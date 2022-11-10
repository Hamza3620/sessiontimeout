import 'package:flutter/cupertino.dart';
import 'package:sessiontimeout/base_page.dart';
import 'package:sessiontimeout/session_timer.dart';

mixin BasicPage<Page extends BasePage> on BaseState<Page> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => sessionTimer.userActivityDetected(),
      onDoubleTap: () => sessionTimer.userActivityDetected(),
      onScaleStart: (_) => sessionTimer.userActivityDetected(),
      child: rootWidget(context),
    );
  }

  Widget rootWidget(BuildContext context);
}
