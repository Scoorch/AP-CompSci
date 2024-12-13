/**
 * 7C
 * Trevor Chen
 * 24/12/3
 */

import java.util.ArrayList;

public class BigIntDriver {
    public static void main() {
        ArrayList<Integer> bihl = new ArrayList();
        ArrayList<Integer> whang = new ArrayList();
        bihl.add(1);
        // bihl.add(9);
        // bihl.add(4);
        // bihl.add(2);
        // bihl.add(0);
        
        whang.add(9);
        whang.add(9);
        // bihl.add(4);
        // bihl.add(2);
        // bihl.add(0);
        BigInt.math(bihl, whang);
    }
}