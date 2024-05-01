import 'package:flutter/material.dart';
import 'package:cryptovisor/screens/helper/crypto_visor_colors.dart';
import 'package:cryptovisor/screens/helper/style_text/crypto_visor_typography_font_size.dart';
import 'package:cryptovisor/screens/helper/style_text/crypto_visor_typography_font_weight.dart';

// https://medium.com/@felipelemosbellini/como-gerar-estilos-de-texto-personalizados-em-flutter-usando-loop-for-5fc1b9a25eab

extension TypographyExtension on Text {
  Text bodyTinyExtraLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.tiny,
        fontWeight: CryptoVisorTypographyFontWight.extraLight,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraSmallExtraLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraSmall,
        fontWeight: CryptoVisorTypographyFontWight.extraLight,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodySmallExtraLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.small,
        fontWeight: CryptoVisorTypographyFontWight.extraLight,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyBaseExtraLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.base,
        fontWeight: CryptoVisorTypographyFontWight.extraLight,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyMediumExtraLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.medium,
        fontWeight: CryptoVisorTypographyFontWight.extraLight,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyLargeExtraLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.large,
        fontWeight: CryptoVisorTypographyFontWight.extraLight,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraLargeExtraLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraLarge,
        fontWeight: CryptoVisorTypographyFontWight.extraLight,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyTinyLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.tiny,
        fontWeight: CryptoVisorTypographyFontWight.light,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraSmallLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraSmall,
        fontWeight: CryptoVisorTypographyFontWight.light,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodySmallLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.small,
        fontWeight: CryptoVisorTypographyFontWight.light,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyBaseLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.base,
        fontWeight: CryptoVisorTypographyFontWight.light,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyMediumLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.medium,
        fontWeight: CryptoVisorTypographyFontWight.light,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyLargeLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.large,
        fontWeight: CryptoVisorTypographyFontWight.light,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraLargeLight({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraLarge,
        fontWeight: CryptoVisorTypographyFontWight.light,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyTinyRegular({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.tiny,
        fontWeight: CryptoVisorTypographyFontWight.regular,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraSmallRegular({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraSmall,
        fontWeight: CryptoVisorTypographyFontWight.regular,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodySmallRegular({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.small,
        fontWeight: CryptoVisorTypographyFontWight.regular,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyBaseRegular({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.base,
        fontWeight: CryptoVisorTypographyFontWight.regular,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyMediumRegular({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.medium,
        fontWeight: CryptoVisorTypographyFontWight.regular,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyLargeRegular({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.large,
        fontWeight: CryptoVisorTypographyFontWight.regular,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraLargeRegular({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraLarge,
        fontWeight: CryptoVisorTypographyFontWight.regular,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyTinyMedium({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.tiny,
        fontWeight: CryptoVisorTypographyFontWight.medium,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraSmallMedium({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraSmall,
        fontWeight: CryptoVisorTypographyFontWight.medium,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodySmallMedium({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.small,
        fontWeight: CryptoVisorTypographyFontWight.medium,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyBaseMedium({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.base,
        fontWeight: CryptoVisorTypographyFontWight.medium,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyMediumMedium({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.medium,
        fontWeight: CryptoVisorTypographyFontWight.medium,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyLargeMedium({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.large,
        fontWeight: CryptoVisorTypographyFontWight.medium,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraLargeMedium({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraLarge,
        fontWeight: CryptoVisorTypographyFontWight.medium,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyTinySemiBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.tiny,
        fontWeight: CryptoVisorTypographyFontWight.semiBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraSmallSemiBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraSmall,
        fontWeight: CryptoVisorTypographyFontWight.semiBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodySmallSemiBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.small,
        fontWeight: CryptoVisorTypographyFontWight.semiBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyBaseSemiBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.base,
        fontWeight: CryptoVisorTypographyFontWight.semiBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyMediumSemiBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.medium,
        fontWeight: CryptoVisorTypographyFontWight.semiBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyLargeSemiBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.large,
        fontWeight: CryptoVisorTypographyFontWight.semiBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraLargeSemiBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraLarge,
        fontWeight: CryptoVisorTypographyFontWight.semiBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyTinyBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.tiny, fontWeight: CryptoVisorTypographyFontWight.bold, mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraSmallBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraSmall,
        fontWeight: CryptoVisorTypographyFontWight.bold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodySmallBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.small,
        fontWeight: CryptoVisorTypographyFontWight.bold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyBaseBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.base, fontWeight: CryptoVisorTypographyFontWight.bold, mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyMediumBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.medium,
        fontWeight: CryptoVisorTypographyFontWight.bold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyLargeBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.large,
        fontWeight: CryptoVisorTypographyFontWight.bold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraLargeBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraLarge,
        fontWeight: CryptoVisorTypographyFontWight.bold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyTinyExtraBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.tiny,
        fontWeight: CryptoVisorTypographyFontWight.extraBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraSmallExtraBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraSmall,
        fontWeight: CryptoVisorTypographyFontWight.extraBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodySmallExtraBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.small,
        fontWeight: CryptoVisorTypographyFontWight.extraBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyBaseExtraBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.base,
        fontWeight: CryptoVisorTypographyFontWight.extraBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyMediumExtraBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.medium,
        fontWeight: CryptoVisorTypographyFontWight.extraBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyLargeExtraBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.large,
        fontWeight: CryptoVisorTypographyFontWight.extraBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraLargeExtraBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: CryptoVisorTypographyFontSize.extraLarge,
        fontWeight: CryptoVisorTypographyFontWight.extraBold,
        mergeStyle: style);
    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  TextStyle _getTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required TextStyle? mergeStyle,
  }) {
    return TextStyle(
            fontSize: fontSize,
            fontStyle: FontStyle.normal,
            color: CryptoVisorColors.whiteLabel,
            fontFamily: 'Inter',
            fontWeight: fontWeight)
        .merge(mergeStyle);
  }

  Text _getTextTypography({required Text text, required TextStyle textStyle}) {
    return Text(text.data!,
        style: textStyle,
        key: text.key,
        strutStyle: text.strutStyle,
        textAlign: text.textAlign,
        textDirection: text.textDirection,
        locale: text.locale,
        softWrap: text.softWrap,
        overflow: text.overflow,
        maxLines: text.maxLines,
        semanticsLabel: text.semanticsLabel,
        textWidthBasis: text.textWidthBasis,
        textHeightBehavior: text.textHeightBehavior);
  }
}
