import 'package:Vio_Telehealth/models/region.dart';
import 'package:Vio_Telehealth/generated/json/base/json_filed.dart';

regionFromJson(Region data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['area'] != null) {
		data.area = json['area']?.toString();
	}
	if (json['deliveryFees'] != null) {
		data.deliveryFees = json['deliveryFees']?.toInt();
	}
	return data;
}

Map<String, dynamic> regionToJson(Region entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['name'] = entity.name;
	data['area'] = entity.area;
	data['deliveryFees'] = entity.deliveryFees;
	return data;
}