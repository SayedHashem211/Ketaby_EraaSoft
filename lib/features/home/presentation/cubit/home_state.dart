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

