import 'package:Blwahda/models/area.dart';
import 'package:Blwahda/models/user.dart';
import 'package:Blwahda/models/region.dart';

userFromJson(User data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['roles'] != null) {
		data.roles = json['roles']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['password'] != null) {
		data.password = json['password']?.toString();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile']?.toString();
	}
	if (json['email'] != null) {
		data.email = json['email']?.toString();
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	return data;
}

Map<String, dynamic> userToJson(User entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['roles'] = entity.roles;
	data['name'] = entity.name;
	data['password'] = entity.password;
	data['mobile'] = entity.mobile;
	data['email'] = entity.email;
	data['image'] = entity.image;
	data['token'] = entity.token;
	return data;
}

userAddressFromJson(UserAddress data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['region'] != null) {
		data.region = new Region().fromJson(json['region']);
	}
	if (json['apartment'] != null) {
		data.apartment = json['apartment']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['area'] != null) {
		data.area = new Area().fromJson(json['area']);
	}
	return data;
}

Map<String, dynamic> userAddressToJson(UserAddress entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
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