package models;

import views.Console;
import views.Message;

public enum Color {
    R,
    Y,
    NULL;

    Color() {
    }

    /**
     * Te devuelve un color en funcion del ordinal
     */

    public static Color get(int ordinal) {
        assert ordinal >= 0 && ordinal < Color.NULL.ordinal();
        Color[] arrayColors = Color.values();
        return arrayColors[ordinal];
    }

    /**
     * Te retorna el color nulo
     */

    public boolean isNULL() {
        return this == Color.NULL;
    }

    public Message writeColor() {
        if (this == R) {
            return Message.RED;
        } else {
            return Message.YELLOW;
        }
    }

    /**
     * Te escribe el color
     */

    public void write() {
        String color = this.name();
        if (this.isNULL()) {
            color = " ";
        }
        Console.getInstance().write(color);
    }
}
