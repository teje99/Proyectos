package models.menu;

import models.Turn;
import models.menu.option.OptionBasic;
import models.menu.option.OptionDemo;
import models.menu.option.OptionTraining;

public class MenuGameMode extends ConsoleMenu {
    private Turn turn;

    /**
     * Se reescribe el constructor del models.menu, teniendo ya predeterminada el nombre del models.menu. Pero añadiendo que necesitamos
     * el turno.
     */

    public MenuGameMode(String title, Turn turn) {
        super(title);
        this.turn = turn;
    }

    @Override
    public void addOptions() {
        this.add(new OptionBasic(this.turn));
        this.add(new OptionDemo(this.turn));
        this.add(new OptionTraining(this.turn));
    }

}