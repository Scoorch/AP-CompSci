import java.util.Scanner;

/**
 * A simple class to run the Elby chat bot.
 *
 * @author <your name goes here>
 * @version <today's date goes here>
 */

public class ElbyInterface {

    /** Create a Magpie, give it user input, and print its replies. */
    public static void main() {
        Elby elby = new Elby();
        System.out.println(elby.getGreeting());
        Scanner in = new Scanner(System.in);
        String statement = in.nextLine();

        while (!statement.equals("Bye")) {
            System.out.println(elby.getResponse(statement));
            statement = in.nextLine();
        }
        System.out.println("ok bye");
    }
}