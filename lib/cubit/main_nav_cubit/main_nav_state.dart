part of 'main_nav_cubit.dart';

abstract class MainNavState extends Equatable {
  const MainNavState();
}

class MainNavInitial extends MainNavState {
  @override
  List<Object> get props => [];
}

class ChangeNavTap extends MainNavState {
  final int index;
  const ChangeNavTap(this.index);
  @override
  List<Object> get props => [index];
}
