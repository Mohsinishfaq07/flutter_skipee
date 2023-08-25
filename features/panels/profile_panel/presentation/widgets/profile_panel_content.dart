import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:skipee/features/panels/profile_panel/presentation/manager/profile_panel_view_model.dart';
import 'package:skipee/features/panels/security_panel/presentation/pages/security_panel.dart';
import '../../../../../app/globals.dart';
import '../../../../global_widgets/widgets/continue_button.dart';
import '../../../../global_widgets/widgets/custom_text_form_field.dart';
import '../../../../../utils/constants/app_assets.dart';
import '../../../../../utils/validators/text_field_validator.dart';
import '../../../../home/presentation/pages/select_image_bottom_sheet.dart';
import '../../../../home/presentation/manager/home_view_model.dart';

class ProfilePanelContent extends StatefulWidget {
  const ProfilePanelContent({Key? key}) : super(key: key);

  @override
  State<ProfilePanelContent> createState() => _ProfilePanelContentState();
}

class _ProfilePanelContentState extends State<ProfilePanelContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  HomeViewModel get _homeViewModel => sl();

  @override
  void initState() {
    context.read<ProfilePanelViewModel>().imageFile.value = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _homeViewModel.panelHeightNotifier.value = 730.h;
        return true;
      },
      child: Scaffold(

        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 22.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppAssets.dragUpDownSvg),
                  SizedBox(height: 22.h),
                  SimpleShadow(
                    opacity: 0.6,
                    color: Colors.black12,
                    offset: const Offset(0, 0),
                    sigma: 10,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ValueListenableBuilder<File?>(
                          valueListenable: context
                              .read<ProfilePanelViewModel>()
                              .imageFile,
                          builder: (_, file, __) {
                            return CircleAvatar(
                              radius: 45.r,
                              backgroundColor:
                                  Colors.grey.withOpacity(0.31),
                              backgroundImage: context
                                  .read<ProfilePanelViewModel>()
                                  .getUpdateImageProvider(context, file),
                            );
                          },
                        ),
                        GestureDetector(
                          onTap: () async {
                            SelectImageBottomSheet bottomSheet =
                                SelectImageBottomSheet(context: context);
                            bottomSheet.show();
                          },
                          child: Container(
                            height: 30.w,
                            width: 30.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(Icons.photo_camera_rounded,
                                size: 20.w),
                          ),
                        ),
                      ],
                    ),
                  ),

                  CustomTextFormField(
                    maxLines: 1,
                    hintText:
                        context.read<ProfilePanelViewModel>().fullNameHintText,
                    labelText:
                        context.read<ProfilePanelViewModel>().fullNameLabelText,
                    controller: context
                        .read<ProfilePanelViewModel>()
                        .fullNameController,
                    focusNode:
                        context.read<ProfilePanelViewModel>().fullNameFocusNode,
                    keyboardType: TextInputType.name,
                    validator: TextFieldValidator.validateName,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(context
                          .read<ProfilePanelViewModel>()
                          .phoneNumberFocusNode);
                    },
                  ),
                  SizedBox(height: 12.h),
                  CustomTextFormField(
                    maxLines: 1,
                    hintText: context
                        .read<ProfilePanelViewModel>()
                        .phoneNumberHintText,
                    labelText: context
                        .read<ProfilePanelViewModel>()
                        .phoneNumberLabelText,
                    controller: context
                        .read<ProfilePanelViewModel>()
                        .phoneNumberController,
                    focusNode: context
                        .read<ProfilePanelViewModel>()
                        .phoneNumberFocusNode,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.phone,
                    validator: TextFieldValidator.validatePhone,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(
                          context.read<ProfilePanelViewModel>().emailFocusNode);
                    },
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 12.h,bottom: 12.h),
                    child: CustomTextFormField(
                      maxLines: 1,
                      hintText:
                          context.read<ProfilePanelViewModel>().emailHintText,
                      labelText:
                          context.read<ProfilePanelViewModel>().emailLabelText,
                      controller:
                          context.read<ProfilePanelViewModel>().emailController,
                      focusNode:
                          context.read<ProfilePanelViewModel>().emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      validator: TextFieldValidator.validateEmail,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                  ),
                  CustomTextFormField(
                    maxLines: 1,
                    obscureText: true,
                    enabled: false,
                    showSuffixIcon: true,
                    hintText:
                        context.read<ProfilePanelViewModel>().passwordHintText,
                    labelText:
                        context.read<ProfilePanelViewModel>().passwordLabelText,
                    onTap: () {
                      Navigator.of(context).pushNamed(SecurityPanel.routeName);
                      _homeViewModel.panelHeightNotifier.value = 385.h;
                    },
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 25.h,),
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 200.w,
                        child: ContinueButtonWidget(
                          loadingNotifier: context
                              .read<ProfilePanelViewModel>()
                              .isProfileUpdateLoading,
                          text: 'Save',
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            context.read<ProfilePanelViewModel>().updateProfile();
                          },
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
