import 'package:app_flutter/get/binding.dart';
import 'package:app_flutter/get/controller.dart';
import 'package:get/get.dart';


abstract class BaseView<T extends BaseController> extends GetView<T> {
  const BaseView({super.key});
}

abstract class BindingView<T extends BaseController> extends BaseView<T>
    with BasePageBinding<T> {

  BindingView({super.key}) {
    binding.dependencies();
  }

  BaseBinding createBinding();

  @override
  BaseBinding get binding => createBinding();
}


abstract class ControllerView<T extends BaseController> extends BaseView<T>
    with BasePageController<T> {

  ControllerView({super.key}) {
    Get.lazyPut<T>(
        () => createController()
    );
  }

  T createController();

  @override
  BaseController get baseController => createController();


}
