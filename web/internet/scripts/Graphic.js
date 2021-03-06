IE4 = ! (navigator.appVersion.charAt(0) < "4" || navigator.appName == "Netscape")

var xo=0
var yo=0
var Ox = -1
var Oy = -1
var lineWidth=1

var rad = Math.PI/180
var maxY = 400
var color = "#228B22"

function print(str) {
	document.write(str)
}

function orgY(y) {
	return maxY-y
}
function outPlot(x,y,w,h) {
	print('<span style="position:absolute;left:'+x+';top:'+y+';height:'+h+';width:'+w+';font-size:1px;background-color:'+color+'"></span>')
}

function Plot(x,y) {
	outPlot(x,y,1,1)
	if(Ox>=0 || Oy>=0) {
		ShowLine(Ox,Oy,x-Ox,y-Oy)		
	}
	Ox = x
	Oy = y
}

function ShowLine(x,y,w,h) {
	if(w<0) {
		x += w
		w = Math.abs(w)
	}
	if(h<0) {
		y += h
		h = Math.abs(h)
	}
	//if(w<1) w=1
	//if(h<1) h=1
	if(w<=1){
		if( lineWidth/2>=1 )
			x = x-lineWidth/2
		w=lineWidth
	}
	if(h<=1){
		if( lineWidth/2>=1 )
			y=y-lineWidth/2
		h=lineWidth
	}
	outPlot(x,y,Math.round(w),Math.round(h))
}

function LineTo(x,y) {
	Line(xo,yo,x,y)
}

function sign(n) {
	if(n>0)
		return 1
	if(n<0)
		return -1
	return n
}

function Line(x1,y1,x2,y2) {
	x2 = Math.round(x2)
	y2 = Math.round(y2)
	xo = x2
	yo = y2
	//y1 = orgY(y1)
	//y2 = orgY(y2)
	var str = ""
	var i=0

	var x = x1
	var y = y1
	dx = Math.abs(x2-x1)
	dy = Math.abs(y2-y1)
	s1 = sign(x2-x1)
	s2 = sign(y2-y1)

	if(dx==0 || dy==0) {
		ShowLine(x1,y1,x2-x1,y2-y1)
		return
	}

	if(dx>dy) {
		temp = dx
		dx = dy
		dy = temp
		key = 1
	}else
		key = 0
	e = 2*dy-dx

	//if( dx==1 ) ShowLine(x1,y1,x2-x1,y2-y1)
	//else
	for(i=0;i<=dx;i++) {
		px = 0
		py = 0
		Plot(x,y)
		while(e>=0) {
			if(key==1) {
				x += s1
				px += s1
			}else {
				y += s2
				py += s2
			}
			e = e-2*dx
		}
		if(key==1)
			y += s2
		else
			x += s1
		e = e+2*dy
	}
} 

function MoveTo(x,y) {
	Ox = Oy = -1
	xo = Math.round(x)
	yo = Math.round(y)
}

// 圆
function Cir(x,y,r) {
	MoveTo(x+r,y)
	for(i=0;i<=360;i+=5) {
		LineTo(r*Math.cos(i*rad)+x,r*Math.sin(i*rad)+y)
	}
}

// 弧形
function Arc(x,y,r,a1,a2) {
	MoveTo(r*Math.cos(a1*rad)+x,r*Math.sin(a1*rad)+y)
	for(i=a1;i<=a2;i++) {
		LineTo(r*Math.cos(i*rad)+x,r*Math.sin(i*rad)+y)
	}
}

// 扇形
function Pei(x,y,r,a1,a2) {
	MoveTo(x,y)
	for(var i=a1;i<=a2;i++) {
		LineTo(r*Math.cos(i*rad)+x,r*Math.sin(i*rad)+y)
	}
	LineTo(x,y)
}

// 弹出扇形
function PopPei(x,y,r,a1,a2) {
	dx = r*Math.cos((a1+(a2-a1)/2)*rad)/10
	dy = r*Math.sin((a1+(a2-a1)/2)*rad)/10
	x += dx
	y += dy
	MoveTo(x,y)
	for(var i=a1;i<=a2;i++) {
		LineTo(r*Math.cos(i*rad)+x,r*Math.sin(i*rad)+y)
	}
	LineTo(x,y)
}

// 矩形
function Rect(x,y,w,h) {	MoveTo(x,y)
	LineTo(x+w,y)
	LineTo(x+w,y+h)
	LineTo(x,y+h)
	LineTo(x,y)
}

// 准星
function zhunxing(x,y) {
	var ox = xo
	var oy = yo
	var oColor = color
	color = "#000000"
	Line(x-5,y,x+6,y)
	Line(x,y-6,x,y+5)
	print('<span style="position:absolute;font-size:10pt;left:'+(x+5)+';top:'+orgY(y+5)+';">['+x+','+y+']</span>')
	color = oColor
	xo = ox
	yo = oy
}
// 标注
function biaozhuStr(x,y,s) {
	return '<span style="position:absolute;font-size:10pt;left:'+x+';top:'+orgY(y)+';">'+s+'</span>'
}
function biaozhu(x,y,s,t) {
	var ox = xo
	var oy = yo
	var oColor = color
	point = "p01.gif"
	if(t==1) {
		print(biaozhuStr(x-5,y+6,"·"+s))
	}
	if(t==2) {
		print(biaozhuStr(xo+x*Math.cos(y*rad)-10,yo+x*Math.sin(y*rad),s))
	}
	color = oColor
	xo = ox
	yo = oy
}
