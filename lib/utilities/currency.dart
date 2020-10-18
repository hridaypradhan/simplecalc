class Currency extends Comparable {
  String symbol, name, shortForm;

  Currency(String shortForm, String name, String symbol) {
    this.symbol = symbol;
    this.name = name;
    this.shortForm = shortForm;
  }

  String toString() {
    return '$symbol - $name - $shortForm\n';
  }

  @override
  int compareTo(other) {
    return this.name.compareTo(other.name);
  }
}
