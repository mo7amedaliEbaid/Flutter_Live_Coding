// Factory Method
// It is a creational design pattern that provides an interface for creating objects in a superclass
// but allows subclass to alter the type of objects that will be created .
// It relies on inheritance and let the subclass decide which object to create.
// it delegates the responsibility of object creation to a factory method.
// relies on subclass to decide which class to instantiate .

// 1- create abstract product

abstract class Animal {
  void speak();
}

// 2- create concrete products
class Cat extends Animal {
  @override
  void speak() {
    print("Cat is Speaking");
  }
}

class Dog extends Animal {
  @override
  void speak() {
    print("Dog is speaking");
  }
}

// 3- create abstract creator(factory)
abstract class AnimalFactory {
  Animal createAnimal();
}

// 4- create concrete creators(factory)
class DogFactory extends AnimalFactory {
  @override
  Animal createAnimal() {
    return Dog();
  }
}

class CatFactory extends AnimalFactory {
  @override
  Animal createAnimal() {
    return Cat();
  }
}

// 5- client
main() {
  AnimalFactory dogFactory = DogFactory();
  Animal dog = dogFactory.createAnimal();
  dog.speak();

  // AnimalFactory catFactory = CatFactory();
  Animal cat = CatFactory().createAnimal();
  cat.speak();
}
