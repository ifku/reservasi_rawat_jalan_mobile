/*
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reservasi_rawat_jalan_mobile/core/injection/locator.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/clinic_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/clinic_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/clinic/get_all_clinic_usecase.dart';

// Mock class for ClinicRepository
class MockClinicRepository extends Mock implements ClinicRepository {}

void main() {
  late MockClinicRepository mockClinicRepository;
  late GetAllClinicUseCase getAllClinicUseCase;

  setUp(() {
    // Initialize mock repository and use case
    mockClinicRepository = MockClinicRepository();
    getAllClinicUseCase = GetAllClinicUseCase();

    // Register the mock in the locator
    locator.registerFactory<ClinicRepository>(() => mockClinicRepository);
  });

  tearDown(() {
    // Reset the locator
    locator.reset();
  });

  group('GetAllClinicUseCase', () {
    // Example data matching your clinic entity structure
    final List<ClinicEntity> testClinics = [
      ClinicEntity(
        idClinic: "178d4b7d-4170-4571-96a1-20d15a904cf6",
        clinicName: "Klinik Umum",
        clinicIcon: "http://localhost:8090/storage/clinic_icon/17298645480.svg",
        createdAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
        updatedAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
      ),
      ClinicEntity(
        idClinic: "81f0439d-ef6f-4a82-9ce3-60dd014d724a",
        clinicName: "Penyakit Dalam",
        clinicIcon: "http://localhost:8090/storage/clinic_icon/17298645481.svg",
        createdAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
        updatedAt: DateTime.parse("2024-10-25T13:55:48.000000Z"),
      ),
    ];

    test(
        'should return a list of clinics when the repository call is successful',
        () async {
      // Arrange: Mock the repository to return a list of clinics
      when(() => mockClinicRepository.getAllClinic())
          .thenAnswer((_) async => Right(testClinics));

      // Act: Call the use case
      final result = await getAllClinicUseCase.call(null);

      // Assert: Verify the result and interactions
      expect(result, Right(testClinics));
      verify(() => mockClinicRepository.getAllClinic()).called(1);
      verifyNoMoreInteractions(mockClinicRepository);
    });

    test('should return an exception when the repository call fails', () async {
      // Arrange: Mock the repository to return an exception
      final exception = Exception("Failed to fetch clinics");
      when(() => mockClinicRepository.getAllClinic())
          .thenAnswer((_) async => Left(exception));

      // Act: Call the use case
      final result = await getAllClinicUseCase.call(null);

      // Assert: Verify the result and interactions
      expect(result, Left(exception));
      verify(() => mockClinicRepository.getAllClinic()).called(1);
      verifyNoMoreInteractions(mockClinicRepository);
    });
  });
}
*/
