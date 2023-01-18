import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/components/navigate.dart';
import 'package:shopapp/components/refactor.dart';
import 'package:shopapp/conestants/const.dart';
import 'package:shopapp/cubit/profile_cubit/profile_cubit.dart';

import '../../cubit/Updateprofile_cubit/updateprofile_cubit.dart';

import '../../cubit/bottomnav_cubit/bottomnav_cubit.dart';
import '../../services/local/cachehelper.dart';
import '../login_screen/shoplogin.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProFileCubit, ProFileState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<ProFileCubit>(context).profileModel;

        if (cubit != null) {
          // BlocProvider.of<ProFileCubit>(context).getProFiledata();
          name.text = cubit.data!.name;
          email.text = cubit.data!.email;
          phone.text = cubit.data!.phone;
        }

        return Scaffold(
            body: ConditionalBuilder(
          condition: state is ProFilesucsess,
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const [
                      Text(
                        'ProFile',
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 24),
                      ),
                    ],
                  ),
                ),
                defultFormField(
                    onTap: () {},
                    label: 'name',
                    obscureText: false,
                    hintText: 'your name',
                    sufficons: const Icon(Icons.supervised_user_circle),
                    controller: name,
                    validatormessage: 'you must enter your name'),
                defultFormField(
                    onTap: () {},
                    label: 'email',
                    obscureText: false,
                    hintText: 'your email',
                    sufficons: const Icon(Icons.supervised_user_circle),
                    controller: email,
                    validatormessage: 'you must enter your name'),
                defultFormField(
                    onTap: () {},
                    label: 'phone',
                    obscureText: false,
                    hintText: 'your phone',
                    sufficons: const Icon(Icons.phone),
                    controller: phone,
                    validatormessage: 'you must enter your phone'),
                BlocConsumer<UpdateProfileCubit, updateprofilecubitState>(
                  listener: (context, state) {
                    if (state is updateprofilecubitloading) {
                      Fluttertoast.showToast(
                          msg: BlocProvider.of<UpdateProfileCubit>(context)
                              .loginmodel!
                              .message,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 8,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        if (state is updateprofilecubitloading)
                          LinearProgressIndicator(),
                        defultbottom(
                          text: 'Update',
                          onpress: () {
                            //BlocProvider.of<BottomnavCubit>(context).;
                            BlocProvider.of<UpdateProfileCubit>(context)
                                .putdata(
                                    name: name.text,
                                    email: email.text,
                                    phone: phone.text);
                            BlocProvider.of<BottomnavCubit>(context)
                                .indexvalue = 0;

                            CacheHelper.savedata(
                                key: 'username', value: name.text);
                          },
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                defultbottom(
                  text: 'LogOut',
                  onpress: () {
                    CacheHelper.removedata(key: 'token');
                    navigateandfinish(context: context, widget: ShopLogIn());
                    print(token);
                  },
                )
              ],
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        ));
      },
    );
  }
}
