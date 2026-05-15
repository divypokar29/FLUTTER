void main() {
  var l1 = [];

  l1.add(201);
  l1.add(202);
  l1.add(203);

  print(l1);

  l1.insert(1, 501);

  print(l1);

  l1.addAll([20, 21, 22, 23, 24]);

  print(l1);

  l1.insertAll(3, [40, 41, 42, 43]);

  print(l1);
}
