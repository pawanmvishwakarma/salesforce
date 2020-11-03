public class AreaCalculator {

    List<Shape> lstShap;

    public AreaCalculator(List<Shape> ls) {
        lstShap  = ls;
    }

    public Decimal areaSum(){

        Decimal totalArea = 0;

        for (Shape obj : lstShap) {
            totalArea = totalArea + obj.getArea();
        }

        return totalArea;
    }
}
