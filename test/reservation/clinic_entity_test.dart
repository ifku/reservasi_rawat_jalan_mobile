import 'package:flutter_test/flutter_test.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/clinic_entity.dart';

void main() {
  group('ClinicEntity', () {
    // Remove 'const' keyword here to allow runtime initialization
    final clinicEntity1 = ClinicEntity(
      idClinic: "178d4b7d-4170-4571-96a1-20d15a904cf6",
      clinicName: "Klinik Umum",
      clinicIcon: "http://localhost:8090/storage/clinic_icon/17298645480.svg",
      createdAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
      updatedAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
    );

    final clinicEntity2 = ClinicEntity(
      idClinic: "178d4b7d-4170-4571-96a1-20d15a904cf6",
      clinicName: "Klinik Umum",
      clinicIcon: "http://localhost:8090/storage/clinic_icon/17298645480.svg",
      createdAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
      updatedAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
    );

    final clinicEntity3 = ClinicEntity(
      idClinic: "81f0439d-ef6f-4a82-9ce3-60dd014d724a",
      clinicName: "Penyakit Dalam",
      clinicIcon: "http://localhost:8090/storage/clinic_icon/17298645481.svg",
      createdAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
      updatedAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
    );

    test('should be equal when all properties are the same', () {
      // Act & Assert
      expect(clinicEntity1, equals(clinicEntity2));
    });

    test('should not be equal when idClinic is different', () {
      // Act & Assert
      expect(clinicEntity1, isNot(equals(clinicEntity3)));
    });

    test('should not be equal when clinicName is different', () {
      // Act & Assert
      expect(clinicEntity1, isNot(equals(clinicEntity3)));
    });

    test('should have correct props for equality comparison', () {
      // Act & Assert
      expect(clinicEntity1.props, [
        clinicEntity1.idClinic,
        clinicEntity1.clinicName,
        clinicEntity1.clinicIcon,
        clinicEntity1.createdAt,
        clinicEntity1.updatedAt
      ]);
    });
  });
}
