package models;

public enum CardinalPoints {
    NORTH(1, 0),
    EAST(0, 1),
    NORTHEAST(1, 1),
    SOUTHEAST(-1, 1);
    private Coordinate coordinate;

    CardinalPoints(int row, int column) {
        coordinate = new Coordinate(row, column);
    }

    /**
     * Te devuelve un array de cuatro ccordenadas, siendo la primera el parametro y las tres que tiene en la direccion pedida
     */

    public Coordinate[] next4Coordinate(Coordinate coordinate) {
        Coordinate[] following = new Coordinate[4];
        following[0] = coordinate;
        for (int i = 1; i < following.length; i++) {
            following[i] = following[i - 1].add(this.coordinate);
        }
        return following;
    }

    /**
     * Te mueve los valores en la direccion contraria a la coordenada
     */

    public void moveArray(Coordinate[] coordinates) {
        for (int i = coordinates.length - 1; i > 0; i--) {
            coordinates[i] = coordinates[i - 1];
        }
        coordinates[0] = coordinates[0].substract(this.coordinate);
    }

}