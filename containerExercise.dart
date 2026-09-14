class Item {
  Item(this.name, this.weight);

  final String name;
  final double weight;
}

class Inventory {
  Inventory(this.name, this.maxWeight);

  final String name;
  final double maxWeight;
  final List<Item> _items = [];

  List<Item> get items => List.unmodifiable(_items);

  double get weight => _items.fold(0.0, (sum, item) => sum + item.weight);

  void addItem(Item item) {
    if (weight + item.weight > maxWeight) {
      print("Inventory overloaded. Cannot add ${item.name}");
      return;
    }

    _items.add(item);
    print("${item.name} added.");

    final newItems = <String>[];

    for (final item in items) {
      newItems.add(item.name);
      print(item.name);
    }

    print(newItems);
  }

  void removeItem(String name) {
    final index = _items.indexWhere((item) => item.name == name);

    if (index == -1) {
      print("Item not found.");
      return;
    }

    final item = _items.removeAt(index);
    print("${item.name} removed.");
  }
}

class Player {
  Player(this.name, this.inventory);

  final String name;
  final Inventory inventory;
}

void main() {
  final player1 = Player("Yannick", Inventory("Backpack", 10));

  player1.inventory.addItem(Item("Sword", 3));
  player1.inventory.addItem(Item("Shield", 5));
  player1.inventory.addItem(Item("Rock", 4));

  print("Total weight: ${player1.inventory.weight}");
}
