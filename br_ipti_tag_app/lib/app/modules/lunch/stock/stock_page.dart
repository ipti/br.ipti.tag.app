import 'package:br_ipti_tag_app/app/shared/widgets/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    return TagBasicDesktopLayout(
      title: widget.title,
      path: ["Merenda Escolar", widget.title],
      description: "",
      body: <Widget>[
        Text(widget.title),
      ],
    );
  }
}
