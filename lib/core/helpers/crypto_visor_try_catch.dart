import 'package:dartz/dartz.dart';
import 'package:cryptovisor/core/exception/crypto_visor_exception.dart';

Future<Either<CryptoExceptionException, T>> executeWithCatch<T>(Future Function() func) async {
  try {
    return Right(await func.call());
  } on Exception catch (error) {
    return Left(CryptoExceptionException(error: "Houve um erro, tente novamente"));
  }
}
