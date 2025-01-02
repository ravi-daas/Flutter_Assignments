import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormCubit extends Cubit<bool> {
  FormCubit() : super(false);

  void toggleLoading(bool isLoading) {
    emit(isLoading);
  }
}

class FormPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("User Form")),
        body: BlocBuilder<FormCubit, bool>(
          builder: (context, isLoading) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Name
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Name"),
                      validator: (value) => value!.isEmpty ? "Enter Name" : null,
                    ),
                    // Email
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)
                              ? null
                              : "Enter valid Email",
                    ),
                    // Phone
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Phone"),
                      keyboardType: TextInputType.phone,
                      validator: (value) => RegExp(r'^\d{10}$').hasMatch(value!)
                          ? null
                          : "Enter valid Phone",
                    ),
                    // Gender
                    DropdownButtonFormField(
                      decoration: const InputDecoration(labelText: "Gender"),
                      items: const [
                        DropdownMenuItem(value: "Male", child: Text("Male")),
                        DropdownMenuItem(value: "Female", child: Text("Female")),
                      ],
                      onChanged: (value) {},
                      validator: (value) =>
                          value == null ? "Select Gender" : null,
                    ),
                    const Spacer(),
                    // Submit Button
                    ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<FormCubit>().toggleLoading(true);
                                // Simulate submission
                                Future.delayed(const Duration(seconds: 2), () {
                                  context
                                      .read<FormCubit>()
                                      .toggleLoading(false);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Form Submitted!")),
                                  );
                                });
                              }
                            },
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : const Text("Submit"),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
