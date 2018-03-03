class Todo{
  final String _message;
  bool _isDone = false;

  Todo(this._message);

  bool get isDone => _isDone;
  void toggle (){_isDone = !_isDone;}
  String get message => _message;
}

typedef void TodoCallback(Todo todo);