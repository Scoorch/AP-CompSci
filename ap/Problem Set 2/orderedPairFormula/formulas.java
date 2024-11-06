/**
 * orderedPairFormula
 * Trevor Chen
 * 24/9/26
 */

public class formulas {
    static orderedPair quad(double a, double b, double c) {
        return new orderedPair((-b+Math.sqrt(b*b-4*a*c))/(2*a), (-b-Math.sqrt(b*b-4*a*c))/(2*a));
    }

    static double slope(orderedPair A, orderedPair B) {
        return (B.y-A.y)/(B.x-A.x);
    }

    static orderedPair midpoint(orderedPair A, orderedPair B) {
        double x = (A.x + B.x)/2;
        double y = (A.y + B.y)/2;
        return new orderedPair(x, y);
    }

    static double arithSeries(double a, double d, int k) {
        return ((double)k/2)*(2*a+d*(k-1));
    }

    static double geoSeries(double a, double r, int k) {
        return a*((1-Math.pow(r, k))/(1-r));
    }

    static int rollDie(int s) {
        return (int)(Math.random()*s);
    }
}