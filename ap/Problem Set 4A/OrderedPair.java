/**
 * 4A
 * Trevor Chen
 * 24/10/21
 */

public class OrderedPair {
    double x;
    double y;
    OrderedPair() {
        x = 0;
        y = 0;
    }
    OrderedPair(double tx, double ty) {
        x = tx;
        y = ty;
    }
    public String toString() {
        return "("+x+", "+y+")";
    }
    public double getX() {
        return x;
    }
    public double getY() {
        return y;
    }
}