import 'package:bloc/bloc.dart';
import 'package:mutual_fund_assignment/db/local_db.dart';

part 'loader_event.dart';
part 'loader_state.dart';

class LoaderBloc extends Bloc<LoaderEvent, LoaderState> {
  LoaderBloc() : super(LoaderInitialState()) {
    on<LoaderGetLocalDataEvent>(loadData);
  }

  Future<void> loadData(
    LoaderGetLocalDataEvent event,
    Emitter<LoaderState> emit,
  ) async {
    final loginStatus = await AppSharedPreference.getLoginStatus();
    emit(LoaderSuccessState(loginStatus: loginStatus));
  }
}
