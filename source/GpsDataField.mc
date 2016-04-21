
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
    
        var color = (getBackgroundColor() == Graphics.COLOR_BLACK) ? Graphics.COLOR_WHITE : Graphics.COLOR_BLACK;

         var flag = getObscurityFlags();
         var width = dc.getWidth();
         var height = dc.getHeight();
         var x = width / 2;
         var y = height / 3+5;
         var bar_height = y;
         var size_w = width/12;
         var size_h = y/4;
         var space = size_w/4;
         
        dc.setColor( color, Gfx.COLOR_TRANSPARENT );
                
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
