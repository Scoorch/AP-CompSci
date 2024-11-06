/**
 * orderedPairFormula
 * Trevor Chen
 * 24/9/26
 */

import java.util.Scanner;

public class driver {
    public static void main() {
        System.out.println("e");
        
        Scanner s = new Scanner(System.in);
        System.out.println("x");
        double x1 = s.nextDouble();
        System.out.println("y1");
        double y1 = s.nextDouble();
        System.out.println("x2");
        double x2 = s.nextDouble();
        System.out.println("y2");
        double y2 = s.nextDouble();
        System.out.println("i");
        int i = s.nextInt();
        // System.out.println(formulas.quad(x1, y1, x2));
        // System.out.println(formulas.slope(new orderedPair(x1, y1), new orderedPair(x2, y2)));
        // System.out.println(formulas.midpoint(new orderedPair(x1, y1), new orderedPair(x2, y2)));
        // System.out.println(formulas.arithSeries(x1, y1, i));
        // System.out.println(formulas.geoSeries(x1, y1, i));
        System.out.println(formulas.rollDie(i));
    }
}