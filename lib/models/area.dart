import 'package:Blwahda/generated/json/base/json_convert_content.dart';
import 'package:Blwahda/generated/json/base/json_filed.dart';

class Area with JsonConvert<Area> {
	@JSONField(name: "_id")
	String sId;
	String name;
}
