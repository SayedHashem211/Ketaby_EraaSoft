import 'package:e_commerce_eraasoft/features/home/data/models/product_model.dart';
import 'package:e_commerce_eraasoft/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/category_model.dart';
import '../product_details_screen.dart';


class CategoryComponent extends StatelessWidget {
  final CategoryModel categoriesModel;
  final ProductModel productModel;
  const CategoryComponent({super.key,
    required this.categoriesModel,
    required this.productModel
  });

  @override
  Widget build(BuildContext context) {
    // print(model.image);
    return SizedBox(
        height: MediaQuery.of(context).size.height*0.3,
        width: MediaQuery.of(context).size.width*0.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ProductDetailsScreen(
                  productId: productModel.id,
                  name: productModel.name,
                  category: productModel.category,
                  description: productModel.description,
                  price: productModel.price,
                  priceAfterDiscount: productModel.priceAfterDiscount,
                  imageUrl: productModel.image,
                );
              }));
              HomeCubit.get(context).showCategoryDetails(categoriesModel.id);
            },
            padding: EdgeInsets.zero,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.25,
                    height: MediaQuery.of(context).size.height*0.13,
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('assets/images/books.jpg',),fit: BoxFit.cover,opacity: 0.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
                Text(categoriesModel.name, maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    )),
              ],
            ),
          ),
        )
    );
  }
}