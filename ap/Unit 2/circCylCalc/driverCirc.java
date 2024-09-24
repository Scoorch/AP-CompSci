/**
 * 2A
 * Trevor Chen
 * 24/9/23
 */

public class driverCirc {
    public static void main(double r) {
        circle c1 = new circle();
        circle c2 = new circle(r);

        System.out.println("Creating a circle with the default constructor!");
        System.out.println(c1);
        System.out.println("getRadius() --> "+c1.getRadius());
        System.out.println("circumference() --> "+c1.circumference());
        System.out.println("area() --> "+c1.area());
        System.out.println();
        System.out.println("Creating a circle with a parameterized constructor!");
        System.out.println(c2);
        System.out.println("getRadius() --> "+c2.getRadius());
        System.out.println("circumference() --> "+c2.circumference());
        System.out.println("area() --> "+c2.area());
    }
}