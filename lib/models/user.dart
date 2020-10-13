import 'package:Vio_Telehealth/generated/json/base/json_convert_content.dart';
import 'package:Vio_Telehealth/generated/json/base/json_filed.dart';

class User with JsonConvert<User> {
  @JSONField(name: "_id")
  String sId;
  UserWallet wallet;
  List<String> patients;
  @JSONField(name: "notify_patients_when_free")
  List<String> notifyPatientsWhenFree;
  @JSONField(name: "is_profile_completed")
  bool isProfileCompleted;
  List<String> roles;
  String mobile;
  @JSONField(name: "app_status")
  String appStatus;
  @JSONField(name: "session_status")
  String sessionStatus;
  List<UserDocuments> documents;
  @JSONField(name: "payment_cards")
  List<UserPaymentCards> paymentCards;
  @JSONField(name: "created_at")
  String createdAt;
  @JSONField(name: "updated_at")
  String updatedAt;
  String token;
  @JSONField(name: "__v")
  int iV;
  Map<String, List<TimeSlot>> calender;
  @JSONField(name: "rate_average")
  int rateAverage;
  List<String> invites;
  @JSONField(name: "rate_count")
  int rateCount;
  String bio;
  @JSONField(name: "birth_date")
  String birthDate;
  @JSONField(name: "cost_per_session")
  int costPerSession;
  String email;
  @JSONField(name: "experience_in_years")
  String experienceInYears;
  @JSONField(name: "full_name")
  String fullName;
  String gender;
  @JSONField(name: "last_name")
  String lastName;
  @JSONField(name: "profile_image")
  String profileImage;
  String specialty;
  @JSONField(name: "time_session")
  int timeSession;
  UserSubscription subscription;
  List<dynamic> allergies;
  @JSONField(name: "chronic_disease")
  List<dynamic> chronicDisease;
  String university;
  @JSONField(name: "session_id")
  String sessionId;
  @JSONField(name: "bank_details")
  UserBankDetails bankDetails;

  User({this.fullName, this.mobile, this.email});
}

class UserWallet with JsonConvert<UserWallet> {
  int balance;
}

class UserDocuments with JsonConvert<UserDocuments> {
  List<String> files;
  String name;
}

class UserPaymentCards with JsonConvert<UserPaymentCards> {
  String id;
  String token;
  @JSONField(name: "last_four_digits")
  String lastFourDigits;
  String subtype;
  @JSONField(name: "initial_order_id")
  String initialOrderId;
}

class TimeSlot with JsonConvert<TimeSlot> {
  String from;
  String to;
}

class UserSubscription with JsonConvert<UserSubscription> {
  String user;
  @JSONField(name: "_id")
  String sId;
  String name;
  @JSONField(name: "start_date")
  String startDate;
  @JSONField(name: "end_date")
  String endDate;
  int cost;
}

class UserBankDetails with JsonConvert<UserBankDetails> {
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
