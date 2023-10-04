import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/transitions.dart';
import '../../cubit/home_cubit.dart';
import '../edit_profile_screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return state is GetProfileDataLoadingState ?
        const Center(
          child: CircularProgressIndicator(),
        )
        :
        Scaffold(
          backgroundColor:  Colors.white,
          body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(cubit.profileModel?.data?.image ?? "",height: 180,width: 100, ),
                      ),
                      SizedBox(height: 6.h,),
                      Text(
                        "Name",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                            fontSize: 24.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          cubit.profileModel?.data?.name ?? "null",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "Email",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                            fontSize: 24.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          cubit.profileModel?.data?.email ?? "null",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 6.sp,
                      ),
                      Text(
                        "City",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                            fontSize: 24.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          cubit.profileModel?.data?.city ?? "null",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "Phone",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                            fontSize: 24.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          cubit.profileModel?.data?.phone ?? "null",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                              fontSize: 17.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CustomPageRoute1(
                                          child: EditProfileDataScreen(
                                            name: cubit.profileModel?.data?.name ?? "null",
                                            email: cubit.profileModel?.data?.email ?? "null",
                                            city : cubit.profileModel?.data?.city ?? "null",
                                            phone : cubit.profileModel?.data?.phone ??"null"
                                          )));
                                },
                                child: Text(
                                "Edit Profile",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
                                      fontSize: 25.sp,
                                      color: const Color(0xFF05A4A6),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              const Icon(
                                Icons.edit,
                                size: 30,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),

        );
      },
    );
  }
}
