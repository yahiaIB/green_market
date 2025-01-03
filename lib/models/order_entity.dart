import 'package:Blwahda/generated/json/base/json_convert_content.dart';
import 'package:Blwahda/generated/json/base/json_field.dart';
import 'package:Blwahda/models/user.dart';

class OrderEntity with JsonConvert<OrderEntity> {
	List<OrderProduct> products;
	String address;
	double total;
	OrderEntity({this.products, this.address, this.total});
}

class OrderProduct with JsonConvert<OrderProduct> {
	@JSONField(name: "_id")
	String sId;
	String selectedOption;
	double amount;

	OrderProduct({this.sId, this.selectedOption, this.amount});
}
