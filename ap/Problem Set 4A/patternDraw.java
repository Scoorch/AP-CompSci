/**
 * 4A
 * Trevor Chen
 * 24/10/18
 */

public class patternDraw {
        static void grid() {
        StdDraw.setScale(0, 500);
        for (int x = 0; x < 500; x+=20) {
            StdDraw.line(x, 0, x, 500);
        }
        for (int y = 0; y < 500; y+=20) {
            StdDraw.line(0, y, 500, y);
        }
    }

    static void eye() {
        StdDraw.setScale(0, 500);
        for (int x = 0; x < 500; x+=20) {
            StdDraw.line(x, 0, 0, 500-x);
            StdDraw.line(500-x, 500, 500, x);
        }
    }

    static void target() {
        StdDraw.setScale(0, 500);
        StdDraw.setPenRadius(0.015);
        double start = 0;
        while (true) {
            StdDraw.show(20);
            StdDraw.clear();
            if (start > 20) start = 0;
            for (double x = start; x < 500; x+=20) {
                StdDraw.circle(250, 250, x);
            }
            start+= 0.5;
        }
    }
}