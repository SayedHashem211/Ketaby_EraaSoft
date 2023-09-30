import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../login/presentation/views/login_screen.dart';
import '../../../on_boarding/presentation/views/widgets/app_background.dart';
import '../cubit/otp_cubit.dart';


class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  var verifyKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final verifyController = TextEditingController();

    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
      if (state is OtpSuccessState) {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const LoginScreen();
        }));
        MotionToast.success(
          description: Text(
            "Verified Successfully",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 15.sp),
          ),
          animationType: AnimationType.fromLeft,
          //layoutOrientation: ORIENTATION.rtl,
          position: MotionToastPosition.bottom,
          width: 300.w,
          height: 100.h,
        ).show(context);
      }
        if (state is OtpErrorState) {
          MotionToast.error(
            description: Text(
              "Something Went Wrong",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15.sp),
            ),
            animationType: AnimationType.fromLeft,
            //layoutOrientation: ORIENTATION.rtl,
            position: MotionToastPosition.bottom,
            width: 300.w,
            height: 100.h,
          ).show(context);
        }
      },
      builder: (context, state) {
        var cubit = OtpCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: verifyKey,
              child: Column(
                children: [
                  const AppBackground(),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "Verify Your Email",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 28.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Image.asset('assets/images/verify.png'),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(5.0),
                    child: defaultFormField(
                      controller: verifyController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter code";
                        }
                        return null;
                      },
                      label: "Code",
                      hint: "Code",
                      prefix: Icons.code,
                    ),
                  ),
                  SizedBox(height: 12.h,),
                  TextButton(
                      onPressed: (){
                        cubit.resendCode();
                      },
                      child: const Text("Resend Code",style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                      ),)
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 55.h,
                    child: BuildCondition(
                      condition: state is! OtpLoadingState,
                      builder: (context) => CustomButton(
                        text: "Verify",
                        onTap: () {
                          if (verifyKey.currentState!.validate()) {
                            cubit.verify(
                             code: verifyController.text
                            );
                          }
                        },
                      ),
                      fallback: (context) =>
                      const Center(child: CircularProgressIndicator()),
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
