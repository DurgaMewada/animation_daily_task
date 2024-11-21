import 'package:flutter/material.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      body: Hero(
        tag: 'red',
        child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 180,),
                  Container(
                    width: 200,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Container(
                      width: 200,
                      height: 440,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                          color: Colors.white
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
