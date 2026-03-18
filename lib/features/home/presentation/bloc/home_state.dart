import 'package:equatable/equatable.dart';

import '../../domain/entities/dashboard_data.dart';

enum HomeStatus { initial, loading, loaded, failure }

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    this.dashboard,
    this.isRefreshing = false,
    this.errorMessage,
  });

  const HomeState.initial() : this(status: HomeStatus.initial);

  const HomeState.loading() : this(status: HomeStatus.loading);

  const HomeState.loaded(
    DashboardData dashboard, {
    bool isRefreshing = false,
    String? errorMessage,
  }) : this(
         status: HomeStatus.loaded,
         dashboard: dashboard,
         isRefreshing: isRefreshing,
         errorMessage: errorMessage,
       );

  const HomeState.failure(String message)
    : this(status: HomeStatus.failure, errorMessage: message);

  final HomeStatus status;
  final DashboardData? dashboard;
  final bool isRefreshing;
  final String? errorMessage;

  HomeState copyWith({
    HomeStatus? status,
    DashboardData? dashboard,
    bool clearDashboard = false,
    bool? isRefreshing,
    String? errorMessage,
    bool clearError = false,
  }) {
    return HomeState(
      status: status ?? this.status,
      dashboard: clearDashboard ? null : dashboard ?? this.dashboard,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    status,
    dashboard,
    isRefreshing,
    errorMessage,
  ];
}
