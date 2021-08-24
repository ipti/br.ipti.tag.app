import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/components/shared/tag_input_decoration.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';

import 'bloc/stock_bloc.dart';
import 'bloc/stock_events.dart';

class ManageItemStockPage extends StatefulWidget {
  final String title;
  const ManageItemStockPage({Key key, this.title = 'Gestão de estoque'})
      : super(key: key);
  @override
  ManageItemStockPageState createState() => ManageItemStockPageState();
}

class ManageItemStockPageState
    extends ModularState<ManageItemStockPage, ManageItemStockBloc> {
  @override
  void initState() {
    controller.add(StartEditing());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TagDefaultPage(
      menu: TagVerticalMenu(),
      title: widget.title,
      description: "Acompanhe o calendário e o estoqueda merenda da sua escola",
      path: ["Merenda", widget.title],
      body: <Widget>[
        SizedBox(
          height: 100,
          child: Row(
            children: [
              TagNumberField(
                onChanged: (value) => print(value),
              )
            ],
          ),
        ),
      ],
    );
  }
}
