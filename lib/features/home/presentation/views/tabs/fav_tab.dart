import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/home_cubit.dart';
import '../widgets/custom_fav_product.dart';


class FavouriteTab extends StatefulWidget {
  const FavouriteTab({Key? key}) : super(key: key);

  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {

  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                BuildCondition(
                  condition: state is! GetAllProductsLoadingState,
                  builder: (context) =>
                      BuildCondition(
                        condition:
                        cubit.favouriteProducts.isNotEmpty,
                        builder: (context) => ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cubit.favouriteProducts.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  margin: const EdgeInsets.all(5),
                                  child: CustomFavouriteWidget(model: cubit.favouriteProducts[index] ,

                                  )
                              );
                            }
                        ),
                        fallback: (context) => Padding(
                          padding: const EdgeInsets.only(
                              top: 240, right: 8, left: 8),
                          child: Text(
                            " No Favourite Products Yet",
                            style: GoogleFonts.roboto(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),),
                        ),
                      ),
                  fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
