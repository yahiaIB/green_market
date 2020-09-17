import 'package:Vio_Telehealth/models/user.dart';

userFromJson(User data, Map<String, dynamic> json) {
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['wallet'] != null) {
		data.wallet = new UserWallet().fromJson(json['wallet']);
	}
	if (json['patients'] != null) {
		data.patients = json['patients']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['notify_patients_when_free'] != null) {
		data.notifyPatientsWhenFree = json['notify_patients_when_free']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['is_profile_completed'] != null) {
		data.isProfileCompleted = json['is_profile_completed'];
	}
	if (json['roles'] != null) {
		data.roles = json['roles']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile']?.toString();
	}
	if (json['calender'] != null) {
		Map<String, List<TimeSlot>> calender = new Map();
		if (json['calender']['Friday'] != null) {
			calender['Friday'] = new List<TimeSlot>();
			(json['calender']['Friday'] as List).forEach((v) {
				calender['Friday'].add(new TimeSlot().fromJson(v));
			});
		}
		if (json['calender']['Monday'] != null) {
			calender['Monday'] = new List<TimeSlot>();
			(json['calender']['Monday'] as List).forEach((v) {
				calender['Monday'].add(new TimeSlot().fromJson(v));
			});
		}
		if (json['calender']['Saturday'] != null) {
			calender['Saturday'] = new List<TimeSlot>();
			(json['calender']['Saturday'] as List).forEach((v) {
				calender['Saturday'].add(new TimeSlot().fromJson(v));
			});
		}
		if (json['calender']['Sunday'] != null) {
			calender['Sunday'] = new List<TimeSlot>();
			(json['calender']['Sunday'] as List).forEach((v) {
				calender['Sunday'].add(new TimeSlot().fromJson(v));
			});
		}
		if (json['calender']['Thursday'] != null) {
			calender['Thursday'] = new List<TimeSlot>();
			(json['calender']['Thursday'] as List).forEach((v) {
				calender['Thursday'].add(new TimeSlot().fromJson(v));
			});
		}
		if (json['calender']['Tuesday'] != null) {
			calender['Tuesday'] = new List<TimeSlot>();
			(json['calender']['Tuesday'] as List).forEach((v) {
				calender['Tuesday'].add(new TimeSlot().fromJson(v));
			});
		}
		if (json['calender']['Wednesday'] != null) {
			calender['Wednesday'] = new List<TimeSlot>();
			(json['calender']['Wednesday'] as List).forEach((v) {
				calender['Wednesday'].add(new TimeSlot().fromJson(v));
			});
		}

		data.calender = calender;
	}
	if (json['app_status'] != null) {
		data.appStatus = json['app_status']?.toString();
	}
	if (json['session_status'] != null) {
		data.sessionStatus = json['session_status']?.toString();
	}
	if (json['documents'] != null) {
		data.documents = new List<UserDocuments>();
		(json['documents'] as List).forEach((v) {
			data.documents.add(new UserDocuments().fromJson(v));
		});
	}
	if (json['payment_cards'] != null) {
		data.paymentCards = new List<UserPaymentCards>();
		(json['payment_cards'] as List).forEach((v) {
			data.paymentCards.add(new UserPaymentCards().fromJson(v));
		});
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at']?.toString();
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	if (json['__v'] != null) {
		data.iV = json['__v']?.toInt();
	}
	if (json['rate_average'] != null) {
		data.rateAverage = json['rate_average']?.toInt();
	}
	if (json['invites'] != null) {
		data.invites = json['invites']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['rate_count'] != null) {
		data.rateCount = json['rate_count']?.toInt();
	}
	if (json['bio'] != null) {
		data.bio = json['bio']?.toString();
	}
	if (json['birth_date'] != null) {
		data.birthDate = json['birth_date']?.toString();
	}
	if (json['cost_per_session'] != null) {
		data.costPerSession = json['cost_per_session']?.toInt();
	}
	if (json['email'] != null) {
		data.email = json['email']?.toString();
	}
	if (json['experience_in_years'] != null) {
		data.experienceInYears = json['experience_in_years']?.toString();
	}
	if (json['first_name'] != null) {
		data.firstName = json['first_name']?.toString();
	}
	if (json['gender'] != null) {
		data.gender = json['gender']?.toString();
	}
	if (json['last_name'] != null) {
		data.lastName = json['last_name']?.toString();
	}
	if (json['profile_image'] != null) {
		data.profileImage = json['profile_image']?.toString();
	}
	if (json['specialty'] != null) {
		data.specialty = json['specialty']?.toString();
	}
	if (json['time_session'] != null) {
		data.timeSession = json['time_session']?.toInt();
	}
	if (json['subscription'] != null) {
		data.subscription = new UserSubscription().fromJson(json['subscription']);
	}
	if (json['allergies'] != null) {
		data.allergies = new List<dynamic>();
		data.allergies.addAll(json['allergies']);
	}
	if (json['chronic_disease'] != null) {
		data.chronicDisease = new List<dynamic>();
		data.chronicDisease.addAll(json['chronic_disease']);
	}
	if (json['university'] != null) {
		data.university = json['university']?.toString();
	}
	if (json['session_id'] != null) {
		data.sessionId = json['session_id']?.toString();
	}
	if (json['bank_details'] != null) {
		data.bankDetails = new UserBankDetails().fromJson(json['bank_details']);
	}
	return data;
}

Map<String, dynamic> userToJson(User entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['_id'] = entity.sId;
	if (entity.wallet != null) {
		data['wallet'] = entity.wallet.toJson();
	}
	data['patients'] = entity.patients;
	data['notify_patients_when_free'] = entity.notifyPatientsWhenFree;
	data['is_profile_completed'] = entity.isProfileCompleted;
	data['roles'] = entity.roles;
	data['mobile'] = entity.mobile;
	data['app_status'] = entity.appStatus;
	data['session_status'] = entity.sessionStatus;
	if (entity.documents != null) {
		data['documents'] =  entity.documents.map((v) => v.toJson()).toList();
	}
	if (entity.paymentCards != null) {
		data['payment_cards'] =  entity.paymentCards.map((v) => v.toJson()).toList();
	}
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['token'] = entity.token;
	data['__v'] = entity.iV;
	data['rate_average'] = entity.rateAverage;
	data['invites'] = entity.invites;
	data['rate_count'] = entity.rateCount;
	data['bio'] = entity.bio;
	data['birth_date'] = entity.birthDate;
	data['cost_per_session'] = entity.costPerSession;
	data['email'] = entity.email;
	data['experience_in_years'] = entity.experienceInYears;
	data['first_name'] = entity.firstName;
	data['gender'] = entity.gender;
	data['last_name'] = entity.lastName;
	data['profile_image'] = entity.profileImage;
	data['specialty'] = entity.specialty;
	data['time_session'] = entity.timeSession;
	if (entity.calender != null) {
		data['calender'] = {
			"Friday":entity.calender['Friday'],
			"Monday":entity.calender['Monday'],
			"Saturday":entity.calender['Saturday'],
			"Sunday":entity.calender['Sunday'],
			"Thursday":entity.calender['Thursday'],
			"Tuesday":entity.calender['Tuesday'],
			"Wednesday":entity.calender['Wednesday'],
		};
	}
	if (entity.subscription != null) {
		data['subscription'] = entity.subscription.toJson();
	}
	if (entity.allergies != null) {
		data['allergies'] =  [];
	}
	if (entity.chronicDisease != null) {
		data['chronic_disease'] =  [];
	}
	data['university'] = entity.university;
	data['session_id'] = entity.sessionId;
	if (entity.bankDetails != null) {
		data['bank_details'] = entity.bankDetails.toJson();
	}
	return data;
}

userWalletFromJson(UserWallet data, Map<String, dynamic> json) {
	if (json['balance'] != null) {
		data.balance = json['balance']?.toInt();
	}
	return data;
}

Map<String, dynamic> userWalletToJson(UserWallet entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['balance'] = entity.balance;
	return data;
}

userDocumentsFromJson(UserDocuments data, Map<String, dynamic> json) {
	if (json['files'] != null) {
		data.files = json['files']?.map((v) => v?.toString())?.toList()?.cast<String>();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> userDocumentsToJson(UserDocuments entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['files'] = entity.files;
	data['name'] = entity.name;
	return data;
}

userPaymentCardsFromJson(UserPaymentCards data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toString();
	}
	if (json['token'] != null) {
		data.token = json['token']?.toString();
	}
	if (json['last_four_digits'] != null) {
		data.lastFourDigits = json['last_four_digits']?.toString();
	}
	if (json['subtype'] != null) {
		data.subtype = json['subtype']?.toString();
	}
	if (json['initial_order_id'] != null) {
		data.initialOrderId = json['initial_order_id']?.toString();
	}
	return data;
}

Map<String, dynamic> userPaymentCardsToJson(UserPaymentCards entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['token'] = entity.token;
	data['last_four_digits'] = entity.lastFourDigits;
	data['subtype'] = entity.subtype;
	data['initial_order_id'] = entity.initialOrderId;
	return data;
}

timeSlotFromJson(TimeSlot data, Map<String, dynamic> json) {
	if (json['from'] != null) {
		data.from = json['from']?.toString();
	}
	if (json['to'] != null) {
		data.to = json['to']?.toString();
	}
	return data;
}

Map<String, dynamic> timeSlotToJson(TimeSlot entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['from'] = entity.from;
	data['to'] = entity.to;
	return data;
}

userSubscriptionFromJson(UserSubscription data, Map<String, dynamic> json) {
	if (json['user'] != null) {
		data.user = json['user']?.toString();
	}
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['start_date'] != null) {
		data.startDate = json['start_date']?.toString();
	}
	if (json['end_date'] != null) {
		data.endDate = json['end_date']?.toString();
	}
	if (json['cost'] != null) {
		data.cost = json['cost']?.toInt();
	}
	return data;
}

Map<String, dynamic> userSubscriptionToJson(UserSubscription entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['user'] = entity.user;
	data['_id'] = entity.sId;
	data['name'] = entity.name;
	data['start_date'] = entity.startDate;
	data['end_date'] = entity.endDate;
	data['cost'] = entity.cost;
	return data;
}

userBankDetailsFromJson(UserBankDetails data, Map<String, dynamic> json) {
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

Map<String, dynamic> userBankDetailsToJson(UserBankDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['bank_name'] = entity.bankName;
	data['swift_code'] = entity.swiftCode;
	data['account_number'] = entity.accountNumber;
	data['beneficiary_name'] = entity.beneficiaryName;
	data['beneficiary_address'] = entity.beneficiaryAddress;
	return data;
}