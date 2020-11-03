public class Rectangle implements Shape {
    Integer height;
    Integer width;

    public Rectangle(Integer h, Integer w) {
        height = h;
        width = w;
    }

    public Decimal getArea(){
        return height * width;
    }
}
