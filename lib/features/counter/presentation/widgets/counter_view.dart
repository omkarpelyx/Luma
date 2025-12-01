import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';

/// Reusable counter display widget
/// Pure presentation component with no business logic
class CounterView extends StatelessWidget {
  const CounterView({
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
    super.key,
  });

  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Counter Value:', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 16),
          Text('$value', style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: onDecrement,
                heroTag: 'decrement',
                tooltip: AppStrings.decrementButton,
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 16),
              FloatingActionButton(
                onPressed: onIncrement,
                heroTag: 'increment',
                tooltip: AppStrings.incrementButton,
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: onReset,
            icon: const Icon(Icons.refresh),
            label: const Text(AppStrings.resetButton),
          ),
        ],
      ),
    );
  }
}
