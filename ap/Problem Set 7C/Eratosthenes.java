/**
 * 7C
 * Trevor Chen
 * 24/11/28
 */

import java.util.ArrayList;

public class Eratosthenes {
    public static ArrayList primes(int n) {
        int p = 2;
        ArrayList<Integer> toe = new ArrayList();
        for (int i = p; i < n; i++) toe.add(i);
        while (p < n) {
            for (int i = 0; i < toe.size(); i++) {
                if (toe.get(i)%p == 0 && toe.get(i) != p) {
                    toe.remove(i);
                    i--;
                }
            }
            for (int a : toe) {
                if (a > p) {
                    p = a;
                    break;
                }
                if (p == toe.get(toe.size()-1)) return toe;
            }
        }
        return toe;
    }
}