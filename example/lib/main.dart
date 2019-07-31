import 'package:flutter/material.dart';
import 'package:flutter_rich_text/flutter_rich_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rich Text Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_rich_text'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RichText(
                overflow: TextOverflow.ellipsis,
                text: richTextForStyledTexts([
                  RichStyleText(
                      'aaa',
                      TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      )),
                  RichStyleText(
                      'bbb',
                      TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w900)),
                  RichStyleText(
                      'ccc',
                      TextStyle(
                          color: Colors.blue,
                          fontSize: 10,
                          fontWeight: FontWeight.w500)),
                  RichStyleText(
                      'ddd',
                      TextStyle(
                          color: Colors.grey,
                          fontSize: 50,
                          fontWeight: FontWeight.w900))
                ])),
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
                      RichStyleRange.length(
                          3,
                          3,
                          TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w900)),
                      RichStyleRange.length(
                          6,
                          3,
                          TextStyle(
                              color: Colors.blue,
                              fontSize: 10,
                              fontWeight: FontWeight.w500)),
                      RichStyleRange.length(
                          9,
                          3,
                          TextStyle(
                              color: Colors.grey,
                              fontSize: 50,
                              fontWeight: FontWeight.w900))
                    ])),
          ],
        ),
      ),
    );
  }
}
