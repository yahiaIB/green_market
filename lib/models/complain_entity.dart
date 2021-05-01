import 'package:Blwahda/generated/json/base/json_convert_content.dart';
import 'package:Blwahda/generated/json/base/json_filed.dart';

class ComplainEntity with JsonConvert<ComplainEntity> {
	@JSONField(name: "_id")
	String sId;
	String description;
	List<ComplainStatu> status;
	@JSONField(name: "created_at")
	String createdAt;
}

class ComplainStatu with JsonConvert<ComplainStatu> {
	String text;
	@JSONField(name: "created_at")
	String createdAt;
}
