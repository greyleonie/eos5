package common.assets;

import java.io.File;
import java.io.IOException;
import java.awt.image.BufferedImage;
import java.awt.*;
import java.awt.geom.*;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import java.awt.image.RenderedImage;
/**
 * @author Administrator
 * @version 1.0
 * @date 2007-6-11
 * @class_displayName Barcode
 */

public class Barcode {

	public static String getImgPath(String code,HttpServletRequest request,int width,int height){
		String imgVirDir = "/site/gb/img";
        String imgDir = request.getSession().getServletContext().getRealPath(imgVirDir);
        File file = new File(imgDir);
        if (!file.exists()) file.mkdirs();
        String imgFile = imgDir  + "/" + code + ".bmp";
        File _file = new File(imgFile);
        if (_file.exists()) {
           System.out.println("------------条码为"+code+"图像文件已经存在了-----------");
            
           return imgVirDir += "/" + code + ".bmp";
        } else {
            try {
                System.out.println("------------创建新的条码图像文件,条码是:"+ code +"-----------");
                Barcode.setOfsX(10);
                Barcode.createBarcodeImage(code, imgFile, width, height, 1.5);
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return imgVirDir + "/" + code + ".bmp";
	}
	
	public static void createBarcodeImage(String code, String filePath,
            int width, int height, double scaleNum) throws IOException {
		File barcodeImgFile = new File(filePath);
		if (barcodeImgFile.exists() == false) {
		RenderedImage img = createBarcodeImg(code, width, height, scaleNum);
		
		ImageIO.write(img, "JPEG" /* format desired */,
		new File(filePath) /* target */);
		}

	}
	
    private static BufferedImage createBarcodeImg(String code,int width, int height,
            double scaleNum) {
		if(scaleNum < 1) scaleNum = 1;
		height = height - 30;
		BufferedImage image = new BufferedImage(width,
		
		          height,
		          BufferedImage.TYPE_INT_RGB);
		
		//Get drawing context
		
		Graphics g = image.getGraphics();
		
		//Fill background
		g.setColor(Color.white);
		g.fillRect(0, 0, width, height);
		
		//Draw barcode
		g.setColor(Color.black);
		Barcode b = new Barcode();
		b.initEan13(code);
		b.draw(g, 72 / 25.4 * scaleNum, 1);
		
		g.dispose();
		return image;
    }  


    private static int ofsX = 10;
    private static int ofsY = -50;
    private static final int EAN13 = 1;
    private static final int EAN8 = 2;
    private int mode = 0;

    private static final double d = 1.0 / 13.0;
    private static final double[][][] charsets = {
        {
        {
         -3, 2, -1, 1}
        , { // 0
        -2 - d, 2 - d, -2 - d, 1 - d}
        , { // 1
        -2 - d, 1 - d, -2 - d, 2 - d}
        , { // 2
        -1, 4, -1, 1}
        , { // 3
        -1, 1, -3, 2}
        , { // 4
        -1, 2, -3, 1}
        , { // 5
        -1, 1, -1, 4}
        , { // 6
        -1 + d, 3 + d, -1 + d, 2 + d}
        , { // 7
        -1 + d, 2 + d, -1 + d, 3 + d}
        , { // 8
        -3, 1, -1, 2}
    }
        , // 9

        {
        {
         -1, 1, -2, 3}
        , { // 0
        -1 + d, 2 + d, -2 + d, 2 + d}
        , { // 1
        -2 + d, 2 + d, -1 + d, 2 + d}
        , { // 2
        -1, 1, -4, 1}
        , { // 3
        -2, 3, -1, 1}
        , { // 4
        -1, 3, -2, 1}
        , { // 5
        -4, 1, -1, 1}
        , { // 6
        -2 - d, 1 - d, -3 - d, 1 - d}
        , { // 7
        -3 - d, 1 - d, -2 - d, 1 - d}
        , { // 8
        -2, 1, -1, 3}
    }
        , // 9

        {
        {
        3, -2, 1, -1}
        , { // 0
        2 + d, -2 + d, 2 + d, -1 + d}
        , { // 1
        2 + d, -1 + d, 2 + d, -2 + d}
        , { // 2
        1, -4, 1, -1}
        , { // 3
        1, -1, 3, -2}
        , { // 4
        1, -2, 3, -1}
        , { // 5
        1, -1, 1, -4}
        , { // 6
        1 - d, -3 - d, 1 - d, -2 - d}
        , { // 7
        1 - d, -2 - d, 1 - d, -3 - d}
        , { // 8
        3, -1, 1, -2}
    }
    }; // 9

    private byte order[][] = {
        {
        0, 0, 0, 0, 0, 0}
        , { // 0
        0, 0, 1, 0, 1, 1}
        , { // 1
        0, 0, 1, 1, 0, 1}
        , { // 2
        0, 0, 1, 1, 1, 0}
        , { // 3
        0, 1, 0, 0, 1, 1}
        , { // 4
        0, 1, 1, 0, 0, 1}
        , { // 5
        0, 1, 1, 1, 0, 0}
        , { // 6
        0, 1, 0, 1, 0, 1}
        , { // 7
        0, 1, 0, 1, 1, 0}
        , { // 8
        0, 1, 1, 0, 1, 0}
    }; // 9

    // Startpositionen der Linien
    private double[] xList = new double[200];
    private double[] yList = new double[200];

    // Breiten und H鰄en der Linien
    private double[] dxList = new double[200];
    private double[] dyList = new double[200];

    // aktuelle x-Position
    private double x;

    // Anzahl Linien
    private int count;

    // Barcode
    private char n[] = new char[13];

    /**
     * Linie an der aktuellen Stelle hinzuf黦en.
     */
    private void add(double dx, double y, double dy) {
        xList[count] = x;
        yList[count] = y;
        dxList[count] = dx;
        dyList[count++] = dy;
        x += dx;
    }

    /**
     * Neuen Barcode initialisieren.
     */
    public void initEan13(String number) {
        // Modus zur點ksetzen
        mode = 0;

        // Z鋒ler f黵 Anzahl Striche zur點ksetzen
        count = 0;

        if (number.length() == 12) {
            // Ziffern lesen und Pr黤summe berechnen
            int test = 0;
            for (int i = 0; i < 12; i++) {
                char c = (char) (number.charAt(i) - '0');
                if (c < 0 || c > 9)
                    return;
                n[i] = c;
                test += n[i] * (1 + (i % 2) * 2);
            }
            test %= 10;
            if (test > 0)
                test = 10 - test;
            n[12] = (char) test;

            // Startposition
            x = 0;

            // normales Randzeichen hinzuf黦en
            add(1, 0, 24.5);
            x += 1;
            add(1, 0, 24.5);

            // 6 Nutzzeichen aus Zeichensatz A und B hinzuf黦en
            for (int i = 1; i < 7; i++) {
                for (int j = 0; j < 4; j++) {
                    double dx = charsets[order[n[0]][i - 1]][n[i]][j];
                    if (dx > 0) {
                        add(dx, 0, 22.85);
                    }
                    else
                        x -= dx;
                }
            }

            // Trennzeichen hinzuf黦en
            x += 1;
            add(1, 0, 24.5);
            x += 1;
            add(1, 0, 24.5);
            x += 1;

            // 6 Nutzzeichen aus Zeichensatz C hinzuf黦en
            for (int i = 7; i < 13; i++) {
                for (int j = 0; j < 4; j++) {
                    double dx = charsets[2][n[i]][j];
                    if (dx > 0) {
                        add(dx, 0, 22.85);
                    }
                    else
                        x -= dx;
                }
            }

            // normales Randzeichen hinzuf黦en
            add(1, 0, 24.5);
            x += 1;
            add(1, 0, 24.5);

            // Ziffern umwandeln
            for (int i = 0; i < 13; i++)
                n[i] += '0';

                // Modus setzen
            mode = EAN13;
        }
    }

    /**
     * Neuen Barcode initialisieren.
     */
    public void initEan8(String number) {
        // Modus zur點ksetzen
        mode = 0;

        // Z鋒ler f黵 Anzahl Striche zur點ksetzen
        count = 0;

        if (number.length() == 7) {
            // Ziffern lesen und Pr黤summe berechnen
            int test = 0;
            for (int i = 0; i < 7; i++) {
                char c = (char) (number.charAt(i) - '0');
                if (c < 0 || c > 9)
                    return;
                n[i] = c;
                test += n[i] * (1 + (1 - (i % 2)) * 2);
            }
            test %= 10;
            if (test > 0)
                test = 10 - test;
            n[7] = (char) test;

            // Startposition
            x = 0;

            // normales Randzeichen hinzuf黦en
            add(1, 0, 24.5);
            x += 1;
            add(1, 0, 24.5);

            // 4 Nutzzeichen aus Zeichensatz A hinzuf黦en
            for (int i = 0; i < 4; i++) {
                for (int j = 0; j < 4; j++) {
                    double dx = charsets[0][n[i]][j];
                    if (dx > 0) {
                        add(dx, 0, 22.85);
                    }
                    else
                        x -= dx;
                }
            }

            // Trennzeichen hinzuf黦en
            x += 1;
            add(1, 0, 24.5);
            x += 1;
            add(1, 0, 24.5);
            x += 1;

            // 4 Nutzzeichen aus Zeichensatz C hinzuf黦en
            for (int i = 4; i < 8; i++) {
                for (int j = 0; j < 4; j++) {
                    double dx = charsets[2][n[i]][j];
                    if (dx > 0) {
                        add(dx, 0, 22.85);
                    }
                    else
                        x -= dx;
                }
            }

            // normales Randzeichen hinzuf黦en
            add(1, 0, 24.5);
            x += 1;
            add(1, 0, 24.5);

            // Ziffern umwandeln
            for (int i = 0; i < 8; i++)
                n[i] += '0';

                // Modus setzen
            mode = EAN8;
        }
    }

    private Rectangle2D.Double rect = new Rectangle2D.Double();

    public void fillRect(Graphics g, double x, double y, double w, double h) {
        rect.width = w;
        rect.height = h;
        rect.x = x;
        rect.y = y;
        ( (Graphics2D) g).fill(rect);
    }

    public void draw(Graphics g, double scale, double scaleHeight) {
        if (count > 0) {
            // Modulbreite
            double m = 0.33;

            // alle Striche anzeigen
            x = 12;
            for (int i = 0; i < count; i++) {
                fillRect(g,
                         (xList[i] + x) * m * scale + ofsX,
                         yList[i] * scale * scaleHeight + ofsY,
                         (dxList[i] * m * scale),
                         dyList[i] * scale * scaleHeight);
            }

            // Text ausgeben
            double y = 0;
            switch (mode) {
                case EAN13:
                    g.setFont(new Font("SansSerif", Font.PLAIN,
                                       (int) (4 * scale)));
                    x = 0.5;
                    y = 26 * scaleHeight;
                    g.drawChars(n, 0, 1, (int) (x * m * scale) + ofsX,
                                (int) (y * scale) + ofsY);
                    x += 16;
                    for (int i = 1; i < 7; i++) {
                        g.drawChars(n, i, 1, (int) (x * m * scale) + ofsX,
                                    (int) (y * scale) + ofsY);
                        x += 7;
                    }
                    x += 4;
                    for (int i = 7; i < 13; i++) {
                        g.drawChars(n, i, 1, (int) (x * m * scale) + ofsX,
                                    (int) (y * scale) + ofsY);
                        x += 7;
                    }
                    break;
                case EAN8:
                    x = 16.5;
                    y = 26 * scaleHeight;
                    for (int i = 0; i < 4; i++) {
                        g.drawChars(n, i, 1, (int) (x * m * scale) + ofsX,
                                    (int) (y * scale) + ofsY);
                        x += 7;
                    }
                    x += 4;
                    for (int i = 4; i < 8; i++) {
                        g.drawChars(n, i, 1, (int) (x * m * scale) + ofsX,
                                    (int) (y * scale) + ofsY);
                        x += 7;
                    }
                    break;
            }
        }
    }
    

    
    public int getOfsX() {
        return ofsX;
    }

    public int getOfsY() {
        return ofsY;
    }

    public static void setOfsX(int ofsX) {
       ofsX = ofsX;
    }

    public static void setOfsY(int ofsY) {
        ofsY = ofsY;
    }

}