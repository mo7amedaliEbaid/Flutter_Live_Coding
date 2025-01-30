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