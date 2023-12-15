import 'package:catan_gui_flutter/features/auth/presentation/widgets/login_drawer.dart';
import 'package:catan_gui_flutter/features/auth/presentation/widgets/register_drawer.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/router.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:go_router/go_router.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with TickerProviderStateMixin {
  bool _isOnRegister = false;
  final _flipCardController = FlipCardController();
  late final AnimationController _animationController;
  late final Animation<double> translationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    translationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onToHome() {
    _animationController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      context.go(homeRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return CATScaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Assets.images.catanBackground.image(fit: BoxFit.cover),
            AnimatedBuilder(
                animation: translationAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                        -1 *
                            constraints.maxWidth *
                            _animationController.value /
                            3,
                        0),
                    child: Row(
                      children: [
                        Expanded(
                          child: FlipCard(
                              rotateSide: _isOnRegister
                                  ? RotateSide.right
                                  : RotateSide.left,
                              controller: _flipCardController,
                              backWidget: RegisterDrawer(
                                  onToHome: onToHome,
                                  onToLoginPressed: () async {
                                    await _flipCardController.flipcard();
                                    setState(() {
                                      _isOnRegister = !_isOnRegister;
                                    });
                                  }),
                              frontWidget: LoginDrawer(
                                  onToHome: onToHome,
                                  onToRegisterPressed: () async {
                                    await _flipCardController.flipcard();
                                    setState(() {
                                      _isOnRegister = !_isOnRegister;
                                    });
                                  })),
                        ),
                        const Expanded(flex: 2, child: SizedBox.shrink())
                      ],
                    ),
                  );
                }),
          ],
        ),
      );
    });
  }
}
