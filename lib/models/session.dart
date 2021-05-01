import 'package:Blwahda/generated/json/base/json_convert_content.dart';
import 'package:Blwahda/generated/json/base/json_filed.dart';
import 'package:Blwahda/models/user.dart';

class Session with JsonConvert<Session> {
	@JSONField(name: "session_details")
	SessionSessionDetails sessionDetails;
	@JSONField(name: "_id")
	String sId;
	SessionPrescription prescription;
	User doctor;
	int cost;
	User patient;
	List<SessionStatu> status;
	@JSONField(name: "webRTC_status")
	List<SessionWebrtcStatu> webrtcStatus;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "updated_at")
	String updatedAt;
	@JSONField(name: "session_note")
	String sessionNote;
	@JSONField(name: "actual_session_time")
	int actualSessionTime;
	@JSONField(name: "__v")
	int iV;
}

class SessionSessionDetails with JsonConvert<SessionSessionDetails> {
	@JSONField(name: "patient_name")
	String patientName;
	@JSONField(name: "reason_of_the_session")
	String reasonOfTheSession;
}

class SessionPrescription with JsonConvert<SessionPrescription> {
	@JSONField(name: "created_at")
	String createdAt;
	List<SessionPrescriptionDrug> drugs;
}

class SessionPrescriptionDrug with JsonConvert<SessionPrescriptionDrug> {
	@JSONField(name: "drug_name")
	String drugName;
	int dose;
	@JSONField(name: "dose_type")
	String doseType;
	String description;
}

class SessionStatu with JsonConvert<SessionStatu> {
	String text;
	@JSONField(name: "created_at")
	String createdAt;
}

class SessionWebrtcStatu with JsonConvert<SessionWebrtcStatu> {
	String text;
	@JSONField(name: "created_at")
	String createdAt;
}
