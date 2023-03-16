// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ControllerPlanClass {
  final planClass = <PlanClass>[PlanClass("Rochas", Etapas(name: 'name'), const Diciplinas(name: "name"))] ;
}

class PlanClass {
  final String name;
  final Etapas etapas;
  final Diciplinas diciplinas;

  const PlanClass(
    this.name,
    this.etapas,
    this.diciplinas,
  );
}

class Etapas {
  final String name;
  const Etapas({
    required this.name,
  });
}

class Diciplinas {
  final String name;
  const Diciplinas({
    required this.name,
  });
}
