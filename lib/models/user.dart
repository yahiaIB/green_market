import 'package:Vio_Telehealth/generated/json/base/json_convert_content.dart';
import 'package:Vio_Telehealth/generated/json/base/json_field.dart';

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
	List<UserAddress> addresses;

}

class UserAddress with JsonConvert<UserAddress> {
	@JSONField(name: "_id")
	String sId;
	String name;
	String region;
	String apartment;
	String description;
	String area;
}
