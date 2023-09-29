import 'package:bloc/bloc.dart';
import 'package:trial_bloc/dashboard/dashboard_event.dart';
import 'package:trial_bloc/dashboard/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(InitialState()) {
    on<ChangeIcon>((event, emit) {
   emit(OnNavigateScreen());
    });





  }
}
