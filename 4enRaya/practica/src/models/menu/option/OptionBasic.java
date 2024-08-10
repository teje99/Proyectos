package models.menu.option;

import models.Color;
import models.Turn;
import models.players.HumanPlayer;
import models.players.Player;
import views.Message;

public class OptionBasic extends OptionGameMode {

    public OptionBasic(Turn turn) {
        super(Message.OPTION_BASIC.toString(), turn);
    }

    @Override
    public void interact() {
        Player[] players = turn.getPlayers();
        for (int i = 0; i < turn.NUMBER_PLAYERS; i++) {
            players[i] = new HumanPlayer(Color.get(i), turn.getBoard());
        }
        turn.setActivePlayer(0);
    }
}