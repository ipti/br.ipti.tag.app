import 'package:br_ipti_tag_app/app/features/school/data/models/school_model.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/usecases/edit_school_usecase.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/usecases/show_school_usecase.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/cubit/school_state.dart';
import 'package:br_ipti_tag_app/app/shared/util/session/session_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SchoolCubit extends Cubit<SchoolState> {
  SchoolCubit(
    this._editSchoolUsecase,
    this._showSchoolUsecase,
  ) : super(const SchoolEmptyState());

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

  void _startSending(SchoolModel? currentSchool) {
    emit(
      SchoolSendingState(currentSchool: currentSchool),
    );
  }

  void _stopSending(SchoolModel currentSchool) {
    emit(SchoolSentState(currentSchool: currentSchool));
  }

  Future save() async {
    final data = SchoolEntity(name: "Escola Teste em");
    // final params = EditSchoolParams(uuid: "6244c323f0a8e92a8c6fad02", data: );
    //  final option = await editSchoolUsecase();
  }

  Future<void> fetchCurrentSchoolData() async {
    _startLoading();
    await _session.fetchCurrentSchool();
    final schoolId = _session.state.currentSchool!.id!;
    final result = await _showSchoolUsecase(ShowSchoolParams(uuid: schoolId));
    result.fold(
      (Exception failure) =>
          emit(SchoolFailedState(message: failure.toString())),
      (school) => _stopLoading(school),
    );
  }

  Future<void> updateCurrentSchoolData() async {
    _startSending(null);
    final schoolId = _session.state.currentSchool!.id!;
    final params = EditSchoolParams(
      uuid: schoolId,
      data: SchoolEntity(
        name: "Escola Teste - 07",
        inepId: "123456789",
        registerType: "00",
        edcensoUfFk: "61a92b6dd2b8a11704d7ae6a",
        edcensoCityFk: "61a92c8ed2b8a11704d813fe",
        edcensoDistrictFk: "61a93a0781524118745b6314",
      ),
    );
    final result = await _editSchoolUsecase(params);
    result.fold(
      (Exception failure) =>
          emit(SchoolFailedState(message: failure.toString())),
      (school) => _stopSending(school),
    );
  }
}
