import 'package:flutter_app/features/auth/data/models/subscription_plan.dart';

class UserResponse {
  final String id;
  final String email;
  final String? name;
  final SubscriptionPlan subscriptionPlan;
  final DateTime createdAt;

  const UserResponse({
    required this.id,
    required this.email,
    required this.name,
    required this.subscriptionPlan,
    required this.createdAt,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      subscriptionPlan: SubscriptionPlan.fromApiValue(
        json['subscription_plan'] as String,
      ),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
