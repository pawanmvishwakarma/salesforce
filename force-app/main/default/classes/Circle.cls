public class Circle implements Shape{

    Integer radius;

    public Circle(Integer r) {
        radius = r;
    }

    public Decimal getArea(){
        return 3.142 * radius * radius;
    }
}
