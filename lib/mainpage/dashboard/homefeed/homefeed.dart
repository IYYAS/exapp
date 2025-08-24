import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgets/video/video.dart';
import 'component/comment.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading delay, after which shimmer will stop.
    Future.delayed(Duration(microseconds:30), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  Widget buildShimmerPost() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade300
            : Colors.grey.shade700,
        highlightColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade100
            : Colors.grey.shade500,        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header shimmer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  CircleAvatar(radius: 20, backgroundColor: Colors.white),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(width: 20, height: 20, color: Colors.white),
                ],
              ),
            ),
            SizedBox(height: 12),
            // Image shimmer block
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.white,
            ),
            SizedBox(height: 12),
            // Footer shimmer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Container(width: 40, height: 16, color: Colors.white),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              // Top Row: Logo + Notification
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo + App Name
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Container(
                          width: 100,
                          height: 30,
                          child:Theme.of(context).brightness == Brightness.dark ?

                          Image.asset( "assets/images/images/black.png")
                              :Image.asset( "assets/images/images/img.png")
                      )
                    ],
                  ),

                  // Notification Icon with dot
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {

                        },
                        icon: const Icon(Icons.mail_outline,color: Color(0xffB86ACA),
                            size: 28),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // User profile row
              Row(
                children: [
                  // Profile picture
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=47", // dummy profile img
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Greeting text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Good morning, Maria!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "@maria_francis",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (_isLoading)
              // Show shimmer placeholders
                ...List.generate(5, (index) => buildShimmerPost())
              else
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1, // example posts
            itemBuilder: (context, index) {
              return
                Container(

                  margin: const EdgeInsets.symmetric(vertical: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://i.pravatar.cc/150?img=5", // profile pic
                          ),
                        ),
                        title: Text("fella",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("10 mins ago"),
                        trailing: Icon(Icons.more_vert),
                      ),

                      // Post Image
                      Container(
                        width: double.infinity,
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://picsum.photos/id/237/400/250"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Footer actions
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Row(
                          children: [
                            // Like button
                            const Icon(Icons.favorite,color: Color(0xffB86ACA),),
                            const SizedBox(width: 4),
                            const Text("4.2k"),

                            const SizedBox(width: 16),

                            // Comment button
                            InkWell(
                              onTap: () {
                                CommentsBottomSheet.show(context);
                              },
                              child: const Icon(Icons.comment,color: Color(0xffB86ACA)),
                            ),
                            const SizedBox(width: 4),
                            const Text("273"),

                            const SizedBox(width: 16),

                            // Share button
                            const Icon(Icons.send,color: Color(0xffB86ACA)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );

            },
          ),

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1, // example posts
                itemBuilder: (context, index) {
                  return
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          const ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://i.pravatar.cc/150?img=5", // profile pic
                              ),
                            ),
                            title: Text("fella",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text("10 mins ago"),
                            trailing: Icon(Icons.more_vert),
                          ),

                          // Post Video
                          SizedBox(
                            height: 250,
                            width: double.infinity,
                            child: ProfessionalVideoPlayer(
                              videoUrl:
                              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Footer actions
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: Row(
                              children: [
                                // Like button
                                const Icon(Icons.favorite,color: Color(0xffB86ACA),),
                                const SizedBox(width: 4),
                                const Text("4.2k"),

                                const SizedBox(width: 16),

                                // Comment button
                                const Icon(Icons.comment,color: Color(0xffB86ACA),),
                                const SizedBox(width: 4),
                                const Text("273"),

                                const SizedBox(width: 16),

                                // Share button
                                const Icon(Icons.send,color: Color(0xffB86ACA),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );

                },
              ),
              SizedBox(height: 100,),

            ],
          ),
        ),
      ) ,
    );
  }
}
