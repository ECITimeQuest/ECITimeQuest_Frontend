enum SubscriptionPlan {
  free,
  premium;

  static SubscriptionPlan fromApiValue(String value) {
    return switch (value) {
      'premium' => SubscriptionPlan.premium,
      _ => SubscriptionPlan.free,
    };
  }

  String toApiValue() {
    return switch (this) {
      SubscriptionPlan.free => 'free',
      SubscriptionPlan.premium => 'premium',
    };
  }

  bool get isPremium => this == SubscriptionPlan.premium;
}
