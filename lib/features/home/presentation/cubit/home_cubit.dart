import 'package:bloc/bloc.dart';
import 'package:e_commerce_eraasoft/core/networking/remote/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/remote/DioHelper.dart';
import '../../data/models/category_model.dart';
import '../../data/models/get_slider_data_model.dart';
import '../../data/models/product_model.dart';
import '../views/tabs/books_tab.dart';
import '../views/tabs/cart_tab.dart';
import '../views/tabs/fav_tab.dart';
import '../views/tabs/home_tab.dart';
import '../views/tabs/profile_tab.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  static HomeCubit get(context) => BlocProvider.of(context);

  // 2. bottom navy bar
  int currentIndex = 0;

  IconData icon = Icons.visibility_off;
  bool isVisible = false;

  void visible() {
    isVisible = !isVisible;
    icon = isVisible ? Icons.visibility : Icons.visibility_off;
    emit(ChangeBottomNavState());
  }

  List<Widget> screens = [
    const HomeTab(),
    const BooksTab(),
    const FavouriteTab(),
    const CartTab(),
    const ProfileTab()
  ];

  void changeBot(index, context) {
    emit(ChangeBotNavState());
    currentIndex = index;
    if (currentIndex == 0) {
      getSliderData();
      getBestSellerData();
      getNewArrivalData();
      getCategories();
    }
    if (currentIndex == 1) {
      // getAllDoctors();
    }
    if (currentIndex == 3) {
      // getAllAppointments();
    }
    if (currentIndex == 4) {
      // getPatientProfileData();
      // getAllAppointments();
    }
  }

  // get slider data

  List<GetSliderModel> slidersData = [];

  Future <void> getSliderData() async {
    DioHelper.getData(url: getSliderDataUrl).then((value) {
      emit(GetSliderDataLoadingState());
      final List<dynamic> data = value.data['data']['sliders'];
      final sliders = data
          .map<GetSliderModel>((json) => GetSliderModel.fromJson(json))
          .toList();
      slidersData = sliders;
      emit(GetSliderDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSliderDataErrorState());
    });
  }

  // get best seller data

  List<ProductModel> bestSellerData = [];

  Future <void> getBestSellerData() async {
    DioHelper.getData(url: getBestSellerDataUrl).then((value) {
      emit(GetBestSellerDataLoadingState());
      final List<dynamic> data = value.data['data']['products'];
      final products = data
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      bestSellerData = products;
      emit(GetBestSellerDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBestSellerDataErrorState());
    });
  }


  // get new arrival data

  List<ProductModel> newArrivalData = [];

  Future <void> getNewArrivalData() async {
    DioHelper.getData(url: getNewArrivalDataUrl).then((value) {
      emit(GetNewArrivalDataLoadingState());
      final List<dynamic> data = value.data['data']['products'];
      final products = data
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      newArrivalData = products;
      emit(GetNewArrivalDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetNewArrivalDataErrorState());
    });
  }




  // get categories

  List<CategoryModel> categories = [];

  Future <void> getCategories() async {
    DioHelper.getData(url: getCategoriesUrl).then((value) {
      emit(GetCategoriesLoadingState());
      final List<dynamic> data = value.data['data']['categories'];
      final categoriesData = data
          .map<CategoryModel>((json) => CategoryModel.fromJson(json))
          .toList();
      categories = categoriesData;
      emit(GetCategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCategoriesErrorState());
    });
  }








  // slider

  int pageIndex = 0;
  void changePageIndex(int value){
    pageIndex = value;
    emit(HomeChangeSliderIndexState());
  }

  final List<String> sliderImages = [
    'assets/images/best_Seller_1.jpg',
    'assets/images/best_Seller_2.jpg',
    'assets/images/best_Seller_3.png',
  ];



}
