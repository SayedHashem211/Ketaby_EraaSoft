import 'package:buildcondition/buildcondition.dart';
import 'package:e_commerce_eraasoft/features/auth_verification/presentation/views/verify_email.dart';
import 'package:e_commerce_eraasoft/features/home/presentation/cubit/home_cubit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../../../core/networking/local/cache_helper.dart';
import '../../../../core/networking/local/enums.dart';
import '../../../../core/utils/components.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../../../on_boarding/presentation/views/widgets/app_background.dart';
import '../../../register/presentation/views/register_screen.dart';
import '../cubit/login_cubit.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late LoginCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = LoginCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const HomeScreen();
          }));
          MotionToast.success(
            description: const Text("Login Successfully",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15),
            ),
            animationType: AnimationType.fromLeft,
            //layoutOrientation: ORIENTATION.rtl,
            position: MotionToastPosition.bottom,
            width: 300.w,
            height: 100.h,
          ).show(context);
          CacheHelper.putString(
              key: MySharedKeys.token,
              value: LoginCubit.get(context).loginModel?.data?.token)
              .then((value) {
            print(LoginCubit.get(context).loginModel?.data?.token);
          });
          HomeCubit.get(context).getSliderData();
          HomeCubit.get(context).getBestSellerData();
          HomeCubit.get(context).getNewArrivalData();
          HomeCubit.get(context).getCategories();
          HomeCubit.get(context).getProfileData();

        }
        if (state is LoginErrorState) {
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
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                  children: [
                    // const AppBackground(),
                    SizedBox(
                      height: 180.h,
                    ),
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 32.h, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(11.0.r),
                      child: defaultFormField(
                        type: TextInputType.emailAddress,
                        label: 'Email',
                        controller: loginEmailController,
                        hint: 'Email',
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please add your email';
                          }
                          final bool isValid = EmailValidator.validate(value);
                          if (!isValid) {
                            return "please enter right email";
                          }
                          return null;
                        },
                        prefix: null,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(11.0.r),
                      child: defaultFormField(
                          label: 'Password',
                          suffix: LoginCubit.get(context).suffix,
                          isPassword: LoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            LoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          type: TextInputType.visiblePassword,
                          controller: loginPasswordController,
                          hint: 'Password',
                          prefix: null,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter password';
                            }
                            //         RegExp regex = RegExp(
                            //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$');
                            //         if (!regex.hasMatch(value)) {
                            //         return
                            //           ''' password must contain at least one capital letter and
                            // one special character''';
                            //         }
                            return null;
                          }),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 55.h,
                        child: BuildCondition(
                          condition: state is! LoginLoadingState,
                          builder: (context) => CustomButton(
                            text: "Login",
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                // debugPrint(
                                //     'user name : ${signUpUserNameController.text}');
                                // debugPrint(
                                //     'email : ${signUpEmailController.text}');
                                // debugPrint(
                                //     'password : ${signUpPasswordController.text}');
                                LoginCubit.get(context).login(
                                    email: loginEmailController.text,
                                    password: loginPasswordController.text,
                                );
                              } else {
                                FocusScope.of(context).unfocus();
                              }
                            },
                          ),
                          fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                        )),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "don't have an account ?",
                              style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                fontSize: 17.sp,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const RegisterScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Register",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                    fontSize: 18.sp,
                                    color: const Color(0xFF05A4A6)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ]
              ),
            ),
          ),
        );
      },
    );
  }
}
