import 'package:Blwahda/generated/json/base/json_convert_content.dart';
import 'package:Blwahda/generated/json/base/json_filed.dart';

class ProfitTransferEntity with JsonConvert<ProfitTransferEntity> {
	@JSONField(name: "_id")
	String sId;
	int amount;
	String doctor;
	String image;
	@JSONField(name: "bank_details")
	ProfitTransferBankDetails bankDetails;
	List<ProfitTransferStatu> status;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "updated_at")
	String updatedAt;
	@JSONField(name: "__v")
	int iV;
}

class ProfitTransferBankDetails with JsonConvert<ProfitTransferBankDetails> {
	@JSONField(name: "bank_name")
	String bankName;
	@JSONField(name: "swift_code")
	String swiftCode;
	@JSONField(name: "account_number")
	String accountNumber;
	@JSONField(name: "beneficiary_name")
	String beneficiaryName;
	@JSONField(name: "beneficiary_address")
	String beneficiaryAddress;
}

class ProfitTransferStatu with JsonConvert<ProfitTransferStatu> {
	String text;
	@JSONField(name: "created_at")
	String createdAt;
}
