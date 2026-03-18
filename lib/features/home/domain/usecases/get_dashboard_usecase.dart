import '../entities/dashboard_data.dart';
import '../repositories/home_repository.dart';

class GetDashboardUseCase {
  const GetDashboardUseCase(this._repository);

  final HomeRepository _repository;

  Future<DashboardData> call({required String token}) =>
      _repository.getDashboard(token: token);
}
