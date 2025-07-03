import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:injectable/injectable.dart';
import 'package:point_of_sale/src/core/style/app_color.dart';

@lazySingleton
class LoaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: isDarkMode
                ? AppColor.lightBackground.withValues(alpha: 0.5)
                : AppColor.primary.withValues(alpha: 0.5),
          ),
        );
      },
    );
  }
}
