package models.players;

import models.Board;
import models.CheckBoard;
import models.Color;
import views.Error;

public abstract class Player {
    private Color color;
    private Board board;

    public Player(Color color, Board board) {
        assert !color.isNULL();
        this.color = color;
        this.board = board;
    }


    public Board getBoard() {
        return board;
    }

    public Color getColor() {
        return color;
    }

    abstract void putToken();


    public void play() {
        CheckBoard checkBoard = new CheckBoard(this.board);
        if (!checkBoard.isFull()) {
            this.putToken();
        } else {
            Error.FULL_BOARD.writeln();
        }
    }

}