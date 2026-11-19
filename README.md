# Dart OOP Assignment: Kigali Bus Card

**Name:** KWIZERA William
**Student ID:** 26608

## My numbers
- D = 8, L = 8
- Starting balance = 1080 RWF
- Bus fare = 208 RWF
- Student discount = 18%

## Output of main.dart
```
Error: name too short
Owner: KWIZERA William | Balance: 1080 RWF
Owner: KWIZERA William | Balance: 1080 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 208 RWF
Paid 208 RWF
Owner: KWIZERA William | Balance: 2664 RWF
Student discount: 37 RWF
Paid 171 RWF
Owner: KWIZERA William | Balance: 909 RWF
Student card: 18% off
```

## Part 1: Why no setter for balance?
If balance had a setter, anyone could write `card.balance = 999999` and skip the rules. Without a setter, the balance can only change through `topUp` and `pay`, which check the amount first. This keeps the money safe.

## Part 2: What does ~/ do?
`print(237 * 17 / 100);` prints `40.29` because `/` gives a decimal answer. `print(237 * 17 ~/ 100);` prints `40` because `~/` is integer division, so it throws away the decimal part. This is why the student discount is always a whole number of RWF.

## Part 4: Bug table
| Bug | The line | Why it is wrong (your words) | Your fix |
|---|---|---|---|
| 1 | `String _brand;` `int _battery;` | Dart wants a starting value for these fields, and the constructor body runs too late to give it one | `String _brand = '';` `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | The child never tells the parent `Phone` which brand and battery to use | add `: super(brand, battery)` |
| 3 | `@override` above `restart()` | `@override` only works when the parent has the same method, and `Phone` has no `restart` | delete `@override` |
| 4 | `p.battery = 100;` | `Phone` has only a getter, so the value can't be assigned | add `set battery(int value)` that accepts 0 to 100 |
| 5 | `print(p.battery());` | `battery` is a getter, not a method, so it must not have `()` | `print(p.battery);` |
| Not a bug | `Phone p = new Phone('Tecno', 50);` | `new` is optional in Dart, but it is still allowed | (none) |

## Part 5
My prediction: the first print shows `1` and the second print shows `5`.

Why: for `a`, `add()` makes `_items` 1, then `a.items = -5` is ignored because the setter only accepts values that are 0 or more, so it prints 1. For `b`, each `b.add()` runs `super.add()` twice, so it adds 2 each time. Two calls make 4, and then `b.items = b.items + 1` sets it to 5, which is allowed, so it prints 5.

Real output:

Was I right?