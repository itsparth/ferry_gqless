// This file is the base library

import 'package:ferry_gqless/schema.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Accessor {
  String query = '';

  void add(String field, int depth) {
    query += '  ' * depth + field + '\n';
  }
}

class QueryNotifier extends ChangeNotifier {
  late Accessor accessor;
  late Query query;
  late bool loading;
  bool hasData = false;

  QueryNotifier() {
    accessor = Accessor();
    query = Query.initial(accessor);
    loading = false;
  }

  void done() async {
    if (hasData || loading) {
      return;
    }
    loading = true;
    notifyListeners();
    // Load data for 3 seconds
    await Future.delayed(Duration(seconds: 3));
    // Fetch data from http
    // Set
    print(accessor.query);
    hasData = true;
    loading = false;
    final Map<String, dynamic> data = {
      'user': {
        'name': 'Parth',
        'todos': [
          {
            'text': 'First Todo',
            'completed': false,
          }
        ]
      },
      'todos': [
        {
          'text': 'First Todo',
          'completed': false,
        }
      ]
    };
    query = Query.fromMap(data);
    print(query.user.todos.length);
    notifyListeners();
  }
}

class PageWrapper extends StatelessWidget {
  final WidgetBuilder builder;

  const PageWrapper({Key? key, required this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<QueryNotifier>(
      builder: (context, value, child) {
        WidgetsBinding.instance!.addPostFrameCallback((_) => value.done());
        return builder(context);
      },
    );
  }
}
