# flutter_rich_text

A package for rich text.

## Guidance

This package is used for generate rich text (TextSpans)

you can generate rich text in 2 ways:

- give a list of texts besides styles
- give a complete text, global style, and a list of styles specific for some ranges.


## Example

give a list of texts besides styles：

```dart
RichText(
    overflow: TextOverflow.ellipsis,
    text: richTextForStyledTexts([
      RichStyleText(
          'aaa',
          TextStyle(
            color: Colors.red,
            fontSize: 20,
          )),
      RichStyleText('bbb',
          TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w900)),
      RichStyleText('ccc',
          TextStyle(color: Colors.blue, fontSize: 10, fontWeight: FontWeight.w500)),
      RichStyleText('ddd',
          TextStyle(color: Colors.grey, fontSize: 50, fontWeight: FontWeight.w900))
    ]))
```

give a complete text, global style, and a list of styles specific for some ranges：
```dart
RichText(
    overflow: TextOverflow.ellipsis,
    text: richTextForStyledRange(
        'aaabbbcccddd',
        TextStyle(
          color: Colors.black,
        ),
        [
          RichStyleRange.length(
              0,
              3,
              TextStyle(
                color: Colors.red,
                fontSize: 20,
              )),
          RichStyleRange.length(3, 3,
              TextStyle(color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w900)),
          RichStyleRange.length(6, 3,
              TextStyle(color: Colors.blue, fontSize: 10, fontWeight: FontWeight.w500)),
          RichStyleRange.length(9, 3,
              TextStyle(color: Colors.grey, fontSize: 50, fontWeight: FontWeight.w900))
        ]))
```


## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
