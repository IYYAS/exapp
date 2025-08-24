import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.3,
              child: Stack(
                children: [
                  // Background Cover Image
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(height * 0.055),
                      bottomRight: Radius.circular(height * 0.055),
                    ),
                    child: Image.network(
                      "https://i.pravatar.cc/300?img=15",
                      width: width,
                      height: height * 0.26,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox();
                      },
                    ),
                  ),

                  // Profile Image with Edit Icon
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: [
                        Container(
                          width: height * 0.132,
                          height: height * 0.132,
                          margin: EdgeInsets.only(top: height * 0.015),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: height * 0.0055,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              "https://i.pravatar.cc/300?img=15",
                              fit: BoxFit.cover,
                              width: height * 0.1,
                              height: height * 0.1,
                              errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person, size: 40, ),
                            ),
                          ),
                        ),

                        // ✏️ Edit Icon Overlay
                        Positioned(
                          right: 2,
                          bottom: 6,
                          child: CircleAvatar(
                            backgroundColor: Color(0xffFFFFFF),
                            radius: height * 0.015,
                            child: const Icon(
                              color: Colors.black,
                              Icons.edit,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),


            // Container(
            //   width: double.infinity,
            //   height: 160,
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Stack(
            //         alignment: Alignment.bottomRight,
            //         children: [
            //           CircleAvatar(
            //             radius: 50,
            //             backgroundImage: NetworkImage(
            //               "https://i.pravatar.cc/300?img=15", // profile image
            //             ),
            //           ),
            //           CircleAvatar(
            //             radius: 16,
            //             child: Icon(Icons.edit, size: 18,),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

            const SizedBox(height: 20),

            // Form fields
            _buildTextField("Username", "maria_francis"),
            _buildTextField("Display Name", "Maria Francis"),
            _buildTextField("Professional Title", "Model"),
            _buildTextField("Bio",
                "Passionate about all things fashion! Sharing my style, trends, and inspiration to help you express your unique self through clothing. ✨\n#FashionLover #StyleInspo",
                maxLines: 4),
            _buildTextField("Height", "5'6\""),
            _buildTextField("Measurements", "34-26-36"),

            const SizedBox(height: 20),

            // Update Button
            ElevatedButton(
              
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffB86ACA),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Update",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 6),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
