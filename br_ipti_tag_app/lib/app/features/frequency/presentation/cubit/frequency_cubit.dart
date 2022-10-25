import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'frequency_state.dart';

class FrequencyCubit extends Cubit<FrequencyState> {
  FrequencyCubit() : super(FrequencyInitial());
}
