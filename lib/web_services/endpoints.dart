class EndPoints {
  static final loginEndpoint = '/auth/local';
  static final verifyEndpoint = '/auth/local/verify';
  static final updateSessionWebRtcStatus = (sessionId)=> '/sessions/$sessionId/web-rtc-status';
  static final updateSessionPrescription = (sessionId)=> '/sessions/$sessionId/prescription';
  static final updateSessionAdditionalNotes = (sessionId)=> '/sessions/$sessionId/session-note';
  static final session = (sessionId)=> '/sessions/$sessionId';
  static final userSession = (userId)=> '/users/$userId/sessions?sort=-created_at';
  static profile(userId) => '/users/$userId';
  static updateDocuments(userId) => '/users/$userId/documents';
  static deleteDocuments(userId , name) => '/users/$userId/documents/$name';
  static completeUserProfile(userId) => '/users/$userId/complete';
  static updateUserProfile(userId) => '/users/$userId';
  static updateUserStatus(userId) => '/users/$userId/session-status';
  static doctors(userId) => '/users/$userId/doctors';
  static doctor(userId, doctorId) => '/users/$userId/doctors/$doctorId';
  static final invite = '/invite';
  static final profitTransfer = '/profit_transfers';
  static userProfitTransfer(userId) => '/users/$userId/profit_transfers';
  static userCancelProfitTransfer(userId , requestId) => '/users/$userId/profit_transfers/$requestId/status';
  static final subscription = '/subscriptions';
  static final transactions = '/transactions?sort=createdAt';
  static userSessionComplains(userId) => '/users/$userId/complains';
  static final createComplain =  '/complains';
  static final createSession =  '/sessions';
  static final getNotify =  '/register-notify';
  static deleteNotify(doctorId) =>  '/register-notify/$doctorId';


}
