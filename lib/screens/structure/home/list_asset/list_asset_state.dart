import 'package:cryptovisor/core/entity/coin_model.dart';

class ListAssetState {
  List<CoinModel> listAssets = [];

  ListAssetState copyWith({
    List<CoinModel>? listAssets,
  }) {
    return ListAssetState()..listAssets = listAssets ?? this.listAssets;
  }
}
