import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeLight());

  bool isTheme= false;
  void changeTheme(bool changeTheme){
    isTheme = !isTheme;
    emit(AppThemeDark());
  }
}
