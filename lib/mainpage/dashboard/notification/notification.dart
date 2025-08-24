import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      "name": "Aditi Raj",
      "action": "loved your post",
      "time": "9m",
      "image": "https://i.pravatar.cc/150?img=47",
      "icon": Icons.favorite,
      "hasActions": false,
    },
    {
      "name": "Riya Khan",
      "action": "loved your post",
      "time": "9m",
      "image": "https://i.pravatar.cc/150?img=32",
      "icon": Icons.favorite,
      "hasActions": false,
    },
    {
      "name": "Satish Kumar",
      "action": "12 mutual friends",
      "time": "10m",
      "image": "https://i.pravatar.cc/150?img=12",
      "icon": null,
      "hasActions": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10,),
                Container(
                    width: 100,
                    height: 30,
                    child:Theme.of(context).brightness == Brightness.dark ?

                    Image.asset( "assets/images/images/black.png")
                :Image.asset( "assets/images/images/img.png")
                )

              ],
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( width: 1),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // handle back button tap
                    },
                    child: Icon(Icons.arrow_back, size: 28, ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // handle menu button tap
                    },
                    child: Icon(Icons.more_vert, size: 28,),
                  ),
                ],
              ),
            ),
            ListView.builder(

              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final item = notifications[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(item["image"]),
                            ),
                            if (item["icon"] != null)
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(
                                    item["icon"],
                                    size: 14,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
                                  children: [
                                    TextSpan(
                                      text: item["name"],
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " ${item["action"]}",
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (item["hasActions"])
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffB86ACA),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Color(0xffB86ACA)),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text("Accept"),
                                    ),
                                    SizedBox(width: 8),
                                    OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(
                                            color: Color(0xffB86ACA)
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text("Decline",
                                          style: TextStyle()),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        Text(
                          item["time"],
                          style: TextStyle( fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
