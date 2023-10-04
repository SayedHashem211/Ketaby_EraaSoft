import 'package:bloc/bloc.dart';
import 'package:e_commerce_eraasoft/core/networking/remote/endpoints.dart';
import 'package:e_commerce_eraasoft/features/home/data/models/add_to_cart_model.dart';
import 'package:e_commerce_eraasoft/features/home/data/models/add_to_favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/remote/DioHelper.dart';
import '../../data/models/cart_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/get_slider_data_model.dart';
import '../../data/models/profile_model.dart';
import '../../data/models/product_model.dart';
import '../../data/models/remove_from_cart_model.dart';
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
      getAllProducts();
    }
    if (currentIndex == 2) {
      getFavouriteProducts();
    }
    if (currentIndex == 3) {
      getCartProducts();
    }
    if (currentIndex == 4) {
     getProfileData();
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


  // get profile data


  ProfileModel? profileModel;
  void getProfileData()async{
    emit(GetProfileDataLoadingState());
    await DioHelper.getData(url: getProfileDataUrl).then((value){
      //print(value.data);
      profileModel = ProfileModel.fromJson(value.data);
      emit(GetProfileDataSuccessState());
    }).catchError((error) {
      //print(error.toString());
      emit(GetProfileDataErrorState());
    });

  }



  // update profile data


  void updateUser({
    required String name,
    required String email,
    required String phone,
    required String city,
  }){
    emit(UpdateProfileDataLoadingState());
    DioHelper.PostData(url: updateProfileDataUrl,
        data:{
          'name':name,
          'email':email,
          'phone':phone,
         'city' : city
        } )
        .then((value) {
      getProfileData();
      emit(UpdateProfileDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateProfileDataErrorState());
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


  // get all products data

  List<ProductModel> allProducts = [];

  Future <void> getAllProducts() async {
    DioHelper.getData(url: getAllProductsUrl).then((value) {
      emit(GetAllProductsLoadingState());
      final List<dynamic> data = value.data['data']['products'];
      final products = data
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      allProducts = products;
      emit(GetAllProductsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllProductsErrorState());
    });
  }


  // show product data

  List<ProductModel> productData = [];

  Future <void> showProductDetails(id) async {
    DioHelper.getData(url: "/products/$id").then((value) {
      emit(ShowProductDetailsLoadingState());
      final List<dynamic> data = value.data['data']['products'];
      final product = data
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      productData = product;
      emit(ShowProductDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShowProductDetailsErrorState());
    });
  }


  // show product data

  List<CategoryModel> categoryData = [];

  Future <void> showCategoryDetails(id) async {
    DioHelper.getData(url: "/categories/$id").then((value) {
      emit(ShowCategoryDetailsLoadingState());
      final List<dynamic> data = value.data['data']['products'];
      final category = data
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      productData = category;
      emit(ShowCategoryDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShowCategoryDetailsErrorState());
    });
  }


  // add product to cart

  AddToCartModel? addToCartModel;

  void addToCart({
    required String id,
  }){
    emit(AddToCartLoadingState());
    DioHelper.PostData(url: addToCartUrl,
        data:{
          'product_id':id,
        } )
        .then((value) {
          addToCartModel = AddToCartModel.fromJson(value.data);
      emit(AddToCartSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AddToCartErrorState());
    });

  }


  // remove product from cart

  RemoveFromCartModel? removeFromCartModel;

  void removeFromCart({
    required String id,
  }){
    emit(RemoveFromCartLoadingState());
    DioHelper.PostData(url: removeFromCartUrl,
        data:{
          'cart_item_id':id,
        } )
        .then((value) {
      removeFromCartModel = RemoveFromCartModel.fromJson(value.data);
      emit(RemoveFromCartSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RemoveFromCartErrorState());
    });

  }


// update cart

  AddToCartModel? updateCartModel;

  void updateCart({
    required String id,
    required String quantity
  }){
    emit(UpdateCartLoadingState());
    DioHelper.PostData(url: updateCartUrl,
        data:{
          'cart_item_id':id,
          'quantity' : quantity
        } )
        .then((value) {
      updateCartModel = AddToCartModel.fromJson(value.data);
      emit(UpdateCartSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateCartErrorState());
    });

  }


  int addQuantity(quantity) {
    return (quantity + 1);

  }
  int subtractQuantity(quantity) {
    return (quantity - 1);
  }

  // add to favourite

  bool isFavourite = false;

  AddToFavouriteModel? addToFavouriteModel;

  void addToFavourite({
    required String id,
  }){
    emit(AddToFavouriteLoadingState());
    DioHelper.PostData(url: addToFavouriteUrl,
        data:{
          'product_id':id,
        } )
        .then((value) {
      addToFavouriteModel = AddToFavouriteModel.fromJson(value.data);
      emit(AddToFavouriteSuccessState());
      isFavourite = true;
    }).catchError((error) {
      print(error.toString());
      emit(AddToFavouriteErrorState());
    });

  }


  AddToFavouriteModel? removeFromFavouriteModel;

  void removeFromFavourite({
    required String id,
  }){
    emit(RemoveFromFavouriteLoadingState());
    DioHelper.PostData(url: removeFromFavouriteUrl,
        data:{
          'product_id':id,
        } )
        .then((value) {
      removeFromFavouriteModel = AddToFavouriteModel.fromJson(value.data);
      emit(RemoveFromFavouriteSuccessState());
      isFavourite = false;
    }).catchError((error) {
      print(error.toString());
      emit(RemoveFromFavouriteErrorState());
    });

  }


  // get all favourite products

  List<ProductModel> favouriteProducts = [];

  Future <void> getFavouriteProducts() async {
    DioHelper.getData(url: getFavouriteProductsUrl).then((value) {
      emit(GetFavouriteProductsLoadingState());
      final List<dynamic> data = value.data['data']['data'];
      final favProducts = data
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
      favouriteProducts = favProducts;
      emit(GetFavouriteProductsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetFavouriteProductsErrorState());
    });
  }


// get cart products

  List<CartModel> cartProducts = [];

  Future <void> getCartProducts() async {
    DioHelper.getData(url: getCartUrl).then((value) {
      emit(GetCartLoadingState());
      final List<dynamic> data = value.data['data']['cart_items'];
      final cartProductsData = data
          .map<CartModel>((json) => CartModel.fromJson(json))
          .toList();
      cartProducts = cartProductsData;
      emit(GetCartSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCartErrorState());
    });
  }






}
