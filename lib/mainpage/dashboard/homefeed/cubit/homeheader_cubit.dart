import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homeheader_state.dart';

class HomeheaderCubit extends Cubit<HomeheaderState> {
  HomeheaderCubit() : super(HomeheaderInitial());

}
