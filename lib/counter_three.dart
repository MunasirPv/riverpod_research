import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/counter_three/counter_state.dart';
import 'package:riverpod_learning/counter_three/counter_state_notifier.dart';

final counterProvider =
    StateNotifierProvider<CounterStateNotifier, CounterState>((ref) {
  return CounterStateNotifier();
});

class CounterThree extends StatelessWidget {
  const CounterThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Riverpod Counter Demo 3'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, ref, child) {
                return Text(
                  '${ref.watch(counterProvider).counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).increment();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 5),
              FloatingActionButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).decrement();
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          );
        },
      ),
    );
  }
}
