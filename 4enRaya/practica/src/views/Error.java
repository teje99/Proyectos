package views;

public enum Error {
    NULL,
    FULL_BOARD("The board is full"),
    COLUMN_NOT_EMPTY("That column is already fulled"),
    WRONG_COLUMN("Invalid column!!! Values[1-7]");
    private String message;

    Error(String message) {
        this.message = message;
    }

    Error() {
    }

    public boolean isNULL() {
        return this == Error.NULL;
    }

    public void writeln() {
        if (!this.isNULL()) {
            Console.getInstance().writeln(this.message);
        }
    }
}
