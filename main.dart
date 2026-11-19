class BusCard {
String _owner = '';
int _balance = 0;
// Constructor (done for you)
BusCard(String owner, int balance) {
_owner = owner;
_balance = balance;
}
// EXAMPLE: getter for owner (done for you)
String get owner {
return _owner;
}
// TODO 1: write a getter for balance
// Hint: copy the style of the owner getter. Balance is an int.

int get balance {
    return _balance;
  }

set owner(String newName) {
if (newName.length < 3) {
print('Error: name too short');
} else {
_owner = newName;
}
}
// EXAMPLE: a method (done for you)
void showInfo() {
print('Owner: $_owner | Balance: $_balance RWF');
}
// TODO 2: write a method topUp(int amount)
// Rule: only accept amounts from 500 to 50000 RWF.
// OK -> add amount to _balance, print 'Topped up <amount> RWF'
// Not OK -> print 'Error: top-up must be 500 to 50000 RWF'
// Hint: use if / else, like the owner setter.

 void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }


// TODO 3: write a method pay(int fare)
// fare is more than _balance -> print 'Card declined'
// otherwise -> subtract fare from _balance, print 'Paid <fare> RWF'
 void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}


class StudentCard extends BusCard {
int _discount = 0;
// Constructor (done for you)
// ": super(owner, balance)" builds the parent BusCard first
StudentCard(String owner, int balance, int discount) : super(owner,
balance) {
_discount = discount;
}
// EXAMPLE: override showInfo (done for you)
@override
void showInfo() {
super.showInfo(); // run the parent's showInfo first
print('Student card: $_discount% off');
}
// TODO 4: override pay(int fare)
// Step 1: work out the discount: int off = fare * _discount ~/ 100;
// Step 2: print 'Student discount: <off> RWF'
// Step 3: call the PARENT's pay with (fare - off)
// Hint: look at how showInfo above uses @override and super.
@override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

void main() {
  // My numbers: D = 8, L = 8
  // Starting balance = 1080 RWF, Bus fare = 208 RWF, Discount = 18%

  // EXAMPLE (done for you): create a card and test the setter
  BusCard card = BusCard('KWIZERA William', 1080);
  card.owner = 'Al'; // refused: name too short
  card.showInfo();

  // TODO 5: change the owner to your full name, then call showInfo()
  card.owner = 'KWIZERA William';
  card.showInfo();

  // TODO 6: top up 100 RWF (must be refused), then top up 2000 RWF
  card.topUp(100);
  card.topUp(2000);

  // TODO 7: pay your bus fare 2 times, then call showInfo()
  card.pay(208);
  card.pay(208);
  card.showInfo();

  // TODO 8: create a StudentCard with your name, starting balance and discount
  StudentCard student = StudentCard('KWIZERA William', 1080, 18);

  // TODO 9: pay your bus fare with the student card, then call showInfo()
  student.pay(208);
  student.showInfo();
}