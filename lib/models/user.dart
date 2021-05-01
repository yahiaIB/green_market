import 'package:Blwahda/generated/json/base/json_convert_content.dart';
import 'package:Blwahda/generated/json/base/json_field.dart';
import 'package:Blwahda/models/region.dart';

import 'area.dart';

class User with JsonConvert<User> {
	@JSONField(name: "_id")
	String sId;
	List<String> roles;
	String name;
	String password;
	String mobile;
	String email;
	String image;
	String token;
}

class UserAddress with JsonConvert<UserAddress> {
	@JSONField(name: "_id")
	String sId;
	String name;
	Region region;
	String apartment;
	String description;
	Area area;
}
