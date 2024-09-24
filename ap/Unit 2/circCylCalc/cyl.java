/**
 * 2A
 * Trevor Chen
 * 24/9/23
 */

public class cyl {
    double height;
    circle base;
    
    public cyl() {
        height = 1;
        base = new circle();
    }
    
    public cyl(double r, double h) {
        height = h;
        base = new circle(r);
    }
    
    public String toString() {
        return("Hello, I am a cylinder with a radius of "+base.getRadius());
    }
    
    public double getRadius() {
        return base.getRadius();
    }
    
    public double getHeight() {
        return height;
    }
    
    public double sArea() {
        return(2*base.area()+height*base.circumference());
    }
    
    public double volume() {
        return(base.area()*height);
    }
}