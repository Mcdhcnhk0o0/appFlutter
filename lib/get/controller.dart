
import 'package:app_flutter/get/view.dart';
import 'package:get/get.dart';

// viewModel
abstract class BaseController extends GetxController {

}


mixin BasePageController<T extends BaseController> on BaseView<T> {

  BaseController get baseController;

}