import '../../domain/entities/dashboard_data.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.id,
    required super.fullName,
    required super.email,
    required super.role,
    required super.location,
    required super.plan,
    required super.memberSince,
    required super.isVerified,
  });
}

class BusinessModel extends Business {
  const BusinessModel({
    required super.id,
    required super.name,
    required super.industry,
    required super.location,
    required super.activeProjects,
    required super.monthlyRevenue,
    required super.teamSize,
  });
}

class DashboardDataModel extends DashboardData {
  const DashboardDataModel({required super.profile, required super.businesses});
}
