import std.stdio;
import arsd.simpledisplay;
import arsd.color;

class Click_region {
    Point click;
    Rectangle region;

    this (Rectangle region) {
        this.region = region;
    }
}

interface Draggable {
    Point click();
}


// class Button {
//     auto drag = new Click_region();
// }


void main() {
    auto window = new SimpleWindow(800, 600, "test");
    auto clickable = new Click_region(Rectangle(0, 0, 200, 200));
    window.handleMouseEvent = delegate (MouseEvent event) {
        if (event.type == MouseEventType.buttonPressed)
        if (clickable.region.contains(Point(event.x, event.y))) {
            writeln("clicked!");
        }
    };

    {
        auto painter = window.draw();
        painter.fillColor = Color.red();
        painter.drawRectangle(clickable.region);
    }

    window.eventLoop(0, delegate (dchar) {});
	
}
