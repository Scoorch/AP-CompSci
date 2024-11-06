/**
 * 2A
 * Trevor Chen
 * 24/9/23
 */

public class driverCyl {
    public static void main(double r, double h) {
        cyl c1 = new cyl();
        cyl c2 = new cyl(r, h);

        System.out.println("Creating a cylinder with the default constructor!");
        System.out.println(c1);
        System.out.println("getRadius() --> "+c1.getRadius());
        System.out.println("getHeight() --> "+c1.getHeight());
        System.out.println("sArea() --> "+c1.sArea());
        System.out.println("volume() --> "+c1.volume());
        System.out.println();
        System.out.println("Creating a cylinder with a parameterized constructor!");
        System.out.println(c2);
        System.out.println("getRadius() --> "+c2.getRadius());
        System.out.println("getHeight() --> "+c2.getHeight());
        System.out.println("sArea() --> "+c2.sArea());
        System.out.println("volume() --> "+c2.volume());
    }
}