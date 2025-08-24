import 'package:exapp/mainpage/dashboard/cubit/dashboard_cubit.dart';
import 'package:exapp/mainpage/dashboard/search/search.dart';
import 'package:exapp/mainpage/dashboard/settingpage/settingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'addimagepage/addimage.dart';
import 'homefeed/homefeed.dart';
import 'notification/notification.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DashboardCubit(),
        child: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            final cubit = context.read<DashboardCubit>();
            return Stack(alignment: Alignment.center,
              children: [
                cubit.naviterbottom == 1
                    ? HomeHeader()
                    : cubit.naviterbottom == 5
                    ? ProfilePage()
                    : cubit.naviterbottom == 2
                    ? GridViewExample()
                    : cubit.naviterbottom == 3
                    ? CreatePostPage()
                    : cubit.naviterbottom == 4
                    ? NotificationsPage()
                    : SizedBox(),
                Positioned(

                  bottom: 20,
                    child:
                    Center(
                      child: Card(
                         elevation: 7,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // Match same radius
                        ),
                        child: Container(
                          width: 400,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.black   // Dark mode → White background
                                : Colors.white,  // Light mode → Black background                          borderRadius: BorderRadius.circular(25),

                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30), // Match same radius
                            ),

                            elevation: 7,
                            child: Container(
                              width: 400,
                              height: 75,

                              decoration: BoxDecoration(

                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? Colors.black   // Dark mode → White background
                                      : Colors.white,  // Light mode → Black background
                                borderRadius: BorderRadius.circular(30),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                    onTap: () {
                                      cubit.set(1);
                                    },
                                    child:
                                    _buildNavItem(context,Icons.home_outlined,


                                      "Home",cubit.naviterbottom == 1,)),
                                InkWell(
                                    onTap: () {
                                      cubit.set(2);
                                    },
                                    child:
                                    _buildNavItem(context,Icons.circle_outlined, "Search", cubit.naviterbottom == 2,
                                    )),
                                InkWell(
                                    onTap: () {
                                      cubit.set(3);
                                    },
                                    child: _buildNavItem(context,Icons.add, "Create",
                                      cubit.naviterbottom == 3,

                                    )),
                                InkWell(
                                    onTap: () {
                                      cubit.set(4);
                                    },
                                    child: _buildNavItem(context,
                                        Icons.notifications_none, "Inbox",

                                      cubit.naviterbottom == 4,

                                    )),
                                InkWell(
                                    onTap: () {
                                      cubit.set(5);
                                    },
                                    child: _buildNavItem(context,Icons.person_outline, "Setting",
                                      cubit.naviterbottom == 5,

                                    )),
                              ],
                            ),
                                                    ),
                          ),
                                            ),
                      ),
                  ),
                ),
              ],
            );
          },
        ),
      ),

    );
  }
}

Widget _buildNavItem(BuildContext context,IconData icon, String label, bool isSelected, ) {
  return CircleAvatar(
    radius: 30,
    backgroundColor: isSelected ? const Color(0xffB86ACA) : Colors.transparent,
    child: Icon(
      icon,
      color: isSelected
          ? Colors.white
          : Theme.of(context).brightness == Brightness.dark
          ? Colors.white // Dark mode → black icon
          : Colors.black, // Light mode → white icon
    ),
  );
}
