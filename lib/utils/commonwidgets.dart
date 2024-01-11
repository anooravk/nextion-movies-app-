import 'package:flutter/material.dart';
import 'colors.dart';
import 'fontfamily.dart';

mediumText(text, color, double size, [align]) => Text(
      text,
      textAlign: align,
      style: TextStyle(
          fontFamily: TextFontFamily.poppinsMedium,
          fontSize: size,
          color: color),
    );

boldText(text, color, double size, [align]) => Text(
      text,
      textAlign: align,
      style: TextStyle(
          fontFamily: TextFontFamily.poppinsBold, fontSize: size, color: color),
    );

blackText(text, color, double size, [align]) => Text(
      text,
      textAlign: align,
      style: TextStyle(
          fontFamily: TextFontFamily.poppinsBlack,
          fontSize: size,
          color: color),
    );

lightText(text, color, double size, [align]) => Text(
      text,
      textAlign: align,
      style: TextStyle(
          fontFamily: TextFontFamily.poppinsLight,
          fontSize: size,
          color: color),
    );

regularText(text, color, double size, [align]) => Text(
      text,
      textAlign: align,
      style: TextStyle(
          fontFamily: TextFontFamily.poppinsRegular,
          fontSize: size,
          color: color),
    );

textField(hintText,
        {controller,
        image,
        onChanged,
        obscureText = false,
        key = TextInputType.emailAddress}) =>
    TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: key,
      cursorColor: ColorResources.black,
      style: TextStyle(
        color: ColorResources.black,
        fontSize: 16,
        fontFamily: TextFontFamily.poppinsRegular,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            image,
            color: ColorResources.black,
            height: 1,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorResources.grey9CA,
          fontSize: 15,
          fontFamily: TextFontFamily.poppinsRegular,
        ),
        filled: true,
        fillColor: ColorResources.white,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorResources.fillGrey, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorResources.fillGrey, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorResources.fillGrey, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );


