import 'package:Vio_Telehealth/models/product_entity.dart';

productEntityFromJson(ProductEntity data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['category'] != null) {
		data.category = json['category']?.toString();
	}
	if (json['options'] != null) {
		data.options = new List<ProductOption>();
		(json['options'] as List).forEach((v) {
			data.options.add(new ProductOption().fromJson(v));
		});
	}
	if (json['active'] != null) {
		data.active = json['active'];
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	return data;
}

Map<String, dynamic> productEntityToJson(ProductEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['category'] = entity.category;
	if (entity.options != null) {
		data['options'] =  entity.options.map((v) => v.toJson()).toList();
	}
	data['active'] = entity.active;
	data['image'] = entity.image;
	return data;
}

productOptionFromJson(ProductOption data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['unit'] != null) {
		data.unit = json['unit']?.toString();
	}
	if (json['active'] != null) {
		data.active = json['active'];
	}
	if (json['pricePerUnit'] != null) {
		data.pricePerUnit = json['pricePerUnit']?.toInt();
	}
	if (json['increasingAmount'] != null) {
		data.increasingAmount = json['increasingAmount']?.toDouble();
	}
	return data;
}

Map<String, dynamic> productOptionToJson(ProductOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['name'] = entity.name;
	data['unit'] = entity.unit;
	data['active'] = entity.active;
	data['pricePerUnit'] = entity.pricePerUnit;
	data['increasingAmount'] = entity.increasingAmount;
	return data;
}