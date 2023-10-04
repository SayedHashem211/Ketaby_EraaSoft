import 'package:buildcondition/buildcondition.dart';
import 'package:e_commerce_eraasoft/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_product_widget.dart';


class BooksTab extends StatefulWidget {
  const BooksTab({Key? key}) : super(key: key);

  @override
  State<BooksTab> createState() => _BooksTabState();
}

class _BooksTabState extends State<BooksTab> {

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
                    cubit.allProducts.isNotEmpty,
                    builder: (context) => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cubit.allProducts.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0),
                            margin: const EdgeInsets.all(5),
                            child: CustomProductWidget(model: cubit.allProducts[index] ,

                            )
                          );
                        }
                    ),
                    fallback: (context) => Padding(
                      padding: const EdgeInsets.only(
                          top: 100, right: 10, left: 10),
                      child: Text(
                        "         No Products Yet",
                        style: GoogleFonts.roboto(
                            fontSize: 30.sp,
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
