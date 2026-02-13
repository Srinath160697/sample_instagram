import 'package:flutter/material.dart';
import 'package:sample/data/fake_data/status_data.dart';
import 'package:sample/data/model/status_model.dart';

class PostGrid extends StatelessWidget {
  const PostGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(2),
      itemCount: instaStatusList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        final post = instaStatusList[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    FeedScreen(posts: instaStatusList, initialIndex: index),
              ),
            );
          },
          child: Image.asset(post.image, fit: BoxFit.cover),
        );
      },
    );
  }
}

class FeedScreen extends StatefulWidget {
  final List<StatusModel> posts;
  final int initialIndex;

  const FeedScreen({
    super.key,
    required this.posts,
    required this.initialIndex,
  });

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: widget.posts.length,
        itemBuilder: (context, index) {
          final post = widget.posts[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(post.image, fit: BoxFit.cover),

              /// Right Side Action Bar
              Positioned(
                bottom: 80,
                right: 12,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildActionIcon(Icons.favorite_border, "12K"),
                    const SizedBox(height: 20),
                    _buildActionIcon(Icons.chat_bubble_outline, "340"),
                    const SizedBox(height: 20),
                    _buildActionIcon(Icons.send, "120"),
                    const SizedBox(height: 20),
                    _buildActionIcon(Icons.thumb_up_alt_outlined, "1.2K"),
                  ],
                ),
              ),
              Positioned(
                bottom: 40,
                left: 20,
                right: 20,
                child: Text(
                  post.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, String count) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 4),
        Text(count, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
