import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/injection.dart';
import '../../../../core/constants/app_strings.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';
import '../widgets/counter_view.dart';

/// Counter page - entry point for the counter feature
/// Uses BlocProvider to inject the CounterBloc
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CounterBloc>()..add(const LoadCounter()),
      child: const CounterPageContent(),
    );
  }
}

/// Content of the counter page
/// Separated to ensure BlocProvider is available in context
class CounterPageContent extends StatelessWidget {
  const CounterPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.counterTitle),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CounterLoaded) {
            return CounterView(
              value: state.counter.value,
              onIncrement: () {
                context.read<CounterBloc>().add(const IncrementCounterEvent());
              },
              onDecrement: () {
                context.read<CounterBloc>().add(const DecrementCounterEvent());
              },
              onReset: () {
                context.read<CounterBloc>().add(const ResetCounterEvent());
              },
            );
          } else if (state is CounterError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(const LoadCounter());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
