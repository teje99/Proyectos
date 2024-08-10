package models.menu;

import models.menu.option.ConsoleOption;

interface Menu {
    /**
     * Método en el que se pondrán las opciones que quieras cargar en el models.menu.
     */
    void addOptions();

    /**
     * Muestra título y ejecuta opción seleccionada.
     */

    void interact_();

    /**
     * Muestra el título del menú y de las opciones.
     */

    void showTitles();


    /**
     * Ejecuta la opción elegida
     */

    void execChoosedOption();

    /**
     * Añáde una opción a la lista de opciones.
     */

    void add(ConsoleOption option);

    /**
     * Quita una opción
     */

    void removeOptions();

    /**
     * Te dice si el array de opciones tiene alguna opción
     */

    boolean hasOption(ConsoleOption option);

}