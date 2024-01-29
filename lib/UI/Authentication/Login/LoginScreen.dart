import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:national_bonds_app/Components/CommonSize/CommonHeightWidth.dart';
import 'package:national_bonds_app/Components/CommonSize/CustomFontSize.dart';
import 'package:national_bonds_app/Components/CustomTextFormField.dart';
import 'package:national_bonds_app/Components/CustomThemeButton.dart';
import 'package:national_bonds_app/Localization/LanguageConstants.dart';
import 'package:national_bonds_app/UI/Authentication/Login/LoginController.dart';
import 'package:national_bonds_app/components/CustomRegularText.dart';
import '../../../Theme/Color/Colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.find();

  @override
  void initState() {
    loginController.setLanguage();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    loginController.userNameTC.text = "fSubB+/COd+59nC5pUCWlw==";
    loginController.passwordTC.text = "QRx1f1mtGuPTmoa17QVxVg==";
    return GetBuilder<LoginController>(
        id: 'login',
        init: LoginController(),
        builder: (login) {
          return Container(
            color: primaryColor,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: backgroundColor,
                body: myBody(login),
              ),
            ),
          );
        });
  }

  Widget myBody(LoginController login) {
    return SingleChildScrollView(
      child: Form(
        key: login.formKey,
        child: Column(
          children: [
            langaugeChangeBtn(login),
            headerText(login),
            formFieldWidget(login),
            loginBtn(login),
          ],
        ),
      ),
    );
  }

  Widget langaugeChangeBtn(LoginController login) {
    print('>>>print language>>third>>    ${login.languageSelected}');
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back_ios, color: iconColor),
          GestureDetector(
            onTap: () {
              login.changeLanguage(context: context);
            },
            child: CustomRegularText(
              fontSize: CustomFontSize.largeFont(),
              color: lightBlueColor,
              label: login.languageSelected,
            ),
          ),
          const Icon(Icons.close, color: iconColor),
        ],
      ),
    );
  }

  Widget headerText(LoginController login) {
    return Column(
      children: [
        SizedBox(
          height: AppDimensions.instance!.height / 6,
        ),
        CustomRegularText(
          fontSize: CustomFontSize.extraLargeFont(),
          label: getTranslated(context, 'login')?.toUpperCase() ?? 'LOGIN',
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
      ],
    );
  }

  Widget formFieldWidget(LoginController login) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.instance!.width / 40,
        vertical: AppDimensions.instance!.height / 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomRegularText(
            fontSize: CustomFontSize.regularFont(),
            label: getTranslated(context, 'userName') ?? 'User Name',
          ),
          SizedBox(
            height: AppDimensions.instance!.height / 90,
          ),
          CustomTextFormField(
            labelText: getTranslated(context, 'userName') ?? 'User Name',
            controller: login.userNameTC,
            alignLabelWithHint: true,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            maxLines: 1,
            textInputType: TextInputType.name,
            validator: (name) {
              if (name == null || name.isEmpty) {
                return 'Please enter user name';
              }
              return null;
            },
          ),
          SizedBox(
            height: AppDimensions.instance!.height / 50,
          ),
          CustomRegularText(
            fontSize: CustomFontSize.regularFont(),
            label: getTranslated(context, 'password') ?? 'Password',
          ),
          SizedBox(
            height: AppDimensions.instance!.height / 90,
          ),
          CustomTextFormField(
            controller: login.passwordTC,
            labelText: getTranslated(context, 'password') ?? 'Password',
            suffixIcon: GestureDetector(
                onTap: () {
                  login.isVisible1 = !login.isVisible1;
                  setState(() {});
                },
                child: Icon(
                  login.isVisible1 ? Icons.visibility : Icons.visibility_off,
                  color: skyBlueColor,
                )),
            obscureText: !login.isVisible1,
            maxLines: 1,
            validator: (PassCurrentValue) {
              RegExp regex = RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,15}$');
              var passNonNullValue = PassCurrentValue ?? "";
              if (passNonNullValue.isEmpty) {
                return ("Please enter password");
              }
              return null;
            },
          ),
          SizedBox(
            height: AppDimensions.instance!.height / 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomRegularText(
                label: getTranslated(context, 'forgotPassword') ??
                    'Forgot Password?',
                color: skyBlueColor,
              ),
            ],
          ),
          SizedBox(
            height: AppDimensions.instance!.height / 90,
          ),
        ],
      ),
    );
  }

  Widget loginBtn(LoginController login) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.instance!.width / 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomThemeButton(
            onPressed: () {
              if (login.formKey.currentState!.validate()) {
                login.formKey.currentState?.save();
                login.login(context: context);
              }
            },
            buttonText: getTranslated(context, 'login') ?? 'Login',
            color: skyBlueColor,
            fontColor: whiteColor,
            fontSize: 13,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            height: AppDimensions.instance!.height / 19,
            width: AppDimensions.instance!.width / 2.4,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
