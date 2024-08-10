package models;

import models.menu.MenuGameMode;
import models.players.Player;
import views.Message;

public class Turn {

    private Board board;
    public final int NUMBER_PLAYERS = 2;
    private Player[] players;
    private int activePlayer;

    public Turn(Board board) {
        assert board != null;
        this.board = board;
        this.players = new Player[this.NUMBER_PLAYERS];
        this.reset();
    }

    /**
     * Llama al menu para seleccionar el tipo de jugadores en funcion del modo de juego
     * y asi rellenar el array de jugadores
     */
    public void reset() {
        new MenuGameMode(Message.TITLEMENU.toString(), this).interact();

    }

    /**
     * Llama al jugador activo para que ponga ficha y cambia el turno para que
     * juegue el otro jugador
     */
    public void play() {
        this.players[activePlayer].play();
        this.activePlayer = (this.activePlayer + 1) % this.NUMBER_PLAYERS;
    }

    /**
     * Te devuelve el array de jugadores
     */
    public Player[] getPlayers() {
        return players;
    }

    /**
     * Devuelve el tablero
     */
    public Board getBoard() {
        return board;
    }

    /**
     * Establece el jugador activo
     */
    public void setActivePlayer(int activePlayer) {
        this.activePlayer = activePlayer;
    }

}
