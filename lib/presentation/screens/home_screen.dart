import 'package:flutter/material.dart';
import 'package:sample/presentation/screens/post_grid_screen.dart';
import 'package:sample/presentation/screens/status_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Instagram Status UI Clone")),
      body: Column(
        children: [
          const StatusList(),
          Expanded(
            child: PostGrid(), // 🖼 Posts below
          ),
        ],
      ),
    );
  }
}
