import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
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
                border: Border.all(color: Colors.blue),
              ),
              margin: EdgeInsets.all(8.0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Search',
                       style: TextStyle(
                         color: Colors.blue,
                        fontSize: 16.0,
                       ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      icon: Icon(Icons.search,color: Colors.blue),
                      onPressed: null,
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
          icon: const Icon(Icons.clear),
           onPressed: () {
          query = '';
          },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
        icon: const Icon(Icons.arrow_back),
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
          title: Text(result),
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
            title: Text(result),
          );
        }
    );
  }
}
