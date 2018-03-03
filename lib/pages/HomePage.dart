import 'package:flutter/material.dart';
import '../model/Todo.dart';

final _biggerFont = const TextStyle(fontSize: 18.0);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _todos = <Todo>[];

  int _counter = 0;

  Widget _buildList(){
    return new ListView.builder(
      itemCount: _todos.length*2,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {

          if (i.isOdd) return new Divider();

          final index = i ~/ 2;

          if (index >= _todos.length) {
            return null;
          }
          return _buildRow(_todos[index]);
        }
    );
  }

  _addTodo(){

    setState((){
      _counter++;
      _todos.add(new Todo("Todo$_counter: "+_controller.text));
      _controller.clear();
    });

  }

  _toggleTodo(Todo todo){
    setState((){
      todo.toggle();
    });


  }

  Widget _buildRow(Todo todo) {
    return new TodoListItem(todo,_toggleTodo);
  }

  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body:
      new Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[

          new TextField(
            controller: _controller,
            decoration: new InputDecoration(
              hintText: 'Type something',
            ),
          ),
          new Expanded(child: _buildList(),),

        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addTodo,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}


class TodoListItem extends StatelessWidget{

  final Todo _todo;
  final TodoCallback _onTap;
  TodoListItem(this._todo, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(
        _todo.message,
        style: _biggerFont,
      ),
      trailing: new Icon(_todo.isDone ? Icons.check_box : Icons.check_box_outline_blank),
      onTap: (){_onTap(_todo);},
    );
  }
}
