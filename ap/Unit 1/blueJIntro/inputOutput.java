/**
 * BlueJ Intro
 * Trevor Chen
 * 24/9/6
 */

import java.util.Scanner;

public class inputOutput {
    public static void main() {
        Scanner s = new Scanner(System.in);
        System.out.print("What is your favorite course at school? ");
        String c = s.nextLine();
        System.out.print("What is your favorite show? ");
        String sh = s.nextLine();
        System.out.print("How many hours do you spend studying each day? ");
        int hst = s.nextInt();
        System.out.print("How many hours do you spend watching shows each day? ");
        int hsh = s.nextInt();
        int ht = hst+hsh;

        System.out.println();
        System.out.println("Summary:");
        System.out.println("Your favorite course is "+c+".");
        System.out.println("Your favorite show is "+sh+".");
        System.out.println("You spend "+hst+" hours studying each day.");
        System.out.println("You spend "+hsh+" hours watching shows each day.");
        System.out.println("In total, you spend "+ht+" hours not touching grass each day.");
        String r;
        System.out.print("Repeat? Y/N: ");
        r = s.next();
        while (r.equals("Y") && r.equals("y")) {
            System.out.print("Recalculate? Y/N: ");
            r = s.next();
        }
        if (r.equals("Y") || r.equals("y")) {
            s.close();
            main();
        }
    }
}
