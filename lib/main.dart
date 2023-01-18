import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/components/themes.dart';
import 'package:shopapp/cubit/Updateprofile_cubit/updateprofile_cubit.dart';
import 'package:shopapp/cubit/getfavorite_cubit/getfavorite_cubit.dart';
import 'package:shopapp/cubit/profile_cubit/profile_cubit.dart';
import 'package:shopapp/cubit/search_cubit/search_cubit.dart';
import 'package:shopapp/pages/homelayout/homelayout.dart';
import 'package:shopapp/pages/onbording_screen/shopintro.dart';
import 'package:shopapp/pages/login_screen/shoplogin.dart';
import 'package:shopapp/services/local/cachehelper.dart';
import 'bloc_observer.dart';
import 'conestants/const.dart';
import 'cubit/bottomnav_cubit/bottomnav_cubit.dart';
import 'cubit/category_cubit/category_cubit.dart';
import 'cubit/homelayout_cubit/home_cubit.dart';
import 'cubit/login_cubit/logincubit_cubit.dart';
import 'cubit/shopregister_cubit/Register_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Widget widget;

  var onbording = CacheHelper.getdata(key: 'onbording');

  token = CacheHelper.getdata(key: 'token') ?? '???';
  print('onbording is ${CacheHelper.getdata(key: 'onbording')}');
  print('token is $token');
  if (onbording != null) {
    if (token != null || token.isNotEmpty) {
      widget = const HomeLayOut();
    } else {
      widget = ShopLogIn();
    }
  } else {
    widget = const ShopIntro();
  }
  runApp(MyApp(
    widget: widget,
  ));
  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  Widget? widget;

  MyApp({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()..gethomedata()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => UpdateProfileCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => Searchcubit()),
        BlocProvider(
            create: (context) => GetFavoriteCubit()..getfavoritedata()),
        BlocProvider(create: (context) => CategoryCubit()..getcategorydata()),
        BlocProvider(create: (context) => ProFileCubit()..getProFiledata()),
        BlocProvider(create: (context) => BottomnavCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: widget,
      ),
    );
  }
}
