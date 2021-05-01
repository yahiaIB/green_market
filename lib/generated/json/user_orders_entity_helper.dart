import 'package:Blwahda/models/user_orders_entity.dart';

userOrdersEntityFromJson(UserOrdersEntity data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['user'] != null) {
		data.user = new UserOrdersUser().fromJson(json['user']);
	}
	if (json['status'] != null) {
		data.status = new List<UserOrdersStatu>();
		(json['status'] as List).forEach((v) {
			data.status.add(new UserOrdersStatu().fromJson(v));
		});
	}
	if (json['address'] != null) {
		data.address = new UserOrdersAddress().fromJson(json['address']);
	}
	if (json['products'] != null) {
		data.products = new List<UserOrdersProduct>();
		(json['products'] as List).forEach((v) {
			data.products.add(new UserOrdersProduct().fromJson(v));
		});
	}
	if (json['number'] != null) {
		data.number = json['number']?.toInt();
	}
	if (json['priceInfo'] != null) {
		data.priceInfo = new UserOrdersPriceInfo().fromJson(json['priceInfo']);
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	return data;
}

Map<String, dynamic> userOrdersEntityToJson(UserOrdersEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	if (entity.user != null) {
		data['user'] = entity.user.toJson();
	}
	if (entity.status != null) {
		data['status'] =  entity.status.map((v) => v.toJson()).toList();
	}
	if (entity.address != null) {
		data['address'] = entity.address.toJson();
	}
	if (entity.products != null) {
		data['products'] =  entity.products.map((v) => v.toJson()).toList();
	}
	data['number'] = entity.number;
	if (entity.priceInfo != null) {
		data['priceInfo'] = entity.priceInfo.toJson();
	}
	data['created_at'] = entity.createdAt;
	return data;
}

userOrdersUserFromJson(UserOrdersUser data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile']?.toInt();
	}
	return data;
}

Map<String, dynamic> userOrdersUserToJson(UserOrdersUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['name'] = entity.name;
	data['mobile'] = entity.mobile;
	return data;
}

userOrdersStatuFromJson(UserOrdersStatu data, Map<String, dynamic> json) {
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	return data;
}

Map<String, dynamic> userOrdersStatuToJson(UserOrdersStatu entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['text'] = entity.text;
	return data;
}

userOrdersAddressFromJson(UserOrdersAddress data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['region'] != null) {
		data.region = new UserOrdersAddressRegion().fromJson(json['region']);
	}
	if (json['apartment'] != null) {
		data.apartment = json['apartment']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['area'] != null) {
		data.area = new UserOrdersAddressArea().fromJson(json['area']);
	}
	return data;
}

Map<String, dynamic> userOrdersAddressToJson(UserOrdersAddress entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	if (entity.region != null) {
		data['region'] = entity.region.toJson();
	}
	data['apartment'] = entity.apartment;
	data['description'] = entity.description;
	if (entity.area != null) {
		data['area'] = entity.area.toJson();
	}
	return data;
}

userOrdersAddressRegionFromJson(UserOrdersAddressRegion data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['deliveryFees'] != null) {
		data.deliveryFees = json['deliveryFees']?.toInt();
	}
	if (json['area'] != null) {
		data.area = json['area']?.toString();
	}
	return data;
}

Map<String, dynamic> userOrdersAddressRegionToJson(UserOrdersAddressRegion entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['name'] = entity.name;
	data['deliveryFees'] = entity.deliveryFees;
	data['area'] = entity.area;
	return data;
}

userOrdersAddressAreaFromJson(UserOrdersAddressArea data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> userOrdersAddressAreaToJson(UserOrdersAddressArea entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['name'] = entity.name;
	return data;
}

userOrdersProductFromJson(UserOrdersProduct data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['category'] != null) {
		data.category = new UserOrdersProductsCategory().fromJson(json['category']);
	}
	if (json['selectedOption'] != null) {
		data.selectedOption = new UserOrdersProductsSelectedOption().fromJson(json['selectedOption']);
	}
	if (json['priceInfo'] != null) {
		data.priceInfo = new UserOrdersProductsPriceInfo().fromJson(json['priceInfo']);
	}
	return data;
}

Map<String, dynamic> userOrdersProductToJson(UserOrdersProduct entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	if (entity.category != null) {
		data['category'] = entity.category.toJson();
	}
	if (entity.selectedOption != null) {
		data['selectedOption'] = entity.selectedOption.toJson();
	}
	if (entity.priceInfo != null) {
		data['priceInfo'] = entity.priceInfo.toJson();
	}
	return data;
}

userOrdersProductsCategoryFromJson(UserOrdersProductsCategory data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> userOrdersProductsCategoryToJson(UserOrdersProductsCategory entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['name'] = entity.name;
	return data;
}

userOrdersProductsSelectedOptionFromJson(UserOrdersProductsSelectedOption data, Map<String, dynamic> json) {
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

Map<String, dynamic> userOrdersProductsSelectedOptionToJson(UserOrdersProductsSelectedOption entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['name'] = entity.name;
	data['unit'] = entity.unit;
	data['active'] = entity.active;
	data['pricePerUnit'] = entity.pricePerUnit;
	data['increasingAmount'] = entity.increasingAmount;
	return data;
}

userOrdersProductsPriceInfoFromJson(UserOrdersProductsPriceInfo data, Map<String, dynamic> json) {
	if (json['amount'] != null) {
		data.amount = json['amount']?.toInt();
	}
	if (json['pricePerUnit'] != null) {
		data.pricePerUnit = json['pricePerUnit']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	return data;
}

Map<String, dynamic> userOrdersProductsPriceInfoToJson(UserOrdersProductsPriceInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['amount'] = entity.amount;
	data['pricePerUnit'] = entity.pricePerUnit;
	data['total'] = entity.total;
	return data;
}

userOrdersPriceInfoFromJson(UserOrdersPriceInfo data, Map<String, dynamic> json) {
	if (json['subTotal'] != null) {
		data.subTotal = json['subTotal']?.toInt();
	}
	if (json['deliveryFees'] != null) {
		data.deliveryFees = json['deliveryFees']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	return data;
}

Map<String, dynamic> userOrdersPriceInfoToJson(UserOrdersPriceInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['subTotal'] = entity.subTotal;
	data['deliveryFees'] = entity.deliveryFees;
	data['total'] = entity.total;
	return data;
}