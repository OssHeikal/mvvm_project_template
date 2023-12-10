// Widget Extensions
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/dimensions_manager.dart';
import '../router/page_transition.dart';
import 'context_extensions.dart';

const double pi = 3.1415926535897932;

Duration transitionDuration = const Duration(milliseconds: 300);

const double degrees2Radians = pi / 180.0;

double radians(double degrees) => degrees * degrees2Radians;

extension WidgetExtension on Widget {
  // build page route for GoRouter
  Page<dynamic> buildPage({PageTransitions? transition, Duration? duration}) {
    return customTransitionPage(this, transition, duration);
  }

  SliverToBoxAdapter toSliver() => SliverToBoxAdapter(child: this);

  /// With custom height and width
  SizedBox withSize({double width = 0.0, double height = 0.0}) {
    return SizedBox(height: height, width: width, child: this);
  }

  Widget setHero({String? heroKey}) {
    if (heroKey == null) return this;
    return Hero(tag: heroKey, child: this);
  }

  Widget setAnimatedContainer({Duration? duration, double? width, double? hight}) {
    return AnimatedContainer(
        width: width,
        height: hight,
        duration: duration ?? const Duration(seconds: 5),
        curve: Curves.fastOutSlowIn,
        child: this);
  }

  /// set container to view
  Container setContainerToView({
    double? height,
    double? width,
    double? margin,
    double? padding,
    double? radius,
    Color? color,
    Color? borderColor,
    AlignmentGeometry? alignment,
  }) {
    return Container(
      alignment: alignment,
      height: height,
      width: width,
      margin: EdgeInsets.all(margin ?? 0),
      padding: EdgeInsets.all(padding ?? AppSize.s5.r),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: borderColor != null
              ? BorderSide(color: borderColor, width: AppSize.s1.w)
              : BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? AppSize.s10.r),
          ),
        ),
      ),
      child: this,
    );
  }

  ClipRRect asGlass({
    double? height,
    double? width,
    double radius = AppSize.s16,
    bool hasBorder = true,
    double padding = AppSize.s0,
    Color? color,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
        child: Container(
          height: height ?? AppSize.s60.h,
          width: width,
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: color ?? Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(radius.r),
            border: hasBorder
                ? Border.all(
                    color: color ?? Colors.white.withOpacity(0.6),
                    width: AppSize.s1.w,
                  )
                : null,
          ),
          child: this,
        ),
      ),
    );
  }

  Widget setTitleText(
    BuildContext context, {
    String? title,
    Widget? titleIcon,
    TextStyle? titleStyle,
    double gap = AppSize.s8,
    double titlePadding = AppSize.s0,
  }) {
    return title != null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  title,
                  style: titleStyle ?? context.textTheme.bodyLarge,
                ).paddingHorizontal(titlePadding),
                titleIcon ?? const SizedBox.shrink()
              ]),
              gap.h.verticalSpace,
              this
            ],
          )
        : this;
  }

  /// With custom width
  SizedBox withWidth(double width) => SizedBox(width: width, child: this);

  /// With custom height
  SizedBox withHeight(double height) => SizedBox(height: height, child: this);

  /// return padding top
  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// return padding left
  Padding paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  /// return padding Directional
  Padding paddingStart(double start) {
    return Padding(padding: EdgeInsetsDirectional.only(start: start), child: this);
  }

  Padding paddingEnd(double end) {
    return Padding(padding: EdgeInsetsDirectional.only(end: end), child: this);
  }

  /// return padding right
  Padding paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  /// return padding Symmetric
  Padding paddingSymmetric({double vertical = 0, double horizontal = 0}) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal), child: this);
  }

  Padding paddingVertical(double padding) {
    return Padding(padding: EdgeInsets.symmetric(vertical: padding), child: this);
  }

  Padding paddingHorizontal(double padding) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: this);
  }

  /// return custom padding from each side
  Padding paddingOnly({
    double top = 0.0,
    double left = 0.0,
    double bottom = 0.0,
    double right = 0.0,
  }) {
    return Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);
  }

  Padding paddingDirectionalOnly({
    double top = 0.0,
    double start = 0.0,
    double bottom = 0.0,
    double end = 0.0,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: top, bottom: bottom, start: start, end: end),
      child: this,
    );
  }

  Padding paddingDirectionalAll({double padding = 0}) {
    return Padding(padding: EdgeInsetsDirectional.all(padding), child: this);
  }

  /// set visibility
  Widget visible(bool visible, {Widget? defaultWidget}) {
    return visible ? this : (defaultWidget ?? const SizedBox());
  }

  /// add custom corner radius each side
  ClipRRect cornerRadiusWithClipRRectOnly({
    int bottomLeft = 0,
    int bottomRight = 0,
    int topLeft = 0,
    int topRight = 0,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft.toDouble()),
        bottomRight: Radius.circular(bottomRight.toDouble()),
        topLeft: Radius.circular(topLeft.toDouble()),
        topRight: Radius.circular(topRight.toDouble()),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  /// add corner radius
  ClipRRect cornerRadiusWithClipRRect(double radius) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: this,
    );
  }

  /// add opacity to parent widget
  Widget opacity({
    required double opacity,
    int durationInSecond = 1,
    Duration? duration,
  }) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration ?? const Duration(milliseconds: 500),
      child: this,
    );
  }

  /// add rotation to parent widget
  Widget rotate({
    required double angle,
    bool transformHitTests = true,
    Offset? origin,
  }) {
    return Transform.rotate(
      origin: origin,
      angle: angle * math.pi / 180,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  ///scrollable
  Widget scrollable() {
    return SingleChildScrollView(physics: const AlwaysScrollableScrollPhysics(), child: this);
  }

  /// add scaling to parent widget
  Widget scale({
    required double scale,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
  }) {
    return Transform.scale(
      scale: scale,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// add translate to parent widget
  Widget translate({
    required Offset offset,
    bool transformHitTests = true,
    Key? key,
  }) {
    return Transform.translate(
      offset: offset,
      transformHitTests: transformHitTests,
      key: key,
      child: this,
    );
  }

  /// set parent widget in center
  Widget center({double? heightFactor, double? widthFactor}) {
    return Center(
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: this,
    );
  }

  /// add tap to parent widget
  Widget onTap(
    Function? function, {
    BorderRadius? borderRadius,
    Color? splashColor,
    Color? hoverColor,
    Color? highlightColor,
  }) {
    return InkWell(
      onTap: function as void Function()?,
      splashColor: splashColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      borderRadius: borderRadius,
      child: this,
    );
  }

  /// Wrap with ShaderMask widget
  Widget withShaderMask(
    List<Color> colors, {
    BlendMode blendMode = BlendMode.srcATop,
  }) {
    return withShaderMaskGradient(LinearGradient(colors: colors), blendMode: blendMode);
  }

  /// Wrap with ShaderMask widget Gradient
  Widget withShaderMaskGradient(
    Gradient gradient, {
    BlendMode blendMode = BlendMode.srcATop,
  }) {
    return ShaderMask(
      shaderCallback: (rect) => gradient.createShader(rect),
      blendMode: blendMode,
      child: this,
    );
  }

  /// add Expanded to parent widget
  Widget expand({flex = 1}) => Expanded(flex: flex, child: this);

  /// add Flexible to parent widget
  Widget flexible({flex = 1, FlexFit? fit, bool buildWhen = true}) {
    return buildWhen ? Flexible(flex: flex, fit: fit ?? FlexFit.loose, child: this) : this;
  }

  /// add FittedBox to parent widget
  Widget fit({BoxFit? fit, AlignmentGeometry? alignment}) {
    return FittedBox(
      fit: fit ?? BoxFit.contain,
      alignment: alignment ?? Alignment.center,
      child: this,
    );
  }

  /// Validate given widget is not null and returns given value if null.
  Widget validate({Widget value = const SizedBox()}) => this;

  Widget showWidgetWhen({bool value = false}) => value ? this : const SizedBox();

  /// Validate given widget is not null and returns given value if null.
  Widget withTooltip({required String msg}) {
    return Tooltip(message: msg, child: this);
  }

  /// Validate given widget is not null and returns given value if null.
  Widget animationSwitch() {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: this);
  }

  /// Make your any widget refreshable with RefreshIndicator on top
  Widget get makeRefreshable => Stack(children: [ListView(), this]);
}
