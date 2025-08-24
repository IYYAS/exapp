import 'package:exapp/mainpage/dashboard/addimagepage/cubit/addimage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/video/videoadd.dart';
import 'component/settingpage.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocProvider(
  create: (context) => AddimageCubit(),
  child: BlocBuilder<AddimageCubit, AddimageState>(
  builder: (context, state) {
    final cubit = context.read<AddimageCubit>();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // ✅ prevents overflow when keyboard appears
      
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
      
          // ✅ use SingleChildScrollView instead of Column
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: 0,),
                    Container(
                        width: 100,
                        height: 30,
                        child:Theme.of(context).brightness == Brightness.dark ?

                        Image.asset( "assets/images/images/black.png")
                            :Image.asset( "assets/images/images/img.png")
                    ),
                    Spacer(),
                    IconButton(
                      icon: const Icon(Icons.settings, ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsPage(),));
                      },
                    ),
                  ],
                ),
      
                const Text(
                  "Create Post",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Share Your thoughts and media",
                  style: TextStyle(),
                ),
                const SizedBox(height: 20),
      
                // Upload Box
                Container(
                  width: double.infinity,
                  height: height * 0.25,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:
                  cubit.selectedVideo != null ?
                  cubit.selectedImage != null
                      ? Image.file(
                    cubit.selectedImage!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                      : cubit.selectedVideo != null
                      ? Center(
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: VideoPlayerWidget(file: cubit.selectedVideo!),
                    ),
                  )
                      : Center(
                    child: Text(
                      "Drag and drop an image or video here,\nor click one of the buttons below",
                      textAlign: TextAlign.center,
                    ),
                  ):Center(
                    child: Text(
                      "Drag and drop an image or video here,\nor click one of the buttons below",
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
                const SizedBox(height: 20),
      
                // Text Input
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "What's on your mind?",
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                ),
                const SizedBox(height: 20),
      
                // Upload Buttons
                BlocConsumer<AddimageCubit, AddimageState>(
                  listener: (context, state) {
                    if (state is AddimageImage) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Image selected: ${state.image.path}")),
                      );
                    } else if (state is Addimagevideo) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Video selected: ${state.video.path}")),
                      );
                    }
                  },
                  builder: (context, state) {
                    return
                      Row(
                      children: [
                        IconButton(
                      onPressed:
                          () {
                            context.read<AddimageCubit>()..pickImageFromGallery();
      
                          }
                          ,
                          icon: const Icon(Icons.image, size: 28),
                        ),
                        IconButton(
                    onPressed: () {
      
                       context.read<AddimageCubit>()..pickVideoFromGallery();
      
                    }
                          ,
                          icon: const Icon(Icons.videocam, size: 28),
                        ),
                        const Spacer(),
      
                        CircleAvatar(
                          radius: 28, // size of the circle
                          backgroundColor: Color(0xffB86ACA), // circle color
                          child: IconButton(
                            onPressed: () {
                            },
                            icon: const Icon(Icons.send, color: Colors.white, size: 28),
                          ),
                        )                    ],
                    );
                  },
                ),
                const SizedBox(height: 80), // ✅ gives space so FAB won't overlap
              ],
            ),
          ),
        ),
      
        // Floating Send Button
      
      ),
    );
  },
),
);
  }
}
