package models.players;

import models.Board;
import models.Color;
import models.Coordinate;
import views.Console;
import views.Message;

public class MachinePlayer extends Player {

    public MachinePlayer(Color color, Board board) {
        super(color, board);
    }

    @Override
    public void putToken() {
        Coordinate coordinate;
        Console.getInstance().writeln(Message.SHOW_PLAYER.toString() + this.getColor().writeColor());
        do {
            coordinate = this.getBoard().getCoordinate((int) (Math.random() * 7));
        } while (!coordinate.validCoordinate());
        this.getBoard().putToken(coordinate, this.getColor());
    }

}
