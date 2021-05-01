import 'package:Blwahda/models/area.dart';
import 'package:Blwahda/generated/json/base/json_filed.dart';

areaFromJson(Area data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> areaToJson(Area entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['name'] = entity.name;
	return data;
}