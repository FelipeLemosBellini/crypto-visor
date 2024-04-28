import 'package:cryptovisor/core/service/api_rest/api_rest.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class DI {
  static final _getIt = GetIt.I;

  static void setupDependencies() {
    _getIt.registerFactory<ApiRest>(() => ApiRest());
    _getIt.registerFactory<DataAssetBloc>(() => DataAssetBloc());
  }
}
