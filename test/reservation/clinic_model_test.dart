import 'package:flutter_test/flutter_test.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/clinic_model.dart';

void main() {
  const mockJson = {
    "id_clinic": "178d4b7d-4170-4571-96a1-20d15a904cf6",
    "clinic_name": "Klinik Umum",
    "clinic_icon": "http://localhost:8090/storage/clinic_icon/17298645480.svg",
    "created_at": "2024-10-25T13:55:48.000Z",
    "updated_at": "2024-10-25T13:55:48.000Z"
  };

  group('ClinicModel', () {
    test('should correctly parse from JSON', () {
      // Act
      final clinicModel = ClinicModel.fromJson(mockJson);

      // Assert
      expect(clinicModel.idClinic, "178d4b7d-4170-4571-96a1-20d15a904cf6");
      expect(clinicModel.clinicName, "Klinik Umum");
      expect(clinicModel.clinicIcon, "http://localhost:8090/storage/clinic_icon/17298645480.svg");
      expect(clinicModel.createdAt, DateTime.parse("2024-10-25T13:55:48.000Z"));
      expect(clinicModel.updatedAt, DateTime.parse("2024-10-25T13:55:48.000Z"));
    });

    test('should correctly convert to JSON', () {
      // Arrange
      final clinicModel = ClinicModel(
        idClinic: "178d4b7d-4170-4571-96a1-20d15a904cf6",
        clinicName: "Klinik Umum",
        clinicIcon: "http://localhost:8090/storage/clinic_icon/17298645480.svg",
        createdAt: DateTime.parse("2024-10-25T13:55:48.000Z"),
        updatedAt: DateTime.parse("2024-10-25T13:55:48.000Z"),
      );

      // Act
      final json = clinicModel.toJson();

      // Assert
      expect(json, {
        "id_clinic": "178d4b7d-4170-4571-96a1-20d15a904cf6",
        "clinic_name": "Klinik Umum",
        "clinic_icon": "http://localhost:8090/storage/clinic_icon/17298645480.svg",
        "created_at": "2024-10-25T13:55:48.000Z",
        "updated_at": "2024-10-25T13:55:48.000Z"
      });
    });
  });
}
