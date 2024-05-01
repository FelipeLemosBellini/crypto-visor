import 'package:cryptovisor/core/repositories/data_crypto/data_crypto_repository.dart';
import 'package:cryptovisor/core/repositories/data_crypto/interfaces/data_crypto_interface.dart';
import 'package:cryptovisor/core/service/api_rest/api_rest.dart';
import 'package:cryptovisor/core/service/api_rest/interfaces/api_rest_interface.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_bloc.dart';
import 'package:cryptovisor/screens/structure/home/list_asset/list_asset_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class DI {
  static final _getIt = GetIt.I;

  static void setupDependencies() {
    //services and repositories
    _getIt.registerLazySingleton<IApiRest>(() => ApiRest());
    _getIt.registerLazySingleton<DataCryptoRepository>(() => DataCryptoRepository());

    //controller of pages
    _getIt.registerFactory<DataAssetBloc>(() => DataAssetBloc());
    _getIt.registerFactory<ListAssetBloc>(() => ListAssetBloc());
  }
}
