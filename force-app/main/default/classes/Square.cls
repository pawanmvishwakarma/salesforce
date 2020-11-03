public class Square implements Shape {

    Integer length;

    public Square(Integer l) {
        length = l;
    }

    public Decimal getArea(){
        return length * length;
    }
}
