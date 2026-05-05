import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider para manejar la pestaña activa del HomePage desde cualquier lugar.
final navigationIndexProvider = StateProvider<int>((ref) => 0);
