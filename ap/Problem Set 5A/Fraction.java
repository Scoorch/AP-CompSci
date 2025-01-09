/**
 * 5A
 * Trevor Chen
 * 25/1/7
 */

public class Fraction {
    
    private int num;
    private int den;
    
    public Fraction() {
        num = 0;
        den = 1;
    }
    
    public Fraction(int n, int d) {
        detectZero(d, 17);
        num = n;
        den = d;
    }
    
    public Fraction(String f) {
        detectZero(Integer.parseInt(f.substring(f.indexOf("/")+1)), 26);
        num = Integer.parseInt(f.substring(0, f.indexOf("/")));
        den = Integer.parseInt(f.substring(f.indexOf("/")));
    }
    
    public Fraction(Fraction f) {
        num = f.num;
        den = f.den;
    }
    
    public int getNum() {
        return num;
    }
    
    public int getDen() {
        return den;
    }
    
    public String toString() {
        return num+"/"+den;
    }
    
    public double toDouble() {
        return (double) num/den;
    }
    
    public void reduce() {
        int tempN = Math.abs(num);
        int tempD = Math.abs(den);
        if (num == 0) {
            den = 1;
            return;
        }
        while (tempN != tempD) {
            if (tempN > tempD) tempN = tempN-tempD; else tempD = tempD-tempN;
        }
        num /= tempN;
        den /= tempD;
    }
    
    public void setNum(int n) {
        num = n;
    }
    
    public void setDen(int d) {
        detectZero(d, 74);
        den = d;
    }
    
    public static Fraction multiply(Fraction a, Fraction b) {
        Fraction out = new Fraction(a.getNum()*b.getNum(), a.getDen()*b.getDen());
        out.reduce();
        return out;
    }
    
    public static Fraction divide(Fraction a, Fraction b) {
        Fraction out = new Fraction(a.getNum()*b.getDen(), a.getDen()*b.getNum());
        out.reduce();
        return out;
    }
    
    public static Fraction add(Fraction a, Fraction b) {
        Fraction out = new Fraction(a.getNum()*b.getDen()+b.getNum()*a.getDen(), a.getDen()*b.getDen());
        out.reduce();
        return out;
    }
    
    public static Fraction subtract(Fraction a, Fraction b) {
        Fraction out = new Fraction(a.getNum()*b.getDen()-b.getNum()*a.getDen(), a.getDen()*b.getDen());
        out.reduce();
        return out;
    }
    
    private void detectZero(int num, int line) {
        if (num == 0) {
            System.out.println("Zero in denominator "+line);
            System.exit(1);
        }
    }
}