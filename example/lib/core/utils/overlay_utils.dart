import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/extensions/context_extensions.dart';
import '../config/extensions/widget_extensions.dart';
import '../resources/dimensions_manager.dart';

class OverlayUtils {
  static void showCustomDialog(
    BuildContext context, {
    required Widget child,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierDismissible: barrierDismissible,
      builder: (context) => child,
    );
  }

  static void showBottomSheet(BuildContext context, {required Widget child}) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s14.r)),
              ),
              child:
                  child.setContainerToView(width: context.width()).paddingVertical(AppSize.s20.h),
            ),
          ],
        );
      },
    );
  }
}
