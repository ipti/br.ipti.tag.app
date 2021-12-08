import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/bloc/enrollment_bloc.dart';
import 'package:br_ipti_tag_app/app/features/student/presentation/enrollment/bloc/enrollment_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_ui/tag_ui.dart';

class AddressFormPage extends StatefulWidget {
  const AddressFormPage({Key? key}) : super(key: key);

  @override
  AddressFormPageState createState() => AddressFormPageState();
}

const heading = Heading(text: "Endereço", type: HeadingType.Title3);

class AddressFormPageState extends State<AddressFormPage> {
  final controller = Modular.get<EnrollmentBloc>();
  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(8.0);

    Widget withPadding(Widget widget) =>
        Padding(padding: padding, child: widget);

    return BlocBuilder<EnrollmentBloc, EnrollmentState>(
        bloc: controller,
        builder: (context, state) {
          if (state is EnrollmentState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    withPadding(heading),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
