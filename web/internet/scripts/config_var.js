var LowBgColor='#254879';				// Background color when mouse is not over
var LowSubBgColor='#254879';			// Background color when mouse is not over on subs
var HighBgColor='#0F69FF';				// Background color when mouse is over
var HighSubBgColor='#0F69FF';			// Background color when mouse is over on subs
var FontLowColor='white';				// Font color when mouse is not over
var FontSubLowColor='white';			// Font color subs when mouse is not over
var FontHighColor='white';				// Font color when mouse is over
var FontSubHighColor='white';			// Font color subs when mouse is over
var BorderColor='white';				// Border color
var BorderSubColor='white';				// Border color for subs
var BorderWidth=0;						// Border width
var BorderBtwnElmnts=1;					// Border between elements 1 or 0
var FontFamily="arial,comic sans ms,technical"	// Font family menu items
var FontSize=9;							// Font size menu items
var FontBold=0;							// Bold menu items 1 or 0
var FontItalic=0;						// Italic menu items 1 or 0
var MenuTextCentered='center';			// Item text position 'left', 'center' or 'right'
var MenuCentered='left';				// Menu horizontal position 'left', 'center' or 'right'
var MenuVerticalCentered='top';			// Menu vertical position 'top', 'middle','bottom' or static
var ChildOverlap=.2;					// horizontal overlap child/ parent
var ChildVerticalOverlap=.2;			// vertical overlap child/ parent
var VerCorrect=0;						// Multiple frames y correction
var HorCorrect=0;						// Multiple frames x correction
var LeftPaddng=0;						// Left padding
var TopPaddng=4;						// Top padding
var FirstLineHorizontal=1;				// SET TO 1 FOR HORIZONTAL MENU, 0 FOR VERTICAL
var MenuFramesVertical=0;				// Frames in cols or rows 1 or 0
var DissapearDelay=100;					// delay before menu folds in
var TakeOverBgColor=1;					// Menu frame takes over background color subitem frame
var FirstLineFrame='navig';				// Frame where first level appears
var SecLineFrame='space';				// Frame where sub levels appear
var DocTargetFrame='space';				// Frame where target documents appear
var TargetLoc='';						// span id for relative positioning
var HideTop=0;							// Hide first level when loading new document 1 or 0
var MenuWrap=1;							// enables/ disables menu wrap 1 or 0
var RightToLeft=0;						// enables/ disables right to left unfold 1 or 0
var UnfoldsOnClick=0;					// Level 1 unfolds onclick/ onmouseover
var WebMasterCheck=0;					// menu tree checking on or off 1 or 0
var ShowArrow=1;						// Uses arrow gifs when 1
var KeepHilite=0;						// Keep selected path highligthed
var Arrws=['/internet/images/tri.gif',5,10,'/internet/images/tridown.gif',10,5,'/internet/images/trileft.gif',5,10];	// Arrow source, width and height
var WriteToFile=0;						//Result html write to file?1 is write
var FileName='e:\\test.txt';			//If write Result html,this is save file
var ContainerBgColor='white';
var SelectColor='#0F69FF';
var MenuTarget="mainFrame";

function BeforeStart(){ }
function AfterBuild(){ 
}
function BeforeFirstOpen(){}
function AfterCloseAll(){}
