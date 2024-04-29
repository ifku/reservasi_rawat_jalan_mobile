import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/doctor_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/doctor_model.dart';

class ChooseDoctorFakeDatasource extends DoctorDatasource {
  List<DoctorModel> doctorModels = [
    DoctorModel(
        idDoctor: 'c28462b7-22fd-438e-81b3-b8f8366315c5',
        doctorName: 'dr. Fifia Anggraini',
        doctorSip: '3120500001',
        doctorStr: '3120500001',
        doctorAge: 28,
        doctorRating: '4',
        doctorImage:
            'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710745012/reservasi-rawat-jalan/icons/doctors/image_doctor7_saom8k.jpg',
        clinicId: '8215c886-b2a4-4688-b96b-c823476fbe5d',
        isAvailable: true,
        clinicName: 'Klinik Umum',
        createdAt: DateTime(2024 - 03 - 13),
        updatedAt: DateTime(2024 - 03 - 13)),
    DoctorModel(
        idDoctor: '7c26e07d-d1f8-443e-af95-4bb4930b03ec',
        doctorName: 'dr. Arrafie Fikri Al Dzaky',
        doctorSip: '3120500002',
        doctorStr: '3120500002',
        doctorAge: 22,
        doctorRating: '4',
        doctorImage:
            'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710745009/reservasi-rawat-jalan/icons/doctors/image_doctor5_yc4bem.jpg',
        clinicId: '8215c886-b2a4-4688-b96b-c823476fbe5d',
        isAvailable: true,
        clinicName: 'Klinik Umum',
        createdAt: DateTime(2024 - 03 - 13),
        updatedAt: DateTime(2024 - 03 - 13)),
    DoctorModel(
        idDoctor: '31dc26fb-7271-495c-87aa-a8757fa4b6d6',
        doctorName: 'dr. Aalia Fegitri',
        doctorSip: '3120500003',
        doctorStr: '3120500003',
        doctorAge: 32,
        doctorRating: '5',
        doctorImage:
            'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710745005/reservasi-rawat-jalan/icons/doctors/image_doctor6_mhtiw1.jpg',
        clinicId: '8215c886-b2a4-4688-b96b-c823476fbe5d',
        isAvailable: true,
        clinicName: 'Klinik Umum',
        createdAt: DateTime(2024 - 03 - 13),
        updatedAt: DateTime(2024 - 03 - 13)),
    DoctorModel(
        idDoctor: 'ed4208be-f3a1-4f73-817f-71a103db7979',
        doctorName: 'dr. Go Yohana Gunawan',
        doctorSip: '3120500004',
        doctorStr: '3120500004',
        doctorAge: 40,
        doctorRating: '5',
        doctorImage:
            'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710745006/reservasi-rawat-jalan/icons/doctors/image_doctor3_smkqdr.jpg',
        clinicId: '8215c886-b2a4-4688-b96b-c823476fbe5d',
        isAvailable: true,
        clinicName: 'Klinik Umum',
        createdAt: DateTime(2024 - 03 - 13),
        updatedAt: DateTime(2024 - 03 - 13)),
    DoctorModel(
        idDoctor: 'e9af3e37-f0e7-4b90-8a4d-8dfba1601457',
        doctorName: 'dr. Christian Raimy Zakka',
        doctorSip: '3120500005',
        doctorStr: '3120500005',
        doctorAge: 32,
        doctorRating: '4.2',
        doctorImage:
            'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710745005/reservasi-rawat-jalan/icons/doctors/image_doctor1_ahztja.jpg',
        clinicId: '8215c886-b2a4-4688-b96b-c823476fbe5d',
        isAvailable: true,
        clinicName: 'Klinik Umum',
        createdAt: DateTime(2024 - 03 - 13),
        updatedAt: DateTime(2024 - 03 - 13)),
    DoctorModel(
        idDoctor: 'c18f0d51-643e-4870-9406-c6053aca2974',
        doctorName: 'dr. Amir Khan',
        doctorSip: '3120500006',
        doctorStr: '3120500006',
        doctorAge: 33,
        doctorRating: '4.8',
        doctorImage:
            'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710745010/reservasi-rawat-jalan/icons/doctors/image_doctor2_rhqsxc.jpg',
        clinicId: '8215c886-b2a4-4688-b96b-c823476fbe5d',
        isAvailable: false,
        clinicName: 'Klinik Umum',
        createdAt: DateTime(2024 - 03 - 13),
        updatedAt: DateTime(2024 - 03 - 13)),
    DoctorModel(
        idDoctor: '1e617378-3db1-47e1-9813-b970ee37639a',
        doctorName: 'dr. Vashdev Gobind',
        doctorSip: '3120500007',
        doctorStr: '3120500007',
        doctorAge: 33,
        doctorRating: '4.8',
        doctorImage:
            'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710745008/reservasi-rawat-jalan/icons/doctors/image_doctor4_niyiuo.jpg',
        clinicId: '8215c886-b2a4-4688-b96b-c823476fbe5d',
        isAvailable: false,
        clinicName: 'Klinik Umum',
        createdAt: DateTime(2024 - 03 - 13),
        updatedAt: DateTime(2024 - 03 - 13)),
    DoctorModel(
        idDoctor: '1e617378-3db1-47e1-9813-b970ee37639a',
        doctorName: 'dr. Vashdev Gobind',
        doctorSip: '3120500007',
        doctorStr: '3120500007',
        doctorAge: 33,
        doctorRating: '4.8',
        doctorImage:
            'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710745008/reservasi-rawat-jalan/icons/doctors/image_doctor4_niyiuo.jpg',
        clinicId: 'f5071ce5-4191-42b9-ab9f-4d63522527c0',
        isAvailable: false,
        clinicName: 'Penyakit Dalam',
        createdAt: DateTime(2024 - 03 - 13),
        updatedAt: DateTime(2024 - 03 - 13)),
  ];

  @override
  Future<Either<Exception, List<DoctorModel>>> getDoctorByClinicId(
      String id) async {
    await Future.delayed(const Duration(seconds: 3));
    List<DoctorModel> doctorsInClinic =
        doctorModels.where((doctor) => doctor.clinicId == id).toList();
    return Right(doctorsInClinic ?? []);
  }
}
