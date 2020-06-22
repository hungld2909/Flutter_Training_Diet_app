import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:training_diet__app/model/upper_body_workout.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(
                  "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  "Upper Body",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.white30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "60 mins",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.shutter_speed,
                          color: Colors.white30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Easy",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < upperBody.length; i++)
                Column(
                  children: [
                    for (int j = 0; j < upperBody[i].length; j++)
                      ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: const Color(0xFF5B4D9D),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: Image.asset(
                            upperBody[i][j].imagePath,
                            width: 40,
                            height: 40,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          upperBody[i][j].name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          upperBody[i][j].instruction,
                          style: TextStyle(
                              color: Colors.white30,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
