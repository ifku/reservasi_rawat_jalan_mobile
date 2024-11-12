import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/entities/clinic_entity.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/repositories/clinic_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/domain/use_cases/clinic/get_all_clinic_usecase.dart';

class MockClinicRepository extends Mock implements ClinicRepository {}

void main() {
  late MockClinicRepository mockClinicRepository;
  late GetAllClinicUseCase getAllClinicUseCase;

  setUp(() {
    mockClinicRepository = MockClinicRepository();
    getAllClinicUseCase = GetAllClinicUseCase(mockClinicRepository);
  });

  group('GetAllClinicUseCase', () {
    final clinicEntities = <ClinicEntity>[
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
      // Arrange
      when(() => mockClinicRepository.getAllClinic())
          .thenAnswer((_) async => Right(clinicEntities));

      // Act
      final result = await getAllClinicUseCase.call(null);

      // Assert
      expect(result, equals(Right(clinicEntities)));
      verify(() => mockClinicRepository.getAllClinic()).called(1);
      verifyNoMoreInteractions(mockClinicRepository);
    });

    test('should return an error when the repository call fails', () async {
      // Arrange
      const errorMessage = "Failed to fetch clinics";
      when(() => mockClinicRepository.getAllClinic())
          .thenAnswer((_) async => Left(Exception(errorMessage)));

      // Act
      final result = await getAllClinicUseCase.call(null);

      // Assert
      expect(result.isLeft(), true);
      expect(
        result.fold((l) => l, (r) => null),
        isA<Exception>(),
      );
      verify(() => mockClinicRepository.getAllClinic()).called(1);
      verifyNoMoreInteractions(mockClinicRepository);
    });
  });
}
