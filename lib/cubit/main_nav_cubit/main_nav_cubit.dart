import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_nav_state.dart';

class MainNavCubit extends Cubit<MainNavState> {
  MainNavCubit() : super(MainNavInitial());

  int index = 0;

  void changeNavTap(int index) {
    this.index = index;
    emit(ChangeNavTap(index));
  }
}
