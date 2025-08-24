import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());
  int naviterbottom = 1;

  set(int value) {
    naviterbottom = value;
    emit(DashboardInitial());
  }
}
