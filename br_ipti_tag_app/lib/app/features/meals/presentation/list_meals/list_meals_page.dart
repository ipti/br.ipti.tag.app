import 'package:br_ipti_tag_app/app/features/meals/presentation/list_meals/bloc/list_meals_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:orbit_ui_tag/orbit_ui_tag.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import '../widgets/daily_meals_list/daily_meals_list.dart';

import 'bloc/list_meals_bloc.dart';
import 'bloc/list_meals_events.dart';

class ListMealsPage extends StatefulWidget {
  final String title;
  const ListMealsPage({Key key, this.title = 'Merenda escolar'})
      : super(key: key);
  @override
  ListMealsPageState createState() => ListMealsPageState();
}

class ListMealsPageState extends ModularState<ListMealsPage, ListMealsBloc> {
  @override
  void initState() {
    controller.add(GetListMealsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TagDefaultPage(
      menu: TagVerticalMenu(),
      aside: Container(),
      title: widget.title,
      description: "Acompanhe o calendário e o estoqueda merenda da sua escola",
      path: ["Merenda", widget.title],
      body: <Widget>[
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _StudentCounter(),
              _FilterTurn(
                controller: controller,
              ),
              const _FilterStudentType(),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cardápio",
                style: TextStyle(
                    fontSize: 16, height: 1.4, fontWeight: FontWeight.w500),
              ),
              Text(
                "Cardápio semanal da sua escola",
                style: TextStyle(
                  color: TagColors.colorTextSecondary,
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<ListMealsBloc, ListMealsState>(
          bloc: controller,
          builder: (context, state) {
            if (state is LoadedState)
              return DailyMealsList(
                mealsOfDay: state.mealsOfDay,
              );
            return CircularProgressIndicator();
          },
        )
      ],
    );
  }
}

class _FilterStudentType extends StatelessWidget {
  const _FilterStudentType({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Filtrar tipo de aluno"),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 338),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Placeholder(
                fallbackHeight: 40,
                fallbackWidth: 70,
              ),
              Placeholder(
                fallbackHeight: 40,
                fallbackWidth: 90,
              ),
              Placeholder(
                fallbackHeight: 40,
                fallbackWidth: 106,
              ),
              Placeholder(
                fallbackHeight: 40,
                fallbackWidth: 50,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _FilterTurn extends StatelessWidget {
  const _FilterTurn({
    Key key,
    @required this.controller,
  }) : super(key: key);
  final ListMealsBloc controller;

  @override
  Widget build(BuildContext context) {
    final buttons = controller.turns.map((turn) {
      return _FilterButton(
          child: Text(
            turn,
            style: TextStyle(
              color: TagColors.colorTextPrimary,
            ),
          ),
          onPressed: (isActive) {
            if (isActive) {
              controller.add(FilterByTurnEvent(turn));
            } else {
              controller.add(CleanFilterByTurnEvent(turn));
            }
          });
    }).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Mostrar turnos"),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buttons,
          ),
        )
      ],
    );
  }
}

class _FilterButton extends StatefulWidget {
  const _FilterButton({
    Key key,
    @required this.onPressed,
    @required this.child,
  }) : super(key: key);

  final Function onPressed;
  final Widget child;

  @override
  __FilterButtonState createState() => __FilterButtonState();
}

class __FilterButtonState extends State<_FilterButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = TagBackgroundColors.backgroundButtonWhiteHover;

    if (isSelected)
      backgroundColor = TagBackgroundColors.backgroundButtonWhiteActive;

    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: widget.child,
      ),
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onPressed(isSelected);
      },
    );
  }
}

class _StudentCounter extends StatelessWidget {
  const _StudentCounter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Quantidade de alunos"),
        ),
        TagNumberField(
          onChanged: (value) => print(value),
        ),
      ],
    );
  }
}
