import 'package:flutter/material.dart';

/// Immutable data model for a Blinkit Money feature card.
class FeatureCardModel {
  const FeatureCardModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}
