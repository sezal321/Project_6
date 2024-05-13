import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project6/features/sub_route/filter.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<DateTime?> _selectedDates = [DateTime.now()];
  bool _isDatePickerVisible = false;// Track the selected dates
  @override
  Widget build(BuildContext context) {
    int red=81;
    int green=212;
    int blue=194;
    Color mycolor =Color.fromARGB(255, red, green, blue);

    return Scaffold(
      body:
      Stack(
        children: [
          ListView(
            children: [

              if (_isDatePickerVisible == true)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.transparent.withOpacity(0.1),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),//this container is responsible for making backgroung blur
              Card(
                color: Color.fromARGB(255, 243, 243, 243),

                child:Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [

                         Expanded(
                           child: GestureDetector(
                             onTap: () {
                               showSearch(
                                 context: context,
                                 delegate: CustomSearchDelegate(),
                               );
                             },
                             child: Container(
                               alignment: Alignment.centerLeft,
                               decoration: BoxDecoration(
                                 color: Color.fromARGB(255, 255, 255, 255),
                                 borderRadius: BorderRadius.circular(24.0),
                               ),

                                height: 48,

                               child:
                               Padding(
                                 padding: const EdgeInsets.only(left: 16.0),
                                 child: Text('Search',
                                   style: TextStyle(
                                       fontSize: 17
                                   ),
                                 ),
                               ),
                              ),
                           ),
                         ),
                        SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: mycolor,
                          ),
                          height: 48,
                          child: IconButton(
                                 icon:
                            Image.asset('assets/icons/search_icon.png', color: Colors.white,),
                            onPressed: (){
                                    showSearch(
                                      context: context,
                                      delegate: CustomSearchDelegate(),
                                    );
                                  },
                               ),
                        ),
                       ],
                       ),
                    ),

                    Container(
                      height: 64,
                      margin: EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(onPressed: (){
                            setState(() {
                              _isDatePickerVisible=!_isDatePickerVisible;
                            });
                          },
                              child: Text('${_formatDateRange()['startDate']}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),)
                          ),

                          Text('|',style: TextStyle(fontSize: 24),),

                          TextButton(onPressed: ()=> setState(() {
                              _isDatePickerVisible=!_isDatePickerVisible;
                            }),
                              child: Text('${_formatDateRange()['endDate']}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ),


              Text('HomePgae'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(_isDatePickerVisible==true)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),

                    ),
                    child: CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        calendarType: CalendarDatePicker2Type.range,
                        selectedDayHighlightColor: mycolor,
                      ),
                      value: _selectedDates,
                      onValueChanged: (dates) {
                        setState(() {
                          _selectedDates = dates ?? [DateTime.now()];
                        });
                      },
                    ),
                  ),
                ),
              if(_isDatePickerVisible==true)

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all( 16.0),
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isDatePickerVisible = !_isDatePickerVisible;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mycolor,
                              foregroundColor: Color.fromARGB(255,255,255,255),
                            ),


                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text('Apply',style: TextStyle(fontSize: 16),),
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),

        ],
      ),
    );
  }
  Map<String, String> _formatDateRange() {
    String startDate = '';
    String endDate = '';

    if (_selectedDates.length == 2) {
      DateFormat dateFormat = DateFormat.yMMMMd(); // Format for displaying only the date
      startDate = dateFormat.format(_selectedDates[0]!);
      endDate = dateFormat.format(_selectedDates[1]!);
    } else if (_selectedDates.length == 1) {
      DateFormat dateFormat = DateFormat.yMMMMd();
      startDate = endDate = dateFormat.format(_selectedDates[0]!);
    }

    return {'startDate': startDate, 'endDate': endDate};
  }

}

//this class is for searching
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

