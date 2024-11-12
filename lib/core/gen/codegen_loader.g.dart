// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "appbar": {
    "account": "Account",
    "activity": "Activity",
    "home": "Home",
    "history": "History"
  },
  "clinicScreen": {
    "clinicList": "Available Clinics",
    "findYourClinic": "Find the best clinic for your needs",
    "generalClinic": "General Clinic",
    "pulmonaryClinic": "Pulmonary Clinic",
    "thtClinic": "ENT Clinic",
    "skinAndGynecologyClinic": "Skin and Gynecology Clinic",
    "eyeClinic": "Eye Clinic",
    "obstreticsClinic": "Obstetrics",
    "surgeryClinic": "Surgery Clinic",
    "cardiacClinic": "Cardiac Clinic",
    "neurologyClinic": "Neurology Clinic",
    "dentalOralClinic": "Dental & Oral Clinic",
    "beautyClinic": "Beauty Clinic",
    "internalDiseaseClinic": "Internal Disease Clinic"
  },
  "homeScreen": {
    "halo": "Hello",
    "whatDoYouWantToDoToday": "What do you want to do today?",
    "reservation": "Reservation",
    "doctorSchedule": "Doctor Schedule",
    "queue": "Queue",
    "insurance": "Insurance",
    "appointment": "Appointment",
    "continueReading": "Continue Reading",
    "doReservationHere": "Make your reservation here",
    "seeDoctorSchedule": "See doctors schedule",
    "seeQueueHere": "See current queue",
    "paymentMethod": "Payment method",
    "latestInformation": "Latest Information",
    "upcomingSchedule": "Upcoming Schedule",
    "continueRead": "Continue Read"
  },
  "chooseDoctorScreen": {
    "clinic": "Clinic",
    "findDoctor": "Find your preferred doctor below.",
    "below": "below!",
    "findDoctorIn": "Find a doctor in",
    "doctor": "Doctor",
    "years": "Years old",
    "doctorDetail": "Doctor Details",
    "sipNumber": "SIP Number",
    "strItem": "STR Number",
    "paymentMethod": "Payment Method",
    "chooseDoctor": "Choose Doctor",
    "doctorNotFound": "Doctor not found."
  },
  "detailDoctorScreen": {
    "detailDoctor": "Doctor Detail",
    "sipNumber": "SIP Number",
    "strNumber": "STR Number",
    "paymentMethod": "Payment Method",
    "chooseDoctor": "CHOOSE DOCTOR"
  },
  "reservationScreen": {
    "noBook": "You have not booked a service yet. Please start scheduling",
    "makeAReservation": "MAKE A RESERVATION",
    "reservation": "Reservation",
    "noReservation": "No Reservation Yet",
    "yourReservationNumber": "Your Reservation Number",
    "pleaseArrive": "Please Arrive 15 Minutes Before Queue",
    "scanCode": "SCAN CODE",
    "currentReservation": "Current Reservation Number",
    "estimatedTime": "Estimated Time",
    "serviceInformation": "Service Information",
    "doctor": "Doctor",
    "typeOfInsurance": "Types of Health Insurance",
    "clinic": "Clinic",
    "patientName": "Patient Name",
    "serviceHour": "Service Hours",
    "reservationDate": "Reservation Date",
    "return": "RETURN",
    "reservationInformation": "Reservation Information",
    "reservation_id": "Reservation ID",
    "see_eticket": "SEE E-TICKET",
    "seeETicket": "See E-TICKET"
  },
  "exception": {
    "requestTimeOutException": "The server appears to be taking too long to answer. Please try again later.",
    "requestCancelledException": "The request was cancelled. Please try again.",
    "noInternetException": "You are not connected to the internet. Please check your network connection and try again.",
    "googleSignInException": "There was an issue signing in with Google. Please try again or use a different sign-in method.",
    "generalErrorException": "Something is wrong, please try again later."
  },
  "detailProfileScreen": {
    "idNumber": "ID Number",
    "fullName": "Fullname",
    "email": "Email",
    "phoneNumber": "Phone Number",
    "dateOfBirth": "Date of Birth",
    "gender": "Gender",
    "male": "Male",
    "female": "Female",
    "address": "Address",
    "occupation": "Occupation",
    "completeInformation": "Complete your personal information below to make your profile more informative for a better user experience.",
    "save": "Save"
  },
  "familyScreen": {
    "familyList": "Family List",
    "addFamilyMember": "Add your Family Members to make service easier and provide a better experience.",
    "addMember": "Add Member"
  },
  "onboardingScreen": {
    "onboarding1Subtitle": "Find the right doctor for your needs easily and quickly.",
    "onboarding2Subtitle": "Arrange a doctor's appointment around your schedule, without the long wait.",
    "onboarding3Subtitle": "Get real-time wait time estimates, so you can organize your daily schedule more efficiently.",
    "onboarding4Subtitle": "Pay with ease using the various online payment methods available, from credit cards to digital wallets.",
    "onboarding1Title": "Find The Best Doctor",
    "onboarding2Title": "Set a Flexible Schedule",
    "onboarding3Title": "Estimated Waiting Time",
    "onboarding4Title": "Hassle-free Transactions"
  },
  "dialog": {
    "error": "Error",
    "errorFetchMessage": "Sorry, there was an error loading the data. Please try again later.",
    "errorSaveMessage": "Your changes failed to save. Please try again later.",
    "deleteData": "Data Deletion",
    "deleteDataMessage": "Are you sure you want to delete this data? This action is irreversible.",
    "unsavedData": "Unsaved Data",
    "paymentSuccessful": "Payment Successful",
    "paymentSuccessfulMessage": "Thank you! Your payment has been saved successfully.",
    "dataSaved": "Data Saved Successfully",
    "dataChangeMessage": "The changes you made have been saved successfully.",
    "confirmationOfChange": "Confirmation of Changes",
    "confirmationOfChangeMessage": "Are you sure you want to keep the changes changes?",
    "verify": "Verify",
    "verifyMessage": "Get all services by verifying first.",
    "cancel": "CANCEL",
    "close": "CLOSE",
    "yes": "YES",
    "save": "SAVE",
    "back": "BACK"
  },
  "common": {
    "underConstruction": "Coming Soon"
  },
  "auth": {
    "greeting": "Hello, Healthy Friend!",
    "signIn": "SIGN IN",
    "signUp": "SIGN UP",
    "orContinueWithEmail": "Or continue with email",
    "signInWithGoogle": "Sign in with Google",
    "email": "Email",
    "haveAnAccount": "Already have an account? Click ",
    "click": "Click",
    "here": "here",
    "otp": "OTP Code",
    "otpMessage": "An OTP code has been sent to your email. Please check your inbox and enter the code here to proceed.",
    "haventReceiveTheCodeYet": "Haven't received a code yet?",
    "otpSendCode": "We have sent a code to ",
    "otpDidntReceive": "Didn't receive the code?",
    "otpResendCode": "Resend Code",
    "otpVerify": "VERIFY",
    "id": "National ID number",
    "dontHaveAnAccount": "Don't have an account? Click ",
    "otpCode": "OTP Code",
    "otpCodeSent": "The OTP code has been sent to your email. Please check your inbox and enter the code here to proceed."
  },
  "historyScreen": {
    "thereAreNoReservation": "There are No Reservations Yet",
    "youHaveNotBooked": "You have not booked a service yet. Please start scheduling",
    "makeReservation": "MAKE A RESERVATION",
    "history": "Histor"
  },
  "activityScreen": {
    "thereAreNoActivities": "There are No Recent Activity",
    "youHaveNotBooked": "You have not booked a service yet. Please start scheduling",
    "makeAReservation": "MAKE A RESERVAT",
    "activity": "Activity"
  },
  "completeProfile": {
    "email": "Email",
    "nationalIdentityNumber": "National Identity Number",
    "phoneNumber": "Phone Number",
    "address": "Addres",
    "dateOfBirth": "Date of Birth",
    "completeProfile": "Complete Profile",
    "fullname": "Fullnam",
    "gender": "Gender"
  },
  "createReservation": {
    "reservationDetail": "Reservation Detail",
    "selectTheDayAndDateForTheAppointment": "Select the day and date for the Appointment",
    "patient": "Patient",
    "date": "Date",
    "next": "NEXT",
    "patientDetail": "Patient Details",
    "fullname": "Fullname",
    "email": "Email ",
    "phoneNumber": "Phone Number",
    "addAsPatient": "Add as patient",
    "addAnotherPatient": "Add another patient",
    "listOfFamilyMembers": "List of family members",
    "choosePatient": "CHOOSE PATIENT",
    "addPatientData": "ADD PATIENT DATA",
    "reservationDate": "Reservation Date",
    "selectDate": "Select Date",
    "chooseDate": "CHOOSE DATE",
    "makeReservation": "MAKE RESERVATION",
    "nationalIdentityNumber": "NIN",
    "searchPatientName": "SEARCH FOR PATIENT NAME"
  },
  "reservationConfirmationScreen": {
    "backToHome": "Back to Home"
  },
  "validation": {
    "invalidNIK": "National Identity Number (NIK) is required.",
    "invalidNIKFormat": "NIK must be exactly 16 numeric characters.",
    "invalidFullname": "Full name is required.",
    "invalidPhone": "Phone number is required.",
    "invalidPhoneFormat": "Phone number must contain at least 10 digits.",
    "invalidAddress": "Address is required.",
    "invalidGender": "Gender is required.",
    "invalidGenderFormat": "Gender must be 'Male' or 'Female'.",
    "invalidDateOfBirth": "Date of birth is required.",
    "invalidDateOfBirthFuture": "Date of birth cannot be in the future.",
    "invalidDateOfBirthFormat": "Date of birth must be in the format YYYY-MM-DD."
  }
};
static const Map<String,dynamic> id_ID = {
  "appbar": {
    "account": "Akun",
    "activity": "Aktivitas",
    "home": " Beranda",
    "history": "Riwayat"
  },
  "clinicScreen": {
    "clinicList": "Daftar Klinik",
    "findYourClinic": "Temukan klinik terbaik sesuai kebutuhanmu",
    "generalClinic": "Klinik Umum",
    "pulmonaryClinic": "Klinik Paru",
    "thtClinic": "Klinik THT",
    "skinAndGynecologyClinic": "Klinik Kulit dan Kelamin",
    "eyeClinic": "Klinik Mata",
    "obstreticsClinic": "Klinik Kandungan",
    "surgeryClinic": "Klinik Bedah",
    "cardiacClinic": "Klinik Jantung",
    "neurologyClinic": "Klinik Syaraf",
    "dentalOralClinic": "Klinik Gigi dan Mulut",
    "beautyClinic": "Klinik Kecantikan",
    "internalDiseaseClinic": "Klinik Penyakit Dalam"
  },
  "homeScreen": {
    "halo": "Halo",
    "whatDoYouWantToDoToday": " Apa yang ingin kamu lakukan hari ini?",
    "reservation": "Reservasi",
    "doctorSchedule": "Jadwal Dokter",
    "queue": "Antrian",
    "insurance": "Asuransi",
    "appointment": "Janji Temu",
    "continueReading": "Lanjut Membaca",
    "doReservationHere": "Lakukan reservasi disini",
    "seeDoctorSchedule": "Lihat jadwal dokter",
    "seeQueueHere": "Lihat antrian saat ini",
    "paymentMethod": "Metode pembayaran",
    "latestInformation": "Informasi Terkini",
    "upcomingSchedule": "Jadwal Mendatang",
    "continueRead": "Lanjutkan Membaca"
  },
  "chooseDoctorScreen": {
    "clinic": "Klinik",
    "findDoctor": "Temukan dokter pilihanmu dibawah ini.",
    "below": "dibawah ini!",
    "findDoctorIn": "Cari Dokter",
    "doctor": "Dokter",
    "years": "Tahun",
    "doctorDetail": "Detail Dokter",
    "sipNumber": "Nomor SIP",
    "strItem": "Nomor STR",
    "paymentMethod": "Pembayaran",
    "chooseDoctor": "Pilih Dokter",
    "doctorNotFound": "Dokter tidak ditemukan."
  },
  "detailDoctorScreen": {
    "detailDoctor": "Detail Dokter",
    "sipNumber": "Nomor SIP",
    "strNumber": "Nomor STR",
    "paymentMethod": "Metode Pembayaran",
    "chooseDoctor": "PILIH DOKTER"
  },
  "reservationScreen": {
    "noBook": "Anda belum memesan layanan. Silahkan mulai untuk melakukan penjadwalan",
    "makeAReservation": "LAKUKAN RESERVASI",
    "reservation": "Reservasi",
    "noReservation": "Belum Ada Reservasi",
    "yourReservationNumber": "Nomor Reservasi Anda",
    "pleaseArrive": "Harap Datang 15 Menit Sebelum Antrian",
    "scanCode": "PINDAI KODE",
    "currentReservation": "Nomor Antrian Saat Ini",
    "estimatedTime": "Estimasi Pelayanan",
    "serviceInformation": "Informasi Pelayanan",
    "doctor": "Dokter Pemeriksa",
    "typeOfInsurance": "Jenis Asuransi Kesehatan",
    "clinic": "Klinik",
    "patientName": "Nama Pasien",
    "serviceHour": "Jam Pelayanan",
    "reservationDate": "Tanggal Reservasi",
    "return": "KEMBALI",
    "reservationInformation": "Informasi Reservasi",
    "reservation_id": "ID Pemesanan",
    "see_eticket": "LIHAT E-TIKET",
    "seeETicket": "Lihat E-TICKET"
  },
  "exception": {
    "requestTimeOutException": "Server tampaknya terlalu lama merespons. Silakan coba lagi nanti.",
    "requestCancelledException": "Permintaan dibatalkan. Silakan coba lagi.",
    "noInternetException": "Anda tidak tersambung ke internet. Periksa koneksi jaringan Anda dan coba lagi.",
    "googleSignInException": "Ada masalah saat masuk dengan Google. Silakan coba lagi atau gunakan metode masuk yang berbeda.",
    "generalErrorException": "Terdapat kesalahan, silakan coba lagi nanti."
  },
  "detailProfileScreen": {
    "idNumber": "NIK",
    "fullName": "Nama Lengkap",
    "email": "Email ",
    "phoneNumber": "Nomor Telepon",
    "dateOfBirth": "Tanggal Lahir",
    "gender": "Jenis Kelamin",
    "male": "Laki-laki",
    "female": "Perempuan",
    "address": "Alamat",
    "occupation": "Pekerjaan",
    "completeInformation": "Lengkapi informasi diri anda di bawah ini untuk membuat profil lebih informatif untuk pengalaman pengguna yang lebih baik.",
    "save": "Simpan"
  },
  "familyScreen": {
    "familyList": "Daftar Keluarga",
    "addFamilyMember": "Tambahkan Anggota Keluarga Anda untuk membuat pelayanan lebih mudah dan memberikan pengalaman yang lebih baik.",
    "addMember": "Tambah Anggota"
  },
  "onboardingScreen": {
    "onboarding1Subtitle": "Temukan dokter yang tepat untuk kebutuhan Anda dengan mudah dan cepat.",
    "onboarding2Subtitle": "Atur janji dengan dokter sesuai jadwal Anda, tanpa perlu menunggu lama.",
    "onboarding3Subtitle": "Dapatkan perkiraan waktu tunggu secara langsung, sehingga Anda bisa mengatur jadwal harian Anda dengan lebih efisien.",
    "onboarding4Subtitle": "Bayar dengan mudah menggunakan berbagai metode pembayaran online yang tersedia, mulai dari kartu kredit hingga dompet digital.",
    "onboarding1Title": "Temukan Dokter Terbaik",
    "onboarding2Title": "Atur Jadwal Flexible",
    "onboarding3Title": "Estimasi Waktu Tunggu",
    "onboarding4Title": "Transaksi Tanpa Ribet"
  },
  "dialog": {
    "error": "Kesalahan",
    "errorFetchMessage": "Maaf, terjadi kesalahan saat memuat data. Silakan coba lagi nanti.",
    "errorSaveMessage": "Perubahan yang Anda lakukan gagal disimpan. Silakan coba lagi nanti.",
    "deleteData": "Penghapusan Data",
    "deleteDataMessage": "Apakah Anda yakin ingin menghapus data ini? Tindakan ini tidak dapat dikembalikan.",
    "unsavedData": "Data Belum Tersimpan",
    "paymentSuccessful": "Pembayaran Berhasil",
    "paymentSuccessfulMessage": "Terima kasih! Pembayaran yang Anda lakukan telah berhasil disimpan dengan sukses.",
    "dataSaved": "Data Berhasil Disimpan",
    "dataChangeMessage": " Perubahan yang Anda lakukan telah berhasil disimpan dengan sukses.",
    "confirmationOfChange": "Konfirmasi Perubahan",
    "confirmationOfChangeMessage": "Apakah Anda yakin untuk menyimpan perubahan yang ada?",
    "verify": "Lakukan Verifikasi",
    "verifyMessage": "Dapatkan seluruh pelayanan dengan melakukan verifikasi terlebih dahulu.",
    "cancel": "BATAL",
    "close": "TUTUP",
    "yes": "IYA",
    "save": "SIMPAN",
    "back": "KEMBALI"
  },
  "common": {
    "underConstruction": "Segera Hadir"
  },
  "auth": {
    "greeting": "Halo, Kawan Sehat!",
    "signIn": "MASUK",
    "signUp": "DAFTAR",
    "orContinueWithEmail": "Atau masuk dengan email",
    "signInWithGoogle": "Masuk dengan Google",
    "email": "Email ",
    "haveAnAccount": "Sudah memiliki akun? Klik ",
    "click": "Klik",
    "here": "di sini",
    "otp": "Kode OTP",
    "otpMessage": "Kode OTP telah dikirimkan ke email Anda. Mohon periksa kotak masuk Anda dan masukkan kode tersebut di sini untuk melanjutkan",
    "haventReceiveTheCodeYet": "Belum menerima kode?",
    "otpSendCode": "Kami telah mengirimkan kode ke ",
    "otpDidntReceive": "Tidak menerima kode?",
    "otpResendCode": "Kirim Ulang Kode",
    "otpVerify": "VERIFIKASI",
    "id": "Nomor Induk Kependudukan (NIK) ",
    "dontHaveAnAccount": "Tidak punya akun? Klik ",
    "otpCode": "Kode OTP",
    "otpCodeSent": "Kode OTP telah dikirimkan ke email Anda. Mohon periksa kotak masuk Anda dan masukkan kode tersebut di sini untuk melanjutkan."
  },
  "historyScreen": {
    "thereAreNoReservation": "Belum Ada Pemesanan Nih!",
    "youHaveNotBooked": "Anda belum memesan layanan. Silakan mulai untuk melakukan penjadwalan",
    "makeReservation": "LAKUKAN RESERVASI",
    "history": "Riwayat"
  },
  "activityScreen": {
    "thereAreNoActivities": "Tidak Ada Aktivitas Terbaru",
    "youHaveNotBooked": "Anda belum memesan layanan. Silakan mulai untuk melakukan penjadwalan",
    "makeAReservation": "LAKUKAN RESERVASI",
    "activity": "Aktivitas"
  },
  "completeProfile": {
    "email": "Email ",
    "nationalIdentityNumber": "Nomor Induk Kependudukan (NIK)",
    "phoneNumber": "Nomor Telepon",
    "address": "Alamat",
    "dateOfBirth": "Tanggal Lahir",
    "completeProfile": "Lengkapi Profil",
    "fullname": "Nama Lengkap",
    "gender": "Jenis Kelamin"
  },
  "createReservation": {
    "reservationDetail": "Detail Reservasi",
    "selectTheDayAndDateForTheAppointment": "Pilih hari dan tanggal untuk Janji Temu",
    "patient": "Pasien",
    "date": "Tanggal",
    "next": "SELANJUTNYA",
    "patientDetail": "Detail Pasien",
    "fullname": "Nama Lengkap",
    "email": "Email",
    "phoneNumber": "Nomor Telepon",
    "addAsPatient": "Tambahkan sebagai pasien",
    "addAnotherPatient": "Tambahkan Pasien Lain",
    "listOfFamilyMembers": "Daftar Anggota Keluarga",
    "choosePatient": "PILIH PASIEN",
    "addPatientData": "TAMBAH DATA PASIEN",
    "reservationDate": "Tanggal Reservasi",
    "selectDate": "Pilih Tanggal",
    "chooseDate": "PILIH TANGGAL",
    "makeReservation": "BUAT RESERVASI",
    "nationalIdentityNumber": "NIK",
    "searchPatientName": "CARI NAMA PASIEN"
  },
  "reservationConfirmationScreen": {
    "backToHome": "Kembali ke Beranda"
  },
  "validation": {
    "invalidNIK": "Nomor Induk Kependudukan (NIK) wajib diisi.",
    "invalidNIKFormat": "NIK harus terdiri dari 16 karakter angka.",
    "invalidFullname": "Nama lengkap wajib diisi.",
    "invalidPhone": "Nomor telepon wajib diisi.",
    "invalidPhoneFormat": "Nomor telepon harus terdiri dari minimal 10 digit.",
    "invalidAddress": "Alamat wajib diisi.",
    "invalidGender": "Jenis kelamin wajib diisi.",
    "invalidGenderFormat": "Jenis kelamin harus 'Laki-laki' atau 'Perempuan'.",
    "invalidDateOfBirth": "Tanggal lahir wajib diisi.",
    "invalidDateOfBirthFuture": "Tanggal lahir tidak boleh di masa depan.",
    "invalidDateOfBirthFormat": "Tanggal lahir harus dalam format YYYY-MM-DD."
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "id_ID": id_ID};
}
