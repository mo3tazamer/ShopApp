import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../components/navigate.dart';
import '../../components/refactor.dart';
import '../../conestants/const.dart';
import '../../cubit/shopregister_cubit/Register_cubit.dart';
import '../../services/local/cachehelper.dart';
import '../homelayout/homelayout.dart';

class ShopRegister extends StatelessWidget {
  final fkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final name = TextEditingController();

  ShopRegister({super.key});

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
                'Register',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              defultFormField(
                  obscureText: false,
                  validatormessage: 'please Enter your name',
                  onTap: () {},
                  sufficons: const Icon(Icons.man),
                  hintText: 'Enter Your name',
                  label: 'name',
                  controller: name),
              defultFormField(
                  obscureText: false,
                  validatormessage: 'please Enter your Email',
                  onTap: () {},
                  sufficons: const Icon(Icons.man),
                  hintText: 'Enter Your Email',
                  label: 'Email',
                  controller: email),
              defultFormField(
                  obscureText: false,
                  validatormessage: 'please Enter your phone',
                  onTap: () {},
                  sufficons: const Icon(Icons.man),
                  hintText: 'Enter Your phone',
                  label: 'phone',
                  controller: phone),
              defultFormField(
                  validatormessage: 'please Enter your password',
                  controller: password,
                  onTap: () {},
                  sufficons: const Icon(Icons.visibility),
                  hintText: 'Enter Your PassWord',
                  label: 'PassWord',
                  obscureText: true),
              BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  var cubit =
                      BlocProvider.of<RegisterCubit>(context).registermodel;
                  if (state is Registercubitsucsess) {
                    if (cubit!.status) {
                      CacheHelper.savedata(
                          key: 'username', value: cubit.data.name);
                      CacheHelper.savedata(
                          key: 'token', value: cubit.data.token);
                      token = cubit.data.token;
                      print('token is register in $token');
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
                  if (state is Registercubitloading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is Registercubitsucsess) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (fkey.currentState!.validate()) {
                                BlocProvider.of<RegisterCubit>(context)
                                    .Postdata(
                                        name: name.text,
                                        email: email.text,
                                        phone: phone.text,
                                        password: password.text);
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
                                BlocProvider.of<RegisterCubit>(context)
                                    .Postdata(
                                        name: name.text,
                                        email: email.text,
                                        phone: phone.text,
                                        password: password.text);
                              }
                            },
                            child: const Text('Register Now')),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
