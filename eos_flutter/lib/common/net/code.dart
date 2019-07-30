
import 'package:eos_flutter/common/event/http_error_event.dart';
import 'package:eos_flutter/common/event/index.dart';

class Code {
  ///网络错误
  static const NETWORK_ERROR = -1;
  static const SUCCESS = 200;

  static errorHandleFunction(code, message, noTip) {
    if (noTip) {
      return message;
    }
    eventBus.fire(new HttpErrorEvent(code, message));
    return message;
  }
}
