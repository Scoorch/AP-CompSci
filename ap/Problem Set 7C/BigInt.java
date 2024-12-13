/**
 * 7C
 * Trevor Chen
 * 24/12/2
 */

import java.util.ArrayList;

public class BigInt {
    public static void math(ArrayList<Integer> ball, ArrayList<Integer> bowl) {
        ArrayList<Integer> bean = new ArrayList();
        int carry = 0;
        while (ball.size() > bowl.size()) bowl.add(0, 0);
        while (bowl.size() > ball.size()) ball.add(0, 0);
        for (int i = ball.size()-1; i >= 0; i--) {
            // if (i >= ball.size()) {
                // bean.add(0, bowl.get(i)+carry);
                // carry = 0;
                // System.out.println(bean+" "+bowl.get(i)+" "+carry);
            // } else if (i >= bowl.size()) {
                // bean.add(0, ball.get(i)+carry);
                // carry = 0;
                // System.out.println(bean+" "+ball.get(i)+" "+carry);
            if (ball.get(i)+bowl.get(i)+carry > 9) {
                bean.add(0, ball.get(i)+bowl.get(i)+carry-10);
                carry = 1;
                System.out.println(bean+" "+ball.get(i)+" "+bowl.get(i)+" "+carry);
            } else {
                bean.add(0, ball.get(i)+bowl.get(i)+carry);
                carry = 0;
                System.out.println(bean+" "+ball.get(i)+" "+bowl.get(i)+" "+carry);
            }
        }
        if (carry != 0) bean.add(0, carry);
        System.out.println(bean);
    }
}