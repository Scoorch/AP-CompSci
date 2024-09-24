/**
 * Calculations
 * Trevor Chen
 * 24/9/10
 */

import java.util.Scanner;
import java.text.DecimalFormat;

public class combine {
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

        System.out.print("Input Days: ");
        double di = s.nextDouble();
        int wk = (int)di/7;
        int dl = (int)di%7;
        if (dl == 1) {
            System.out.println("Total: "+wk+" weeks and "+dl+" day.");
        } else {
            System.out.println("Total: "+wk+" weeks and "+dl+" days.");
        }

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

        System.out.print("Input Number: ");
        int n = s.nextInt();
        int n1 = n%10;
        int n2 = (n%100-n1)/10;
        int n3 = (n%1000-n2-n1)/100;
        int ns = n1+n2+n3;
        System.out.println(ns);

        DecimalFormat df = new DecimalFormat("#.00");
        String fValue = df.format(s.nextDouble());
        System.out.println(fValue);
        s.close();
    }
}
