import 'package:catan_gui_flutter/features/auth/presentation/widgets/login_drawer.dart';
import 'package:catan_gui_flutter/features/auth/presentation/widgets/register_drawer.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool _isOnRegister = true;
  final _flipCardController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return CATScaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Assets.images.catanBackground.image(fit: BoxFit.cover),
            Row(
              children: [
                Expanded(
                  child: FlipCard(
                      rotateSide:
                          _isOnRegister ? RotateSide.right : RotateSide.left,
                      controller: _flipCardController,
                      frontWidget: RegisterDrawer(onToLoginPressed: () async {
                        await _flipCardController.flipcard();
                        setState(() {
                          _isOnRegister = !_isOnRegister;
                        });
                      }),
                      backWidget: LoginDrawer(onToRegisterPressed: () async {
                        await _flipCardController.flipcard();
                        setState(() {
                          _isOnRegister = !_isOnRegister;
                        });
                      })),
                ),
                const Expanded(flex: 2, child: SizedBox.shrink())
              ],
            ),
          ],
        ),
      );
    });
  }
}
