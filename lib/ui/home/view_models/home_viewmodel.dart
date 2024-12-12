import 'package:bloc/bloc.dart';
import '../widgets/home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController()
      : super(
          HomeState(isLoading: true, darkModeOn: false, active: false),
        ) {
    Future.delayed(
      const Duration(seconds: 2),
    ).then((_) {
      emit(HomeState(
          isLoading: false, darkModeOn: state.darkModeOn, active: false));
    });
  }

  void changeTheme() => emit(state.copyWith(darkModeOn: !state.darkModeOn));

  void activeToogle() => emit(state.copyWith(active: !state.active));

}
