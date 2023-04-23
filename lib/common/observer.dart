import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/view/common/info_snack_bar.dart';

class SampleBlocObserver extends BlocObserver {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  SampleBlocObserver({required this.scaffoldMessengerKey});

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    String message = error.toString();

    if (error is DioError) {
      message = error.response != null ? '${error.response!.statusCode} ${error.response!.data}' : error.message;
    }

    scaffoldMessengerKey.currentState?.showSnackBar(InfoSnackBar(message: message));
    super.onError(bloc, error, stackTrace);
  }
}
