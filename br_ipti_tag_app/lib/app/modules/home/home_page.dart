import 'package:br_ipti_tag_app/app/modules/home/home_events.dart';
import 'package:flutter/material.dart';
import 'package:br_ipti_tag_app/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller = Modular.get();

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
                    if (snapshot.data is HomeReady) {
                      HomeReady event = snapshot.data;
                      return ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          title: Text(event.users[index].matricula),
                        ),
                        itemCount: event.users.length,
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            TextButton(
              child: Text("Me leve para outro modulo"),
              onPressed: () => _controller.fetchUsers(),
            ),
          ],
        ),
      ),
    );
  }
}
