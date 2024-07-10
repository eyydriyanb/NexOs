//define Rectangle, subclass of Shape
public class Rectangle extends Shape {
    //private member variables
    private int length;
    private int width;

    //constructor
    public Rectangle(String color, int length, int width) {
        super(color);
        this.length = length;
        this.width = width;
    }
    @Override
    public double getArea()
    {
        return length*width;
    
    }
}