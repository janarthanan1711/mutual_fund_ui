part of 'loader_bloc.dart';

abstract class LoaderState {}

final class LoaderInitialState extends LoaderState {}

final class LoaderSuccessState extends LoaderState {
  final bool loginStatus;
  LoaderSuccessState({required this.loginStatus});
}
