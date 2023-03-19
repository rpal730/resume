import 'package:get_it/get_it.dart';
import 'package:resume/screens/homepage/viewmodels/homepage_viewmodel.dart';
import 'package:resume/screens/login/view_models/login_viewmodel.dart';
import 'package:resume/screens/splash/view_models/splash_screen_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<SplashScreenViewModel>(
      () => SplashScreenViewModel());
  locator.registerLazySingleton<LoginScreenViewModel>(
      () => LoginScreenViewModel());
  locator.registerLazySingleton<HomepageViewModel>(() => HomepageViewModel());
}
