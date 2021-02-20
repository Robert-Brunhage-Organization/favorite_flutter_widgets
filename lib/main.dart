import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          FittedBoxExample(),
          Placeholder(),
          WrapExample(),
          LayoutBuilderExample(),
          InkWellWithAnimatedIconExample(),
          Text(totalWidth.toString(), style: Theme.of(context).textTheme.headline4),
          SnackbarExample(),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}

class SnackbarExample extends StatelessWidget {
  const SnackbarExample({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('hello'),
            behavior: SnackBarBehavior.floating,
          ));
        },
        child: Text('Open Snackbar'),
      ),
    );
  }
}

class FittedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 100,
      child: Text('I want this text to always fit the container'),
    );
  }
}

class WrapExample extends StatelessWidget {
  const WrapExample({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        10,
        (index) => Container(
          margin: const EdgeInsets.all(10),
          color: Colors.red,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          return Container(
            color: Colors.red,
            height: 100,
            width: 100,
          );
        } else {
          return Container(
            color: Colors.blue,
            height: 100,
            width: 100,
          );
        }
      },
    );
  }
}

class InkWellWithAnimatedIconExample extends StatefulWidget {
  @override
  _InkWellWithAnimatedIconExampleState createState() => _InkWellWithAnimatedIconExampleState();
}

class _InkWellWithAnimatedIconExampleState extends State<InkWellWithAnimatedIconExample> with SingleTickerProviderStateMixin {
  AnimationController myAnimation;

  @override
  void initState() {
    super.initState();
    myAnimation = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (myAnimation.isCompleted) {
          myAnimation.reverse();
        } else {
          myAnimation.forward();
        }
      },
      child: Center(
        child: AnimatedIcon(icon: AnimatedIcons.add_event, size: 52, progress: myAnimation),
      ),
    );
  }
}
