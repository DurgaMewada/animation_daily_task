import 'package:flutter/material.dart';

class DragAnimation extends StatefulWidget {
  const DragAnimation({super.key});

  @override
  State<DragAnimation> createState() => _DragAnimationState();
}

class _DragAnimationState extends State<DragAnimation> {
  Map<String, Color> matches = {};
  List<Map<String, dynamic>> colorData = [
    {'color': Colors.teal, 'name': 'Teal'},
    {'color': Colors.orange, 'name': 'Orange'},
    {'color': Colors.yellow, 'name': 'Yellow'},
    {'color': Colors.green, 'name': 'Green'},
    {'color': Colors.red, 'name': 'Red'},
    {'color': Colors.cyan, 'name': 'Cyan'},

  ];

  List<String> shuffledNames = [];

  @override
  void initState() {
    super.initState();
    shuffledNames = List<String>.from(
        colorData.map((item) => item['name'] as String))..shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Colors',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 40),
        child: Row(
          children: [

            Expanded(
              child: ListView.builder(
                itemCount: colorData.length,
                itemBuilder: (context, index) {
                  final color = colorData[index]['color'] as Color?;
                  final name = colorData[index]['name'] as String;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Draggable<String>(
                      data: name,
                      feedback: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                      childWhenDragging: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12),
                        ),
                      ),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ListView.builder(
                itemCount: shuffledNames.length,
                itemBuilder: (context, index) {
                  final name = shuffledNames[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DragTarget<String>(
                      onAccept: (receivedName) {
                        if (receivedName == name) {
                          setState(() {
                            matches[name] = colorData.firstWhere(
                                    (item) => item['name'] == name)['color']
                            as Color;
                          });
                        }
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: matches.containsKey(name)
                                ? matches[name]
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text(
                              name,
                              style: TextStyle(
                                fontSize: 16,
                                color: matches.containsKey(name)
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
