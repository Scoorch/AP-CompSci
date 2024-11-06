/**
 * stringTools
 * Trevor Chen
 * 24/9/25
 */

import java.util.Scanner;

class driver {
    public static void main() {
        Scanner sc = new Scanner(System.in);
        stringTools sTools = new stringTools();

        System.out.println("lastLetter test cases:");
        System.out.println("Enter a word with at least one character: ");
        String answer1 = sc.nextLine();
        System.out.println("The last letter is " + sTools.lastLetter(answer1));
        System.out.println("---------------------");
        System.out.println("formPhone test cases:");
        System.out.println("Enter a ten digit number: ");
        String answer2 = sc.nextLine();
        System.out.println("The phone number is " + sTools.formPhone(answer2));
        System.out.println("---------------------");
        System.out.println("midThree test cases:");
        System.out.println("Enter an odd length word with at least three characters: ");
        String answer3 = sc.nextLine();
        System.out.println("The middle three chararacters are " + sTools.midThree(answer3));
        System.out.println("---------------------");
        System.out.println("swapLastTwo test cases:");
        System.out.println("Enter a word with at least two characters: ");
        String answer4 = sc.nextLine();
        System.out.println("The new word is " + sTools.swapLastTwo(answer4));
        System.out.println("---------------------");
        System.out.println("frontAgain test cases:");
        System.out.println("Enter a word: ");
        String answer5 = sc.nextLine();
        System.out.println("Enter a number, max is the number of characters: ");
        int answer5e = sc.nextInt();
        if (sTools.frontAgain(answer5, answer5e) == true) {
            System.out.println("The first "+answer5e+" letter(s) are the same as the last "+answer5e);
        } else {
            System.out.println("The first "+answer5e+" letter(s) are not the same as the last "+answer5e);
        }
        System.out.println("---------------------");

    }
}



