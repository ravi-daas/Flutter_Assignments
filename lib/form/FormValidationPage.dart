import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware_internshala/form/FormValidatorCubit.dart';
import 'package:infoware_internshala/form/FormValidatorState.dart';
import 'package:infoware_internshala/form/Validator.dart';

// you can see we've added our Validator mixin
// and now we can access all it's method directly
class FormValidationPage extends StatelessWidget with Validator {
  FormValidationPage({Key? key}) : super(key: key);

  final FormValidatorCubit _formValidatorCubit = FormValidatorCubit();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocSelector<FormValidatorCubit, FormValidatorState, AutovalidateMode>(
              bloc: _formValidatorCubit,
              selector: (state) => state.autovalidateMode,
              builder: (context, AutovalidateMode autovalidateMode) {
                return Form(
                  key: _formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      TextFormField(
                        // mixin method
                        validator: validateName,
                        onChanged: _formValidatorCubit.updateName,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter your name',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: validateEmail,
                        onChanged: _formValidatorCubit.updateEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      BlocSelector<FormValidatorCubit, FormValidatorState, bool>(
                        bloc: _formValidatorCubit,
                        selector: (state) => state.obscureText,
                        builder: (context, obscureText) {
                          return Column(
                            children: [
                              TextFormField(
                                validator: validatePassword,
                                onChanged: _formValidatorCubit.updatePassword,
                                obscureText: obscureText,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: IconButton(onPressed: _formValidatorCubit.toggleObscureText, icon: const Icon(Icons.remove_red_eye)),
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              TextFormField(
                                validator: (value) =>
                                    validateConfirmPassword(
                                      value,
                                      _formValidatorCubit.state.password,
                                    ),
                                obscureText: obscureText,
                                keyboardType: TextInputType.visiblePassword,
                                onChanged: _formValidatorCubit.updateConfirmPassword,
                                decoration: const InputDecoration(
                                  labelText: 'Confirm password',
                                  hintText: 'Enter your confirm password',
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: validateAddress,
                        onChanged: _formValidatorCubit.updateAddress,
                        decoration: const InputDecoration(
                          labelText: 'Address',
                          hintText: 'Enter your address',
                          prefixIcon: Icon(Icons.home),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: validateCity,
                        onChanged: _formValidatorCubit.updateAddress,
                        decoration: const InputDecoration(
                          labelText: 'City',
                          hintText: 'Enter your city',
                          prefixIcon: Icon(Icons.home),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: double.infinity,
              height: 48.0,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Do your job here
                  } else {
                    // in case a user has submitted invalid form we'll set 
                     // AutovalidateMode.always which will rebuild the form
                    // in result we'll start getting error message
                    _formValidatorCubit.updateAutovalidateMode(AutovalidateMode.always);
                  }
                },
                child: const Text('Submit'),
              ),
            ),
            const SizedBox(height: 8.0),
            // SizedBox(
            //   width: double.infinity,
            //   height: 48.0,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => EditFormPage(),
            //         ),
            //       );
            //     },
            //     child: const Text('Edit Form'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}