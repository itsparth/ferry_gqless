import 'package:ferry_gqless/library.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => QueryNotifier(),
    child: MaterialApp(
      home: PageWrapper(
        builder: (context) => Scaffold(
          body: Consumer<QueryNotifier>(
            builder: (context, value, child) => Center(
              child: value.loading
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        Text(value.query.user.name),
                        ...value.query.user.todos
                            .map((e) => Text('${e.text} ${e.completed}'))
                      ],
                    ),
            ),
          ),
        ),
      ),
    ),
  ));
}
