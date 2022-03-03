import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'school_state.dart';

class SchoolCubit extends Cubit<SchoolState> {
  SchoolCubit() : super(SchoolInitial());
}
