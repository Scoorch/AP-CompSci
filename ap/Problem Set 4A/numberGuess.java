/**
 * 4A
 * Trevor Chen
 * 24/10/18
 */

import java.util.Scanner;

public class numberGuess {
    public static void main() {
        Scanner s = new Scanner(System.in);
        int goal = (int)(Math.random()*100)+1;
        int in = 0;
        int tries = 0;
        System.out.println("I'm thinking of a number between 1 and 100. Can you guess it?");
        while (in != goal) {
            in = s.nextInt();
            tries++;
            if (in > goal) System.out.println("Nope, that guess is too high.");
            else System.out.println("Nope, that guess is too low.");
        }
        System.out.println("You guessed it! It took you "+tries+" tries.");
    }
}