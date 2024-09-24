/**
 * Calculations
 * Trevor Chen
 * 24/9/10
 */

import java.util.Scanner;

public class receipt {
    public static void main() {
        Scanner s = new Scanner(System.in);
        System.out.print("Input Item: ");
        String i = s.nextLine();
        System.out.print("Input Price: ");
        double p = s.nextDouble();
        System.out.print("Input Quantity: ");
        int q = s.nextInt();
        System.out.print("Input Tax Rate in Percent: ");
        double t = s.nextDouble();
        double tp = (p + p * (t / 100.0)) * q;
        System.out.println("Total Price: $"+tp);
        s.close();
    }
}
