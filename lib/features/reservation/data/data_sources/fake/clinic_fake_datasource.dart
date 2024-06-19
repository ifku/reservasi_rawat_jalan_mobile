import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/clinic_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/clinic_model.dart';

class ClinicFakeDataSource extends ClinicDataSource {
  @override
  Future<Either<Exception, List<ClinicModel>>> getAllClinic() async {
    await Future.delayed(const Duration(seconds: 3));
    return Right(<ClinicModel>[
      ClinicModel(
          idClinic: '8215c886-b2a4-4688-b96b-c823476fbe5d',
          clinicName: 'Klinik Umum',
          clinicIcon: 'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710741672/reservasi-rawat-jalan/icons/clinics/icon_sthetoscope_tbtp2d.svg',
          createdAt: DateTime(2024 - 03 - 13),
          updatedAt: DateTime(2024 - 03 - 13)),
      ClinicModel(
          idClinic: 'f5071ce5-4191-42b9-ab9f-4d63522527c0',
          clinicName: 'Penyakit Dalam',
          clinicIcon: 'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710741662/reservasi-rawat-jalan/icons/clinics/icon_healthcare_fsllgn.svg',
          createdAt: DateTime(2024 - 03 - 13),
          updatedAt: DateTime(2024 - 03 - 13)),
      ClinicModel(
          idClinic: '2e01a6e4-d68a-4119-ad1f-5dcdf1b02e63',
          clinicName: 'Klinik Paru',
          clinicIcon: 'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710741667/reservasi-rawat-jalan/icons/clinics/icon_lung_omlmnh.svg',
          createdAt: DateTime(2024 - 03 - 13),
          updatedAt: DateTime(2024 - 03 - 13)),
      ClinicModel(
          idClinic: 'e250acde-6758-4f1e-8866-f9ebc4c24938',
          clinicName: 'Klinik THT',
          clinicIcon: 'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710741658/reservasi-rawat-jalan/icons/clinics/icon_ear_iiwxcq.svg',
          createdAt: DateTime(2024 - 03 - 13),
          updatedAt: DateTime(2024 - 03 - 13)),
      ClinicModel(
          idClinic: 'c290d683-8535-4563-b86a-cc34d71a7011',
          clinicName: 'Klinik Kulit dan Kelamin',
          clinicIcon: 'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710741677/reservasi-rawat-jalan/icons/clinics/icon_uterus_v5vpbs.svg',
          createdAt: DateTime(2024 - 03 - 13),
          updatedAt: DateTime(2024 - 03 - 13)),
      ClinicModel(
          idClinic: '299582bc-3215-4681-9140-900f9c1ccbc6',
          clinicName: 'Klinik Mata',
          clinicIcon: 'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710741659/reservasi-rawat-jalan/icons/clinics/icon_eye_y0keqn.svg',
          createdAt: DateTime(2024 - 03 - 13),
          updatedAt: DateTime(2024 - 03 - 13)),
      ClinicModel(
          idClinic: '7a99ac57-6034-4226-9d59-43e3280071f7',
          clinicName: 'Klinik Kandungan',
          clinicIcon: 'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710741660/reservasi-rawat-jalan/icons/clinics/icon_fetus_bjtobs.svg',
          createdAt: DateTime(2024 - 03 - 13),
          updatedAt: DateTime(2024 - 03 - 13)),
      ClinicModel(
          idClinic: 'c76c53d2-0491-4e2c-a371-3b870f208b52',
          clinicName: 'Klinik Bedah',
          clinicIcon: 'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710741674/reservasi-rawat-jalan/icons/clinics/icon_surgeon_g2rtut.svg',
          createdAt: DateTime(2024 - 03 - 13),
          updatedAt: DateTime(2024 - 03 - 13)),
      ClinicModel(
          idClinic: 'c3870583-b9df-412d-879a-84a732545712',
          clinicName: 'Klinik Jantung',
          clinicIcon: 'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710741664/reservasi-rawat-jalan/icons/clinics/icon_heart_rwmszk.svg',
          createdAt: DateTime(2024 - 03 - 13),
          updatedAt: DateTime(2024 - 03 - 13)),
      ClinicModel(
          idClinic: '8a9a9887-76a2-443c-b618-2c73d8bc91d1',
          clinicName: 'Klinik Syaraf',
          clinicIcon: 'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710741669/reservasi-rawat-jalan/icons/clinics/icon_neuron_cxcluj.svg',
          createdAt: DateTime(2024 - 03 - 13),
          updatedAt: DateTime(2024 - 03 - 13)),
      ClinicModel(
          idClinic: '4a45c969-c1eb-4137-a9a0-f81977abf7a2',
          clinicName: 'Klinik Gigi',
          clinicIcon: 'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710741676/reservasi-rawat-jalan/icons/clinics/icon_teeth_zrf9rl.svg',
          createdAt: DateTime(2024 - 03 - 13),
          updatedAt: DateTime(2024 - 03 - 13)),
      ClinicModel(
          idClinic: '9dc3e22f-2fa2-4275-bd58-9fcf3bcbd802',
          clinicName: 'Klinik Kecantikan',
          clinicIcon: 'https://res.cloudinary.com/dr0pg1lxr/image/upload/v1710741670/reservasi-rawat-jalan/icons/clinics/icon_skincare_hoejig.svg',
          createdAt: DateTime(2024 - 03 - 13),
          updatedAt: DateTime(2024 - 03 - 13)),
    ]);
  }
}
