import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Exception, String>> completeProfile(String email);
}
