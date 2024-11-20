import 'package:flutter/material.dart';

class AnimationAlignTask extends StatefulWidget {
  const AnimationAlignTask({super.key});

  @override
  State<AnimationAlignTask> createState() => _AnimationAlignTaskState();
}

class _AnimationAlignTaskState extends State<AnimationAlignTask> {
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.menu, color: Colors.white),
        backgroundColor: isBooked ? Colors.black : Colors.blue,
        title: Text(
          'Animated Align',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding:EdgeInsets.only(
                bottom: 70           ),
            child: AnimatedAlign(
              alignment: isBooked ? Alignment.topCenter : Alignment.bottomCenter,
              duration: Duration(seconds: 3),
              child:  Icon(Icons.airplanemode_active, color: isBooked?Colors.black : Colors.blue,size: 30,),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isBooked = !isBooked;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isBooked ?  Colors.black : Colors.blue,
                ),
                child: Text(
                  isBooked ? 'Successful booked!' : 'Book your Tickets Now?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),



        ],
      ),
    );
  }
}