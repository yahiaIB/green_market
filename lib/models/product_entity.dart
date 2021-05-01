import 'package:Blwahda/generated/json/base/json_convert_content.dart';
import 'package:Blwahda/generated/json/base/json_field.dart';

class ProductEntity with JsonConvert<ProductEntity> {
	@JSONField(name: "_id")
	String sId;
	String category;
	List<ProductOption> options;
	bool active;
	String image;


	int selectedOptionIndex = 0;
	double amount = 1.0;
}

class ProductOption with JsonConvert<ProductOption> {
	@JSONField(name: "_id")
	String sId;
	String name;
	String unit;
	bool active;
	int pricePerUnit;
	double increasingAmount;

	bool isSelectedAtCart = false;
}
