import 'package:foap/helper/imports/common_import.dart';
import 'package:get/get.dart';

Widget backNavigationBar({required String title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        color: AppColorConstants.themeColor.withOpacity(0.4),
        child: Center(
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ).lP8.ripple(() {
            Get.back();
          }),
        ).p8,
      ).circular,
      BodyLargeText(title.tr, weight: TextWeight.medium),
      const SizedBox(
        width: 20,
      )
    ],
  ).setPadding(left: 16, right: 16, top: 8, bottom: 16);
}

Widget backNavigationBarWithIcon(
    {required ThemeIcon icon,
    required String title,
    required VoidCallback iconBtnClicked}) {
  return Stack(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            width: 35,
            color: AppColorConstants.themeColor,
            child: Center(
              child: const ThemeIconWidget(
                ThemeIcon.backArrow,
                size: 18,
                color: Colors.white,
              ).lP8.ripple(() {
                Get.back();
              }),
            ),
          ).circular,
          ThemeIconWidget(
            icon,
            size: 20,
            color: AppColorConstants.iconColor,
          ).ripple(() {
            iconBtnClicked();
          }),
        ],
      ),
      Positioned(
        left: 0,
        right: 0,
        child: Center(
          child: BodyLargeText(title.tr, weight: TextWeight.medium),
        ),
      ),
    ],
  ).setPadding(left: 16, right: 16, top: 8, bottom: 16);
}

Widget profileScreensNavigationBar(
    {required String title,
    String? rightBtnTitle,
    required VoidCallback completion}) {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ThemeIconWidget(
            ThemeIcon.backArrow,
            size: 18,
            color: AppColorConstants.iconColor,
          ).ripple(() {
            Get.back();
          }),
          if (rightBtnTitle != null)
            BodyLargeText(rightBtnTitle.tr, weight: TextWeight.medium)
                .ripple(() {
              completion();
            }),
        ],
      ).setPadding(left: 16, right: 16),
      Positioned(
        left: 0,
        right: 0,
        child: Center(
          child: BodyLargeText(title.tr, weight: TextWeight.medium),
        ),
      )
    ],
  ).bP16;
}

Widget titleNavigationBarWithIcon(
    {required String title,
    required ThemeIcon icon,
    required VoidCallback completion}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const SizedBox(
        width: 25,
      ),
      BodyLargeText(title.tr, weight: TextWeight.medium),
      ThemeIconWidget(
        icon,
        color: AppColorConstants.iconColor,
        size: 25,
      ).ripple(() {
        completion();
      }),
    ],
  ).setPadding(left: 16, right: 16, top: 8, bottom: 16);
}

Widget titleNavigationBar({
  required String title,
}) {
  return BodyLargeText(title.tr, weight: TextWeight.medium)
      .setPadding(left: 16, right: 16, top: 8, bottom: 16);
}
