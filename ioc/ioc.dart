//
// The Inversion-of-Control (IoC) pattern, is about providing any kind of callback, which "implements" and/or controls reaction,
// instead of acting ourselves directly (in other words, inversion and/or redirecting control to the external handler/controller).
// The Dependency-Injection (DI) pattern is a more specific version of IoC pattern, and is all about removing dependencies from your code.
//
// Every DI implementation can be considered IoC, but one should not call it IoC, because implementing Dependency-Injection is harder
// than callback (Don't lower your product's worth by using the general term "IoC" instead).
//
// For DI example, say your application has a text-editor component, and you want to provide spell checking. Your standard code would look something like this:
//
// public class TextEditor {
//
//     private SpellChecker checker;
//
//     public TextEditor() {
//         this.checker = new SpellChecker();
//     }
// }
// What we've done here creates a dependency between the TextEditor and the SpellChecker. In an IoC scenario we would instead do something like this:
//
// public class TextEditor {
//
//     private IocSpellChecker checker;
//
//     public TextEditor(IocSpellChecker checker) {
//         this.checker = checker;
//     }
// }
// In the first code example we are instantiating SpellChecker (this.checker = new SpellChecker();), which means the TextEditor class directly depends on the SpellChecker class.
//
// In the second code example we are creating an abstraction by having the SpellChecker dependency class in TextEditor's constructor signature (not initializing dependency in class). This allows us to call the dependency then pass it to the TextEditor class like so:
//
// SpellChecker sc = new SpellChecker(); // dependency
// TextEditor textEditor = new TextEditor(sc);
// Now the client creating the TextEditor class has control over which SpellChecker implementation to use because we're injecting the dependency into the TextEditor signature.
//
// Note that just like IoC being the base of many other patterns, above sample is only one of many Dependency-Injection kinds, for example:
//
// Constructor Injection.
// Where an instance of IocSpellChecker would be passed to constructor, either automatically or similar to above manually.
//
// Setter Injection.
// Where an instance of IocSpellChecker would be passed through setter-method or public property.
//
// Service-lookup and/or Service-locator
// Where TextEditor would ask a known provider for a globally-used-instance (service) of IocSpellChecker type (and that maybe without storing said instance, and instead, asking the provider again and again).
// ### **Explanation of Inversion of Control (IoC)**
//
// The **Inversion of Control (IoC)** principle is a design principle where the flow of control is inverted compared to traditional programming. Instead of a class taking control of its dependencies (e.g., creating or managing them), the dependencies are supplied to the class externally. This makes the code more flexible, modular, and easier to test.
//
// Your provided code achieves **IoC** through **Dependency Injection (DI)**. Let’s break it down step by step:
//
// ---
//
// ### **Key Components of the Code**
// 1. **`AuthService` (Abstract Class):**
//    - The `AuthService` class defines a contract (via the `login` method) for authentication services.
//    - It does not specify the implementation. This allows different implementations (like email or Google login) to adhere to the same interface.
//
// 2. **`EmailAuthService` and `GoogleAuthService` (Concrete Implementations):**
//    - These classes implement the `AuthService` interface.
//    - Each provides a different way to perform login (`EmailAuthService` for email and `GoogleAuthService` for Google).
//
// 3. **`LoginManager` (Dependency Consumer):**
//    - This class depends on an `AuthService` to handle login but **does not create or directly control the concrete implementation of the `AuthService`**.
//    - Instead, the specific implementation is passed to it via the constructor (constructor injection), adhering to the **IoC principle**.
//
// 4. **`main` Function (Dependency Provider):**
//    - The `main` function is responsible for providing the specific implementations (`EmailAuthService` or `GoogleAuthService`) to the `LoginManager` via dependency injection.
//
// ---
//
// ### **How Inversion of Control Is Achieved**
//
// #### **1. Decoupling of Dependency Creation**
//    - Instead of the `LoginManager` directly creating an instance of `EmailAuthService` or `GoogleAuthService`, it accepts an `AuthService` object as a dependency via its constructor:
//      ```dart
//      LoginManager(this._authService);
//      ```
//    - This decouples the `LoginManager` class from specific implementations. It doesn’t need to know **how** the `AuthService` is implemented; it only knows that it can call `login`.
//
// #### **2. Flexibility in Dependency Injection**
//    - By injecting the dependency into the `LoginManager`, you can easily switch between different implementations of `AuthService` without modifying the `LoginManager` code:
//      ```dart
//      LoginManager emailLoginManager = LoginManager(EmailAuthService());
//      LoginManager googleLoginManager = LoginManager(GoogleAuthService());
//      ```
//    - This makes the code **open to extension** (e.g., adding new authentication methods like Facebook) but **closed to modification**, which adheres to the **Open/Closed Principle (OCP)**.
//
// #### **3. Separation of Concerns**
//    - Each class has a clear responsibility:
//      - `AuthService` defines the contract.
//      - Concrete classes (`EmailAuthService` and `GoogleAuthService`) handle the implementation details.
//      - `LoginManager` focuses on managing login, delegating the actual authentication process to an injected dependency.
//    - This separation ensures that changes in one class (e.g., adding a new `AuthService` implementation) do not ripple through the rest of the code.
//
// #### **4. Testability**
//    - By using the `AuthService` interface, you can easily mock or stub dependencies in unit tests for `LoginManager`. For example:
//      ```dart
//      class MockAuthService implements AuthService {
//        @override
//        void login(String username, String password) {
//          print('Mock login called with $username');
//        }
//      }
//
//      void main() {
//        LoginManager mockLoginManager = LoginManager(MockAuthService());
//        mockLoginManager.performLogin('testUser', 'testPassword');
//      }
//      ```
//    - This makes the code easier to test and ensures the `LoginManager` works correctly regardless of the specific `AuthService` implementation.
//
// ---
//
// ### **IoC in Action**
//
// Here’s how control is inverted:
//
// - **Traditional Control Flow (No IoC):**
//   - The `LoginManager` class would create its dependencies internally:
//     ```dart
//     class LoginManager {
//       final AuthService _authService = EmailAuthService();
//       void performLogin(String username, String password) {
//         _authService.login(username, password);
//       }
//     }
//     ```
//   - In this case, the `LoginManager` controls which implementation to use. Changing it would require modifying the `LoginManager` class, reducing flexibility and increasing coupling.
//
// - **Inverted Control Flow (Using IoC):**
//   - The `LoginManager` does not create or manage its dependency. Instead, the dependency is supplied to it:
//     ```dart
//     LoginManager emailLoginManager = LoginManager(EmailAuthService());
//     ```
//   - Now, control of the dependency is external to the `LoginManager`, enabling greater flexibility and reducing coupling.
//
// ---
//
// ### **Advantages of This Approach**
// 1. **Modularity:** Adding new `AuthService` implementations (e.g., `FacebookAuthService`) does not require changes to the `LoginManager` class.
// 2. **Testability:** You can easily test the `LoginManager` by injecting mock or stub implementations of `AuthService`.
// 3. **Flexibility:** The `LoginManager` can work with any `AuthService` implementation passed to it.
// 4. **Reusability:** `AuthService` implementations can be reused in other parts of the application.
//
// ---
//
// ### **Conclusion**
// By implementing **Dependency Injection**, the code adheres to the **Inversion of Control** principle. This design improves flexibility, promotes separation of concerns, and makes the system easier to extend, maintain, and test.

// Dependency Injection (DI) is a design pattern used to implement **Inversion of Control (IoC)** by passing dependencies (e.g., services, objects) to a class instead of letting the class create or fetch them on its own. There are different ways to achieve DI, depending on how dependencies are supplied to the dependent class. Below are the common types:
//
// ---
//
// ### **1. Constructor Injection**
// In this approach, dependencies are passed to the dependent class through its constructor. This is the most commonly used DI method because it ensures that the dependency is provided at the time of object creation, making it immutable (if not reassigned).
//
// #### Example:
// ```dart
// class Service {
//   void performTask() => print('Task performed');
// }
//
// class Client {
//   final Service _service;
//
//   // Dependency is injected via the constructor
//   Client(this._service);
//
//   void doWork() => _service.performTask();
// }
//
// void main() {
//   Service service = Service();
//   Client client = Client(service); // Injecting dependency
//   client.doWork();
// }
// ```
//
// #### Advantages:
// - Promotes **immutability** of dependencies.
// - Ensures that the dependent class is always in a valid state.
// - Ideal for mandatory dependencies.
//
// ---
//
// ### **2. Setter Injection**
// Dependencies are provided through **setter methods** or public fields after the object is created. This allows dependencies to be optional or updated later.
//
// #### Example:
// ```dart
// class Service {
//   void performTask() => print('Task performed');
// }
//
// class Client {
//   Service? _service;
//
//   // Dependency is injected via a setter
//   set service(Service service) => _service = service;
//
//   void doWork() {
//     if (_service != null) {
//       _service!.performTask();
//     } else {
//       print('No service available');
//     }
//   }
// }
//
// void main() {
//   Client client = Client();
//   Service service = Service();
//
//   client.service = service; // Injecting dependency
//   client.doWork();
// }
// ```
//
// #### Advantages:
// - Allows flexibility if the dependency is optional or can change during the object’s lifecycle.
// - Useful when circular dependencies exist (though these should be avoided).
//
// #### Disadvantages:
// - Dependency may not be set, leading to a potential runtime error.
// - Makes the class harder to test for immutability.
//
// ---
//
// ### **3. Interface Injection**
// This is used less often and primarily in languages like Java. Here, the dependent class implements an interface that defines a method to inject the dependency.
//
// #### Example:
// ```dart
// abstract class DependencyInjector {
//   void inject(Service service);
// }
//
// class Service {
//   void performTask() => print('Task performed');
// }
//
// class Client implements DependencyInjector {
//   late Service _service;
//
//   @override
//   void inject(Service service) {
//     _service = service;
//   }
//
//   void doWork() => _service.performTask();
// }
//
// void main() {
//   Service service = Service();
//   Client client = Client();
//   client.inject(service); // Dependency injected via interface method
//   client.doWork();
// }
// ```
//
// #### Advantages:
// - Allows the injector class to control the injection process explicitly.
// - Helps define clear contracts between the dependent and injector classes.
//
// #### Disadvantages:
// - Increases complexity as the dependent class must implement a specific interface.
//
// ---
//
// ### **4. Method Injection**
// Dependencies are provided through specific methods (not necessarily setters). The dependency is passed as a parameter when the method is called.
//
// #### Example:
// ```dart
// class Service {
//   void performTask() => print('Task performed');
// }
//
// class Client {
//   void doWork(Service service) {
//     service.performTask(); // Dependency injected via method parameter
//   }
// }
//
// void main() {
//   Service service = Service();
//   Client client = Client();
//
//   client.doWork(service); // Injecting dependency when calling the method
// }
// ```
//
// #### Advantages:
// - Provides fine-grained control over when and where the dependency is needed.
// - Useful for temporary dependencies.
//
// #### Disadvantages:
// - The dependent object is not initialized with its dependency, which could lead to inconsistencies or errors if misused.
//
// ---
//
// ### **5. Service Locator (Alternative to DI)**
// Although not strictly DI, the **Service Locator** pattern provides dependencies on demand from a centralized registry or factory. The dependent class requests the dependency explicitly.
//
// #### Example:
// ```dart
// class Service {
//   void performTask() => print('Task performed');
// }
//
// class ServiceLocator {
//   static final Map<String, dynamic> _services = {};
//
//   static void register(String key, dynamic service) {
//     _services[key] = service;
//   }
//
//   static dynamic get(String key) {
//     return _services[key];
//   }
// }
//
// void main() {
//   // Registering service
//   ServiceLocator.register('service', Service());
//
//   // Accessing service from the locator
//   Service service = ServiceLocator.get('service');
//   service.performTask();
// }
// ```
//
// #### Advantages:
// - Centralized control over service creation and lifecycle.
// - Useful in complex applications where managing DI manually becomes hard.
//
// #### Disadvantages:
// - Increases coupling between classes and the service locator.
// - Harder to track dependencies compared to explicit DI.
//
// ---
//
// ### **Comparison of DI Techniques**
//
// | **Technique**         | **When to Use**                                                                                   | **Advantages**                           | **Disadvantages**                           |
// |------------------------|---------------------------------------------------------------------------------------------------|------------------------------------------|---------------------------------------------|
// | Constructor Injection  | When the dependency is **mandatory** and does not change during the lifecycle of the dependent.   | Promotes immutability; ensures validity. | Cannot handle optional or changing dependencies. |
// | Setter Injection       | When the dependency is **optional** or needs to change after object creation.                    | Flexible and supports optional injection.| May leave the object in an incomplete state. |
// | Interface Injection    | When you want to define a clear contract for injection and decouple the injector and consumer.    | Clear interface contracts.               | Adds complexity; rarely used in practice.   |
// | Method Injection       | When the dependency is **temporary** or specific to a single method call.                        | Fine-grained control.                    | Dependency is not part of the object's state. |
// | Service Locator        | When managing dependencies manually is complex (e.g., in large applications).                    | Centralized control.                     | Increases coupling; harder to test and maintain. |
//
// ---
//
// ### **Best Practices**
// 1. Prefer **constructor injection** for mandatory dependencies.
// 2. Use **setter injection** for optional dependencies or when changes during the object's lifecycle are needed.
// 3. Avoid the **Service Locator** pattern unless dependency management is too complex.
// 4. Ensure dependencies are injected in a way that maintains immutability (when possible) and avoids runtime errors.