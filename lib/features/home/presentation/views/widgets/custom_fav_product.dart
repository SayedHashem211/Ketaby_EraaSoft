import 'package:e_commerce_eraasoft/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce_eraasoft/features/home/presentation/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/product_model.dart';

class CustomFavouriteWidget extends StatefulWidget {
  final ProductModel model;

  const CustomFavouriteWidget({super.key, required this.model});

  @override
  State<CustomFavouriteWidget> createState() => _CustomFavouriteWidgetState();
}

class _CustomFavouriteWidgetState extends State<CustomFavouriteWidget> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    // print(model.image);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Container(
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.model.image,
                        ),
                        fit: BoxFit.contain,
                      ),
                    )),
                SizedBox(
                  width: 0.1.w,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.37,
                      child: Text(widget.model.name,
                          maxLines: 2,
                          softWrap: true,
                          //textScaleFactor: 0.4,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    SizedBox(height: 4.h),
                    Text(widget.model.category,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                    SizedBox(height: 5.h),
                    Text(widget.model.price,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        )),
                    SizedBox(height: 5.h),
                    Text(widget.model.priceAfterDiscount.toString(),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green)),
                  ],
                ),
                SizedBox(
                  width: 6.w,
                ),
                const Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 28,
                      color: Colors.red,
                    ),
                    Spacer(),
                    Icon(
                      Icons.add_shopping_cart_outlined,
                      size: 28,
                    )
                  ],
                )
              ],
            ));
      },
    );
  }
}
