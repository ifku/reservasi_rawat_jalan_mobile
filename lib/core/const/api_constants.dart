class ApiConstants {
  ApiConstants._();

  static const String signUp = "/auth/sign-up";
  static const String signIn = "/auth/sign-in";
  static const String sendOtp = "/auth/send-otp";

  static const String clinic = "/clinic";
  static const String doctorByClinicId = "/doctor/clinic/";
  static const String reservationByPatientId = "/reservation/patient/";
  static const String reservationByUserId = "/reservation/user/";
  static const String createReservation = "/reservation/";
  static const String patientByUserId = "/patient/";

  static const String advanceFiltering = "/reservation/filter/advance-filter";
}
