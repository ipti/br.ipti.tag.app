import 'package:br_ipti_tag_app/app/features/school/domain/entities/school.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/usecases/edit_school_usecase.dart';
import 'package:br_ipti_tag_app/app/features/school/domain/usecases/show_school_usecase.dart';
import 'package:br_ipti_tag_app/app/features/school/presentation/cubit/school_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchoolCubit extends Cubit<SchoolState> {
  SchoolCubit(
    this._editSchoolUsecase,
    this._showSchoolUsecase,
  ) : super(SchoolEmptyState());

  final EditSchoolUsecase _editSchoolUsecase;
  final ShowSchoolUsecase _showSchoolUsecase;

  Future save() async {
    final data = SchoolEntity(name: "Escola Teste em");
    // final params = EditSchoolParams(uuid: "6244c323f0a8e92a8c6fad02", data: );
    //  final option = await editSchoolUsecase();
  }

  void _startLoading() {
    emit(state.copyWith(loading: true));
  }

  void _stopLoading() {
    emit(state.copyWith(loading: false));
  }

  void _startSending() {
    emit(state.copyWith(
      sending: true,
      message: "Enviando dados",
    ));
  }

  void _stopSending() {
    emit(state.copyWith(sending: false));
  }

  Future<void> fetchCurrentSchoolData() async {
    _startLoading();
    final result = await _showSchoolUsecase(
        ShowSchoolParams(uuid: "6244c323f0a8e92a8c6fad02"));
    result.fold(
      (Exception failure) =>
          emit(SchoolFailedState(message: failure.toString())),
      (school) => emit(SchoolLoadedState(currentSchool: school)),
    );
    _stopLoading();
  }

  Future<void> updateSchoolData() async {
    _startSending();

    final params = EditSchoolParams(
      uuid: "6244c323f0a8e92a8c6fad02",
      data: SchoolEntity(
        name: "Escola Teste - 02",
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
      (school) => emit(SchoolLoadedState(currentSchool: school)),
    );
    _stopSending();
  }
}
