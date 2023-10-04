import 'dart:convert';
import 'dart:io';
import 'package:buildcondition/buildcondition.dart';
import 'package:e_commerce_eraasoft/core/networking/local/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../../core/networking/local/cache_helper.dart';
import '../../../../core/utils/custom_button.dart';
import '../cubit/home_cubit.dart';


class EditProfileDataScreen extends StatefulWidget {
  final String? name;
  final String? email;
  final String? city;
  final String? phone;

  const EditProfileDataScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.city,
    required this.phone,
  }) : super(key: key);

  @override
  _EditProfileDataScreenState createState() => _EditProfileDataScreenState();
}

class _EditProfileDataScreenState extends State<EditProfileDataScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _cityController;
  late TextEditingController _phoneController;
  File? _image;
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
    _nameController = TextEditingController(text: widget.name);
    _emailController =
        TextEditingController(text: widget.email);
    _cityController =
        TextEditingController(text: widget.city);
    _phoneController =
        TextEditingController(text: widget.phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is UpdateProfileDataSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Updated Successfully'),
              duration: Duration(seconds: 1),
              showCloseIcon: true,
            ),
          );

          Navigator.pop(context);

        }
        if (state is UpdateProfileDataErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something Went Wrong')),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF05A4A6),
            title: Text("Edit Profile", style: TextStyle(
              fontSize: 23.sp,
            ),),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your name";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter email address";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    decoration:
                    const InputDecoration(labelText: "City"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your city";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(labelText: "Phone number"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter mobile number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 55.h,
                      child: BuildCondition(
                        condition: true ,
                        builder: (context) => CustomButton(
                          text: "Submit",
                          onTap: () {
                              cubit.updateUser(
                                  name: _nameController.text,
                                email: _emailController.text,
                                phone: _phoneController.text,
                                city: _cityController.text
                              );
                            }
                        ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                      )),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF05A4A6),
            onPressed: _pickImage,
            child: const Icon(Icons.image),
          ),
        );
      },
    );
  }
}
