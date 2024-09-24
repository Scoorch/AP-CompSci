/**
 * Calculations
 * Trevor Chen
 * 24/9/10
 */

import java.util.Scanner;

public class sumOfDigits {
    public static void main() {
        Scanner s = new Scanner(System.in);
        System.out.print("Input Number: ");
        int n = s.nextInt();
        int n1 = n%10;
        int n2 = (n%100-n1)/10;
        int n3 = (n%1000-n2-n1)/100;
        int ns = n1+n2+n3;
        System.out.println(ns);
        s.close();
    }
}
