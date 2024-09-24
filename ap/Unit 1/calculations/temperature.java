/**
 * Calculations
 * Trevor Chen
 * 24/9/10
 */

import java.util.Scanner;

public class temperature {
    public static void main() {
        Scanner s = new Scanner(System.in);
        System.out.print("Convert Celsius to Fahrenheit: ");
        double c = s.nextDouble();
        double f = c * (9.0 / 5) + 32;
        if (f % (int)f == 0) {
            System.out.println((int)f);            
        } else {
            System.out.println(f);
        }
        s.close();
    }
}
