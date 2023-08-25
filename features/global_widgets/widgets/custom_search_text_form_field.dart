import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/app_assets.dart';

class CustomSearchTextFormField extends StatelessWidget {
  const CustomSearchTextFormField({
    required this.hintText,
    required this.labelText,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.maxLines,
    this.enabled = true,
    this.contentPadding,
    this.showSuffixIcon = false,
    this.onTap,
    this.onSuffixTap,
    this.obsecureSuffix = false,
    Key? key,
  }) : super(key: key);

  final String labelText;
  final bool obscureText;
  final String hintText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool enabled;
  final EdgeInsets? contentPadding;
  final bool showSuffixIcon;
  final bool obsecureSuffix;
  final Function()? onSuffixTap;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            enabled: enabled,
            obscureText: obscureText,
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            obscuringCharacter: '*',
            cursorHeight: 16.h,
            maxLines: maxLines,
            style: Theme.of(context).textTheme.bodyText1,
            decoration: InputDecoration(
              hintText: labelText,
              prefixIcon: const Icon(Icons.search),
              contentPadding: contentPadding,
              suffixIcon: showSuffixIcon
                  ? GestureDetector(
                      onTap: onSuffixTap,
                      child: obsecureSuffix
                          ? Icon(
                              obscureText
                                  ? Icons.visibility_off_rounded
                                  : Icons.remove_red_eye_rounded,
                              color: Theme.of(context).primaryColor,
                            )
                          : Transform.scale(
                              scale: 0.5,
                              child: SvgPicture.asset(AppAssets.editSvg),
                            ),
                    )
                  : null,
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
