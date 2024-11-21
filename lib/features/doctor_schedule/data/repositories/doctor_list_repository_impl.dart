import 'package:dartz/dartz.dart';
import 'package:reservasi_rawat_jalan_mobile/features/doctor_schedule/data/data_sources/doctor_list_datasource.dart';
import 'package:reservasi_rawat_jalan_mobile/features/doctor_schedule/domain/repositories/doctor_list_repository.dart';
import 'package:reservasi_rawat_jalan_mobile/features/reservation/data/models/doctor_model.dart';

class DoctorListRepositoryImpl implements DoctorListRepository {
  final DoctorListDataSource _doctorListDataSource;

  DoctorListRepositoryImpl(this._doctorListDataSource);
  @override
  Future<Either<Exception, List<DoctorModel>>> getAllDoctor({required int page}) async {
    try {
      final response = await _doctorListDataSource.getAllDoctor(page: page);
      return response;
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

}