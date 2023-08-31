import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final masterProvider = StateProvider<int>((ref) => 0);

class MasterScreen extends StatelessWidget {
  const MasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}

class MyBottomAppBar extends ConsumerWidget {
  const MyBottomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(masterProvider);
    return SizedBox(
      height: 78,
      child: Row(
        children: children.map((e) {
          int current = children.indexOf(e);
          return Expanded(
            child: InkWell(
              onTap: () => ref.read(masterProvider.notifier).state = current,
              child: Column(
                children: [
                  Icon(
                    e.icon,
                    color: index == current ? Colors.blueAccent : Colors.black,
                  ),
                  Text(e.title),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

List<BottomBarItem> children = [
  BottomBarItem(title: 'Home', icon: Icons.home),
  BottomBarItem(title: 'Categories', icon: Icons.category),
  BottomBarItem(title: 'My Bag', icon: Icons.shopping_bag),
  BottomBarItem(title: 'Profile', icon: Icons.person),
];

class BottomBarItem {
  String title;
  IconData icon;
  BottomBarItem({required this.title, required this.icon});
}
