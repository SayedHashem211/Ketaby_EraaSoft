part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

// bottom_navy_bar
class ChangeBotNavState extends HomeState {}
class ChangeBottomNavState extends HomeState {}

// get slider images

class HomeChangeSliderIndexState extends HomeState {}
class GetSliderDataLoadingState extends HomeState{}
class GetSliderDataSuccessState extends HomeState{}
class GetSliderDataErrorState extends HomeState{}


// get best seller data

class GetBestSellerDataLoadingState extends HomeState{}
class GetBestSellerDataSuccessState extends HomeState{}
class GetBestSellerDataErrorState extends HomeState{}

// get new arrival

class GetNewArrivalDataLoadingState extends HomeState{}
class GetNewArrivalDataSuccessState extends HomeState{}
class GetNewArrivalDataErrorState extends HomeState{}

// get categories

class GetCategoriesLoadingState extends HomeState{}
class GetCategoriesSuccessState extends HomeState{}
class GetCategoriesErrorState extends HomeState{}


// get profile data

class GetProfileDataLoadingState extends HomeState{}
class GetProfileDataSuccessState extends HomeState{}
class GetProfileDataErrorState extends HomeState{}


// update profile data

class UpdateProfileDataLoadingState extends HomeState{}
class UpdateProfileDataSuccessState extends HomeState{}
class UpdateProfileDataErrorState extends HomeState{}



// get all products

class GetAllProductsLoadingState extends HomeState{}
class GetAllProductsSuccessState extends HomeState{}
class GetAllProductsErrorState extends HomeState{}


// show product details

class ShowProductDetailsLoadingState extends HomeState{}
class ShowProductDetailsSuccessState extends HomeState{}
class ShowProductDetailsErrorState extends HomeState{}



// show category details

class ShowCategoryDetailsLoadingState extends HomeState{}
class ShowCategoryDetailsSuccessState extends HomeState{}
class ShowCategoryDetailsErrorState extends HomeState{}


// add to cart

class AddToCartLoadingState extends HomeState{}
class AddToCartSuccessState extends HomeState{}
class AddToCartErrorState extends HomeState{}

// remove from cart

class RemoveFromCartLoadingState extends HomeState{}
class RemoveFromCartSuccessState extends HomeState{}
class RemoveFromCartErrorState extends HomeState{}


// update cart

class UpdateCartLoadingState extends HomeState{}
class UpdateCartSuccessState extends HomeState{}
class UpdateCartErrorState extends HomeState{}
class AddQuantitySuccessState extends HomeState{}
class SubtractQuantitySuccessState extends HomeState{}


// add to favourite

class AddToFavouriteLoadingState extends HomeState{}
class AddToFavouriteSuccessState extends HomeState{}
class AddToFavouriteErrorState extends HomeState{}


// remove from favourite

class RemoveFromFavouriteLoadingState extends HomeState{}
class RemoveFromFavouriteSuccessState extends HomeState{}
class RemoveFromFavouriteErrorState extends HomeState{}


// get all favourite products

class GetFavouriteProductsLoadingState extends HomeState{}
class GetFavouriteProductsSuccessState extends HomeState{}
class GetFavouriteProductsErrorState extends HomeState{}


// get cart

class GetCartLoadingState extends HomeState{}
class GetCartSuccessState extends HomeState{}
class GetCartErrorState extends HomeState{}