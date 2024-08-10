package models;

import views.Console;
import views.Message;

public class Board {
    private Color[][] colors;
    private Coordinate lastCoordinate;

    /**
     * Constructor de board
     */

    public Board() {
        this.colors = new Color[Coordinate.MAX_ROW][Coordinate.MAX_COLUMN];
        lastCoordinate = null;
        this.reset();
    }

    /**
     * Reinicia el tablero
     */

    public void reset() {
        for (int r = 0; r < Coordinate.MAX_ROW; r++) {
            for (int c = 0; c < Coordinate.MAX_COLUMN; c++) {
                this.colors[r][c] = Color.NULL;
            }
        }
    }

    /**
     * Pone la ficha en la coordenada que se indica al llamar al metodo
     */

    public void putToken(Coordinate coordinate, Color color) {
        this.colors[coordinate.getRow()][coordinate.getColumn()] = color;
        this.lastCoordinate = coordinate;
    }

    /**
     * Te inidca si la coordenada esta vacia
     */

    public boolean coordinateEmpty(Coordinate coordinate) {
        return this.colors[coordinate.getRow()][coordinate.getColumn()].isNULL();
    }

    /**
     * Te crea la coordenada en la posicion mas baja de la columna que se pasa como parametro
     */

    public Coordinate getCoordinate(int column) {
        int row = whereIsTheHole(column);
        return new Coordinate(row, column);
    }

    /**
     * Calcula si la columna esta llena
     */

    public boolean isThereAHole(int column) {
        Coordinate coordinate = new Coordinate(Coordinate.MAX_ROW - 1, column);
        return this.coordinateEmpty(coordinate);
    }

    /**
     * Te devuelve la fila libre de la columna
     */

    public int whereIsTheHole(int column) {
        int row = 0;
        boolean holeFound = false;
        while (row < Coordinate.MAX_ROW && !holeFound) {
            Coordinate coordinate = new Coordinate(row, column);
            if (this.coordinateEmpty(coordinate)) {
                holeFound = true;
            } else {
                row++;
            }
        }
        return row;
    }

    /**
     * Te muestra el tablero
     */

    public void show() {
        Message.HORIZONTAL_LINE.writeln();
        for (int i = Coordinate.MAX_ROW - 1; i >= 0; i--) {
            Message.VERTICAL_LINE.write();
            for (int j = 0; j < Coordinate.MAX_COLUMN; j++) {
                this.getColor(new Coordinate(i, j)).write();
                Message.VERTICAL_LINE.write();
            }
            Console.getInstance().writeln();
        }
        Message.HORIZONTAL_LINE.writeln();

    }

    /**
     * Te devuelve el color de la coordenada
     */

    public Color getColor(Coordinate coordinate) {
        if (coordinate.validCoordinate()) {
            return this.colors[coordinate.getRow()][coordinate.getColumn()];
        } else {
            return Color.NULL;
        }

    }

    /**
     * Te devuelve la ultima coordenada en la que se coloco una ficha
     */

    public Coordinate getLastCoordinate() {
        return this.lastCoordinate;
    }

}
