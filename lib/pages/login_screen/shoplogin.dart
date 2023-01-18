import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/components/navigate.dart';

import 'package:shopapp/pages/register_screen/shopregister.dart';

import '../../components/refactor.dart';
import '../../conestants/const.dart';
import '../../cubit/bottomnav_cubit/bottomnav_cubit.dart';
import '../../cubit/login_cubit/logincubit_cubit.dart';
import '../../cubit/profile_cubit/profile_cubit.dart';
import '../../services/local/cachehelper.dart';
import '../homelayout/homelayout.dart';

class ShopLogIn extends StatelessWidget {
  final fkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  ShopLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Form(
          key: fkey,
          child: Column(
            children: [
              Text(
                'LogIn',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              defultFormField(
                  obscureText: false,
                  validatormessage: 'please Enter your Email',
                  onTap: () {},
                  sufficons: const Icon(Icons.man),
                  hintText: 'Enter Your Email',
                  label: 'Email',
                  controller: email),
              defultFormField(
                  validatormessage: 'please Enter your password',
                  controller: password,
                  onTap: () {},
                  sufficons: const Icon(Icons.visibility),
                  hintText: 'Enter Your PassWord',
                  label: 'PassWord',
                  obscureText: true),
              BlocConsumer<LoginCubit, LogincubitState>(
                listener: (context, state) {
                  var cubit = BlocProvider.of<LoginCubit>(context).loginmodel;
                  if (state is Logincubitsucsess) {
                    if (cubit!.status) {
                      CacheHelper.savedata(
                          key: 'username', value: '${cubit.data!.name}');
                      CacheHelper.savedata(
                          key: 'token', value: '${cubit.data!.token}');
                      token = cubit.data!.token;
                      print('token is log in $token');
                      BlocProvider.of<ProFileCubit>(context).getProFiledata();
                      BlocProvider.of<BottomnavCubit>(context).indexvalue = 0;
                      navigateandfinish(
                          widget: const HomeLayOut(), context: context);
                    } else {
                      Fluttertoast.showToast(
                          msg: cubit.message,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 8,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }
                },
                builder: (context, state) {
                  if (state is Logincubitloading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is Logincubitsucsess) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (fkey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).Postdata(
                                    email: email.text, password: password.text);
                              }
                            },
                            child: const Text('Sign in')),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (fkey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).Postdata(
                                    email: email.text, password: password.text);
                              }
                            },
                            child: const Text('Sign in')),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('don\'t have an account'),
                  TextButton(
                      onPressed: () {
                        navigateto(context: context, widget: ShopRegister());
                      },
                      child: const Text('Register'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
