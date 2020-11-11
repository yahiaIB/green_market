// class Option {
//  
//   String id;
//   String name;
//   double price;
//   String unit;
//   double unitChange;
//
//   bool isSelectedAtCart;
//
//   Option(
//       {this.id,
//       this.name,
//       this.price,
//       this.unit,
//       this.unitChange,
//       this.isSelectedAtCart = false});
//
//   factory Option.fromJson(Map<String, dynamic> json) {
//     return Option(
//       id: json["id"],
//       name: json["name"],
//       price: json["price"],
//       unit: json["unit"],
//       unitChange: json["unitChange"],
//       isSelectedAtCart: json["is_selected_at_cart"] != null
//           ? json['is_selected_at_cart']
//           : false,
//     );
//   }
// }
