import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  const UserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
    required this.location,
    required this.plan,
    required this.memberSince,
    required this.isVerified,
  });

  final String id;
  final String fullName;
  final String email;
  final String role;
  final String location;
  final String plan;
  final String memberSince;
  final bool isVerified;

  @override
  List<Object?> get props => <Object?>[
    id,
    fullName,
    email,
    role,
    location,
    plan,
    memberSince,
    isVerified,
  ];
}

class Business extends Equatable {
  const Business({
    required this.id,
    required this.name,
    required this.industry,
    required this.location,
    required this.activeProjects,
    required this.monthlyRevenue,
    required this.teamSize,
  });

  final String id;
  final String name;
  final String industry;
  final String location;
  final int activeProjects;
  final double monthlyRevenue;
  final int teamSize;

  @override
  List<Object?> get props => <Object?>[
    id,
    name,
    industry,
    location,
    activeProjects,
    monthlyRevenue,
    teamSize,
  ];
}

class DashboardData extends Equatable {
  const DashboardData({required this.profile, required this.businesses});

  final UserProfile profile;
  final List<Business> businesses;

  int get businessCount => businesses.length;

  int get totalActiveProjects => businesses.fold<int>(
    0,
    (total, business) => total + business.activeProjects,
  );

  double get totalMonthlyRevenue => businesses.fold<double>(
    0,
    (total, business) => total + business.monthlyRevenue,
  );

  @override
  List<Object?> get props => <Object?>[profile, businesses];
}
