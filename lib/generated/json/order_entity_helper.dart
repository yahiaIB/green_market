import 'package:Blwahda/models/order_entity.dart';
import 'package:Blwahda/models/user.dart';

orderEntityFromJson(OrderEntity data, Map<String, dynamic> json) {
	if (json['products'] != null) {
		data.products = new List<OrderProduct>();
		(json['products'] as List).forEach((v) {
			data.products.add(new OrderProduct().fromJson(v));
		});
	}
	if (json['address'] != null) {
		data.address = json['address'];
	}
	if (json['total'] != null) {
		data.total = json['total']?.toDouble();
	}
	return data;
}

Map<String, dynamic> orderEntityToJson(OrderEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.products != null) {
		data['products'] =  entity.products.map((v) => v.toJson()).toList();
	}
	if (entity.address != null) {
		data['address'] = entity.address;
	}
	data['total'] = entity.total;
	return data;
}

orderProductFromJson(OrderProduct data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['selectedOption'] != null) {
		data.selectedOption = json['selectedOption']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> orderProductToJson(OrderProduct entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['selectedOption'] = entity.selectedOption;
	data['amount'] = entity.amount;
	return data;
}