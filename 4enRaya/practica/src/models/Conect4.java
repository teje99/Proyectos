package models;

import views.Console;
import views.Message;

public class Conect4 {
    private Board board;
    private Turn turn;

    public Conect4() {
        this.board = new Board();
        this.turn = new Turn(this.board);
    }

    /**
     * Se inicia la partida y pregunta si quieres jugar otra partida
     */

    public void play() {
        do {
            this.playGame();
        } while (this.isResumedGame());
    }

    /**
     * Va preguntando a los jugadores donde poner ficha y comprobando si hay cuatro en raya o el tablero esta lleno
     */

    private void playGame() {
        Message.MAINTITLE.writeln();
        this.board.show();
        do {
            this.turn.play();
            this.board.show();
        } while (!this.gameOver());
        new CheckBoard(this.board).showResult();
    }

    /**
     * Comprueba si la partida se ha acabado ya sea por tablero lleno o por
     * 4 en raya
     */
    private boolean gameOver() {
        CheckBoard checkBoard = new CheckBoard(this.board);
        return checkBoard.isFull() || checkBoard.checkInAllDirectionsFourInARow();
    }

    /**
     * Pregunta al usuario si quiere jugar otra partida
     */
    private boolean isResumedGame() {
        char resume;
        do {
            resume = Console.getInstance().readChar(Message.RESUME.toString());
        } while (!(resume == 'y' || resume == 'n'));
        boolean result = false;
        if (resume == 'y') {
            result = true;
            this.board.reset();
            this.turn.reset();
        }
        return result;
    }

}
