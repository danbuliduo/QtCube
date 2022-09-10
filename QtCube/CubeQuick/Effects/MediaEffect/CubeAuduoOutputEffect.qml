import QtMultimedia

MediaPlayer{
    id : control
    audioOutput: AudioOutput{}
    function show(showSignal){
        control.position = 0.0
        if(showSignal) control.play()
    }
    function showplay(url, showSignal){
        control.source = url
        control.position = 0.0
        if(showSignal) control.play()
    }
}
