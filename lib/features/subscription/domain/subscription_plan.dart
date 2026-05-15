// El enum SubscriptionPlan vive en la capa de datos de auth.
// Lo re-exportamos aquí para que el resto de la feature no cambie sus imports.
export 'package:flutter_app/features/auth/data/models/enums/subscription_plan.dart';

import 'package:flutter_app/features/auth/data/models/enums/subscription_plan.dart';

class SubscriptionPlanInfo {
  final SubscriptionPlan plan;
  final String name;
  final String price;
  final String priceSubtitle;
  final String description;
  final List<SubscriptionFeature> features;

  const SubscriptionPlanInfo({
    required this.plan,
    required this.name,
    required this.price,
    required this.priceSubtitle,
    required this.description,
    required this.features,
  });
}

class SubscriptionFeature {
  final String label;
  final bool included;

  const SubscriptionFeature({required this.label, required this.included});
}
