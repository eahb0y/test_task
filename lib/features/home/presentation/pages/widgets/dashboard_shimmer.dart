import 'package:flutter/material.dart';

import '../../../../../core/util/app_utils.dart';
import '../../../../../core/widgets/app_shimmer_box.dart';

class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppShimmerBox(height: 28, width: 220),
        AppGaps.v12,
        AppShimmerBox(height: 18, width: 300),
        AppGaps.v20,
        AppShimmerBox(height: 220),
        AppGaps.v14,
        AppShimmerBox(height: 144),
        AppGaps.v14,
        AppShimmerBox(height: 144),
      ],
    );
  }
}
