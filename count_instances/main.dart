// how to count the instances created from a class in you project

class Person {
  int counter = 0;

  Person() {
    counter++;
  }
}

class Me extends Person {}

main() {
  Person me = Person();
  Person him = Person();
  Person we = Person();
  print(Person().counter);
  print(Me().counter);
  List<String> keys = [
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
    "8",
    "f",
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
    "8",
    "f",
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
    "8",
    "f",
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
    "8",
    "f",
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
    "8",
    "f",
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
    "8",
    "f",
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
    "8",
    "f",
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
    "8",
    "f",
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
    "8",
    "f",
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
    "8",
    "f",
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
    "8",
    "f",
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
    "8",
    "f",
    "a",
    "a",
    "s",
    "d",
    "d",
    "f",
    "5",
    "5",
  ];
  print(keys.join());
}
