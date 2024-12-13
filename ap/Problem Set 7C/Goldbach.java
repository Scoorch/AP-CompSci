/**
 * 7C
 * Trevor Chen
 * 24/11/29
 */

import java.util.ArrayList;

public class Goldbach {
    public static void main(int jawn) {
        ArrayList<Integer> jerricky = new ArrayList();
        jerricky = Eratosthenes.primes((jawn));
        for (int i = 0; i < jerricky.size(); i++) {
            if (jerricky.contains(jawn-jerricky.get(i))) {
                System.out.println("ki");
                System.out.println(jerricky.get(i) + ", " + (jawn-jerricky.get(i)));
            }
        }
    }
}