import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/widgets/cat_elevated_button.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:catan_gui_flutter/widgets/cat_text_button.dart';
import 'package:catan_gui_flutter/widgets/cat_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final s = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      return CATScaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Assets.images.catanBackground.image(fit: BoxFit.cover),
            Row(
              children: [
                Expanded(
                  child: Container(
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
                      padding: EdgeInsets.all(s * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.orange.shade100,
                              fontSize: s * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: s * 0.1),
                          CATTextFormField(
                            labelText: 'Name',
                            notSelectedColor: Colors.orange.shade100,
                          ),
                          SizedBox(height: s * 0.025),
                          CATTextFormField(
                            labelText: 'E-Mail',
                            notSelectedColor: Colors.orange.shade100,
                          ),
                          SizedBox(height: s * 0.025),
                          CATTextFormField(
                            labelText: 'Password',
                            obscureText: true,
                            notSelectedColor: Colors.orange.shade100,
                            selectedColor: Colors.orange.shade500,
                          ),
                          SizedBox(height: s * 0.1),
                          CATElevatedButton(
                              backgroundColor: Colors.orange.shade900,
                              onPressed: () {},
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.orange.shade100,
                                    fontSize: s * 0.02),
                              )),
                          SizedBox(height: s * 0.01),
                          CATTextButton(
                              foregroundColor: Colors.orange.shade100,
                              onPressed: () {},
                              child: Text(
                                'Already have an account? Login',
                                style: TextStyle(fontSize: s * 0.02),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(flex: 2, child: SizedBox.shrink()),
              ],
            )
          ],
        ),
      );
    });
  }
}
