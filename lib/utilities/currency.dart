class Currency {
  String symbol, name, shortForm;

  Currency(String shortForm, String name, String symbol) {
    this.symbol = symbol;
    this.name = name;
    this.shortForm = shortForm;
  }

  String toString() {
    return '$symbol - $name - $shortForm\n';
  }
}
