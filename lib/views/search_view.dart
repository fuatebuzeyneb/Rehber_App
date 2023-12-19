import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/add_to_firebase/add_to_firebase_cubit.dart';
import 'package:travel_app/widgets/appbar/custom_appbar_widget.dart';
import 'package:travel_app/widgets/custom_buttom_widget.dart';
import 'package:travel_app/widgets/custom_text_field_widget.dart';
import 'package:travel_app/widgets/services/functions/toast_msg.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = 'SearchView';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AddToFirebaseCubit, AddToFirebaseState>(
      listener: (context, state) {
        if (state is AddToFirebaseSuccess) {
          toastMsg(
              errorMsg:
                  'Successfully, check your email to verify your account');
        } else if (state is AddToFirebaseFailure) {
          toastMsg(errorMsg: state.errorMsg);
        }
      },
      builder: (context, state) {
        AddToFirebaseCubit addToFirebaseCubit =
            BlocProvider.of<AddToFirebaseCubit>(context);
        return SafeArea(
          child: Scaffold(
            body: Form(
              key: addToFirebaseCubit.formKeyForAdd,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.12,
                  ),
                  const CustomAppBarWidget(
                    title: 'Welcome !',
                    fontSize: 32,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  CustomTextFieldWidget(
                    onChanged: (value) {
                      addToFirebaseCubit.name = value;
                    },
                    label: 'Name',
                  ),
                  CustomTextFieldWidget(
                    onChanged: (value) {
                      addToFirebaseCubit.image = value;
                    },
                    label: 'image url',
                  ),
                  CustomTextFieldWidget(
                    onChanged: (value) {
                      addToFirebaseCubit.description = value;
                    },
                    label: 'description',
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  state is AddToFirebaseLoading
                      ? const CircularProgressIndicator()
                      : CustomButtonWidget(
                          title: 'Sign Up',
                          onTap: () async {
                            if (addToFirebaseCubit.formKeyForAdd.currentState!
                                .validate()) {
                              await addToFirebaseCubit.addUser();
                            } else {
                              toastMsg(
                                  errorMsg:
                                      'You must agree to the terms and condition');
                            }
                          }),
                  const SizedBox(
                    height: 10,
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
