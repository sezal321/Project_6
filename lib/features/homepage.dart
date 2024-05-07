import 'package:flutter/material.dart';
import 'package:project6/features/sub_route/filter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    int red=81;
    int green=212;
    int blue=194;
    Color mycolor =Color.fromARGB(255, red, green, blue);

    return Scaffold(

      appBar: AppBar
        (
        actions:
        [
        Expanded(
          child: GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },

            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(color: mycolor),
              ),
              margin: EdgeInsets.only(left: 16.0,right: 16.0,top: 4.0,bottom: 8.0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: IconButton(
                      icon: Image.asset('assets/icons/search_icon.png',color: mycolor,),
                      onPressed: null,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: IconButton(
                     icon: Image.asset('assets/icons/filter_icon.png',color: mycolor,),
                      onPressed: ()
                      {
                       Navigator.push
                         (
                         context,
                        MaterialPageRoute(builder: (context)=>Filter()),
                       );
                     }
                    ),
                  ),
                ],
              ),
            ),
          ),
        )

        ],
      ),

      body:
      ListView(
        children: [
          Text('HomePgae'),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate{

  List<String> searchTerm=[
    'Apple',
    'Banana',
    'Pear',
    'Watermelons',
    'Oranges',
    'Blueberries',
    'Strawberries',
    'Raspberries',
  ];


  @override
  List<Widget> buildActions(BuildContext context){

    return[
      IconButton(
          icon: const Icon(Icons.clear,color: Color.fromARGB(255, 81, 212, 194)),
           onPressed: () {
          query = '';
          },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
        icon: const Icon(Icons.arrow_back,color:Color.fromARGB(255, 81, 212, 194),),
        onPressed: () {
          close(context, null);
        },
      );
  }

  @override
  Widget buildResults(BuildContext context)
  {
    List<String> matchQuery =[];
    for(var fruit in searchTerm)
    {
      if(fruit.toLowerCase().contains(query.toLowerCase()))
      {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
        itemBuilder: (context,index)
         {
        var result = matchQuery[index];

          return ListTile(
          title: Text(
              result,
            style: TextStyle(color:Color.fromARGB(255, 81, 212, 194),),
          ),
            );
         }
        );
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    List<String> matchQuery =[];
    for(var fruit in searchTerm)
    {
      if(fruit.toLowerCase().contains(query.toLowerCase()))
      {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context,index)
        {
          var result = matchQuery[index];

          return ListTile(
            title: Text(
              result,
              style: TextStyle(color:Color.fromARGB(255, 81, 212, 194),),

            ),
          );
        }
    );
  }
}
