import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/networking/remote/DioHelper.dart';
import '../../../../core/networking/remote/endpoints.dart';
import '../../data/models/resend_code_model.dart';
import '../../data/models/verify_email_model.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());


  static OtpCubit get(context)=>BlocProvider.of(context);

  VerifyEmailModel? verifyEmailModel;

  void verify({
    required String code,
  }) {
    emit(OtpLoadingState());
    DioHelper.PostData(url: verifyEmailUrl, data: {
      'verify_code': code,
    }).then((value) {
      emit(OtpLoadingState());
      verifyEmailModel = VerifyEmailModel.fromJson(value.data);
      //print(loginModel?.data?.token);
      //print(loginModel?.data?.id);
      //print(value.data);
      emit(OtpSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(OtpErrorState());
    });
  }



  ResendCodeModel? resendCodeModel;

  void resendCode() {
    DioHelper.getData(url: resendCodeUrl).then((value) {
      emit(ResendCodeLoadingState());
      resendCodeModel = ResendCodeModel.fromJson(value.data);
      //print(loginModel?.data?.token);
      //print(loginModel?.data?.id);
      //print(value.data);
      emit(ResendCodeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ResendCodeErrorState());
    });
  }

}
