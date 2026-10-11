mixin CanFight {
  void fight() {
    print("Attacks furiosly!");
  }
}

mixin CanCastSpell {
  void castSpell() {
    print("Casting spell.");
  }
}

mixin CanStealth {
  void goStealth() {
    print("Going into stealth mode.");
  }
}

mixin class HasMana {
  int mana = 100;
}

class Warrior with CanFight {}

class Mage with CanCastSpell, HasMana {
  void showMana() {
    print(mana);
  }
}

class Rogue with CanFight, CanStealth {}

class Spellblade with CanFight, CanCastSpell, HasMana {
  @override
  void fight() {
    print("Uses sword and magic visiously.");
  }

  void showMana() {
    print(mana);
  }
}

void main() {
  var warrior = Warrior();
  warrior.fight();

  var mage = Mage();
  mage.castSpell();

  var rouge = Rogue();
  rouge.fight();
  rouge.goStealth();

  var spellblade = Spellblade();
  spellblade.castSpell();
  spellblade.fight();

  print(mage.mana);
  print(spellblade.mana);
}
