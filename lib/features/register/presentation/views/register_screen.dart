import 'package:buildcondition/buildcondition.dart';
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
import '../../../auth_verification/presentation/views/verify_email.dart';
import '../../../login/presentation/views/login_screen.dart';
import '../../../on_boarding/presentation/views/widgets/app_background.dart';
import '../cubit/register_cubit.dart';


// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final signUpUserNameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpPasswordConfirmController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late RegisterCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = RegisterCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const LoginScreen();
          }));
            MotionToast.success(
              description: const Text("Registered Successfully",
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
              value:
              RegisterCubit.get(context).registerModel?.data?.token)
              .then((value) {
            print(RegisterCubit.get(context).registerModel?.data?.token);
          });
          }
        if (state is RegisterErrorState) {
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
                    height: 140.h,
                  ),
                  Text(
                   "Sign Up",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontSize: 32.h, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(11.0.r),
                    child: defaultFormField(
                      type: TextInputType.name,
                      label: 'Name',
                      controller: signUpUserNameController,
                      hint: 'Name',
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please add your user name';
                        }
                        return null;
                      },
                      prefix: null,
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(11.0.r),
                    child: defaultFormField(
                      type: TextInputType.emailAddress,
                      label: 'Email',
                      controller: signUpEmailController,
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
                    height: 1.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(11.0.r),
                    child: defaultFormField(
                        label: 'Password',
                        suffix: RegisterCubit.get(context).suffix,
                        isPassword: RegisterCubit.get(context).isPassword,
                        suffixPressed: () {
                          RegisterCubit.get(context)
                              .changePasswordVisibility();
                        },
                        type: TextInputType.visiblePassword,
                        controller: signUpPasswordController,
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
                    height: 1.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(11.0.r),
                    child: defaultFormField(
                        label: 'Confirm Password',
                        suffix: RegisterCubit.get(context).suffix,
                        isPassword: RegisterCubit.get(context).isPassword,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();

                        },
                        type: TextInputType.visiblePassword,
                        controller: signUpPasswordConfirmController,
                        hint: 'Confirm Password',
                        prefix: null,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please enter password';
                          }
                          if (value != signUpPasswordController.text){
                            return 'confirm password must match password';
                            //         RegExp regex = RegExp(
                            //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$');
                            //         if (!regex.hasMatch(value)) {
                            //         return
                            //           ''' password must contain at least one capital letter and
                            // one special character''';
                            //         }
                            return null;
                          }
                        }),
                  ),
              SizedBox(
                height: 15.h,
              ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 55.h,
                      child: BuildCondition(
                        condition: state is! RegisterLoadingState,
                        builder: (context) => CustomButton(
                          text: "Register",
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              // debugPrint(
                              //     'user name : ${signUpUserNameController.text}');
                              // debugPrint(
                              //     'email : ${signUpEmailController.text}');
                              // debugPrint(
                              //     'password : ${signUpPasswordController.text}');
                              RegisterCubit.get(context).register(
                                name: signUpUserNameController.text,
                                email: signUpEmailController.text,
                                password: signUpPasswordController.text,
                                passwordConfirmation: signUpPasswordConfirmController.text
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
                       "Already have an account ?",
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
                                return const LoginScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Log in",
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
