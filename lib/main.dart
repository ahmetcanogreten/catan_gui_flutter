import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/repositories/game_repository.dart';
import 'package:catan_gui_flutter/repositories/room_repository.dart';
import 'package:catan_gui_flutter/repositories/user_repository.dart';
import 'package:catan_gui_flutter/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(const CatanApp());
}

class CatanApp extends StatefulWidget {
  const CatanApp({super.key});

  @override
  State<CatanApp> createState() => _CatanAppState();
}

class _CatanAppState extends State<CatanApp> {
  late final AuthenticationCubit _authenticationCubit;

  @override
  void initState() {
    super.initState();
    registerRepositories();
    createAndRegisterBlocs();
  }

  void createAndRegisterBlocs() {
    _authenticationCubit = AuthenticationCubit();
    _authenticationCubit.login(email: "", password: "");
    GetIt.I.registerSingleton<AuthenticationCubit>(_authenticationCubit);
  }

  void registerRepositories() {
    GetIt.I.registerSingleton<IUserRepository>(MockUserRepository());
    GetIt.I.registerSingleton<IGameRepository>(MockGameRepository());
    GetIt.I.registerSingleton<IRoomRepository>(MockRoomRepository());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
            create: (context) => _authenticationCubit),
      ],
      child: MaterialApp.router(
        routerConfig: routerConfig,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
