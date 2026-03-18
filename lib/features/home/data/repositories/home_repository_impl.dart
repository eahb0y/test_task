import '../../domain/entities/dashboard_data.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required MockHomeRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final MockHomeRemoteDataSource _remoteDataSource;

  @override
  Future<DashboardData> getDashboard({required String token}) =>
      _remoteDataSource.getDashboard(token: token);
}
