import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_eraasoft/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/get_slider_data_model.dart';
import '../widgets/custom_best_Seller_item.dart';
import '../widgets/custom_category_item.dart';


class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  // late PageController pageController;
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
    //pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2,
                          viewportFraction: .9,
                          disableCenter: true,
                          autoPlay: true,
                          autoPlayAnimationDuration: const Duration(milliseconds: 2000),

                        ),
                        items:  cubit.slidersData
                            .map((item) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color:Colors.black,
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: Image.network(item.image,).image,
                                    fit: BoxFit.cover
                                )
                            ),
                            height: 50,
                          ),
                        ))
                            .toList(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('Best Seller Products',style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,

                            ),),
                            const Spacer(),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_right))
                          ],
                        ),
                        cubit.bestSellerData.isNotEmpty?
                        Column(
                          children: [
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.34,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context,
                                      index) => ItemComponent (model:cubit.bestSellerData[index] ,),
                                  separatorBuilder:
                                      (context, index) =>
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.01,
                                      ),
                                  itemCount: cubit.bestSellerData.length),
                            ),
                          ],
                        ):
                        const Text(""),
                        CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 2,
                            viewportFraction: .9,
                            disableCenter: true,
                            onPageChanged: (index,i) {
                              cubit.changePageIndex(index);
                            },

                          ),

                          items:cubit.sliderImages
                              .map((item) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:Colors.black,
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  image: DecorationImage(
                                      image: AssetImage(item,),
                                      fit: BoxFit.cover
                                  )
                              ),
                              height: 50,
                            ),
                          ))
                              .toList(),

                        ),
                        Center(
                          child: CarouselIndicator(
                            count: cubit.sliderImages.length,
                            index: cubit.pageIndex,
                            color: Colors.grey,
                            activeColor: const Color(0xFF05A4A6),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('Categories',style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,

                            ),),
                            const Spacer(),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_right))
                          ],
                        ),
                        cubit.categories.isNotEmpty?
                        Column(
                          children: [
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.2,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context,
                                      index) => CategoryComponent (model:cubit.categories[index] ,),
                                  separatorBuilder:
                                      (context, index) =>
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.01,
                                      ),
                                  itemCount: cubit.categories.length),
                            ),
                          ],
                        ) :
                        const Text(""),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('New Arrival Products',style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,

                            ),),
                            const Spacer(),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard_arrow_right))
                          ],
                        ),
                        cubit.newArrivalData.isNotEmpty?
                        Column(
                          children: [
                            Container(
                              height:
                              MediaQuery.of(context).size.height * 0.33,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context,
                                      index) => ItemComponent(model:cubit.newArrivalData[index] ,),
                                  separatorBuilder:
                                      (context, index) =>
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.01,
                                      ),
                                  itemCount: cubit.newArrivalData.length),
                            ),
                          ],
                        ) :
                        const Text(""),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
