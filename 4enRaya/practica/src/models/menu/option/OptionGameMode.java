package models.menu.option;

import models.Turn;

public abstract class OptionGameMode extends ConsoleOption {

    protected Turn turn;

    public OptionGameMode(String title, Turn turn) {
        super(title);
        this.turn = turn;
    }

}