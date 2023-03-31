// ignore_for_file: avoid_print
import 'dart:developer';
import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    log('{$bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log("Error: $error");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Transition: $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onCreate(BlocBase bloc) {
    log("$bloc is Created", name: "BLOC");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log("$bloc is Closed", name: "BLOC");
    super.onClose(bloc);
  }
}
