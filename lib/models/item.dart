// import 'package:Vio_Telehealth/models/option.dart';
//
// class Item {
//   String image = '';
//   double amount = 1.0;
//   List<Option> options = [];
//   int selectedOptionIndex = 0;
//   String categoryName = '';
//
//   Item(
//       {this.image,
//       this.amount = 1,
//       this.options,
//       this.selectedOptionIndex = 0,
//       this.categoryName});
//
//   factory Item.fromJson(Map<String, dynamic> json) {
//     var list = json['options'] as List;
//     List<Option> optionsList = list.map((i) => Option.fromJson(i)).toList();
//     return Item(
//         image: json['image'],
//         amount: json['amount'],
//         selectedOptionIndex: json['selected_item_index'] != null
//             ? json['selected_item_index']
//             : 0,
//         options: optionsList,
//         categoryName: json['category_name']);
//   }
// }
