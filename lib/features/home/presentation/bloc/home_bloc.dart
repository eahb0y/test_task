import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_dashboard_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

export 'home_event.dart';
export 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required GetDashboardUseCase getDashboard, required String token})
    : _getDashboard = getDashboard,
      _token = token,
      super(const HomeState.initial()) {
    on<HomeRequested>(_onRequested);
    on<HomeRefreshed>(_onRefreshed);
  }

  final GetDashboardUseCase _getDashboard;
  final String _token;

  Future<void> _onRequested(
    HomeRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    await _loadDashboard(emit);
  }

  Future<void> _onRefreshed(
    HomeRefreshed event,
    Emitter<HomeState> emit,
  ) async {
    if (state.dashboard != null) {
      emit(
        state.copyWith(
          isRefreshing: true,
          errorMessage: null,
          clearError: true,
        ),
      );
    } else {
      emit(const HomeState.loading());
    }

    await _loadDashboard(emit);
  }

  Future<void> _loadDashboard(Emitter<HomeState> emit) async {
    try {
      final dashboard = await _getDashboard(token: _token);
      emit(HomeState.loaded(dashboard));
    } catch (_) {
      if (state.dashboard != null) {
        emit(
          state.copyWith(isRefreshing: false, errorMessage: 'refresh_failed'),
        );
        return;
      }

      emit(const HomeState.failure('dashboard_failed'));
    }
  }
}
