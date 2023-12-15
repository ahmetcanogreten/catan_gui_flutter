import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/utils/validators.dart';
import 'package:catan_gui_flutter/widgets/cat_elevated_button.dart';
import 'package:catan_gui_flutter/widgets/cat_text_button.dart';
import 'package:catan_gui_flutter/widgets/cat_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterDrawer extends StatefulWidget {
  final Function() onToLoginPressed;
  final VoidCallback onToHome;
  const RegisterDrawer(
      {super.key, required this.onToLoginPressed, required this.onToHome});

  @override
  State<RegisterDrawer> createState() => _RegisterDrawerState();
}

class _RegisterDrawerState extends State<RegisterDrawer> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordObscured = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      return Container(
        // Gradient
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0, 0.75, 0.95, 1.0],
            colors: [
              Colors.black.withOpacity(0.75),
              Colors.black.withOpacity(0.50),
              Colors.black.withOpacity(0.25),
              Colors.transparent,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(maxSize * 0.05),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.orange.shade100,
                    fontSize: maxSize * 0.075,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: maxSize * 0.1),
                CATTextFormField(
                  onChanged: () => setState(() {}),
                  controller: _firstNameController,
                  validator: (value) => isValidName(value ?? '')
                      ? null
                      : 'First name must be at least 3 characters long',
                  labelText: 'First Name',
                  color: Colors.orange.shade100,
                ),
                SizedBox(height: maxSize * 0.05),
                CATTextFormField(
                  onChanged: () => setState(() {}),
                  controller: _lastNameController,
                  validator: (value) => isValidName(value ?? '')
                      ? null
                      : 'Last bame must be at least 3 characters long',
                  labelText: 'Last Name',
                  color: Colors.orange.shade100,
                ),
                SizedBox(height: maxSize * 0.05),
                CATTextFormField(
                  onChanged: () => setState(() {}),
                  controller: _emailController,
                  validator: (value) => isValidEmail(value ?? '')
                      ? null
                      : 'Please enter a valid email address',
                  labelText: 'E-Mail',
                  color: Colors.orange.shade100,
                ),
                SizedBox(height: maxSize * 0.05),
                CATTextFormField(
                  onChanged: () => setState(() {}),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.orange.shade100,
                    ),
                    onPressed: () => setState(
                      () => _isPasswordObscured = !_isPasswordObscured,
                    ),
                  ),
                  controller: _passwordController,
                  validator: (value) => isValidPassword(value ?? '')
                      ? null
                      : 'Password must be at least 8 characters long',
                  labelText: 'Password',
                  obscureText: _isPasswordObscured,
                  color: Colors.orange.shade100,
                ),
                SizedBox(height: maxSize * 0.2),
                BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  listener: (context, state) {
                    if (state is LoggedIn) {
                      widget.onToHome();
                    } else if (state is RegisterError) {
                      // TODO : Show Error
                    }
                  },
                  builder: (context, state) {
                    if (state is WaitRegistering) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.orange.shade100,
                        ),
                      );
                    }
                    return CATElevatedButton(
                        backgroundColor: Colors.orange.shade900,
                        onPressed: isValidName(_firstNameController.text) &&
                                isValidName(_lastNameController.text) &&
                                isValidEmail(_emailController.text) &&
                                isValidPassword(_passwordController.text)
                            ? () {
                                context.read<AuthenticationCubit>().register(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                    );
                              }
                            : null,
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.orange.shade100,
                              fontSize: maxSize * 0.04),
                        ));
                  },
                ),
                SizedBox(height: maxSize * 0.05),
                CATTextButton(
                    foregroundColor: Colors.orange.shade100,
                    onPressed: widget.onToLoginPressed,
                    child: Text(
                      'Already have an account? Login',
                      style: TextStyle(fontSize: maxSize * 0.03),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
