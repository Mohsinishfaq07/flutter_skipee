import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:skipee/features/panels/security_panel/presentation/manager/security_panel_view_model.dart';

import '../../../../../app/globals.dart';
import '../../../../global_widgets/widgets/continue_button.dart';
import '../../../../global_widgets/widgets/custom_text_form_field.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../../../../../utils/validators/text_field_validator.dart';
import '../../../../home/presentation/manager/home_view_model.dart';

class SecurityPanelContent extends StatefulWidget {
  const SecurityPanelContent({Key? key}) : super(key: key);

  @override
  State<SecurityPanelContent> createState() => _SecurityPanelContentState();
}

class _SecurityPanelContentState extends State<SecurityPanelContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  HomeViewModel get _homeViewModel => sl();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _homeViewModel.panelHeightNotifier.value = 555.h;
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 22.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(AppAssets.dragUpDownSvg),
                ),
                SizedBox(height: 22.h),
                ValueListenableBuilder<bool>(
                  valueListenable: context.read<SecurityPanelViewModel>().oldObsecureTextNotifier,
                  builder: (_, value, __) {
                    return CustomTextFormField(
                      maxLines: 1,
                      obscureText: value,
                      hintText: context.read<SecurityPanelViewModel>().oldPasswordHintText,
                      labelText: context.read<SecurityPanelViewModel>().oldPasswordLabelText,
                      controller: context.read<SecurityPanelViewModel>().oldPasswordController,
                      focusNode: context.read<SecurityPanelViewModel>().oldPasswordFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      validator: TextFieldValidator.validatePassword,
                      showSuffixIcon: true,
                      obsecureSuffix: true,
                      onSuffixTap: context.read<SecurityPanelViewModel>().changeOldObsecureText,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(context.read<SecurityPanelViewModel>().newPasswordFocusNode);
                      },
                    );
                  },
                ),
                SizedBox(height: 12.h),
                ValueListenableBuilder<bool>(
                  valueListenable: context.read<SecurityPanelViewModel>().newObsecureTextNotifier,
                  builder: (_, value, __) {
                    return CustomTextFormField(
                      maxLines: 1,
                      obscureText: value,
                      hintText: context.read<SecurityPanelViewModel>().newPasswordHintText,
                      labelText: context.read<SecurityPanelViewModel>().newPasswordLabelText,
                      controller: context.read<SecurityPanelViewModel>().newPasswordController,
                      focusNode: context.read<SecurityPanelViewModel>().newPasswordFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      validator: TextFieldValidator.validatePassword,
                      showSuffixIcon: true,
                      obsecureSuffix: true,
                      onSuffixTap: context.read<SecurityPanelViewModel>().changeNewObsecureText,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(context.read<SecurityPanelViewModel>().confirmPasswordFocusNode);
                      },
                    );
                  },
                ),
                SizedBox(height: 12.h),
                ValueListenableBuilder<bool>(
                  valueListenable: context.read<SecurityPanelViewModel>().confirmObsecureTextNotifier,
                  builder: (_, value, __) {
                    return CustomTextFormField(
                      maxLines: 1,
                      obscureText: value,
                      hintText: context.read<SecurityPanelViewModel>().confirmPasswordHintText,
                      labelText: context.read<SecurityPanelViewModel>().confirmPasswordLabelText,
                      controller: context.read<SecurityPanelViewModel>().confirmPasswordController,
                      focusNode: context.read<SecurityPanelViewModel>().confirmPasswordFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      showSuffixIcon: true,
                      obsecureSuffix: true,
                      onSuffixTap: context.read<SecurityPanelViewModel>().changeConfirmObsecureText,
                      validator: (value) {
                        return TextFieldValidator.validateConfirmPassword(value, context.read<SecurityPanelViewModel>().newPasswordController.text);
                      },
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    );
                  },
                ),
                SizedBox(height: 25.h),
                Align(
                  alignment: Alignment.center,
                  child: ContinueButtonWidget(
                    loadingNotifier: context.read<SecurityPanelViewModel>().isLoadingNotifier,
                    text: 'Update',
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                    },
                  ),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
