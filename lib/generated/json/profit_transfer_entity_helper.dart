import 'package:Blwahda/models/profit_transfer_entity.dart';
import 'package:Blwahda/generated/json/base/json_filed.dart';

profitTransferEntityFromJson(ProfitTransferEntity data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toInt();
	}
	if (json['doctor'] != null) {
		data.doctor = json['doctor']?.toString();
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['bank_details'] != null) {
		data.bankDetails = new ProfitTransferBankDetails().fromJson(json['bank_details']);
	}
	if (json['status'] != null) {
		data.status = new List<ProfitTransferStatu>();
		(json['status'] as List).forEach((v) {
			data.status.add(new ProfitTransferStatu().fromJson(v));
		});
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at']?.toString();
	}
	if (json['__v'] != null) {
		data.iV = json['__v']?.toInt();
	}
	return data;
}

Map<String, dynamic> profitTransferEntityToJson(ProfitTransferEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	data['amount'] = entity.amount;
	data['doctor'] = entity.doctor;
	data['image'] = entity.image;
	if (entity.bankDetails != null) {
		data['bank_details'] = entity.bankDetails.toJson();
	}
	if (entity.status != null) {
		data['status'] =  entity.status.map((v) => v.toJson()).toList();
	}
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['__v'] = entity.iV;
	return data;
}

profitTransferBankDetailsFromJson(ProfitTransferBankDetails data, Map<String, dynamic> json) {
	if (json['bank_name'] != null) {
		data.bankName = json['bank_name']?.toString();
	}
	if (json['swift_code'] != null) {
		data.swiftCode = json['swift_code']?.toString();
	}
	if (json['account_number'] != null) {
		data.accountNumber = json['account_number']?.toString();
	}
	if (json['beneficiary_name'] != null) {
		data.beneficiaryName = json['beneficiary_name']?.toString();
	}
	if (json['beneficiary_address'] != null) {
		data.beneficiaryAddress = json['beneficiary_address']?.toString();
	}
	return data;
}

Map<String, dynamic> profitTransferBankDetailsToJson(ProfitTransferBankDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['bank_name'] = entity.bankName;
	data['swift_code'] = entity.swiftCode;
	data['account_number'] = entity.accountNumber;
	data['beneficiary_name'] = entity.beneficiaryName;
	data['beneficiary_address'] = entity.beneficiaryAddress;
	return data;
}

profitTransferStatuFromJson(ProfitTransferStatu data, Map<String, dynamic> json) {
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	return data;
}

Map<String, dynamic> profitTransferStatuToJson(ProfitTransferStatu entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['text'] = entity.text;
	data['created_at'] = entity.createdAt;
	return data;
}