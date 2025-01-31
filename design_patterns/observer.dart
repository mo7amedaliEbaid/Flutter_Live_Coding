// Observer Design Pattern
// The Observer Design Pattern is a behavioral pattern that defines a one-to-many dependency between objects.
// When one object (the subject) changes its state, all its observers are notified and updated automatically.

// When to Use the Observer Pattern?
// When multiple objects need to stay in sync with a subject's state.
// When the subject doesn't know in advance how many or which objects depend on it.
// Useful in implementing event-driven systems like GUIs, data streams, or real-time notifications.
// Key Components
// Subject: Maintains a list of observers and provides methods to add, remove, and notify them.
// Observer: Defines an interface for objects that should be notified of changes in the subject.
// Concrete Subject: Implements the subject and maintains its state.
// Concrete Observer: Implements the observer and updates itself based on notifications.

// Observer: Defines an interface for objects that should be notified of changes in the subject.
abstract class Observer {
  void update(String news);
}

// Subject: Maintains a list of observers and provides methods to add, remove, and notify them.
abstract class Subject {
  void addObserver(Observer observer);

  void removeObserver(Observer observer);

  void notifyObservers();
}


// Concrete Subject: Implements the subject and maintains its state.
class NewsAgency implements Subject {
  final List<Observer> _observers = [];
  String _latestNews = '';

  void publishNews(String news) {
    _latestNews = news;
    notifyObservers();
  }

  @override
  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  @override
  void notifyObservers() {
    for (var observer in _observers) {
      observer.update(_latestNews);
    }
  }

  @override
  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }
}


// Concrete Observer: Implements the observer and updates itself based on notifications.

class Subscriber implements Observer {
  String name;

  Subscriber(this.name);

  @override
  void update(String news) {
    print("$name received news update : $news");
  }
}

// Client Code
void main() {
  // Create the subject
  NewsAgency newsAgency = NewsAgency();

  // Create observers
  Subscriber subscriber1 = Subscriber("Alice");
  Subscriber subscriber2 = Subscriber("Bob");

  // Register observers
  newsAgency.addObserver(subscriber1);
  newsAgency.addObserver(subscriber2);

  // Publish news
  newsAgency.publishNews("Breaking: New Dart version released!");

  print("\n--- After some time ---\n");

  // Remove an observer and publish more news
  newsAgency.removeObserver(subscriber1);
  newsAgency.publishNews("Update: Dart 3.1 is now available!");
}