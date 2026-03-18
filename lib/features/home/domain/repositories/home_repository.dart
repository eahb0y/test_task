import '../entities/dashboard_data.dart';

abstract class HomeRepository {
  Future<DashboardData> getDashboard({required String token});
}
