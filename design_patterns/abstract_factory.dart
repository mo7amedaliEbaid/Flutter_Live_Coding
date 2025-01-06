// Abstract Factory
// It's a creational design pattern that provides an interface for creating families of related objects without specifying their concrete
// classes
// it is useful when a system needs to support multiple product families and the product families need to work together

// factory of factories

// 1- abstract product
abstract class Animal {
  void getsSick();
}

abstract class Person {
  void cure();
}

// 2- concrete products

class Cat extends Animal {
  @override
  void getsSick() {
    print("Cat is Sick");
  }
}

class Dog extends Animal {
  @override
  void getsSick() {
    print("Dog gets sick");
  }
}

class Doctor extends Person {
  @override
  void cure() {
    print("Doctor is Curing");
  }
}

class Nurse extends Person {
  @override
  void cure() {
    print("Nurse Rush to help");
  }
}

// 3- define abstract factory
abstract class AnimalClinic {
  Animal createAnimal();

  Person askForHelp();
}

// 4- concrete factory

class CatsClinic extends AnimalClinic {
  @override
  Animal createAnimal() {
    return Cat();
  }

  @override
  Person askForHelp() {
    return Doctor();
  }
}

class DogsClinic extends AnimalClinic {
  @override
  Animal createAnimal() {
    return Dog();
  }

  @override
  Person askForHelp() {
    return Nurse();
  }
}

//5- Client Code
main() {
  AnimalClinic catsClinic = CatsClinic();
  Animal cat = catsClinic.createAnimal();
  Person doctor = catsClinic.askForHelp();
  cat.getsSick();
  doctor.cure();

  AnimalClinic dogsClinic = DogsClinic();
  Animal dog = dogsClinic.createAnimal();
  Person nurse = dogsClinic.askForHelp();
  dog.getsSick();
  nurse.cure();
}

// 1- abstract products
/*abstract class Animal {
  void getsSick();
}

abstract class Person {
  void cure();
}

// 2- concrete products
class Cat extends Animal {
  @override
  void getsSick() {
    print("Cat is Sick");
  }
}

class Dog extends Animal {
  @override
  void getsSick() {
    print("Dog gets Sick");
  }
}

class Doctor extends Person {
  @override
  void cure() {
    print("Doctor is curing");
  }
}

abstract class AnimalClinic {
  Animal createAnimal();

  Person createDoctor();
}

class CatsClinic extends AnimalClinic {
  @override
  Animal createAnimal() {
    return Cat();
  }

  @override
  Person createDoctor() {
    return Doctor();
  }
}

class DogsClinic extends AnimalClinic {
  @override
  Animal createAnimal() {
    return Dog();
  }

  @override
  Person createDoctor() {
    return Doctor();
  }
}

// 5- Client Code

main() {
  AnimalClinic catsClinic = CatsClinic();
  Animal cat = catsClinic.createAnimal();
  Person doctor = catsClinic.createDoctor();
  cat.getsSick();
  doctor.cure();

  AnimalClinic dogsClinic = DogsClinic();
  Animal dog = dogsClinic.createAnimal();
  Person dogsDoctor = dogsClinic.createDoctor();
  dog.getsSick();
  dogsDoctor.cure();
}*/

/*
// Animal interface
abstract class Animal {
  void speak();
}

// Concrete Animal implementations
class Dog implements Animal {
  @override
  void speak() {
    print('Woof! Woof!');
  }
}

class Cat implements Animal {
  @override
  void speak() {
    print('Meow! Meow!');
  }
}

// Zookeeper interface
abstract class Zookeeper {
  void careForAnimal();
}

// Concrete Zookeeper implementations
class DogZookeeper implements Zookeeper {
  @override
  void careForAnimal() {
    print('I care for dogs and ensure they are happy!');
  }
}

class CatZookeeper implements Zookeeper {
  @override
  void careForAnimal() {
    print('I care for cats and ensure they are comfortable!');
  }
}

// Abstract Factory interface
abstract class ZooFactory {
  Animal createAnimal();
  Zookeeper createZookeeper();
}

// Concrete Factory for Dog Zoo
class DogZooFactory implements ZooFactory {
  @override
  Animal createAnimal() {
    return Dog();
  }

  @override
  Zookeeper createZookeeper() {
    return DogZookeeper();
  }
}

// Concrete Factory for Cat Zoo
class CatZooFactory implements ZooFactory {
  @override
  Animal createAnimal() {
    return Cat();
  }

  @override
  Zookeeper createZookeeper() {
    return CatZookeeper();
  }
}

void main() {
  // Dog Zoo Factory
  ZooFactory dogZooFactory = DogZooFactory();
  Animal dog = dogZooFactory.createAnimal();
  Zookeeper dogKeeper = dogZooFactory.createZookeeper();
  dog.speak(); // Output: Woof! Woof!
  dogKeeper.careForAnimal(); // Output: I care for dogs and ensure they are happy!

  // Cat Zoo Factory
  ZooFactory catZooFactory = CatZooFactory();
  Animal cat = catZooFactory.createAnimal();
  Zookeeper catKeeper = catZooFactory.createZookeeper();
  cat.speak(); // Output: Meow! Meow!
  catKeeper.careForAnimal(); // Output: I care for cats and ensure they are comfortable!
}
*/
