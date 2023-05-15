class TaskModel {
  late int? id;
  late String itemName;
  late int quantity;
  late double price;
  late String date;

  TaskModel({
    this.id,
    required this.itemName,
    required this.quantity,
    required this.price,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemName': itemName,
      'quantity': quantity,
      'price': price,
      'date': date,
    };
  }

  TaskModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    itemName = map['itemName'];
    quantity = map['quantity'];
    price = map['price'];
    date = map['date'];
  }
}
