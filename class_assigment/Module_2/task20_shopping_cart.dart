import 'dart:io';

class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);

  double get totalPrice => price * quantity;

  void display() {
    print('  ${name.padRight(20)} x$quantity  \$${price.toStringAsFixed(2)} each  =  \$${totalPrice.toStringAsFixed(2)}');
  }
}

class Cart {
  List<Product> items = [];

  void addProduct(Product product) {
    items.add(product);
    print('  ✔ "${product.name}" added to cart.\n');
  }

  void removeProduct(String name) {
    int index = items.indexWhere((p) => p.name.toLowerCase() == name.toLowerCase());
    if (index != -1) {
      items.removeAt(index);
      print('  ✔ "$name" removed from cart.\n');
    } else {
      print('  ✘ "$name" not found in cart.\n');
    }
  }

  void viewCart() {
    if (items.isEmpty) {
      print('\n  Cart is empty.\n');
      return;
    }
    print('\n  ┌──────────────────────────────────────────────────┐');
    print('  │                  Your Cart                       │');
    print('  ├──────────────────────────────────────────────────┤');
    for (Product p in items) {
      p.display();
    }
    print('  ├──────────────────────────────────────────────────┤');
    print('  │  Total Items : ${items.length}');
    print('  └──────────────────────────────────────────────────┘\n');
  }

  double get grandTotal => items.fold(0, (sum, p) => sum + p.totalPrice);
}

class Order {
  Cart cart;
  String customerName;

  Order(this.cart, this.customerName);

  void placeOrder() {
    if (cart.items.isEmpty) {
      print('  ✘ Cannot place order. Cart is empty!\n');
      return;
    }

    print('\n  ========================================');
    print('           ORDER CONFIRMATION           ');
    print('  ========================================');
    print('  Customer : $customerName');
    print('  ----------------------------------------');
    for (Product p in cart.items) {
      p.display();
    }
    print('  ----------------------------------------');
    print('  Grand Total : \$${cart.grandTotal.toStringAsFixed(2)}');
    print('  ========================================');
    print('  ✔ Order placed successfully! Thank you.\n');
  }
}

void main() {
  print('========================================');
  print('         Shopping Cart System           ');
  print('========================================\n');

  stdout.write('Enter your name: ');
  String? customerName = stdin.readLineSync();
  if (customerName == null || customerName.trim().isEmpty) {
    customerName = 'Customer';
  }

  Cart cart = Cart();
  bool running = true;

  while (running) {
    print('\nSelect an option:');
    print('  1. Add Product to Cart');
    print('  2. Remove Product from Cart');
    print('  3. View Cart');
    print('  4. Place Order');
    print('  5. Exit');
    stdout.write('\nEnter choice (1-5): ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('\n  Product name     : ');
        String? name = stdin.readLineSync();
        stdout.write('  Price per unit   : \$');
        double? price = double.tryParse(stdin.readLineSync() ?? '');
        stdout.write('  Quantity         : ');
        int? qty = int.tryParse(stdin.readLineSync() ?? '');

        if (name == null || name.trim().isEmpty || price == null || price <= 0 || qty == null || qty <= 0) {
          print('  Error: Invalid product details!\n');
        } else {
          cart.addProduct(Product(name.trim(), price, qty));
        }
        break;

      case '2':
        stdout.write('\n  Enter product name to remove: ');
        String? removeName = stdin.readLineSync();
        if (removeName != null && removeName.trim().isNotEmpty) {
          cart.removeProduct(removeName.trim());
        }
        break;

      case '3':
        cart.viewCart();
        break;

      case '4':
        Order order = Order(cart, customerName.trim());
        order.placeOrder();
        running = false;
        break;

      case '5':
        print('\nGoodbye!');
        running = false;
        break;

      default:
        print('  Invalid choice! Please enter 1 to 5.\n');
    }

    if (running && choice != '4') print('----------------------------------------');
  }
}
