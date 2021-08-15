import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';

import 'bloc/stock_bloc.dart';
import 'bloc/stock_events.dart';

class StockPage extends StatefulWidget {
  final String title;
  const StockPage({Key key, this.title = 'Estoque'}) : super(key: key);
  @override
  StockPageState createState() => StockPageState();
}

class StockPageState extends ModularState<StockPage, StockBloc> {
  @override
  void initState() {
    controller.add(StartEditing());
    // Modular.to.navigate('/turmas/matricula-rapida/personal');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TagDefaultPage(
      title: widget.title,
      path: ["Merenda Escolar", widget.title],
      description: "",
      body: <Widget>[
        Text(widget.title),
      ],
    );
  }
}
