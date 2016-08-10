using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class GpsDataFieldApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }
    
    function onStart(state) {
    }

    function onStop(state) {
    }
    
    function getInitialView()
    {
        return [new GpsDataFieldView()];
    }
    
    function onSettingsChanged()
    {
        Ui.requestUpdate();
    }
}