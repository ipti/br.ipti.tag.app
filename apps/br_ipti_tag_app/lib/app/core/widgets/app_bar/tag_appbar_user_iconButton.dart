import 'package:br_ipti_tag_app/app/core/plataform/session_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';
import '../../util/session/session_bloc.dart';
import '../header/dropdown_select_school.dart';

class TagAppBarUserIconButton extends StatefulWidget {
  const TagAppBarUserIconButton({Key? key}) : super(key: key);

  @override
  State<TagAppBarUserIconButton> createState() => _TagAppBarUserIconButtonState();
}

class _TagAppBarUserIconButtonState extends State<TagAppBarUserIconButton> {
  final sessionController = Modular.get<SessionBloc>();

  final sessionService = Modular.get<SessionServiceImpl>();

  @override
  void initState() {
    super.initState();
    sessionController.fetchCurrentSchool();
  }

  @override
  Widget build(BuildContext context) {
    //backgroundImage: NetworkImage(sessionService.user?.photoUrl ?? "")
    return BlocBuilder<SessionBloc, SessionState>(
      bloc: sessionController,
      builder: (context, state) {
        if (state.currentSchool == null) return const CircularProgressIndicator();
        state = state.copyWith(currentSchool: state.currentSchool);

        return InkWell(
          onTap: () => _showModalBottomSheet(context),
          child: Padding(
            padding: const EdgeInsets.only(right:8),
            child: CircleAvatar(
              // radius: 55,
              backgroundColor: Colors.red,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                // radius: 50,
                child: Text(state.currentSchool!.name.substring(0, 1).toUpperCase()),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          child: DropdownSelectSchool(),
        );
      },
    );
  }

}
