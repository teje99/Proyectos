package models;

public class Coordinate {
    public static final int MAX_ROW = 6;
    public static final int MAX_COLUMN = 7;
    private int row;
    private int column;

    public Coordinate(int row, int column) {
        this.column = column;
        this.row = row;
    }

    /**
     * Suma la coordenada que llama al metodo mas la que se pasa como parametro
     */
    public Coordinate add(Coordinate coordinate) {
        return new Coordinate(this.row + coordinate.row, this.column + coordinate.column);
    }

    /**
     * Resta la coordenada que llama al metodo menos la que se pasa como parametro
     */
    public Coordinate substract(Coordinate coordinate) {
        return new Coordinate(this.row - coordinate.row, this.column - coordinate.column);
    }

    /**
     * Comprueba que la fila y la columna de la coordenada este dentro de los limites
     */
    public boolean validCoordinate() {
        return this.row < MAX_ROW && this.row >= 0 && this.column >= 0 && this.column < MAX_COLUMN;
    }

    /**
     * Devuelve la fila de la coordenada
     */
    public int getRow() {
        return row;
    }

    /**
     * Devuelve la columna de la coordenada
     */
    public int getColumn() {
        return column;
    }


}
