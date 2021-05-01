import 'package:Blwahda/generated/json/base/json_convert_content.dart';
import 'package:Blwahda/generated/json/base/json_field.dart';

class CategoryEntity with JsonConvert<CategoryEntity> {
	@JSONField(name: "_id")
	String sId;
	String name;
}
