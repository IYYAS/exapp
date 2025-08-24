import 'package:flutter/material.dart';

class CommentsBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.6,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 10),

                // Title
                const Text(
                  "1.1k Comments",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // Comments List
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      buildComment(
                        image: "https://i.pravatar.cc/150?img=5",
                        name: "Ankita Singhania",
                        comment:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        likes: 762,
                        time: "2 hours ago",
                      ),
                      buildComment(
                        image: "https://i.pravatar.cc/150?img=8",
                        name: "Yash Gupta",
                        comment:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        likes: 762,
                        time: "2 hours ago",
                      ),
                    ],
                  ),
                ),

                // Input Field
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Type comment",
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        child: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            // send comment
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }

  static Widget buildComment({
    required String image,
    required String name,
    required String comment,
    required int likes,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(image), radius: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(comment, style: const TextStyle(fontSize: 13)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.favorite_border, size: 16),
                    const SizedBox(width: 4),
                    Text("$likes"),
                    const SizedBox(width: 16),
                    Text(time,
                        style: const TextStyle(
                            fontSize: 12,
                           )),
                    const SizedBox(width: 16),
                    const Text("Reply",
                        style:
                        TextStyle(fontSize: 12, )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
