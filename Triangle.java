//define Triangle, subclass of Shape
public class Triangle extends Shape {
    //private member variables
    private int base;
    private int height;

    //constructor
    public Triangle(String color, int base, int height) {
        super(color);
        this.base = base;
        this.height = height;
    }
    @Override
    public double getArea()
    {
        return (base*height)/2;
    
    }
}