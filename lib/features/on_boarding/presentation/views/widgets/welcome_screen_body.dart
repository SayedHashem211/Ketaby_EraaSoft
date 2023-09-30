import 'package:flutter/material.dart';
import '../../../../../core/utils/custom_button.dart';
import '../../../../register/presentation/views/register_screen.dart';
import '../../view_models/welcome_on_boarding_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_background.dart';

// ignore: must_be_immutable
class WelcomeScreenBody extends StatelessWidget {
  WelcomeScreenBody({Key? key}) : super(key: key);

  final _pageController = PageController();




  @override
  Widget build(BuildContext context) {

    List<Instruction> onBoardingInstructions = [
      Instruction(
          image: 'assets/images/on_boarding_1.jpg',
          content:
              "People who love reading, usually need to several books"),
      Instruction(
          image: 'assets/images/on_boarding_2.jpg',
          content:
          "using this application , you will see several available books and buy it"),
    ];

    return Column(
      children: [
        // const AppBackground(),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: onBoardingInstructions.length,
            itemBuilder: (context, i) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(child: Image.asset(onBoardingInstructions[i].image)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onBoardingInstructions.length,
                    (f) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color(0xFF05A4A6),
                        borderRadius: BorderRadius.circular(5.0.r),
                      ),
                      width: f == i ? 16.w : 6.w,
                      height: 5.h,
                    ),
                  ),
                ),
                SizedBox(height: 11.0.h),
                Text(
                  onBoardingInstructions[i].content,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontSize: 21.sp),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(8),
            child: CustomButton(
              text: "Get Start",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return  const RegisterScreen();
                    },
                  ),
                );
              },
            )),
      ],
    );
  }
}
