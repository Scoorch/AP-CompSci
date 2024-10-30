/**
 * Calculations
 * Trevor Chen
 * 24/9/10
 */

import java.util.Scanner;

public class daysToWeeks {
    public static void main() {
        Scanner s = new Scanner(System.in);
        System.out.print("Input Days: ");
        double di = s.nextDouble();
        int w = (int)di/7;
        int dl = (int)di%7;
        System.out.println("Total: "+w+" weeks and "+dl+" days.");
        s.close();
    }
}
