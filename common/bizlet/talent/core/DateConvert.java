package talent.core;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

public class DateConvert {
    /**
     * 通过日期所在本周的星期几，取出本周的星期一
     * 
     * @return
     */
    public static String getMon() {
        String result = "";
        GregorianCalendar gc1 = new GregorianCalendar();
        int days = gc1.getTime().getDay();
        for (int j = 1; j < days; j++) {
            gc1.add(Calendar.DATE, -1);
        }

        result = fotmatDate2(gc1.getTime());
        return result;
    }

    /**
     * 通过日期所在本周的星期几，取出本周的星期日
     * 
     * @return
     */
    public static String getSun() {
        String result = "";
        GregorianCalendar gc1 = new GregorianCalendar();
        int days = 7 - gc1.getTime().getDay();
        for (int j = 0; j < days; j++) {
            gc1.add(Calendar.DATE, 1);
        }

        result = fotmatDate2(gc1.getTime());
        return result;
    }

    /**
     * 所在日期加1 天，并加12个小时
     * 
     * @return
     */
    public static Date addDay(Date cundate) {
        Date result = null;
        GregorianCalendar gc1 = new GregorianCalendar();
        gc1.setTime(cundate);
        gc1.add(Calendar.DATE, 1);
        String cuntime = fotmatDate2(gc1.getTime()) + " 12:00:00";
        result = StringToDate2(cuntime);
        return result;
    }

    /**
     * 计算两个日期之间相差的天数
     * 
     * @param date1
     * @param date2
     * @return
     */
    public static int diffdates(String date1, String date2) {
        int result = 0;
        //SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd
        // HH:mm:ss");
        ElapsedTime et = new ElapsedTime();

        GregorianCalendar gc1 = new GregorianCalendar();
        GregorianCalendar gc2 = new GregorianCalendar();

        gc1.setTime(StringToDate(date1));
        gc2.setTime(StringToDate(date2));
        result = et.getDays(gc1, gc2);

        return result;
    }

    /**
     * 计算两个时间之间相差的分钟数
     * 
     * @param time1
     * @param time2
     * @return
     */
    public static int diffminutes(String time1, String time2) {
        int result = 0;
        ElapsedTime et = new ElapsedTime();

        GregorianCalendar gc1 = new GregorianCalendar();
        GregorianCalendar gc2 = new GregorianCalendar();

        gc1.setTime(StringToTime(time1));
        gc2.setTime(StringToTime(time2));
        result = et.getMinutes(gc1, gc2);

        return result;
    }

    public static int diffyears(Date date1, Date date2) {
        int result = 0;
        ElapsedTime et = new ElapsedTime();

        GregorianCalendar gc1 = new GregorianCalendar();
        GregorianCalendar gc2 = new GregorianCalendar();
        gc1.setTime(date1);
        gc2.setTime(date2);
        result = et.getYears(gc1, gc2);

        return result;
    }

    public static int datediff(String date1, String date2) {
        int result = 0;
        ElapsedTime et = new ElapsedTime();

        GregorianCalendar gc1 = new GregorianCalendar(2004, Calendar.JANUARY, 1);
        GregorianCalendar gc2 = new GregorianCalendar(2004, Calendar.JANUARY, 1);
        gc1.setTime(StringToDate(date1));
        gc2.setTime(StringToDate(date2));
        result = et.getDays(gc1, gc2);

        return result;
    }

    public static Date StringToDate(String src) {
        Date result = null;
        if (src != null && src.length() > 0) {
            SimpleDateFormat sf = null;
            try {
                sf = new SimpleDateFormat("yyyy-MM-dd", Locale.CHINESE);
                result = sf.parse(src);
            } catch (Exception ex) {
            }
        }
        return result;
    }

    public static Date StringToDatex(String src) {
        Date result = null;
        if (src != null && src.length() > 0) {
            SimpleDateFormat sf = null;
            try {
                sf = new SimpleDateFormat("yyyy/MM/dd", Locale.CHINESE);
                result = sf.parse(src);
            } catch (Exception ex) {
            }
        }
        return result;
    }

    public static Date StringToDate2(String src) {
        Date result = null;
        if (src != null && src.length() > 0) {
            SimpleDateFormat sf = null;
            try {
                sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINESE);
                result = sf.parse(src);
            } catch (Exception ex) {
            }
        }
        return result;
    }

    public static Date StringToTime(String src) {
        Date result = null;
        if (src != null && src.length() > 0) {
            SimpleDateFormat sf = null;
            try {
                sf = new SimpleDateFormat("HH:mm:ss", Locale.CHINESE);
                result = sf.parse(src);
            } catch (Exception ex) {
            }
        }
        return result;
    }

    public static String fotmatDate(Date myDate) {
        String result = null;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        result = formatter.format(myDate);
        return result;
    }

    public static String fotmatDate2(Date myDate) {
        String result = null;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        result = formatter.format(myDate);
        return result;
    }

    public static String fotmatYear(Date myDate) {
        String result = null;
        SimpleDateFormat yearformatter = new SimpleDateFormat("yyyy");
        result = yearformatter.format(myDate);
        return result;
    }

    public static String getDayTime(Date myDate) {
        String result = null;
        SimpleDateFormat formatter = new SimpleDateFormat("ddHHmmss");
        result = formatter.format(myDate);
        return result;
    }
}
