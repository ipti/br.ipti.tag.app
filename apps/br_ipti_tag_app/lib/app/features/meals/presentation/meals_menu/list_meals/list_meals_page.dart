import 'dart:developer';

import 'package:br_ipti_tag_app/app/core/util/routes/routes.dart';
import 'package:br_ipti_tag_app/app/core/widgets/app_bar/custom_app_bar.dart';
import 'package:br_ipti_tag_app/app/core/widgets/menu/vertical_menu.dart';
import 'package:br_ipti_tag_app/app/features/meals/presentation/widgets/meals_item_per_day/meals_item_per_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_ui/tag_ui.dart';

import 'bloc/list_meals_bloc.dart';
import 'bloc/list_meals_events.dart';
import 'bloc/list_meals_states.dart';

class ListMealsPage extends StatefulWidget {
  const ListMealsPage({super.key, this.title = 'Refeições'});

  final String title;

  @override
  ListMealsPageState createState() => ListMealsPageState();
}

class ListMealsPageState extends State<ListMealsPage> {
  final controller = Modular.get<ListMealsBloc>();
  @override
  void initState() {
    controller.add(
      GetListMealsEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    const labelStyle = TextStyle(
      color: TagColors.colorBaseInkNormal,
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );

    return BlocBuilder<ListMealsBloc, ListMealsState>(
      bloc: controller,
      builder: (context, state) {
        List<Widget> tabs = [];
        List<Widget> tabViews = [];

        if (state is LoadedState) {
          tabs = state.mealsOfDay
              .map((e) => Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(DateFormat('EEEE', 'pt_BR')
                            .format(DateTime.parse(e.fullnameDay!))),
                        Text(
                          DateFormat('dd/MM', 'pt_BR')
                              .format(DateTime.parse(e.fullnameDay!)),
                          style: const TextStyle(
                              color: TagColors.colorBaseInkLight,),
                        ),
                      ],
                    ),
                  ))
              .toList();
          log(tabs.toString());
          tabViews = state.mealsOfDay
              .map(
                (e) => _DailyMeals(mealsOfDay: e),
              )
              .toList();
        }
        if (state is FailedState ||
            (state is LoadedState && state.mealsOfDay.isEmpty)) {
          tabs = [
            Tab(text: DateFormat('EEEE', 'pt_BR').format(DateTime.now())),
          ];
          tabViews = [
            TagEmpty(
              onPressedRetry: () => controller.add(GetListMealsEvent()),
            ),
          ];
        }
        if (state is LoadingState) {
          tabs = [
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(DateFormat('EEEE', 'pt_BR').format(DateTime.now())),
                  Text(
                    DateFormat('dd/MM', 'pt_BR').format(DateTime.now()),
                    style: const TextStyle(color: TagColors.colorBaseInkLight),
                  ),
                ],
              ),
            ),
          ];
          tabViews = [
            const Center(
              child: CircularProgressIndicator(),
            ),
          ];
        }

        return DefaultTabController(
          length: tabs.length,
          child: TagScaffold(
            menu: const TagVerticalMenu(),
            appBar: const CustomAppBar(),
            title: widget.title,
            description: "Cardápio semanal da sua escola",
            path: [AppRoutes.merenda, TagPath("", widget.title)],
            onTapBreadcrumb: (route) =>
                Modular.to.pushNamed(route, forRoot: true),
            tabBar: TabBar(
              isScrollable: true,
              labelColor: TagColors.colorBaseProductDark,
              indicatorColor: TagColors.colorBaseProductDark,
              labelStyle: labelStyle,
              onTap: (index) => pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              tabs: tabs,
            ),
            body: TabBarView(
              children: tabViews,
            ),
          ),
        );
      },
    );
  }
}

class _DailyMeals extends StatelessWidget {
  const _DailyMeals({
    required this.mealsOfDay,
  });

  final MealsMenu mealsOfDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34, left: 8, right: 8),
      child: MealsItemDay(
        fullnameDay: mealsOfDay.fullnameDay ?? "",
        currentDate: mealsOfDay.currentDate ?? "",
        meals: mealsOfDay.meals,
      ),
    );
  }
}

// ignore: unused_element
class _FilterStudentType extends StatelessWidget {
  const _FilterStudentType();

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
        ),
      ],
    );
  }
}

// ignore: unused_element
class _FilterTurn extends StatelessWidget {
  const _FilterTurn({
    required this.controller,
  });
  final ListMealsBloc controller;

  @override
  Widget build(BuildContext context) {
    final buttons = controller.turns.map((turn) {
      return _FilterButton(
        onPressed: (bool isActive) {
          if (isActive) {
            controller.add(
              FilterByTurnEvent(turn),
            );
          } else {
            controller.add(
              CleanFilterByTurnEvent(turn),
            );
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
        ),
      ],
    );
  }
}

class _FilterButton extends StatefulWidget {
  const _FilterButton({
    required this.onPressed,
    required this.child,
  });

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
