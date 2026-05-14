enum SubscriptionPlan {
  free,
  semiPremium,
  premium;

  static SubscriptionPlan fromApiValue(String value) {
    return switch (value) {
      'free' => SubscriptionPlan.free,
      'semi_premium' => SubscriptionPlan.semiPremium,
      'premium' => SubscriptionPlan.premium,
      _ => throw FormatException('Invalid subscription plan: $value'),
    };
  }

  String toApiValue() {
    return switch (this) {
      SubscriptionPlan.free => 'free',
      SubscriptionPlan.semiPremium => 'semi_premium',
      SubscriptionPlan.premium => 'premium',
    };
  }

  bool get isPremium => this == SubscriptionPlan.premium;
}
