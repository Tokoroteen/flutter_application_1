import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _flag = false;

  // ボタンクリック時にフラグを切り替える
  _click() async {
    setState(() {
      _flag = !_flag;
    });
  }

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          children: const [
            Icon(Icons.create),
            Text("初めてのタイトル"),
          ],
        ),
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                  duration: const Duration(seconds: 3),
                  width: _flag ? 100 : 50,
                  height: _flag ? 50 : 100,
                  padding: _flag
                      ? const EdgeInsets.all(0)
                      : const EdgeInsets.all(30),
                  margin: _flag
                      ? const EdgeInsets.all(0)
                      : const EdgeInsets.all(30),
                  transform: _flag ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
                  color: _flag ? Colors.blue : Colors.grey),
              AnimatedSwitcher(
                  duration: const Duration(seconds: 3),
                  child: _flag
                      ? const Text("なにもない")
                      : const Icon(Icons.favorite, color: Colors.pink))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedOpacity(
                  opacity: _flag ? 0.1 : 1.0,
                  duration: const Duration(seconds: 3),
                  child: Text(
                    "消える文字",
                    style: Theme.of(context).textTheme.headline4,
                  )),
              AnimatedSize(
                  duration: const Duration(seconds: 3),
                  child: SizedBox(
                      width: _flag ? 50 : 200,
                      height: _flag ? 50 : 200,
                      child: Container(color: Colors.purple))),
              AnimatedAlign(
                  duration: const Duration(seconds: 3),
                  alignment: _flag ? Alignment.topLeft : Alignment.bottomRight,
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(color: Colors.green)))
            ],
          ),
          const Text("Hello"),
          const Text("World"),
          TextButton(
              onPressed: () => {print("Button is pushed")},
              child: const Text("テキストボタン")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
              ),
              Icon(
                Icons.audiotrack,
                color: Colors.green,
                size: 30.0,
              ),
              Icon(
                Icons.beach_access,
                color: Colors.blue,
                size: 36.0,
              ),
              Icon(FontAwesomeIcons.gift, color: Colors.teal)
            ],
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          if (_counter % 2 == 0)
            const Text('偶数です',
                style: TextStyle(fontSize: 20, color: Colors.red))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _click,
        child: const Icon(Icons.ac_unit_outlined),
      ),
      drawer: const Drawer(child: Center(child: Text("Drawer"))),
      endDrawer: const Drawer(child: Center(child: Text("endDrawer"))),
    );
  }
}
