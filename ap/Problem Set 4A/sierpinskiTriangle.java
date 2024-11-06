/**
 * 4A
 * Trevor Chen
 * 24/10/18
 */

public class sierpinskiTriangle {
    public static void main() {
        StdDraw.setScale(0, 1.5);
        StdDraw.setPenRadius(0.0005);
        OrderedPair[] vertices = new OrderedPair[3];
        vertices[0] = new OrderedPair(0.25, 0.25);
        vertices[1] = new OrderedPair(1.25, 0.25);
        vertices[2] = new OrderedPair(0.75, Math.sqrt(3)/2+.25);
        OrderedPair o = vertices[0];
        StdDraw.point(vertices[0].getX(), vertices[0].getY());
        StdDraw.point(vertices[1].getX(), vertices[1].getY());
        StdDraw.point(vertices[2].getX(), vertices[2].getY());
        int count = 0;
        for (int i = 100000; i > 0; i--) {
            OrderedPair e = vertices[(int)(Math.random()*3)];
            o = new OrderedPair((e.getX()+o.getX())/2, (e.getY()+o.getY())/2);
            StdDraw.point(o.getX(), o.getY());
            System.out.println(count);
            count++;
        }
    }
}