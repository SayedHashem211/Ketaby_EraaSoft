import 'package:flutter/material.dart';

import '../../../data/models/product_model.dart';

class ItemComponent extends StatelessWidget {
  final ProductModel model;
  const ItemComponent({super.key,
    required this.model});

  @override
  Widget build(BuildContext context) {
    // print(model.image);
    return SizedBox(
        height: MediaQuery.of(context).size.height*0.4,
        width: MediaQuery.of(context).size.width*0.4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: (){},
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    height: MediaQuery.of(context).size.height*0.15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: NetworkImage(model.image,),fit: BoxFit.contain,),)
                ),
                // child: Image.network(model.image,fit: BoxFit.contain,)),
                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                Text(model.name, maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    )),
                SizedBox(height:MediaQuery.of(context).size.height*0.005),
                Text(model.category, maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey
                    )),
                Text(model.price, maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    )),
                SizedBox(height: MediaQuery.of(context).size.height*0.005),
                Text(model.priceAfterDiscount.toString(), maxLines: 1,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.green
                    )),
              ],
            ),
          ),
        )
    );
  }
}