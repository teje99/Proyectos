package models.menu.option;

import views.Console;

public abstract class ConsoleOption {

    public static Console console = new Console();
    private String title;

    public ConsoleOption(String title) {
        this.title = title;
    }

    /**
     * Se realiza la accion de la opcion
     */
    public abstract void interact();

    /**
     * Te muesta el titulo de la opcion
     */
    public void showTitle(int index) {
        console.writeln(index + ". " + this.getTitle());
    }

    /**
     * Te devuelve el titulo de la opcion
     */
    protected String getTitle() {
        return this.title;
    }

}
