import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/search_cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  var text = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Searchcubit, SearchcubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<Searchcubit>(context).searchModel;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    BlocProvider.of<Searchcubit>(context).Postdata(text: value);
                  },
                  obscureText: false,
                  controller: text,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    suffixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: (BorderRadius.circular(25))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (state is Searchcubitloading)
                  const LinearProgressIndicator(),
                const SizedBox(
                  height: 15,
                ),
                if (state is Searchcubitsucsess)
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit!.data.data.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 120,
                                width: 100,
                                child: Image.network(
                                  cubit.data.data[index].image,
                                ),
                              ),
                              Text(
                                '${cubit.data.data[index].price}',
                                maxLines: 2,
                                softWrap: true,
                                style: const TextStyle(
                                  fontSize: 14,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          Text(
                            cubit.data.data[index].name,
                            maxLines: 2,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.visible,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
/*
Expanded(
child: ListView.builder( itemCount: cubit!.data.data.length,
itemBuilder: (context, index) => Column(
children: [
Container(height: 100,
child: Image.network(
cubit.data.data[index].image,),
),
Text(cubit.data.data[index].name)
],
),

),
);



var cubit = BlocProvider.of<Searchcubit>(context).searchModel;
if(state is Searchcubitloading)*/
