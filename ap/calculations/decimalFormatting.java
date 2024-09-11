/**
 * Calculations
 * Trevor Chen
 * 24/9/10
 */

import java.util.Scanner;
import java.text.DecimalFormat;

public class decimalFormatting {
    public static void main() {
        Scanner s = new Scanner(System.in);
        DecimalFormat df = new DecimalFormat("#.00");
        String fValue = df.format(s.nextDouble());
        System.out.println(fValue);
        s.close();
    }
}
