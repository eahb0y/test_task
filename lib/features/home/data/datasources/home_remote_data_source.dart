import '../models/dashboard_data_model.dart';

class MockHomeRemoteDataSource {
  Future<DashboardDataModel> getDashboard({required String token}) async {
    await Future<void>.delayed(const Duration(milliseconds: 1250));

    if (!token.startsWith('mock_token_')) {
      throw StateError('Session token is invalid.');
    }

    return const DashboardDataModel(
      profile: UserProfileModel(
        id: 'usr_demo_01',
        fullName: 'Amina Rakhimova',
        email: 'demo@solidflow.app',
        role: 'Founder & Operator',
        location: 'Tashkent',
        plan: 'Business Pro',
        memberSince: '03.2023',
        isVerified: true,
      ),
      businesses: <BusinessModel>[
        BusinessModel(
          id: 'biz_01',
          name: 'Atlas Cafe',
          industry: 'HoReCa',
          location: 'Tashkent',
          activeProjects: 4,
          monthlyRevenue: 18500,
          teamSize: 12,
        ),
        BusinessModel(
          id: 'biz_02',
          name: 'Northwind Studio',
          industry: 'Creative Agency',
          location: 'Samarkand',
          activeProjects: 6,
          monthlyRevenue: 22400,
          teamSize: 9,
        ),
        BusinessModel(
          id: 'biz_03',
          name: 'Silk Road Logistics',
          industry: 'Logistics',
          location: 'Bukhara',
          activeProjects: 3,
          monthlyRevenue: 31750,
          teamSize: 18,
        ),
      ],
    );
  }
}
