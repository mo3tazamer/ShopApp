import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/components/navigate.dart';
import 'package:shopapp/pages/search_screen/search_screen.dart';

import '../../cubit/bottomnav_cubit/bottomnav_cubit.dart';
import '../../services/local/cachehelper.dart';

class HomeLayOut extends StatelessWidget {
  const HomeLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomnavCubit, BottomnavState>(
      listener: (context, state) {
        if (state is BottomnavInitial) {
          BlocProvider.of<BottomnavCubit>(context).indexvalue = 0;
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<BottomnavCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: cubit.indexvalue != 3
                ? Text('Welcome ${CacheHelper.getdata(key: 'username')} ')
                : Text('Welcome  '),
            actions: [
              TextButton(
                  onPressed: () {
                    navigateto(context: context, widget: SearchScreen());
                  },
                  child: const Icon(Icons.search))
            ],
          ),
          body: cubit.bottomScreen[cubit.indexvalue],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.indexvalue,
              onTap: (index) {
                cubit.changebottom(index, context);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: 'Category'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ]),
        );
      },
    );
  }
}
