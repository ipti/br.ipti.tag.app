import 'package:br_ipti_tag_app/app/features/home/home_controller.dart';
import 'package:br_ipti_tag_app/app/features/home/home_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Modular.get();

  @override
  void initState() {
    _controller.fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: StreamBuilder<HomeEvent>(
                  stream: _controller.states.stream,
                  builder: (context, AsyncSnapshot<HomeEvent> snapshot) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            TextButton(
              onPressed: () => _controller.fetchUsers(),
              child: const Text("Me leve para outro modulo"),
            ),
          ],
        ),
      ),
    );
  }
}
