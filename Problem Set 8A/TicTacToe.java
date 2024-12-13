/**
 * 8A Tic Tac Toe Game
 * Trevor Chen
 * 24/12/5
 */

import java.util.Scanner;

public class TicTacToe {
    static char[][] bin = new char[3][3];
    public static void main() {
        Scanner in = new Scanner(System.in);
        boolean ANOTHA = true;
        while (ANOTHA) {
            game();
            boolean ask = true;
            int confusion = 1;
            while (ask) {
                ask = false;
                System.out.print("ANOTHER");
                for (int i = 0; i < confusion; i++) System.out.print("?");
                System.out.println(" YA/NA");
                String ans = in.nextLine().strip();
                if (!ans.equals("YA")) {
                    if (ans.equals("NA")) {
                        ANOTHA = false; 
                    } else {
                        ask = true;
                        confusion++;
                    }
                }
            }
        }
    }

    public static void game() {
        Scanner in = new Scanner(System.in);
        int round = 0;
        char player = 'X';
        boolean win = false;
        boolean tie = false;
        for (int c = 0; c < 3; c++) {
            for (int r = 0; r < 3; r++) {
                bin[r][c] = ' ';
            }
        }
        while (!win) {
            System.out.println("Round "+round+":");
            for (int c = 0; c < 3; c++) {
                for (int r = 0; r < 3; r++) {
                    System.out.print("["+bin[r][c]+"]");
                }
                System.out.println();
            }
            System.out.println(player+" to move. (row, col)");
            String[] splitAns = in.nextLine().strip().split(", ");
            if (bin[Integer.parseInt(splitAns[0])][Integer.parseInt(splitAns[1])] != ' ') {
                System.out.println("Invalid placement!");
                continue;
            }
            bin[Integer.parseInt(splitAns[0])][Integer.parseInt(splitAns[1])] = player;
            if (!checkWin()) {
                if (player == 'X') {
                    player = 'O'; 
                } else player = 'X';  
            } else win = true;
            round++;
            tie = true;
            for (int r = 0; r < 3; r++) {
                for (int c = 0; c < 3; c++) {
                    if (bin[r][c] == ' ') tie = false;
                }
            }
            if (tie) break;
        }
        if (tie) {
            System.out.println("Tie game, means you both have > 1 iq, a huge accomplishment");
        } else if (player == 'X') {
            System.out.println("Player O's career is over, shoulda been better at tic tac toe smh my head");
        } else if (player == 'O') System.out.println("Player X's career is over, shoulda been better at tic tac toe smh my head");
    }

    public static boolean checkWin() {
        System.out.println("1");
        if (bin[0][0] != ' ' && bin[0][0] == bin[0][1] && bin[0][0] == bin[0][2]) return true;
        System.out.println("2");
        if (bin[1][0] != ' ' && bin[1][0] == bin[1][1] && bin[1][0] == bin[1][2]) return true;
        System.out.println("3");
        if (bin[2][0] != ' ' && bin[2][0] == bin[2][1] && bin[2][0] == bin[2][2]) return true;
        System.out.println("4");
        if (bin[0][0] != ' ' && bin[0][0] == bin[1][0] && bin[0][0] == bin[2][0]) return true;
        System.out.println("5");
        if (bin[0][1] != ' ' && bin[0][1] == bin[1][1] && bin[0][1] == bin[2][1]) return true;
        System.out.println("6");
        if (bin[0][2] != ' ' && bin[0][2] == bin[1][2] && bin[0][2] == bin[2][2]) return true;
        System.out.println("7");
        if (bin[0][0] != ' ' && bin[0][0] == bin[1][1] && bin[0][0] == bin[2][2]) return true;
        System.out.println("8");
        if (bin[2][0] != ' ' && bin[2][0] == bin[1][1] && bin[2][0] == bin[0][2]) return true;
        System.out.println("9");
        return false;
    }
}