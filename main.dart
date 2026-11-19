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