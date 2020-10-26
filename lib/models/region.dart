import 'package:Vio_Telehealth/generated/json/base/json_convert_content.dart';
import 'package:Vio_Telehealth/generated/json/base/json_filed.dart';

class Region with JsonConvert<Region> {
	@JSONField(name: "_id")
	String sId;
	String name;
	String area;
	int deliveryFees;
}
