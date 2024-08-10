package models.menu;

import models.menu.option.ConsoleOption;
import views.Console;

import java.util.ArrayList;
import java.util.List;

public abstract class ConsoleMenu implements Menu {

    private static Console console = new Console();
    private String title;

    private List<ConsoleOption> options;


    /**
     * Constructor models.menu
     */
    protected ConsoleMenu(String title) {
        this.title = title;
        this.options = new ArrayList<ConsoleOption>();
    }

    /**
     * El models.menu añade las opciones que tenga,y llama a interact_
     */

    public void interact() {
        this.addOptions();
        this.interact_();
    }

    /**
     * Método abstracto que ya se definirá más adelante con las opciones que quieras añadir
     * dependiendo del models.menu que quieras.
     */
    @Override
    public abstract void addOptions();

    /**
     * Muestra título y ejecuta opción seleccionada.
     */

    @Override
    public void interact_() {
        this.showTitles();
        this.execChoosedOption();
    }

    /**
     * Muestra el título del menú y llama showtitlke
     */
    @Override
    public void showTitles() {
        this.showTitle();
        for (int i = 0; i < this.options.size(); i++) {
            this.options.get(i).showTitle(i + 1);
        }
    }

    /**
     * Muestra el título de las opciones
     */

    private void showTitle() {
        String string = "\n" + this.title + "\n";
        for (int i = 0; i < this.title.length(); i++) {
            string += "-";
        }
        ConsoleMenu.console.writeln(string);
    }

    /**
     * Te pide una opción y ejecuta dicha opción
     */
    @Override
    public void execChoosedOption() {
        this.options.get(this.chooseOption()).interact();
    }

    private int chooseOption() {
        int answer;
        boolean ok;
        do {
            answer = ConsoleMenu.console.readInt("Options? [1-" + this.options.size() + "]: ") - 1;
            ok = 0 <= answer && answer <= this.options.size() - 1;
            if (!ok) {
                ConsoleMenu.console.writeln("Error!!!");
            }
        } while (!ok);
        return answer;
    }

    /**
     * Añáde una opción
     */
    @Override
    public void add(ConsoleOption option) {
        this.options.add(option);
    }

    /**
     * Quita una opción
     */
    @Override
    public void removeOptions() {
        this.options.clear();
    }

    /**
     * Te dice si el array de opciones tiene alguna opción
     */
    @Override
    public boolean hasOption(ConsoleOption option) {
        return this.options.contains(option);
    }

}