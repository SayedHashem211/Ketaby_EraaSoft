import 'package:buildcondition/buildcondition.dart';
import 'package:e_commerce_eraasoft/core/utils/custom_button.dart';
import 'package:e_commerce_eraasoft/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductDetailsScreen extends StatefulWidget {

  final dynamic productId;
  final dynamic name;
  final dynamic category;
  final dynamic description;
  final dynamic price;
  final dynamic priceAfterDiscount;
  final dynamic imageUrl;


  const ProductDetailsScreen({
   super.key,
   required this.productId,
    required this.name,
  required this.category,
  required this.description,
  required this.price,
  required this.priceAfterDiscount,
  required this.imageUrl
    });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

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
    if (state is AddToFavouriteSuccessState){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Added To Favourite!'),
          duration: Duration(seconds: 1),
          showCloseIcon: true,
        ),
      );
    }
    if (state is AddToFavouriteErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong'),
          duration: Duration(seconds: 1),
          showCloseIcon: true,
        ),
      );
    }


    if (state is RemoveFromFavouriteSuccessState){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('removed To Favourite!'),
          duration: Duration(seconds: 1),
          showCloseIcon: true,
        ),
      );
    }
    if (state is RemoveFromFavouriteErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong'),
          duration: Duration(seconds: 1),
          showCloseIcon: true,
        ),
      );
    }


    if (state is AddToCartSuccessState) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Added Successfully'),
          duration: Duration(seconds: 1),
          showCloseIcon: true,
        ),
      );

      Navigator.pop(context);

    }
    if (state is AddToCartErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something Went Wrong')),
      );
    }
  },
  builder: (context, state) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width*0.81,
                        height: MediaQuery.of(context).size.height * 0.46,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.imageUrl,
                            ),
                            fit: BoxFit.contain,
                          ),
                        )),
                    SizedBox(width: 2.w,),
                    InkWell(
                        onTap: (){
                          if (cubit.isFavourite == false) {
                            cubit.addToFavourite(
                                id: widget.productId.toString());
                           cubit.isFavourite = true;
                          }
                          else if (cubit.isFavourite == true) {
                            cubit.removeFromFavourite(
                                id: widget.productId.toString());
                            cubit.isFavourite = false;
                          }



                        },
                        child:
                        cubit.isFavourite?
                        const Icon(Icons.favorite_outlined,size: 35,color: Colors.red,)
                            :
                        const Icon(Icons.favorite_outline,size: 35,)),
                    SizedBox(width: 0.2.w,),
                  ],
                ),
                SizedBox(height: 10.h,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.84,
                  child: Text(widget.name , style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                  ),),
                ),
                SizedBox(height: 2.h,),
                Row(
                  children: [
                    Text(widget.category , style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                    ),),
                    const Spacer(),
                    Column(
                      children: [
                        Text("${widget.price}\$", style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                        ),),
                        Text("${widget.priceAfterDiscount.toString()}\$", style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF05A4A6),
                          overflow: TextOverflow.ellipsis,
                        ),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4.h,),
                const Text("Description" , style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                ),),
                SizedBox(height: 3.h,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.98,
                  child: Text(widget.description , style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey
                  ),),
                ),
                SizedBox(height: 6.h,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: 55.h,
                  child: BuildCondition(
                    condition: true,
                    builder: (context) => CustomButton(
                        text: "Add To Cart",
                        onTap: (){
                          cubit.addToCart(id: widget.productId.toString());
                        }
                    ),
                  ),
                )

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
