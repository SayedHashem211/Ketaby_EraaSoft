import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce_eraasoft/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../login/presentation/views/login_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }

  List<BottomNavyBarItem> tabs = [
    BottomNavyBarItem(
      icon: const Icon(Icons.home, ),
      title: const Text(
        "Home",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF05A4A6)),
      ),
      activeColor: const Color(0xFF05A4A6),
      inactiveColor: Colors.grey,
    ),
    BottomNavyBarItem(
      icon: const Icon(
        Icons.book,
      ),
      title: const Text(
        "Books",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color:Color(0xFF05A4A6)),
      ),
      activeColor: const Color(0xFF05A4A6),
      inactiveColor: Colors.grey,
    ),
    BottomNavyBarItem(
      icon: const Icon(Icons.favorite_outline, ),
      title: const Text("Favourite",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF05A4A6))),
      activeColor: const Color(0xFF05A4A6),
      inactiveColor: Colors.grey,
    ),
    BottomNavyBarItem(
      icon: const Icon(Icons.shopping_cart,),
      title: const Text(
        "Cart",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF05A4A6)),
      ),
      activeColor: const Color(0xFF05A4A6),
      inactiveColor: Colors.grey,
    ),
    BottomNavyBarItem(
      icon:
      const Icon(Icons.perm_contact_cal_rounded, ),
      title: const Text(
        "Profile",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF05A4A6)),
      ),
      activeColor: const Color(0xFF05A4A6),
      inactiveColor: Colors.grey,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:Colors.transparent,
            elevation: 0,
            actions:  [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/bg.png"),
                radius: 20,
              ),
              SizedBox(width: 8.w,),
            ],
            title: Column(
              children: [
                SizedBox(height: 5.h,),
                Text(
                  "Hi, Sayed",
                  style: GoogleFonts.roboto(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(height: 1.h,),
                Text(
                  "What are you reading today?",
                  style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
                SizedBox(height: 3.h,),
              ],
            ),
            leading: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 12),
                 height: MediaQuery.of(context).size.height*0.25,
                 width: double.infinity,
                 decoration: const BoxDecoration(
                   color: Color(0xFF05A4A6),
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                      SizedBox(height: 30.h,),
                     SizedBox(height: 8.h,),
                     const CircleAvatar(
                       backgroundImage: AssetImage("assets/images/bg.png"),
                       radius: 30,
                     ),
                     SizedBox(height: 5.h,),
                     const Text("user name", style: TextStyle(
                       fontSize: 21,
                       color: Colors.white,
                       fontWeight: FontWeight.w700
                     ),),
                     SizedBox(height: 5.h,),
                     const Text("sekahashem@gmail.com", style: TextStyle(
                         fontSize: 16,
                         color: Colors.white,
                         fontWeight: FontWeight.w300
                     ),),


                   ],
                 ),
               ),
                SizedBox(height: 10.h,),
                const ListTile(
                  title: Text("Order History",style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 19
                  ),),
                  leading: Icon(Icons.history_edu,color: Colors.grey,),
                ),
                SizedBox(height: 5.h,),
                const Divider(color: Colors.grey,height: 1,thickness: 0.5,),
                SizedBox(height: 10.h,),
                const ListTile(
                  title: Text("Edit Profile",style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 19
                  ),),
                  leading: Icon(Icons.edit,color: Colors.grey,),
                ),
                SizedBox(height: 5.h,),
                const Divider(color: Colors.grey,height: 1,thickness: 0.5,),
                SizedBox(height: 10.h,),
                const ListTile(
                  title: Text("Change Password",style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 19
                  ),),
                  leading: Icon(Icons.published_with_changes_sharp,color: Colors.grey,),
                ),
                SizedBox(height: 5.h,),
                const Divider(color: Colors.grey,height: 1,thickness: 0.5,),
                SizedBox(height: 10.h,),
                ListTile(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                  },
                  title: const Text("LogOut",style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 19
                  ),),
                  leading: const Icon(Icons.logout,color: Colors.red,),
                ),
                SizedBox(height: 5.h,),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavyBar(
            backgroundColor: Colors.transparent,
            selectedIndex: cubit.currentIndex,
            showElevation: true,
            containerHeight: 60,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            iconSize: 30,
            onItemSelected: (index) => cubit.changeBot(index, context),
            items: tabs,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          body: SafeArea(child: cubit.screens[cubit.currentIndex]),
        );
      },
    );
  }
}
