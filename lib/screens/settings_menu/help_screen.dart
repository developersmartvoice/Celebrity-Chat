import 'package:foap/screens/settings_menu/support_requests_screen.dart';
import 'package:get/get.dart';
import 'package:foap/helper/imports/common_import.dart';
import '../../universal_components/rounded_input_field.dart';
import 'help_support_contorller.dart';
import 'package:get/get.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  HelpSupportController helpSupportContorller = Get.find();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorConstants.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            backNavigationBarWithIcon(

                title: helpString.tr,
                icon: ThemeIcon.card,
                iconBtnClicked: () {
                  Get.to(() => const SupportRequestsScreen());
                }),
            divider().tP8,
            SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    InputField(
                      controller: nameController,
                      showBorder: true,
                      showDivider: false,
                      hintText: nameString.tr,
                      cornerRadius: 5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    InputField(
                      controller: emailController,
                      showBorder: true,
                      showDivider: false,
                      hintText: emailString.tr,
                      cornerRadius: 5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    InputField(
                      controller: phoneController,
                      showBorder: true,
                      showDivider: false,
                      hintText: phoneNumberString.tr,
                      cornerRadius: 5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    InputField(
                      controller: messageController,
                      maxLines: 5,
                      showBorder: true,
                      showDivider: false,
                      hintText: messageString.tr,
                      cornerRadius: 5,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    _submitBtn(),
                  ],
                ).extended,
              ),
            ).p25
          ],
        ),
      ),
    );
  }

  Widget _submitBtn() {
    return AppThemeButton(
      onPress: () {
        helpSupportContorller.submitSupportRequest(
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            message: messageController.text);
      },
      text: submitString.tr,
    );
  }
}
