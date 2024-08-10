package models.menu.option;

import models.Color;
import models.Turn;
import models.players.MachinePlayer;
import models.players.Player;
import views.Message;


public class OptionDemo extends OptionGameMode {

    public OptionDemo(Turn turn) {
        super(Message.OPTION_DEMO.toString(), turn);
    }

    @Override
    public void interact() {
        Player[] players = turn.getPlayers();
        for (int i = 0; i < turn.NUMBER_PLAYERS; i++) {
            players[i] = new MachinePlayer(Color.get(i), turn.getBoard());
        }
        turn.setActivePlayer(0);
    }
}