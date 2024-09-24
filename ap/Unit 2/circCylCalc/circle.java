/**
 * 2A
 * Trevor Chen
 * 24/9/23
 */

public class circle {
    double radius;
    
    public circle() {
        radius = 1;
    }
    
    public circle(double r) {
        radius = r;
    }
    
    public String toString() {
        return("Hello, I am a circle with a radius of "+radius);
    }
    
    public double getRadius() {
        return radius;
    }
    
    public double circumference() {
        return(2*Math.PI*radius);
    }
    
    public double area() {
        return(Math.PI*radius*radius);
    }
}