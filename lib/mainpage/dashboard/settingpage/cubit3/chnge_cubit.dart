import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<int> {
  ProfileCubit() : super(0); // default = grid tab

  void setTab(int index) => emit(index);
}
