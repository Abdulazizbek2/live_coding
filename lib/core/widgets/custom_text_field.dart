import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? helper;
  final String? prefixText;
  final double? paddingTop;
  final double? paddingBottom;
  final bool isRequired;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final int? labelMaxLines;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputFormatter? inputFormatter;
  final void Function()? onTap;
  final void Function(String? value)? onChanged;
  final String? Function(String? value)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool obscureText;
  final String obscuringCharacter;
  final BorderRadius? borderRadius;
  final TextStyle? style;
  final TextStyle? hintTextStyle;
  final String? errorText;
  final bool autofocus;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.helper,
    this.prefixText,
    this.paddingTop,
    this.paddingBottom,
    this.isRequired = true,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.labelMaxLines,
    this.controller,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType,
    this.textInputAction,
    this.inputFormatters,
    this.inputFormatter,
    this.onTap,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.borderRadius,
    this.style,
    this.hintTextStyle,
    this.errorText,
    this.autofocus = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (widget.paddingTop != null) SizedBox(height: widget.paddingTop),
          if (widget.label != null) ...[
            // CustomText(
            //   widget.label!,
            //   style: TextStyle(
            //       color: context.color(AppColors.c080A15, AppColors.white),
            //       fontSize: 14,
            //       fontWeight: FontWeight.w600),
            // ),
            const SizedBox(height: 4),
          ],
          TextFormField(
            autofocus: widget.autofocus,
            textCapitalization: widget.textCapitalization,
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            onEditingComplete: widget.onEditingComplete,
            validator: widget.validator,
            controller: widget.controller,
            focusNode: widget.focusNode,
            readOnly: widget.readOnly,
            obscureText: obscureText,
            obscuringCharacter: widget.obscuringCharacter,
            inputFormatters: widget.inputFormatters ?? [if (widget.inputFormatter != null) widget.inputFormatter!],
            style: widget.style ??
                const TextStyle(
                  fontSize: 14,
                  // color: context.color(AppColors.black, AppColors.white),
                  fontWeight: FontWeight.w400,
                ),
            decoration: InputDecoration(
              errorText: widget.errorText,
              filled: true,
              // fillColor: context.color(AppColors.white, AppColors.c242424),
              hintText: widget.hint,
              prefixText: widget.prefixText,
              prefixStyle: const TextStyle(
                fontSize: 14,
                //  color: context.color(AppColors.black, AppColors.white)
              ),
              hintStyle: widget.hintTextStyle ??
                  const TextStyle(
                    // color: context.color(AppColors.c9D9895, AppColors.white),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
              helperMaxLines: 4,
              prefixIcon: widget.prefixIcon,
              // suffixIcon: !widget.obscureText
              //     ? widget.suffixIcon
              //     : IconButton(
              //         onPressed: () => setState(() => obscureText = !obscureText),
              //         icon: CustomIcon(
              //           icon: obscureText ? Assets.icons.eyeClosed : Assets.icons.eyeOpen,
              //           color: context.color(AppColors.cB9BBC9, AppColors.white),
              //         ),
              //         splashColor: Colors.transparent,
              //         highlightColor: Colors.transparent,
              //       ),
              // errorStyle: TextStyle(
              //   color: AppColors.errorColor,
              //   fontSize: 11,
              // ),
              contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: widget.borderRadius ?? BorderRadius.circular(10.r),
              //   borderSide: BorderSide(color: context.color(AppColors.borderColor, AppColors.c242424)),
              // ),
              errorBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red),
              ),
              // focusedErrorBorder: OutlineInputBorder(
              //   borderRadius: widget.borderRadius ?? BorderRadius.circular(10.r),
              //   borderSide: BorderSide(
              //     color: AppColors.primary,
              //     width: 1.5,
              //   ),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderRadius: widget.borderRadius ?? BorderRadius.circular(10.r),
              //   borderSide: BorderSide(
              //     color: AppColors.primary,
              //     width: 1.5,
              //   ),
              // ),
              border: OutlineInputBorder(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          if (widget.helper != null) ...[
            // 4.verticalSpace,
            // CustomText(
            //   widget.helper!,
            //   style: TextStyle(
            //       color: context.color(AppColors.c080A15, AppColors.white),
            //       fontSize: 12,
            //       fontWeight: FontWeight.w600),
            // )
          ],
          // if (widget.paddingBottom != null) SizedBox(height: widget.paddingBottom),
        ],
      );
}
