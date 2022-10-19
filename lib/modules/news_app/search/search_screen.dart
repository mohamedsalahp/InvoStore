import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/news_app/cubit/cubit.dart';
import 'package:untitled/layout/news_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){

        var list=NewsCubit.get(context).search;
        return  Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFormText(
                      control: searchController,
                      type: TextInputType.text,
                      validator: (value)
                      {
                        if(value.isEmpty)
                        {
                          return "Search Can't be Empty";
                        }
                        else{
                          return null;
                        }
                      },
                      onTap: (){
                        print(searchController.toString());
                      },
                      onChanged: (value)
                      {

                        NewsCubit.get(context).getSearch(value);
                      },
                      label: 'Search',
                      prefix: Icons.search),
                ),
                Expanded(child: articleBuilder(list, context,)
                ),
              ],
            )
        );
        },
    );
  }
}
