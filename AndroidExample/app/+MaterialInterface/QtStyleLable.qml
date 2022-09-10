import QtQuick

Item{
    id: root
    property real cornersSize: 0.2*Math.min(height,width)
    property color fillcolor: "#222840"
    onFillcolorChanged: canvas.requestPaint()
    onCornersSizeChanged: canvas.requestPaint()
    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0,0,width,height);
            ctx.beginPath();
            ctx.moveTo(0,cornersSize);
            ctx.lineTo(cornersSize,0);
            ctx.lineTo(width,0);
            ctx.lineTo(width,height-cornersSize);
            ctx.lineTo(width-cornersSize,height);
            ctx.lineTo(0,height);
            ctx.fillStyle = fillcolor;
            ctx.fill();
        }
    }
}
