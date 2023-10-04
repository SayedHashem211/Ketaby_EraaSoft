import 'package:e_commerce_eraasoft/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/cart_model.dart';


class CustomCartWidget extends StatefulWidget {
  final CartModel model;

   const CustomCartWidget({super.key, required this.model});

  @override
  State<CustomCartWidget> createState() => _CustomCartWidgetState();
}

class _CustomCartWidgetState extends State<CustomCartWidget> {
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
        if (state is UpdateCartSuccessState){
          cubit.getCartProducts();
        }
      },
      builder: (context, state) {
        return Container(
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width * 0.86,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.23,
                    height: MediaQuery.of(context).size.height * 0.18,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.model.itemProductImage ?? "",
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
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Text(widget.model.itemProductName ?? "",
                          maxLines: 2,
                          softWrap: true,
                          //textScaleFactor: 0.4,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey
                          )),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      height: 40.h,
                      width: 95.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey
                        )
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          InkWell(
                              onTap: (){
                                int quantity = cubit.addQuantity(widget.model.itemQuantity);
                                cubit.updateCart(id: widget.model.itemId.toString(), quantity: quantity.toString());
                                setState(() {
                                  cubit.getCartProducts();
                                });
                              },
                              child: const CircleAvatar(
                                backgroundColor: Color(0xFF05A4A6),
                                  radius: 12,
                                  child: Icon(Icons.add,color: Colors.black,size: 24,))),
                          SizedBox(width: 2.w,),

                          Text(widget.model.itemQuantity.toString(),style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black
                          ),),

                           SizedBox(height: 10.h,),
                           Column(
                             children: [
                               SizedBox(height: 2.h,),
                               InkWell(
                                   onTap: (){
                                     int quantity = cubit.subtractQuantity(widget.model.itemQuantity);
                                     cubit.updateCart(id: widget.model.itemId.toString(), quantity: quantity.toString());
                                     setState(() {
                                       cubit.getCartProducts();
                                     });
                                   },
                                   child: Column(
                                     children: [
                                       SizedBox(height: 5.h,),
                                       const CircleAvatar(
                                         backgroundColor: Color(0xFF05A4A6),
                                           radius: 12,
                                           child: Icon(Icons.minimize_rounded,color: Colors.black,size: 14,weight: 1,)),
                                     ],
                                   )),
                             ],
                           ),
                           SizedBox(height: 10.h,),
                        ],
                      ),
                    ),

                  ],
                ),
                SizedBox(width: 1.w,),
                Column(
                  children: [
                    SizedBox(height: 3.h,),
                     InkWell(
                         onTap: (){
                           cubit.removeFromCart(id: widget.model.itemId.toString());
                         },
                         child: const Icon(Icons.delete,color: Colors.red,size: 25,)),
                    SizedBox(height: 12.h,),
                    Text(widget.model.itemProductPrice ?? "",
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
                    Text(
                        widget.model.itemProductPriceAfterDiscount.toString(),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green)),
                  ],
                )
                // SizedBox(
                //   width: 6.w,
                // ),
                // Column(
                //   children: [
                //     const Icon(
                //       Icons.favorite_outline,
                //       size: 28,
                //     ),
                //     const Spacer(),
                //     const Icon(
                //       Icons.add_shopping_cart_outlined,
                //       size: 28,
                //     )
                //   ],
                // )
              ],
            ));
      },
    );
  }
}
