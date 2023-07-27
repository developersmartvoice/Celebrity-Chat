import 'package:foap/helper/imports/common_import.dart';
import 'package:get/get.dart';
import 'package:foap/helper/imports/login_signup_imports.dart';

import '../../universal_components/rounded_input_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPasswordScreen> {
  TextEditingController email = TextEditingController();
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColorConstants.backgroundColor,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // const SizedBox(
            //   height: 70,
            // ),
            // const ThemeIconWidget(
            //   ThemeIcon.backArrow,
            //   size: 25,
            // ).ripple(() {
            //   Get.back();
            // }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Heading3Text(
              forgotPwdString.tr,
              textAlign: TextAlign.start,
              color: AppColorConstants.themeColor,
            ),
            Heading6Text(
              helpToGetAccountString.tr,
              weight: TextWeight.medium,
              textAlign: TextAlign.start,
            ).setPadding(top: 10, bottom: 80),
            addTextField(),

            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Heading5Text(
                loginAnotherAccountString.tr,
                weight: TextWeight.medium,
                textAlign: TextAlign.start,
              ).ripple(() {
                Get.back();
              }),
            ),
            const Spacer(),
            addSubmitBtn(),
            const SizedBox(
              height: 55,
            )
          ]),
        ).setPadding(left: 20, right: 20));
  }

  addTextField() {
    return InputField(
      showDivider: true,
      cornerRadius: 5,
      controller: email,
      hintText: enterEmailString.tr,
    );
  }

  addSubmitBtn() {
    return AppThemeButton(
      onPress: () {
        loginController.forgotPassword(email: email.text);
      },
      text: sendOTPString.tr,
    ).setPadding(top: 25);
  }
}
