import 'package:flutter/material.dart';

import '../onboardscreensecond/onboardscreensecond.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 28,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Go back
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: Handle Skip action
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Placeholder for logo icon
                      const Icon(
                        Icons.show_chart, // Replace with your logo asset
                        size: 32,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Ex Social",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
            
                // Description text
                Container(
                    width: 249,
                    height: 249,
            
                    child:
                    Image.asset("assets/images/images/welcomescrren.png",)
                ),
                SizedBox(height: 50,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.search, size: 28, color: Colors.black87),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Browse verified profiles of actors, musicians, creators, and more.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
            
                SizedBox(height: 20),
            
                // Feature 2
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.star_outline, size: 28, color: Colors.black87),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Send messages, request video calls, or book appearances — it’s fast, easy, and secure.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 60,),
            
                // Next Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GetStartedScreen(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB865C6), // Purple
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            
                const SizedBox(height: 20),
            
                // Sign In link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.black87),
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: Navigate to Sign In
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
