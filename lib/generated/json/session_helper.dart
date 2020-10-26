import 'package:Vio_Telehealth/models/session.dart';
import 'package:Vio_Telehealth/models/user.dart';

sessionFromJson(Session data, Map<String, dynamic> json) {
	if (json['session_details'] != null) {
		data.sessionDetails = new SessionSessionDetails().fromJson(json['session_details']);
	}
	if (json['_id'] != null) {
		data.sId = json['_id']?.toString();
	}
	if (json['prescription'] != null) {
		data.prescription = new SessionPrescription().fromJson(json['prescription']);
	}
	if (json['doctor'] != null) {
		data.doctor = new User().fromJson(json['doctor']);
	}
	if (json['cost'] != null) {
		data.cost = json['cost']?.toInt();
	}
	if (json['patient'] != null) {
		data.patient = new User().fromJson(json['patient']);
	}
	if (json['status'] != null) {
		data.status = new List<SessionStatu>();
		(json['status'] as List).forEach((v) {
			data.status.add(new SessionStatu().fromJson(v));
		});
	}
	if (json['webRTC_status'] != null) {
		data.webrtcStatus = new List<SessionWebrtcStatu>();
		(json['webRTC_status'] as List).forEach((v) {
			data.webrtcStatus.add(new SessionWebrtcStatu().fromJson(v));
		});
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at']?.toString();
	}
	if (json['session_note'] != null) {
		data.sessionNote = json['session_note']?.toString();
	}
	if (json['actual_session_time'] != null) {
		data.actualSessionTime = json['actual_session_time']?.toInt();
	}
	if (json['__v'] != null) {
		data.iV = json['__v']?.toInt();
	}
	return data;
}

Map<String, dynamic> sessionToJson(Session entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.sessionDetails != null) {
		data['session_details'] = entity.sessionDetails.toJson();
	}
	data['_id'] = entity.sId;
	if (entity.prescription != null) {
		data['prescription'] = entity.prescription.toJson();
	}
	if (entity.doctor != null) {
		data['doctor'] = entity.doctor.toJson();
	}
	data['cost'] = entity.cost;
	if (entity.patient != null) {
		data['patient'] = entity.patient.toJson();
	}
	if (entity.status != null) {
		data['status'] =  entity.status.map((v) => v.toJson()).toList();
	}
	if (entity.webrtcStatus != null) {
		data['webRTC_status'] =  entity.webrtcStatus.map((v) => v.toJson()).toList();
	}
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['session_note'] = entity.sessionNote;
	data['actual_session_time'] = entity.actualSessionTime;
	data['__v'] = entity.iV;
	return data;
}

sessionSessionDetailsFromJson(SessionSessionDetails data, Map<String, dynamic> json) {
	if (json['patient_name'] != null) {
		data.patientName = json['patient_name']?.toString();
	}
	if (json['reason_of_the_session'] != null) {
		data.reasonOfTheSession = json['reason_of_the_session']?.toString();
	}
	return data;
}

Map<String, dynamic> sessionSessionDetailsToJson(SessionSessionDetails entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['patient_name'] = entity.patientName;
	data['reason_of_the_session'] = entity.reasonOfTheSession;
	return data;
}

sessionPrescriptionFromJson(SessionPrescription data, Map<String, dynamic> json) {
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['drugs'] != null) {
		data.drugs = new List<SessionPrescriptionDrug>();
		(json['drugs'] as List).forEach((v) {
			data.drugs.add(new SessionPrescriptionDrug().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> sessionPrescriptionToJson(SessionPrescription entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['created_at'] = entity.createdAt;
	if (entity.drugs != null) {
		data['drugs'] =  entity.drugs.map((v) => v.toJson()).toList();
	}
	return data;
}

sessionPrescriptionDrugFromJson(SessionPrescriptionDrug data, Map<String, dynamic> json) {
	if (json['drug_name'] != null) {
		data.drugName = json['drug_name']?.toString();
	}
	if (json['dose'] != null) {
		data.dose = json['dose']?.toInt();
	}
	if (json['dose_type'] != null) {
		data.doseType = json['dose_type']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	return data;
}

Map<String, dynamic> sessionPrescriptionDrugToJson(SessionPrescriptionDrug entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['drug_name'] = entity.drugName;
	data['dose'] = entity.dose;
	data['dose_type'] = entity.doseType;
	data['description'] = entity.description;
	return data;
}

sessionStatuFromJson(SessionStatu data, Map<String, dynamic> json) {
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	return data;
}

Map<String, dynamic> sessionStatuToJson(SessionStatu entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['text'] = entity.text;
	data['created_at'] = entity.createdAt;
	return data;
}

sessionWebrtcStatuFromJson(SessionWebrtcStatu data, Map<String, dynamic> json) {
	if (json['text'] != null) {
		data.text = json['text']?.toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	return data;
}

Map<String, dynamic> sessionWebrtcStatuToJson(SessionWebrtcStatu entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['text'] = entity.text;
	data['created_at'] = entity.createdAt;
	return data;
}