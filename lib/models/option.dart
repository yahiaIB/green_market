class Option {
  String name;
  double price;
  String unit;
  double unitChange;

  bool isSelectedAtCart;

  Option(
      {this.name,
      this.price,
      this.unit,
      this.unitChange,
      this.isSelectedAtCart = false});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      name: json["name"],
      price: json["price"],
      unit: json["unit"],
      unitChange: json["unitChange"],
      isSelectedAtCart: json["is_selected_at_cart"] != null
          ? json['is_selected_at_cart']
          : false,
    );
  }
}
