import 'package:app_flutter/get/controller.dart';
import 'package:get/get.dart';

import 'view.dart';

// viewModelFactory
abstract class BaseBinding extends Bindings {

}


mixin BasePageBinding<T extends BaseController> on BaseView<T> {

  BaseBinding get binding;

}
