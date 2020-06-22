import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:training_diet__app/model/meal.dart';
import 'package:training_diet__app/ui/meal_detail_screen.dart';
import 'package:training_diet__app/ui/workout_screen.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:intl/intl.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
        child: BottomNavigationBar(
          iconSize: 40,
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.home),
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.search),
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.person),
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            height: height * 0.36,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    top: 35, left: 32, right: 16, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      subtitle: Text(
                        "Hello, HungLD",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      trailing: ClipOval(child: Image.asset("assets/hung.jpg")),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        _RadialProgress(
                          width: height * 0.15,
                          height: height * 0.15,
                          progress: 0.7,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _IngredientProgress(
                              ingredient: "Protein",
                              progress: 0.3,
                              progressColor: Colors.green,
                              leftAmount: 72,
                              width: width * 0.25,
                            ),
                            _IngredientProgress(
                              ingredient: "Carbs",
                              progress: 0.2,
                              progressColor: Colors.red,
                              leftAmount: 252,
                              width: width * 0.25,
                            ),
                            _IngredientProgress(
                              ingredient: "Fat",
                              progress: 0.1,
                              progressColor: Colors.yellowAccent,
                              leftAmount: 61,
                              width: width * 0.25,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.36,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 32, right: 16),
                    child: Text(
                      "MEALS FOR TODAY",
                      style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 32.0,
                          ),
                          for (int i = 0; i < meals.length; i++)
                            _MealCard(meal: meals[i]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: OpenContainer(
                      closedElevation: 0,
                      transitionType: ContainerTransitionType.fade,
                      transitionDuration: const Duration(milliseconds: 2000),
                      closedColor: const Color(0xFFE9E9E9),
                      openBuilder: (context, _) {
                        return WorkoutScreen();
                      },
                      closedBuilder: (context, VoidCallback openContainer) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => WorkoutScreen()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                bottom: 10, left: 32, right: 32),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    const Color(0xFF20008B),
                                    const Color(0xFF200087),
                                  ]),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 16, left: 16),
                                  child: Text(
                                    "YOUR NEXT WORKOUT",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4, left: 16),
                                  child: Text(
                                    "UPPER BODY",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: const Color(0xFF5B4D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/chest.png",
                                          color: Colors.white,
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: const Color(0xFF5B4D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/back.png",
                                          color: Colors.white,
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color: const Color(0xFF5B4D9D),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/biceps.png",
                                          color: Colors.white,
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress, width;
  final Color progressColor;

  const _IngredientProgress(
      {Key key,
      this.ingredient,
      this.leftAmount,
      this.progress,
      this.width,
      this.progressColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.black12,
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: progressColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text("${leftAmount}g left"),
          ],
        ),
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;
  const _RadialProgress({Key key, this.height, this.width, this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: 0.75),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: "1996",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF200087)),
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "Kcal left",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF200087),
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;
  _RadialPainter({this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 5
      ..color = Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(-relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _MealCard extends StatelessWidget {
  final Meal meal;
  const _MealCard({Key key, @required this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        top: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MealDetailScreen(
                    meal: meal,
                  )));
        },
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: OpenContainer(
                  closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  transitionDuration: const Duration(milliseconds: 1000),
                  openBuilder: (context, _) {
                    return MealDetailScreen(
                      meal: meal,
                    );
                  },
                  closedBuilder: (context, openContainer) {
                    return GestureDetector(
                        onTap: openContainer,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Image.asset(
                            meal.imagePath,
                            width: 150.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                    );
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        meal.mealTime,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        meal.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${meal.kiloCaloriesBurnt} kcal",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.black12,
                            size: 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${meal.timeTaken} min",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
