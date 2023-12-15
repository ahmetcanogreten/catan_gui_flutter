import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/utils/validators.dart';
import 'package:catan_gui_flutter/widgets/cat_elevated_button.dart';
import 'package:catan_gui_flutter/widgets/cat_text_button.dart';
import 'package:catan_gui_flutter/widgets/cat_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginDrawer extends StatefulWidget {
  final Function() onToRegisterPressed;
  const LoginDrawer({super.key, required this.onToRegisterPressed});

  @override
  State<LoginDrawer> createState() => _LoginDrawerState();
}

class _LoginDrawerState extends State<LoginDrawer> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordObscured = true;

  @override
  void dispose() {
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
                  'Login',
                  style: TextStyle(
                    color: Colors.orange.shade100,
                    fontSize: maxSize * 0.075,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: maxSize * 0.1),
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
                      // TODO : Home Screen
                    } else if (state is LoginError) {
                      // TODO : Show Error
                    }
                  },
                  builder: (context, state) {
                    if (state is WaitLoggingIn) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.orange.shade100,
                        ),
                      );
                    }

                    return CATElevatedButton(
                        foregroundColor: Colors.orange.shade100,
                        backgroundColor: Colors.orange.shade900,
                        onPressed: isValidEmail(_emailController.text) &&
                                isValidPassword(_passwordController.text)
                            ? () {
                                context.read<AuthenticationCubit>().login(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    );
                              }
                            : null,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              // color: Colors.orange.shade100,
                              fontSize: maxSize * 0.04),
                        ));
                  },
                ),
                SizedBox(height: maxSize * 0.05),
                CATTextButton(
                    foregroundColor: Colors.orange.shade100,
                    onPressed: widget.onToRegisterPressed,
                    child: Text(
                      'No Account? Register here!',
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
