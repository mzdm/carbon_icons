import 'dart:convert';
import 'dart:io';

const _codePointMapPath = 'generated/CarbonFonts.json';

const _generatedOutputFilePath = 'generated/carbon_fonts.dart';

const _ignoredKeywords = <String, String>{
  '1st': 'first_1st',
  '2nd': 'second_2nd',
  '3rd': 'third_3rd',
  '2d': 'two_d',
  '3d': 'three_d',
  '3g': 'three_g',
  '4g': 'four_g',
  '5g': 'five_g',
  '2k': 'two_k',
  '4k': 'four_k',
};

const _template = """
// Generated code - do not modify!

import 'package:flutter/widgets.dart';

part 'package:carbon_icons/src/widgets/icon_data.dart';

class CarbonIcons {
  CarbonIcons._();


""";

void main() {
  File codePointMapFile = File(_codePointMapPath);

  if (!codePointMapFile.existsSync()) {
    throw ("Could not find 'generated/CarbonFonts.json' file.");
  }

  final fileContent = codePointMapFile.readAsStringSync();
  Map<String, dynamic> codePointMap = json.decode(fileContent);

  final fontAppender = StringBuffer('');
  fontAppender.write(_template);
  codePointMap.forEach((fontName, codePoint) {
    fontAppender.write(_getFontData(codePoint, fontName));
  });
  fontAppender.write("}");

  File generatedOutput = File(_generatedOutputFilePath);
  generatedOutput.writeAsStringSync(fontAppender.toString());
}

String _getFontData(int codePoint, String fontName) {
  String? iconName;
  for (final entry in _ignoredKeywords.entries) {
    final key = entry.key;
    if (fontName.toLowerCase().startsWith(key)) {
      iconName = fontName.toLowerCase().replaceFirst(key, entry.value);
      break;
    }
  }
  final radix16 = codePoint.toRadixString(16).toUpperCase();
  final iconDataItem =
      'static const IconData ${iconName ?? fontName.toLowerCase()} = _CarbonIconData(0x$radix16);\n';
  return iconDataItem;
}
