package views;

public enum Message {
    MAINTITLE("--- CONECT 4 ---"),
    HORIZONTAL_LINE("---------------"),
    VERTICAL_LINE(" | "),
    ENTER_COLUMN("Enter a column to drop a token: "),
    SHOW_PLAYER("Turn: "),
    PLAYER_WIN("You win!!! :-)"),
    RED("RED"),
    YELLOW("YELLOW"),
    RESUME("Do you want to play another game? (y/n): "),
    TITLEMENU("--- Game mode ---"),
    OPTION_BASIC("Basic"),
    OPTION_TRAINING("Training"),
    OPTION_DEMO("Demo");

    private String message;

    Message(String message) {
        this.message = message;
    }


    public void write() {
        Console.getInstance().write(this.message);
    }

    public void writeln() {
        Console.getInstance().writeln(this.message);
    }


    @Override
    public String toString() {
        return message;
    }
}
