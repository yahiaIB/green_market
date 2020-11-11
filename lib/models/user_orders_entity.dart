import 'package:Vio_Telehealth/generated/json/base/json_convert_content.dart';
import 'package:Vio_Telehealth/generated/json/base/json_field.dart';

class UserOrdersEntity with JsonConvert<UserOrdersEntity> {
	@JSONField(name: "_id")
	String sId;
	UserOrdersUser user;
	List<UserOrdersStatu> status;
	UserOrdersAddress address;
	List<UserOrdersProduct> products;
	int number;
	UserOrdersPriceInfo priceInfo;
	@JSONField(name: "created_at")
	String createdAt;
}

class UserOrdersUser with JsonConvert<UserOrdersUser> {
	@JSONField(name: "_id")
	String sId;
	String name;
	int mobile;
}

class UserOrdersStatu with JsonConvert<UserOrdersStatu> {
	String text;
}

class UserOrdersAddress with JsonConvert<UserOrdersAddress> {
	String name;
	UserOrdersAddressRegion region;
	String apartment;
	String description;
	UserOrdersAddressArea area;
}

class UserOrdersAddressRegion with JsonConvert<UserOrdersAddressRegion> {
	@JSONField(name: "_id")
	String sId;
	String name;
	int deliveryFees;
	String area;
}

class UserOrdersAddressArea with JsonConvert<UserOrdersAddressArea> {
	@JSONField(name: "_id")
	String sId;
	String name;
}

class UserOrdersProduct with JsonConvert<UserOrdersProduct> {
	@JSONField(name: "_id")
	String sId;
	UserOrdersProductsCategory category;
	UserOrdersProductsSelectedOption selectedOption;
	UserOrdersProductsPriceInfo priceInfo;
}

class UserOrdersProductsCategory with JsonConvert<UserOrdersProductsCategory> {
	@JSONField(name: "_id")
	String sId;
	String name;
}

class UserOrdersProductsSelectedOption with JsonConvert<UserOrdersProductsSelectedOption> {
	@JSONField(name: "_id")
	String sId;
	String name;
	String unit;
	bool active;
	int pricePerUnit;
	double increasingAmount;
}

class UserOrdersProductsPriceInfo with JsonConvert<UserOrdersProductsPriceInfo> {
	int amount;
	int pricePerUnit;
	int total;
}

class UserOrdersPriceInfo with JsonConvert<UserOrdersPriceInfo> {
	int subTotal;
	int deliveryFees;
	int total;
}
