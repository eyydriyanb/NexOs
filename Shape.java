abstract public class Shape {
    private String color; //private member variable
    public Shape(String color) {//constructor
        this.color = color;
    }

    public String toString() {
        return "Color of the shape= \""+color+"\"";

    }
    //all shape subclasses must implement a method called getArea()
    abstract public double getArea();
}