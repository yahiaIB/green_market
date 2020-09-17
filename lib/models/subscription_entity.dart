import 'package:Vio_Telehealth/generated/json/base/json_convert_content.dart';
import 'package:Vio_Telehealth/generated/json/base/json_filed.dart';

class SubscriptionEntity with JsonConvert<SubscriptionEntity> {
	@JSONField(name: "_id")
	String sId;
	String name;
	SubscriptionInterval interval;
	int cost;
}

class SubscriptionInterval with JsonConvert<SubscriptionInterval> {
	int amount;
	String key;
}
