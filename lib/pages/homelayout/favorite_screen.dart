import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:favorite_button/favorite_button.dart';
import '../../cubit/getfavorite_cubit/getfavorite_cubit.dart';
import '../../cubit/homelayout_cubit/home_cubit.dart';

class Favorit extends StatefulWidget {
  const Favorit({Key? key}) : super(key: key);

  @override
  State<Favorit> createState() => _FavoritState();
}

class _FavoritState extends State<Favorit> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetFavoriteCubit, GetFavoriteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<GetFavoriteCubit>(context).favoriteModel;
        return Scaffold(
          body: ConditionalBuilder(
            condition: cubit != null,
            builder: (context) => ListView.builder(
                itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Image.network(
                              '${cubit.data!.data![index].product!.image}',
                              height: 150,
                              width: double.infinity,
                            ),
                            if (cubit.data!.data![index].product!.discount != 0)
                              Container(
                                  color: Colors.red,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: const Text(
                                    'Discount',
                                    style: TextStyle(fontSize: 12),
                                  ))
                          ],
                        ),
                        Text(
                          ' ${cubit.data!.data![index].product!.name}',
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                          style: const TextStyle(fontSize: 15, height: 1.3),
                        ),
                        Row(
                          children: [
                            Text(
                              ' ${cubit.data!.data![index].product!.price}',
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.deepOrange),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            if (cubit.data!.data![index].product!.discount != 0)
                              Text(
                                ' ${cubit.data!.data![index].product!.oldPrice}',
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            const Spacer(),
                            /*IconButton(
                              onPressed: () {},
                              icon: const CircleAvatar(
                                  backgroundColor: Colors.deepOrange,
                                  radius: 20,
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 18,
                                    color: Colors.black,
                                  )),
                            )*/
                            FavoriteButton(
                              iconColor: Colors.deepOrangeAccent,
                              iconDisabledColor: Colors.grey,
                              iconSize: 45,
                              isFavorite: BlocProvider.of<HomeCubit>(context)
                                  .homemodel!
                                  .data
                                  .products[index]
                                  .inFavorites,
                              valueChanged: (isFavorite) {
                                //print(cubit.data.products[index].id);
                                setState(() {});
                                BlocProvider.of<HomeCubit>(context)
                                    .changefavoritedata(
                                  id: cubit.data!.data![index].product!.id,
                                );
                                //BlocProvider.of<HomeCubit>(context).gethomedata()  ;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                itemCount: cubit!.data!.data!.length,
                shrinkWrap: true),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
/*
GridView.builder(
padding: const EdgeInsets.all(15),
itemCount: cubit!.data.data.length,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
childAspectRatio: 1 / 1.55,
mainAxisSpacing: 1,
crossAxisSpacing: 1,
crossAxisCount: 2),
itemBuilder: (context, index) => Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Stack(
alignment: Alignment.bottomLeft,
children: [

if (cubit.data.data[index].discount != 0)
Container(
color: Colors.red,
padding:
const EdgeInsets.symmetric(horizontal: 8),
child: const Text(
'Discount',
style: TextStyle(fontSize: 12),
))
],
),
Text(
' ${cubit.data.data[index].name}',
overflow: TextOverflow.clip,
maxLines: 2,
style: const TextStyle(fontSize: 15, height: 1.3),
),
Row(
children: [
Text(
' ${cubit.data.data[index].price}',
style: const TextStyle(
fontSize: 15, color: Colors.deepOrange),
),
const SizedBox(
width: 5,
),
if (cubit.data.data[index].discount != 0)
Text(
' ${cubit.data.data[index].old_price}',
style: const TextStyle(
fontSize: 15,
color: Colors.grey,
decoration: TextDecoration.lineThrough),
),
const Spacer(),
*/
/*IconButton(
                                  onPressed: () {},
                                  icon: const CircleAvatar(
                                      backgroundColor: Colors.deepOrange,
                                      radius: 20,
                                      child: Icon(
                                        Icons.favorite_border,
                                        size: 18,
                                        color: Colors.black,
                                      )),
                                ),*/ /*

*/
/*FavoriteButton(
                    iconColor: Colors.deepOrangeAccent,
                    iconDisabledColor: Colors.grey,
                    iconSize: 45,
                    isFavorite:true,

                    valueChanged: (isFavorite) {

                      //print(cubit.data.products[index].id);

                      BlocProvider.of<HomeCubit>(context)
                          .changefavoritedata(
                        id: cubit.data.data[index].id,
                      );
                      //BlocProvider.of<HomeCubit>(context).gethomedata()  ;
                      // هحط فانكش الفيفوريت السكريت هنا
                    },
                  ),*/ /*

],
),
],
),
)*/
