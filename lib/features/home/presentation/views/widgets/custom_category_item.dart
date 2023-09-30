import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/category_model.dart';


class CategoryComponent extends StatelessWidget {
  final CategoryModel model;
  const CategoryComponent({super.key,
    required this.model});

  @override
  Widget build(BuildContext context) {
    // print(model.image);
    return SizedBox(
        height: MediaQuery.of(context).size.height*0.3,
        width: MediaQuery.of(context).size.width*0.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: (){},
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
                Text(model.name, maxLines: 2,
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