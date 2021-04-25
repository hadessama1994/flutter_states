import 'package:flutter/material.dart';
import 'package:flutter_json/controller/home_controller.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = HomeController();

  _done() {
    return SafeArea(
      child: Container(
        child: Center(
          child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: controller.users.length,
              itemBuilder: (context, index) {
                return Text(controller.users[index].title!);
              }),
        ),
      ),
    );
  }

  _error() {
    return Center(child: Text("No Connection..."));
  }

  _loading() {
    return Center(child: CircularProgressIndicator());
  }

  _start() {
    Center(child: Text("..."));
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.done:
        return _done();
      case HomeState.error:
        return _error();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
            animation: controller.state,
            builder: (context, child) {
              return stateManagement(controller.state.value);
            }));
  }
}
