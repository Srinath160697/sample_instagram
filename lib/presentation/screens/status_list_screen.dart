import 'package:flutter/material.dart';
import 'package:sample/core/common_widget/common_sheet.dart';
import 'package:sample/data/fake_data/status_data.dart';

class StatusList extends StatelessWidget {
  const StatusList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: fakeStatusList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return GestureDetector(
              onTap: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => const CommentSheet(),
              ),
              child: Container(
                width: 90,
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: const [
                    CircleAvatar(radius: 35, child: Icon(Icons.add)),
                    SizedBox(height: 5),
                    Text("Add"),
                  ],
                ),
              ),
            );
          }

          final status = fakeStatusList[index - 1];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullScreenStatus(image: status.image),
                ),
              );
            },
            child: Container(
              width: 90,
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(status.image),
                  ),
                  const SizedBox(height: 5),
                  Text(status.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FullScreenStatus extends StatelessWidget {
  final String image;

  const FullScreenStatus({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(child: Image.asset(image)),

          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => const CommentSheet(),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink, // Button background
                  foregroundColor: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 14,
                  ), // Inner padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                    side: const BorderSide(
                      color: Colors.white, // Optional border
                      width: 1.5,
                    ),
                  ),
                  elevation: 6, // Shadow
                ),
                child: const Text(
                  "Comment",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
