
using Toybox.WatchUi as Ui;
using Toybox.Application as App;
using Toybox.Graphics as Gfx;

class DataField extends Ui.DataField
{
	hidden var gps;
        
    function compute(info)
    {
        gps = info.currentLocationAccuracy;
    }
    
    function onUpdate(dc)
    {
    
         var flag = getObscurityFlags();
         var width = dc.getWidth();
         var height = dc.getHeight();
         var x = width / 2;
         var y = height / 3+5;
         var bar_height = y;
         var size_w = width/12;
         var size_h = y/4;
         var space = size_w/4;
         
        setColor(dc); 
                
        if(flag>=OBSCURE_BOTTOM){
        	y = y-10;
        	flag=flag-OBSCURE_BOTTOM;
        }
        if(flag>=OBSCURE_RIGHT){
        	x = x-10;
        	flag=flag-OBSCURE_RIGHT;
        } 
        if(flag>=OBSCURE_TOP){
            y = y+10;
        	flag=flag-OBSCURE_TOP;
        }
        if(flag>=OBSCURE_LEFT){
            x = x+10;
        }
                
		drawGPS(dc,x,y,size_w,size_h,bar_height,space);		
    }
    
    function setColor(dc){
        var user_color =  App.getApp().getProperty("default_color");
        if(user_color == 0){
           	var color = (getBackgroundColor() == Graphics.COLOR_BLACK) ? Graphics.COLOR_WHITE : Graphics.COLOR_BLACK;
        	dc.setColor( color, Gfx.COLOR_TRANSPARENT );
        }else if (user_color == 1) {
        	dc.setColor( Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT );
        }else if (user_color == 2) {
        	dc.setColor( Gfx.COLOR_DK_BLUE, Gfx.COLOR_TRANSPARENT );
        }else if (user_color == 3) {
        	dc.setColor( Gfx.COLOR_GREEN, Gfx.COLOR_TRANSPARENT );
        }else if (user_color == 4) {
        	dc.setColor( Gfx.COLOR_DK_GREEN, Gfx.COLOR_TRANSPARENT );
        }else if (user_color == 5) {
        	dc.setColor( Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT );
        }else if (user_color == 6) {
        	dc.setColor( Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT );
        }else if (user_color == 7) {
        	dc.setColor( Gfx.COLOR_ORANGE, Gfx.COLOR_TRANSPARENT );
        }else if (user_color == 8) {
        	dc.setColor( Gfx.COLOR_PINK, Gfx.COLOR_TRANSPARENT );
        }else if (user_color == 9) {
        	dc.setColor( Gfx.COLOR_PURPLE, Gfx.COLOR_TRANSPARENT );
        }else if (user_color == 10) {
        	dc.setColor( Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT );
        }else if (user_color == 11) {
        	dc.setColor( Gfx.COLOR_DK_RED, Gfx.COLOR_TRANSPARENT );
        }
    }
    
    function drawGPS(dc,x,y,size_w,size_h,bar_height,space){
    	if(gps!=null){
    	if( gps == 4){
    		dc.fillRectangle(x+size_w+space/2+space, y, size_w, bar_height);
		}
		if(gps >=3 ) {
			dc.fillRectangle(x+space/2, y+size_h, size_w, bar_height-size_h);
		}
		if(gps >= 2 ) {
			dc.fillRectangle(x-size_w-space/2, y+2*size_h, size_w, bar_height-2*size_h);
		}
		if(gps >= 1 ) {
			dc.fillRectangle(x-size_w*2-space/2-space, y+3*size_h, size_w, bar_height-3*size_h);			
		}
		}
		dc.drawRectangle(x-size_w*2-space/2-space, y+3*size_h, size_w, bar_height-3*size_h);
		dc.drawRectangle(x-size_w-space/2, y+2*size_h, size_w, bar_height-2*size_h);
		dc.drawRectangle(x+space/2, y+size_h, size_w, bar_height-size_h);
		dc.drawRectangle(x+size_w+space/2+space, y, size_w, bar_height);
		
    }
}

class GpsDataField extends App.AppBase
{

    function getInitialView()
    {
        return [new DataField()];
    }

}
