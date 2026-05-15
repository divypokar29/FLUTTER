class Vehicle {
  String type;
  String fuelType;
  int maxSpeed;

  Vehicle(this.type, this.fuelType, this.maxSpeed);

  void displayDetails() {
    print('  Type      : $type');
    print('  Fuel Type : $fuelType');
    print('  Max Speed : $maxSpeed km/h');
  }
}

class Car extends Vehicle {
  int numberOfDoors;
  String brand;

  Car(String fuelType, int maxSpeed, this.numberOfDoors, this.brand)
      : super('Car', fuelType, maxSpeed);

  @override
  void displayDetails() {
    print('\n  ┌─────────────────────────────────────┐');
    print('  │             Car Details             │');
    print('  ├─────────────────────────────────────┤');
    super.displayDetails();
    print('  Brand     : $brand');
    print('  Doors     : $numberOfDoors');
    print('  └─────────────────────────────────────┘');
  }
}

class Bike extends Vehicle {
  bool hasPillion;
  String brand;

  Bike(String fuelType, int maxSpeed, this.hasPillion, this.brand)
      : super('Bike', fuelType, maxSpeed);

  @override
  void displayDetails() {
    print('\n  ┌─────────────────────────────────────┐');
    print('  │            Bike Details             │');
    print('  ├─────────────────────────────────────┤');
    super.displayDetails();
    print('  Brand     : $brand');
    print('  Pillion   : ${hasPillion ? 'Yes' : 'No'}');
    print('  └─────────────────────────────────────┘');
  }
}

void main() {
  print('========================================');
  print('       Vehicle Hierarchy Program        ');
  print('========================================');

  Car car = Car('Petrol', 220, 4, 'Toyota');
  car.displayDetails();

  Car electricCar = Car('Electric', 250, 4, 'Tesla');
  electricCar.displayDetails();

  Bike bike = Bike('Petrol', 180, true, 'Royal Enfield');
  bike.displayDetails();

  Bike electricBike = Bike('Electric', 120, false, 'Ather');
  electricBike.displayDetails();

  print('\n========================================');
  print('  Total Vehicles Created: 4');
  print('========================================');
}
