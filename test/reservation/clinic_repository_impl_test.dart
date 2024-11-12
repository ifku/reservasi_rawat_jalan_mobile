import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/data_sources/clinic_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/clinic_model.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/clinic_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/repositories/clinic_repository_impl.dart';

class MockClinicDataSource extends Mock implements ClinicDataSource {}

void main() {
  late MockClinicDataSource mockClinicDataSource;
  late ClinicRepository clinicRepository;

  setUp(() {
    mockClinicDataSource = MockClinicDataSource();
    clinicRepository = ClinicRepositoryImpl(mockClinicDataSource);
  });

  group('ClinicRepositoryImpl', () {
    final List<ClinicModel> mockClinics = [
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

    test('should return a list of clinics when the data source returns a success', () async {
      // Arrange
      when(() => mockClinicDataSource.getAllClinic())
          .thenAnswer((_) async => Right(mockClinics));

      // Act
      final result = await clinicRepository.getAllClinic();

      // Assert
      expect(result, equals(Right(mockClinics)));
      verify(() => mockClinicDataSource.getAllClinic()).called(1);
      verifyNoMoreInteractions(mockClinicDataSource);
    });

    test('should return an exception when the data source returns an error', () async {
      // Arrange
      const errorMessage = "Failed to fetch clinics";
      when(() => mockClinicDataSource.getAllClinic())
          .thenAnswer((_) async => Left(Exception(errorMessage)));

      // Act
      final result = await clinicRepository.getAllClinic();

      // Assert
      expect(result.isLeft(), true);
      expect(
        result.fold((l) => l, (r) => null),
        isA<Exception>(),
      );
      verify(() => mockClinicDataSource.getAllClinic()).called(1);
      verifyNoMoreInteractions(mockClinicDataSource);
    });

  });
}
