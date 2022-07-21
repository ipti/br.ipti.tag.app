import 'package:br_ipti_tag_app/app/features/meals/domain/entities/meals_menu.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/meals_item_per_day/meals_item_per_day.dart';
import 'package:br_ipti_tag_app/app/shared/widgets/menu/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/list_meals_bloc.dart';
import 'bloc/list_meals_events.dart';
import 'bloc/list_meals_states.dart';

class ListMealsPage extends StatefulWidget {
  const ListMealsPage({Key? key, this.title = 'Refeições'}) : super(key: key);

  final String title;

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
    final pageController = PageController();

    const labelStyle = TextStyle(
        color: TagColors.colorBaseInkNormal,
        fontWeight: FontWeight.w600,
        fontSize: 14);

    return TagDefaultPage(
      menu: const TagVerticalMenu(),
      title: widget.title,
      description: "Cardápio semanal da sua escola",
      path: ["Merenda Escolar", widget.title],
      body: <Widget>[
        BlocBuilder<ListMealsBloc, ListMealsState>(
          bloc: controller,
          builder: (context, state) {
            if (state is LoadedState) {
              return DefaultTabController(
                length: state.mealsOfDay.length,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      isScrollable: true,
                      labelColor: TagColors.colorBaseProductDark,
                      indicatorColor: TagColors.colorBaseProductDark,
                      labelStyle: labelStyle,
                      onTap: (index) => pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                      tabs: state.mealsOfDay
                          .map((e) => Tab(child: Text(e.fullnameDay!)))
                          .toList(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        children: state.mealsOfDay
                            .map((e) => _DailyMeals(mealsOfDay: e))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}

class _DailyMeals extends StatelessWidget {
  const _DailyMeals({
    Key? key,
    required this.mealsOfDay,
  }) : super(key: key);

  final MealsMenu mealsOfDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34),
      child: MealsItemDay(
        fullnameDay: mealsOfDay.fullnameDay,
        currentDate: mealsOfDay.currentDate,
        meals: mealsOfDay.meals,
      ),
    );
  }
}

// ignore: unused_element
class _FilterStudentType extends StatelessWidget {
  const _FilterStudentType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Filtrar tipo de aluno"),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 338),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
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

// ignore: unused_element
class _FilterTurn extends StatelessWidget {
  const _FilterTurn({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ListMealsBloc controller;

  @override
  Widget build(BuildContext context) {
    final buttons = controller.turns.map((turn) {
      return _FilterButton(
        onPressed: (bool isActive) {
          if (isActive) {
            controller.add(FilterByTurnEvent(turn));
          } else {
            controller.add(CleanFilterByTurnEvent(turn));
          }
        },
        child: Text(
          turn,
          style: const TextStyle(
            color: TagColors.colorBaseInkNormal,
          ),
        ),
      );
    }).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text("Mostrar turnos"),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 200),
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
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  final void Function(bool) onPressed;
  final Widget child;

  @override
  __FilterButtonState createState() => __FilterButtonState();
}

class __FilterButtonState extends State<_FilterButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = TagColors.colorBaseCloudLight;

    if (isSelected) backgroundColor = TagColors.colorBaseCloudLightActive;

    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onPressed(isSelected);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: widget.child,
      ),
    );
  }
}
