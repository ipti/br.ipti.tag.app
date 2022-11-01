import 'package:br_ipti_tag_app/app/core/util/session/session_bloc.dart';

import 'package:br_ipti_tag_app/app/features/school/presentation/cubit/school_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tag_sdk/tag_sdk.dart';

class SchoolCubit extends Cubit<SchoolState> {
  SchoolCubit(
    this._editSchoolUsecase,
    this._showSchoolUsecase,
  ) : super(
          const SchoolEmptyState(),
        );

  final EditSchoolUsecase _editSchoolUsecase;
  final ShowSchoolUsecase _showSchoolUsecase;
  final SessionBloc _session = Modular.get<SessionBloc>();

  void _startLoading() {
    emit(
      const SchoolLoadingState(),
    );
  }

  void _stopLoading(SchoolModel currentSchool) {
    emit(
      SchoolLoadedState(currentSchool: currentSchool),
    );
  }

  void _startSending() {
    emit(
      SchoolSendingState(
        currentSchool: state.currentSchoolData!.copyWith(),
      ),
    );
  }

  void _stopSending(SchoolModel currentSchool) {
    emit(
      SchoolSentState(currentSchool: currentSchool),
    );
  }

  Future save() async {
    // final data = School(name: "Escola Teste em");
    // final params = EditSchoolParams(uuid: "6244c323f0a8e92a8c6fad02",);
    //  final option = await editSchoolUsecase();
    throw UnimplementedError();
  }

  Future<void> fetchCurrentSchoolData() async {
    _startLoading();
    await _session.fetchCurrentSchool();
    final schoolId = _session.state.currentSchool!.inepId!;
    final result = await _showSchoolUsecase(
      ShowSchoolParams(uuid: schoolId),
    );
    result.fold(
      (Exception failure) => emit(SchoolFailedState(
        message: failure.toString(),
      )),
      (school) => _stopLoading(school),
    );
  }

  Future<void> updateCurrentSchoolData() async {
    _startSending();
    final String schoolId = _session.state.currentSchool!.id!;

    final params = EditSchoolParams(
      uuid: schoolId,
      data: School(
        name: state.currentSchoolData?.name,
        inepId: state.currentSchoolData?.inepId,
        registerType: state.currentSchoolData?.registerType,
        edcensoUfFk: state.currentSchoolData?.edcensoUfFk,
        edcensoCityFk: state.currentSchoolData?.edcensoCityFk,
        edcensoDistrictFk: state.currentSchoolData?.edcensoDistrictFk,
        // initialDate: state.currentSchoolData!.initialDate,
        // finalDate: state.currentSchoolData!.finalDate,
        // actOfAcknowledgement: state.currentSchoolData!.actOfAcknowledgement,
      ),
    );
    final result = await _editSchoolUsecase(params);
    result.fold(
      (Exception failure) => emit(SchoolFailedState(
        message: failure.toString(),
      )),
      (school) => _stopSending(school),
    );
  }

  void setCurrentSchoolName(String name) => emit(
        SchoolDataChangeState(
          currentSchool: state.currentSchoolData!.copyWith(
            name: name,
          ),
        ),
      );
  void setCurrentSchoolInepId(String inepId) => emit(
        SchoolDataChangeState(
          currentSchool: state.currentSchoolData!.copyWith(inepId: inepId),
        ),
      );
  void setCurrentSchoolRegisterType(String registerType) => emit(
        SchoolDataChangeState(
          currentSchool:
              state.currentSchoolData!.copyWith(registerType: registerType),
        ),
      );
  void setCurrentSchoolEdcensoUfFk(int edcensoUfFk) => emit(
        SchoolDataChangeState(
          currentSchool:
              state.currentSchoolData!.copyWith(edcensoUfFk: edcensoUfFk),
        ),
      );
  void setCurrentSchoolEdcensoCityFk(int edcensoCityFk) =>
      emit(SchoolDataChangeState(
        currentSchool:
            state.currentSchoolData!.copyWith(edcensoCityFk: edcensoCityFk),
      ));
  void setCurrentSchoolEdcensoDistrictFk(int edcensoDistrictFk) =>
      emit(SchoolDataChangeState(
        currentSchool: state.currentSchoolData!
            .copyWith(edcensoDistrictFk: edcensoDistrictFk),
      ));
  void setCurrentSchoolInitialDate(String initialDate) =>
      emit(SchoolDataChangeState(
        currentSchool:
            state.currentSchoolData!.copyWith(initialDate: initialDate),
      ));
  void setCurrentSchoolFinalDate(String finalDate) =>
      emit(SchoolDataChangeState(
        currentSchool: state.currentSchoolData!.copyWith(finalDate: finalDate),
      ));
  void setCurrentSchoolActOfAcknowledgement(String actOfAcknowledgement) =>
      emit(SchoolDataChangeState(
        currentSchool: state.currentSchoolData!
            .copyWith(actOfAcknowledgement: actOfAcknowledgement),
      ));
}
