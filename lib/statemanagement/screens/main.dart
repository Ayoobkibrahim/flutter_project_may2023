
import 'package:flutter/material.dart';
import 'package:flutter_project_may2023/statemanagement/provider/Movie%20provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider<MovieProvider>(create:(context)=>MovieProvider(),
  child: MaterialApp(home: Homee(),
  debugShowCheckedModeBanner: false,),));
}

class Homee extends StatelessWidget {
  const Homee({super.key});



  @override
  Widget build(BuildContext context) {

    var movie_to_whishlist = context.watch<MovieProvider>().whismovie;
    var movies = context.watch<MovieProvider>().movies;


    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.favorite),
            label: Text("whislist"),
          ),
          Expanded(child: ListView.builder(
            itemCount: movies.length,
              itemBuilder: (context,index){
              // movies is list of map
              final currentmovie = movies[index];
            return Card(
              child: ListTile(
                title: Text(currentmovie.title),
                subtitle: Text(currentmovie.time!),
                trailing: IconButton(onPressed: (){
                  if(!movie_to_whishlist.contains(currentmovie)){
                    context.read<MovieProvider>().addToList(currentmovie);

                  } else{
                    context.read<MovieProvider>().addToList(currentmovie);
                  }

                },
                icon:Icon(
                    Icons.favorite,
                color:
                movie_to_whishlist.contains(currentmovie)
                ? Colors.red :
                Colors.white),)
              ),
            );
          }))
        ],
      ),),
    );
  }
}
