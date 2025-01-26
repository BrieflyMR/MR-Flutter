import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../core/constants.dart';
import '../widgets/bottom_menu.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final surface = lightColors["surface"]!;
    return Scaffold(
      backgroundColor: surface,
      body: Column(
        children: [
          Text(
            "Label Small",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            "Label Medium",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            "Label Large",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            "Body Small",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            "Body Medium",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "Body Large",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            "Title Small",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            "Title Medium",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "Title Large",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "Headline Small",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            "Headline Medium",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "Headline Large",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            "Display Small",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            "Display Medium",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            "Display Large",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
