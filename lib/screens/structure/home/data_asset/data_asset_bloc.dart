import 'dart:math';

import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/crypto_data/bollinger_bands_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/moving_average_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/relative_strength_index_model.dart';
import 'package:cryptovisor/core/entity/response/response_data_crypto_and_bar_chart_model.dart';
import 'package:cryptovisor/core/repositories/data_crypto/data_crypto_repository.dart';
import 'package:cryptovisor/core/repositories/data_crypto/interfaces/data_crypto_interface.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DataAssetBloc extends Cubit<DataAssetState> {
  final IDataCryptoRepository dataCryptoRepository;

  DataAssetBloc({required this.dataCryptoRepository}) : super(DataAssetState());

  void setNewTimer(int? newValue) {
    if (newValue != null) {
      emit(state.copyWith(selectedValue: newValue, amountCandles: newValue * 6));
    }
  }

  void setValueBollinger(bool? value) {
    emit(state.copyWith(showBollinger: value!));
  }

  void setValueMovingAverage8(bool? value) {
    emit(state.copyWith(showMovingAverage8: value!));
  }

  void setValueMovingAverage14(bool? value) {
    emit(state.copyWith(showMovingAverage14: value!));
  }

  void setValueMovingAverage30(bool? value) {
    emit(state.copyWith(showMovingAverage30: value!));
  }

  List<T> subListaFinalGenerica<T>(List<T> listaCompleta, int quantidade) {
    if (listaCompleta.isEmpty) return [];
    if (quantidade > listaCompleta.length) {
      // throw Exception('Quantidade excede o tamanho da lista.');
    }

    int startIndex = listaCompleta.length - quantidade;
    if (startIndex < 0) {
      startIndex = 0;
    }

    return listaCompleta.skip(startIndex).take(quantidade).toList();
  }
}
