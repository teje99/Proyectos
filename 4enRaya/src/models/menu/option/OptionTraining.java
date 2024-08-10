package models.menu.option;

import models.Color;
import models.Turn;
import models.players.HumanPlayer;
import models.players.MachinePlayer;
import models.players.Player;
import views.Message;

public class OptionTraining extends OptionGameMode {

    public OptionTraining(Turn turn) {
        super(Message.OPTION_TRAINING.toString(), turn);
    }

    @Override
    public void interact() {
        Player[] players = turn.getPlayers();
        for (int i = 0; i < turn.NUMBER_PLAYERS; i++) {
            if (i % 2 == 0) {
                players[i] = new HumanPlayer(Color.get(i), turn.getBoard());
            } else {
                players[i] = new MachinePlayer(Color.get(i), turn.getBoard());
            }

        }
        turn.setActivePlayer(0);
    }
}