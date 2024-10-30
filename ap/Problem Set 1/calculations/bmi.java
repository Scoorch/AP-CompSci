/**
 * Calculations
 * Trevor Chen
 * 24/9/10
 */

import java.util.Scanner;

public class bmi {
    public static void main() {
        Scanner s = new Scanner(System.in);
        System.out.print("Input Weight in Kilograms: ");
        double w = s.nextDouble();
        System.out.print("Input Height in Meters: ");
        double h = s.nextDouble();
        double bmi = w / Math.pow(h, 2);
        if (bmi % (int)bmi == 0) {
            System.out.println((int)bmi);            
        } else {
            System.out.println(bmi);
        }
        s.close();
    }
}
