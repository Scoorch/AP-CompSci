/**
 * orderedPairFormula
 * Trevor Chen
 * 24/9/26
 */

public class orderedPair {
    double x;
    double y;
    orderedPair() {
        x = 0;
        y = 0;
    }
    orderedPair(double tx, double ty) {
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