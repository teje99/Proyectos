package models;

import views.Error;
import views.Console;
import views.Message;

public class CheckBoard {
    private Board board;

    public CheckBoard(Board board) {
        this.board = board;
    }

    /**
     * Te muestra por pantalla el ganador o si el tablero esta lleno
     */

    public void showResult() {
        if (this.checkInAllDirectionsFourInARow()) {
            Console.getInstance().writeln(board.getColor(board.getLastCoordinate()).writeColor() + ", " + Message.PLAYER_WIN);
        } else {
            Error.FULL_BOARD.writeln();
        }

    }

    /**
     * Te dice si el tablero esta lleno
     */

    public boolean isFull() {
        boolean full = true;
        int i = 0;
        while (i < Coordinate.MAX_COLUMN && full) {
            if (board.getColor(new Coordinate(Coordinate.MAX_ROW - 1, i)) == Color.NULL) {
                full = false;
            }
            i++;
        }
        return full;
    }

    /**
     * Te comprueba a partir de la ultima coordenada si hay cuatro en raya en todas las direcciones
     */

    public boolean checkInAllDirectionsFourInARow() {
        for (CardinalPoints cardinalPoint : CardinalPoints.values()) {
            if (this.checkInOneDirectionFourInARow(cardinalPoint)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Te comprueba si hay cuatra fichas iguales en una direccion especifica
     */

    private boolean checkInOneDirectionFourInARow(CardinalPoints cardinalPoints) {
        Coordinate[] fourInRow = cardinalPoints.next4Coordinate(board.getLastCoordinate());
        for (int i = 0; i < 4; i++) {
            if (this.checkFourInARow(fourInRow)) {
                return true;
            } else {
                cardinalPoints.moveArray(fourInRow);
            }
        }
        return false;
    }

    /**
     * Te comprueba si en el array las cuatro fichas son iguales
     */

    private boolean checkFourInARow(Coordinate[] coordinates) {
        int counter = 0;
        for (Coordinate coordinate : coordinates) {
            if (board.getColor(coordinate).equals(board.getColor(board.getLastCoordinate()))) {
                counter++;
            }
        }
        return counter == 4;
    }


}
