

import 'package:logger/logger.dart';

class Log {

  static final Logger logger = Logger();

  static () {
    Logger.level = Level.all;
    logger.i("Current log level: ${Logger.level}");
  }
  
  static d(dynamic message) {
    logger.d(message);
  }

  static e(dynamic message) {
    logger.e(message);
  }

}