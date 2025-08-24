import 'package:exapp/mainpage/dashboard/search/cubit/searchdefault_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class GridViewExample extends StatefulWidget {


  @override
  State<GridViewExample> createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading delay, for example 3 seconds
    Future.delayed(Duration(seconds:1), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  Widget buildShimmerGridItem() {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade300
          : Colors.grey.shade700,
      highlightColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade100
          : Colors.grey.shade500,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget buildShimmerListItem() {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade300
          : Colors.grey.shade700,
      highlightColor: Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade100
          : Colors.grey.shade500,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
        ),
        title: Container(
          height: 16,
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 8),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchdefaultCubit(),
      child: BlocBuilder<SearchdefaultCubit, SearchdefaultState>(
        builder: (context, state) {
         final cubit = context.read<SearchdefaultCubit>();
          return SafeArea(
            child: Scaffold(

              body: SingleChildScrollView(

                child: Column(
                  children: [
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
                    // Search bar
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:
                      TextField(
                        onChanged: (value) {
                          cubit.search(value);
                        },
                        decoration: InputDecoration(
                          hintText: "Search...",
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xffB86ACA),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xffB86ACA), // default border color
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xffB86ACA), // border color when not focused
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xff7B2CBF), // border color when focused
                              width: 2,
                            ),
                          ),
                        ),
                      )
                    ),
                    if (_isLoading)
                    // Show shimmer effect
                      cubit.filteredNames.isEmpty
                          ?
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(8),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return buildShimmerGridItem();
                        },
                      )
                          : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) =>
                            buildShimmerListItem(),
                      )
                    else
                    // GridView
                    cubit.filteredNames.isEmpty
                    // ✅ Show images if no search
                        ?
                    MasonryGridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(8),
                      crossAxisCount: 2, // 2 columns
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      itemCount: cubit.images.length,
                      itemBuilder: (context, index) {
                        final img = cubit.images[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            img,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    )                    // ✅ Show names when search
                        : ListView.builder(
                      shrinkWrap: true,

                      physics: NeverScrollableScrollPhysics(), // prevent nested scroll conflict

                      itemCount: cubit.filteredNames.length,
                      itemBuilder: (context, index) {


                        final name = cubit.filteredNames[index];
                        return ListTile(
                          leading: CircleAvatar(
                           backgroundImage: NetworkImage(cubit.images[index]),
                          ),
                          title: Text(name),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
