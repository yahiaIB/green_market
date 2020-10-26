import 'package:Vio_Telehealth/models/subscription_entity.dart';

subscriptionEntityFromJson(SubscriptionEntity data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['interval'] != null) {
		data.interval = new SubscriptionInterval().fromJson(json['interval']);
	}
	if (json['cost'] != null) {
		data.cost = json['cost']?.toInt();
	}
	return data;
}

Map<String, dynamic> subscriptionEntityToJson(SubscriptionEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['name'] = entity.name;
	if (entity.interval != null) {
		data['interval'] = entity.interval.toJson();
	}
	data['cost'] = entity.cost;
	return data;
}

subscriptionIntervalFromJson(SubscriptionInterval data, Map<String, dynamic> json) {
	if (json['amount'] != null) {
		data.amount = json['amount']?.toInt();
	}
	if (json['key'] != null) {
		data.key = json['key']?.toString();
	}
	return data;
}

Map<String, dynamic> subscriptionIntervalToJson(SubscriptionInterval entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['amount'] = entity.amount;
	data['key'] = entity.key;
	return data;
}