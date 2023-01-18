import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/category_cubit/category_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CategoryCubit>(context).categorymodel;
        return ConditionalBuilder(
          condition: cubit != null,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: cubit!.data.data.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.network(
                          cubit!.data.data[index].image,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(cubit!.data.data[index].name),
                    ],
                  )
                ],
              ),
            ),
            separatorBuilder: (context, index) => const Divider(),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
