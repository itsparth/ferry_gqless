import 'package:ferry_gqless/library.dart';

const MAX_DEPTH = 10;

// This file will be generated
class Todo {
  final String _id;
  final String _text;
  final bool _completed;
  final User _user;
  final Accessor? _accessor;
  final int _depth;

  Todo(this._id, this._text, this._completed, this._user,
      [this._accessor, this._depth = 0]);

  factory Todo.initial(Accessor accessor, int depth) {
    if (depth == MAX_DEPTH) {
      return Todo('', '', false, User.fromMap({}));
    }
    return Todo(
        '', '', false, User.initial(accessor, depth + 1), accessor, depth);
  }

  factory Todo.fromMap(Map<String, dynamic> map) => Todo(
      map['id'] ?? '',
      map['text'] ?? '',
      map['completed'] ?? false,
      map.containsKey('user') ? User.fromMap(map['user']) : User.fromMap({}));

  String get id {
    _accessor?.add('id', _depth);
    return _id;
  }

  String get text {
    _accessor?.add('text', _depth);
    return _text;
  }

  bool get completed {
    _accessor?.add('completed', _depth);
    return _completed;
  }

  User get user {
    _accessor?.add('user', _depth);
    return _user;
  }
}

class User {
  final String _id;
  final String _name;
  final String? _status;
  final List<Todo> _todos;
  final Accessor? _accessor;
  final int _depth;

  User(this._id, this._name, this._status, this._todos,
      [this._accessor, this._depth = 0]);

  factory User.initial(Accessor accessor, int depth) {
    if (depth == MAX_DEPTH) {
      return User('', '', null, [], accessor, depth);
    }
    return User(
        '', '', null, [Todo.initial(accessor, depth + 1)], accessor, depth);
  }

  factory User.fromMap(Map<String, dynamic> map) => User(
        map['id'] ?? '',
        map['name'] ?? '',
        map['status'] ?? null,
        map.containsKey('todos')
            ? (map['todos'] as List<Map<String, dynamic>>)
                .map((e) => Todo.fromMap(e))
                .toList()
            : [],
      );
  String get id {
    _accessor?.add('id', _depth);
    return _id;
  }

  String get name {
    _accessor?.add('name', _depth);
    return _name;
  }

  String? get status {
    _accessor?.add('status', _depth);
    return _status;
  }

  List<Todo> get todos {
    _accessor?.add('todos', _depth);
    return _todos;
  }
}

class Query {
  final List<Todo> _todos;
  final User _user;
  final Accessor? _accessor;
  final int _depth;

  Query(this._todos, this._user, [this._accessor, this._depth = 0]);

  factory Query.initial(Accessor accessor) =>
      Query([Todo.initial(accessor, 1)], User.initial(accessor, 1), accessor);

  factory Query.fromMap(Map<String, dynamic> map) => Query(
      map.containsKey('todos')
          ? (map['todos'] as List<Map<String, dynamic>>)
              .map((e) => Todo.fromMap(e))
              .toList()
          : [],
      map.containsKey('user') ? User.fromMap(map['user']) : User.fromMap({}));

  List<Todo> get todos {
    _accessor?.add('todos', _depth);
    return _todos;
  }

  User get user {
    _accessor?.add('user', _depth);
    return _user;
  }
}
