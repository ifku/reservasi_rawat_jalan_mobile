import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reservasi_rawat_jalan_mobile/core/const/api_constants.dart';
import 'package:reservasi_rawat_jalan_mobile/core/network/http_client.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/remote/clinic_remote_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/clinic_model.dart';

class MockHttpClient extends Mock implements AppHttpClient {}

void main() {
  late MockHttpClient mockHttpClient;
  late ClinicRemoteDatasource clinicRemoteDatasource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    clinicRemoteDatasource = ClinicRemoteDatasource(mockHttpClient);

    registerFallbackValue(Uri.parse(ApiConstants.clinic));
  });

  group('ClinicRemoteDatasource', () {
    const mockApiResponse = {
      "message": "Get all clinic success",
      "data": [
        {
          "id_clinic": "178d4b7d-4170-4571-96a1-20d15a904cf6",
          "clinic_name": "Klinik Umum",
          "clinic_icon": "http://localhost:8090/storage/clinic_icon/17298645480.svg",
          "created_at": "2024-10-25T13:55:48.000000Z",
          "updated_at": "2024-10-25T13:55:48.000000Z"
        },
        {
          "id_clinic": "81f0439d-ef6f-4a82-9ce3-60dd014d724a",
          "clinic_name": "Penyakit Dalam",
          "clinic_icon": "http://localhost:8090/storage/clinic_icon/17298645481.svg",
          "created_at": "2024-10-25T13:55:48.000000Z",
          "updated_at": "2024-10-25T13:55:48.000000Z"
        }
      ],
      "isSuccess": true
    };

    final expectedClinics = [
      ClinicModel(
        idClinic: "178d4b7d-4170-4571-96a1-20d15a904cf6",
        clinicName: "Klinik Umum",
        clinicIcon: "http://localhost:8090/storage/clinic_icon/17298645480.svg",
        createdAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
        updatedAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
      ),
      ClinicModel(
        idClinic: "81f0439d-ef6f-4a82-9ce3-60dd014d724a",
        clinicName: "Penyakit Dalam",
        clinicIcon: "http://localhost:8090/storage/clinic_icon/17298645481.svg",
        createdAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
        updatedAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
      ),
    ];

    test('should return a list of clinics when the API call is successful', () async {
      // Arrange
      when(() => mockHttpClient.get(ApiConstants.clinic)).thenAnswer(
            (_) async => Right(mockApiResponse),
      );

      // Act
      final result = await clinicRemoteDatasource.getAllClinic();

      // Assert
      expect(result.fold((l) => l, (r) => r), expectedClinics);
      verify(() => mockHttpClient.get(ApiConstants.clinic)).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });

    test('should return an Exception when the API call fails', () async {
      // Arrange
      const mockErrorMessage = "Failed to fetch clinics";
      when(() => mockHttpClient.get(ApiConstants.clinic)).thenAnswer(
            (_) async => Left(Exception(mockErrorMessage)),
      );

      // Act
      final result = await clinicRemoteDatasource.getAllClinic();

      // Assert
      expect(result.isLeft(), true);
      expect(
        result.fold((l) => l, (r) => null),
        isA<Exception>(),
      );
      verify(() => mockHttpClient.get(ApiConstants.clinic)).called(1);
      verifyNoMoreInteractions(mockHttpClient);
    });
  });
}
