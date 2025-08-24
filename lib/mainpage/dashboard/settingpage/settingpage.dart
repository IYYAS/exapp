import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'component/editpage.dart';
import 'cubit3/chnge_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("maria_francis", style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: const Icon(Icons.arrow_back),
          actions: const [
            Icon(Icons.more_vert),
            SizedBox(width: 12),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Picture
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://i.pravatar.cc/300?img=15"),
              ),
              const SizedBox(height: 8),

              // Name
              const Text("Maria Francis", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),

              // Tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: const Text("Model", style: TextStyle(fontSize: 12)),
              ),
              const SizedBox(height: 12),

              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat("11.2 k", "Posts"),
                  _buildStat("15.1 M", "Followers"),
                  _buildStat("636", "Following"),
                ],
              ),
              const SizedBox(height: 12),

              // Bio
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Passionate about all things fashion! Sharing my style, "
                      "trends, and inspiration to help you express your unique self "
                      "through clothing. ✨\n"
                      "#FashionLover #StyleInspo",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 16),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EditProfilePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffB86ACA),
                      side: const BorderSide(color: Color(0xffB86ACA)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Edit Profile"),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xffB86ACA)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("Share Profile"),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Tabs with Cubit
              BlocBuilder<ProfileCubit, int>(
                builder: (context, selectedTab) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTabIcon(context, Icons.grid_on, 0, selectedTab),
                      _buildTabIcon(context, Icons.video_collection_outlined, 1, selectedTab),
                      _buildTabIcon(context, Icons.favorite_border, 2, selectedTab),
                    ],
                  );
                },
              ),

              const SizedBox(height: 12),

              // Content with Cubit
              BlocBuilder<ProfileCubit, int>(
                builder: (context, selectedTab) {
                  if (selectedTab == 0) return _buildPostsGrid();
                  if (selectedTab == 1) return _buildVideosGrid();
                  return _buildFavoritesGrid();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildStat(String number, String label) {
    return Column(
      children: [
        Text(number, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildTabIcon(BuildContext context, IconData icon, int index, int selectedTab) {
    final isSelected = index == selectedTab;

    return GestureDetector(
      onTap: () {
        context.read<ProfileCubit>().setTab(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Color(0xffB86ACA) : Colors.grey,
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 70,
            color: isSelected ? Color(0xffB86ACA): Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildPostsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage("https://i.pravatar.cc/300?img=${index + 30}"),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _buildVideosGrid() {
    return Container(
      height: 200,
      alignment: Alignment.center,
      child: const Text("🎬 Videos Coming Soon",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildFavoritesGrid() {
    return Container(
      height: 200,
      alignment: Alignment.center,
      child: const Text("❤️ Favorites Empty",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }
}
