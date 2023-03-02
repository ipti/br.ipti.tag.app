import 'package:br_ipti_appbase/core/status_page.dart';
import 'package:br_ipti_appbase/core/util/session/session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const EmptyState());

  final session = Modular.get<SessionBloc>();

  void startLoading() {
    emit(
      state.copyWith(status: Status.loading),
    );
  }
}
