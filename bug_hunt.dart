class Phone {
  String _brand = '';   // Bug 1: fields need a starting value
  int _battery = 0;     // Bug 1

  Phone(String brand, int battery) {
    _brand = brand;
    _battery = battery;
  }

  int get battery {
    return _battery;
  }

  // Bug 4: added a setter that accepts only 0 to 100
  set battery(int value) {
    if (value >= 0 && value <= 100) {
      _battery = value;
    }
  }
}

class SmartPhone extends Phone {
  String _system = '';

  // Bug 2: must call the parent constructor with super
  SmartPhone(String brand, int battery, String system) : super(brand, battery) {
    _system = system;
  }

  // Bug 3: @override removed, because Phone has no restart method
  void restart() {
    print('Restarting $_system');
  }
}

void main() {
  Phone p = new Phone('Tecno', 50);   // Not a bug: "new" is optional in Dart, but still allowed
  p.battery = 100;
  print(p.battery);                   // Bug 5: removed the () after battery
}