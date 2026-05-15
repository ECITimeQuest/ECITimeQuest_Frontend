import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationIndexProvider = StateProvider<int>((ref) => 0);
final homeOverlayProvider = StateProvider<Widget?>((ref) => null);
