// Strategy Design pattern: It is a behavioral design pattern
// that allows you to define a family of algorithms ,
// and make their objects interchangeable .
// this pattern is used for scenarios where you want to select an algorithm's behavior at run time.

// 1- define strategy interface

abstract class PaymentStrategy {
  void pay(double amount);
}

// 2- implement concrete strategies

class CreditCardPayment extends PaymentStrategy {
  @override
  void pay(double amount) {
    print("pay $amount by credit card");
  }
}

class PayPalPayment extends PaymentStrategy {
  @override
  void pay(double amount) {
    print("pay $amount by paybal");
  }
}

// 3- create context class
class PaymentContext {
  void pay(PaymentStrategy paymentStrategy, double amount) {
    paymentStrategy.pay(amount);
  }
}

// 4- use strategy pattern

main() {
  PaymentContext paymentContext = PaymentContext();

  PaymentStrategy creditCardStrategy = CreditCardPayment();

  paymentContext.pay(creditCardStrategy, 100);

  PaymentStrategy payPalStrategy = PayPalPayment();

  paymentContext.pay(payPalStrategy, 50);
}
