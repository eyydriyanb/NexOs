//driver code

public class Main {
    public static void main(String[]args) {
        //rectangle
        Shape shape1 = new Rectangle("apricot", 4,5);
        System.out.println("Rectangle\n");
        System.out.println(shape1);
        System.out.println("Area is " +shape1.getArea());

        //triangle
        Shape shape2 = new Triangle("neon magenta", 4,5);
        System.out.println("\nTriangle\n");
        System.out.println(shape2);
        System.out.println("Area is " +shape2.getArea());
    }
}
