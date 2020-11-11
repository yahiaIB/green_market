import 'package:Vio_Telehealth/models/complain_entity.dart';
import 'package:Vio_Telehealth/generated/json/base/json_filed.dart';

complainEntityFromJson(ComplainEntity data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['status'] != null) {
		data.status = new List<ComplainStatu>();
		(json['status'] as List).forEach((v) {
			data.status.add(new ComplainStatu().fromJson(v));
		});
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	return data;
}

Map<String, dynamic> complainEntityToJson(ComplainEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['description'] = entity.description;
	if (entity.status != null) {
		data['status'] =  entity.status.map((v) => v.toJson()).toList();
	}
	data['created_at'] = entity.createdAt;
	return data;
}

complainStatuFromJson(ComplainStatu data, Map<String, dynamic> json) {
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	return data;
}

Map<String, dynamic> complainStatuToJson(ComplainStatu entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['text'] = entity.text;
	data['created_at'] = entity.createdAt;
	return data;
}