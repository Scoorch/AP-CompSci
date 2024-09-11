/**
 * BlueJ Intro
 * Trevor Chen
 * 24/9/6
 */

import java.util.Scanner;

public class scanner {
    public static void main() {
        Scanner s = new Scanner(System.in);
        System.out.print("Enter your name: ");
        String n = s.nextLine();
        s.close();
        String t = "Trevor";
        if (n == t) {
            System.out.println(n + " is good at programming");
        } else {
            System.out.println(n + " is bad at programming");
        }
    }
}
