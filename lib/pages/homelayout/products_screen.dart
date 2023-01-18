import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../cubit/getfavorite_cubit/getfavorite_cubit.dart';
import '../../cubit/homelayout_cubit/home_cubit.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<HomeCubit>(context).homemodel;

          return ConditionalBuilder(
              condition: cubit != null,
              builder: (context) => SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        CarouselSlider(
                            items: cubit!.data.banners
                                .map((e) => Image.network(
                                      e.image,
                                      fit: BoxFit.cover,
                                    ))
                                .toList(),
                            options: CarouselOptions(
                                height: 250,
                                autoPlay: true,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlayCurve: Curves.linearToEaseOut,
                                viewportFraction: 1.0)),
                        const SizedBox(
                          height: 10,
                        ),
                        GridView.builder(
                          padding: const EdgeInsets.all(15),
                          itemCount: cubit.data.products.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  Image.network(
                                    cubit.data.products[index].image,
                                    height: 150,
                                    width: double.infinity,
                                  ),
                                  if (cubit.data.products[index].discount != 0)
                                    Container(
                                        color: Colors.red,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: const Text(
                                          'Discount',
                                          style: TextStyle(fontSize: 12),
                                        ))
                                ],
                              ),
                              Text(
                                cubit.data.products[index].name,
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                                style:
                                    const TextStyle(fontSize: 15, height: 1.3),
                              ),
                              Row(
                                children: [
                                  Text(
                                    ' ${cubit.data.products[index].price.round()}',
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.deepOrange),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  if (cubit.data.products[index].discount != 0)
                                    Text(
                                      ' ${cubit.data.products[index].oldPrice.round()}',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough),
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
                                  ),*/
                                  FavoriteButton(
                                    iconColor: Colors.deepOrangeAccent,
                                    iconDisabledColor: Colors.grey,
                                    iconSize: 45,
                                    isFavorite:
                                        cubit.data.products[index].inFavorites,
                                    valueChanged: (isFavorite) {
                                      setState(() {});
                                      print(cubit.data.products[index].id);

                                      BlocProvider.of<HomeCubit>(context)
                                          .changefavoritedata(
                                        id: cubit.data.products[index].id,
                                      );
                                      BlocProvider.of<GetFavoriteCubit>(context)
                                          .getfavoritedata();
                                      //BlocProvider.of<HomeCubit>(context).gethomedata()  ;
                                      // هحط فانكش الفيفوريت السكريت هنا
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
