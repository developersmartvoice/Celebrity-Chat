import 'package:foap/helper/imports/common_import.dart';
import 'package:get/get.dart';
import 'package:foap/helper/imports/login_signup_imports.dart';

import '../../universal_components/rounded_input_field.dart';
import '../../universal_components/rounded_password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final LoginController controller = Get.find();

  bool showPassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConstants.backgroundColor,
      body: SingleChildScrollView(
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Heading3Text(welcomeString.tr,
                        weight: TextWeight.bold),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Heading3Text(signInMessageString.tr,
                        weight: TextWeight.medium),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    InputField(
                      controller: email,
                      showDivider: true,
                      hintText: emailOrUsernameString.tr,
                      cornerRadius: 5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    PasswordField(
                      onChanged: (value) {},
                      showDivider: true,
                      controller: password,
                      cornerRadius: 5,
                      hintText: passwordString.tr,
                      showRevealPasswordIcon: true,
                      textStyle: TextStyle(
                          fontSize: FontSizes.h6,
                          color: AppColorConstants.themeColor),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    addLoginBtn(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => const ForgotPasswordScreen());
                      },
                      child: Center(
                        child: BodyMediumText(
                          forgotPwdString.tr,
                          weight: TextWeight.bold,
                          color: AppColorConstants.themeColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.37,
                          color: AppColorConstants.themeColor,
                        ),
                        Heading6Text(
                          orString.tr,
                        ),
                        Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.37,
                          color: AppColorConstants.themeColor,
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    const SocialLogin(hidePhoneLogin: false).setPadding(left: 65, right: 65),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Heading6Text(
                          dontHaveAccountString.tr,
                        ),
                        Heading6Text(
                          signUpString.tr,
                          weight: TextWeight.medium,
                          color: AppColorConstants.themeColor,
                        ).ripple(() {
                          Get.to(() => const SignUpScreen());
                        }),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    // bioMetricView(),
                    // const Spacer(),
                  ]),
            )).setPadding(left: 25, right: 25),
      ),
    );
  }

  Widget addLoginBtn() {
    return AppThemeButton(
      onPress: () {
        controller.login(email.text.trim(), password.text.trim());
      },
      text: signInString.tr,
    );
  }
}
