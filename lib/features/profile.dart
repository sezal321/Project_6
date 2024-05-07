import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project6/features/sub_route/forgot_password.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    Color mycolor=Color.fromARGB(255, 81, 212, 194);
    return Scaffold(

     body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(

                  decoration:
                  InputDecoration(label:

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Email'),
                  ),
                    hintText: "Enter email",
                    hintStyle: TextStyle(color: Color.fromARGB(255, 81, 212, 194),),
                    labelStyle: TextStyle(color: Color.fromARGB(255, 81, 212, 194),),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mycolor),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mycolor),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(

                  decoration:
                  InputDecoration(label:

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text('Password'),
                  ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Color.fromARGB(255, 81, 212, 194),),
                    labelStyle: TextStyle(color: Color.fromARGB(255, 81, 212, 194),),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mycolor),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mycolor),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),

              TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder:(context)=>ForgotPassword(),
                    ),
                    );
                  },
                  child:
                  Text('forgot password??',
                  style: TextStyle(color: mycolor),
                  )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mycolor,
                      foregroundColor: Color.fromARGB(255,255,255,255),
                      elevation: 0,
                      minimumSize: Size(150, 50),
                    ),
                    child: Text('Sign in',style: TextStyle(fontSize: 16),),
                  ),
                  ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mycolor,
                        foregroundColor: Color.fromARGB(255,255,255,255),
                        elevation: 0,
                        minimumSize: Size(150, 50),
                      ),
                      child: Text('Log in',style: TextStyle(fontSize: 16)),
                  ),

                ],
              ),

            ],
          ),
        ),
      )


    );
  }
}

