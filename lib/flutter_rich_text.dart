library flutter_rich_text;

import 'package:flutter/material.dart';

class RichStyleRange {
  RichStyleRange(this.start, this.end, this.style);
  RichStyleRange.length(start, length, this.style)
      : start = start,
        end = start + length;
  int start;
  int end;
  TextStyle style;
}

class RichStyleText {
  RichStyleText(this.text, this.style);
  String text;
  TextStyle style;
}

TextSpan _textSpanWithRichStyleText(RichStyleText richText) {
  return TextSpan(
    text: richText.text,
    style: richText.style,
  );
}

TextSpan richTextForStyledTexts(List<RichStyleText> texts) {
  if (texts == null || texts.length == 0) {
    return TextSpan(text: '');
  }
  if (texts.length == 1) {
    RichStyleText richText = texts[0];
    return _textSpanWithRichStyleText(richText);
  }
  RichStyleText firstRichText = texts[0];

  return TextSpan(
    text: firstRichText.text,
    style: firstRichText.style,
    children: texts.sublist(1).map((RichStyleText richText) {
      return _textSpanWithRichStyleText(richText);
    }).toList(),
  );
}

TextSpan richTextForStyledRange(String text, TextStyle globalStyle, List<RichStyleRange> ranges) {
  if (text == null || text.length == 0) {
    return TextSpan(text: '');
  }
  if (ranges == null || ranges.length == 0) {
    return TextSpan(text: text, style: globalStyle);
  }
  RichStyleText richText = RichStyleText(text, globalStyle);
  List<num> styleIndexForChars = List.filled(text.length + 1, -1);
  styleIndexForChars[text.length] = -10; //add bounds
//  print(styleIndexForChars);
  for (int i = 0; i < ranges.length; i++) {
    RichStyleRange richRange = ranges[i];

    for (int j = richRange.start; j < richRange.end && j < text.length; j++) {
      if (j >= 0 && j < text.length) {
        styleIndexForChars[j] = i;
      }
    }
  }
//  print(styleIndexForChars);

  if (text.length == 1) {
    int styleIndex = styleIndexForChars[0];
    TextStyle style = globalStyle;
    if (styleIndex >= 0) {
      style = ranges[styleIndex].style;
    }
    return TextSpan(text: text, style: style);
  }

  int sameStyleStart = 0;
  List<RichStyleText> richTexts = [];
  for (int i = 1; i < styleIndexForChars.length; i++) {
    int preStyleIndex = styleIndexForChars[i - 1];
    int currStyleIndex = styleIndexForChars[i];

    if (preStyleIndex != currStyleIndex) {
      int start = sameStyleStart;
      int end = i;
//      print('from $start to $end, ${text.substring(start, end)} use same style $preStyleIndex');
      TextStyle style = globalStyle;
      if (preStyleIndex >= 0) {
        style = ranges[preStyleIndex].style;
      }
      RichStyleText richText = RichStyleText(text.substring(start, end), style);
      richTexts.add(richText);
      sameStyleStart = i;
    }
  }

  return richTextForStyledTexts(richTexts);
}
