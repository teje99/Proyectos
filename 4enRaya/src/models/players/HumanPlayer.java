package models.players;

import models.Color;
import models.Board;
import models.Coordinate;
import views.Error;
import views.Console;
import views.Message;

public class HumanPlayer extends Player {

    public HumanPlayer(Color color, Board board) {
        super(color, board);
    }

    @Override
    public void putToken() {
        Coordinate coordinate;
        coordinate = this.getCoordinate();
        this.getBoard().putToken(coordinate, this.getColor());
    }

    /**
     * Le pide una columna al usuario y genera una coordenada seleccionando la fila disponible,
     * si la columna esta llena o fuera de los limites le solicita otra columna
     */
    private Coordinate getCoordinate() {
        Error error;
        int column;
        do {
            Console.getInstance().writeln(Message.SHOW_PLAYER.toString() + this.getColor().writeColor());
            column = Console.getInstance().readInt(Message.ENTER_COLUMN.toString());
            column--;
            error = checkColumn(column);
        } while (!error.isNULL());
        return this.getBoard().getCoordinate(column);
    }

    /**
     * Comprueba si la columna es valida
     */
    private Error checkColumn(int column) {
        Error error = Error.NULL;
        if (!(0 <= column && column < Coordinate.MAX_COLUMN)) {
            error = Error.WRONG_COLUMN;
        } else {
            if (!this.getBoard().isThereAHole(column)) {
                error = Error.COLUMN_NOT_EMPTY;
            }
        }
        error.writeln();
        return error;
    }

}