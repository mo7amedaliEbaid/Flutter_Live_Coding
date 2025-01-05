// Simple Factory
// it is a creational design pattern used to create objects without exposing the instantiation logic to the client
// it provides a single method to create and return different types of objects based on input parameters.

// 1- abstract class for parent ( shape in our example )

abstract class Shape {
  void draw();
}

// 2- concrete classes extends the parent ( circle / square )

class Circle extends Shape {
  @override
  void draw() {
    print("This is a circle");
  }
}

class Square extends Shape {
  @override
  void draw() {
    print("This is a square");
  }
}

// 3- Shape Factory
// to create and return shape objects

class ShapeFactory {
  static Shape createShape(String shapeType) {
    switch (shapeType) {
      case "circle":
        return Circle();
      case "square":
        return Square();
      default:
        throw ArgumentError("Invalid shape type: ${shapeType}");
    }
  }
}

// 4- client side

main() {
  Shape circle = ShapeFactory.createShape("circle");
  Shape square = ShapeFactory.createShape("square");

  circle.draw();
  square.draw();
}
