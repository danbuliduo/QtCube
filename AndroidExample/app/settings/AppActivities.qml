pragma Singleton

import QtQuick
import CubeQuick.Effects.MediaEffect

QtObject {
    id: activites
    property CubeAuduoOutputEffect clicked0Effect: CubeAuduoOutputEffect{
        source: "qrc:/res/media/ui-btn_clicked0.mp3"
    }
    property CubeAuduoOutputEffect clicked1Effect: CubeAuduoOutputEffect{
        source: "qrc:/res/media/ui-btn_clicked1.mp3"
    }
    property CubeAuduoOutputEffect clicked2Effect: CubeAuduoOutputEffect{
        source: "qrc:/res/media/ui-btn_clicked2.mp3"
    }
    property CubeAuduoOutputEffect clicked3Effect: CubeAuduoOutputEffect{
        source: "qrc:/res/media/ui-btn_clicked3.mp3"
    }
    function clickedActivity(index){
        switch(index){
        case 0: clicked0Effect.show(AppSettings.soundEffect); break;
        case 1: clicked1Effect.show(AppSettings.soundEffect); break;
        case 2: clicked2Effect.show(AppSettings.soundEffect); break;
        case 3: clicked3Effect.show(AppSettings.soundEffect); break;
        }
    }
}
