
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../data/repositories/settings_repository_impl.dart';
import '../domain/usecases/settings_usecase.dart';
import '../presentation/controllers/home_view_controller.dart';
import '../presentation/events/home_events.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewController>(
          () => HomeViewController(
        homeEvents: HomeEvents(
          settingsUseCase: SettingsUseCase(
            settingsRepository: SettingsRepositoryImpl(),
          ),
        ),
      ),
    );
    Get.find<HomeViewController>();
  }
}
