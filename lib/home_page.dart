import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  reset() {
    setCount(0);
    setReplays(0);
    setTotal(0);
    setGoal(100);
  }

  setCount(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("counter", value);
    getCount();
  }

  getCount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt("counter") ?? 0;
    });
  }

  setTotal(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("total", value);
    getTotal();
  }

  getTotal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      total = prefs.getInt("total") ?? 0;
    });
  }

  setReplays(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("replays", value);
    getReplays();
  }

  getReplays() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      replays = prefs.getInt("replays") ?? 0;
    });
  }

  setGoal(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("goal", value);
    getGoal();
  }

  getGoal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      goal = prefs.getInt("goal") ?? 100;
    });
  }

  setVisibility(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("visibility", value);
    getVisibility();
  }

  getVisibility() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isVisibile = prefs.getBool("visibility") ?? false;
    });
  }

  setColor(Color value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("color", value.value.toRadixString(16));
    getColor();
  }

  getColor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getString("color") ?? "0xFFB1001c";

    try {
      setState(() {
        mainColor = Color(int.parse(colorValue, radix: 16));
      });
    } catch (e) {
      // Handle the exception, e.g., set a default color
      setState(() {
        mainColor = const Color(0xFFB1001c);
      });
    }
  }

  @override
  void initState() {
    getGoal();
    getCount();
    getTotal();
    getReplays();
    getColor();
    getVisibility();
    super.initState();
  }

  Color mainColor = const Color(0xFFB1001c);
  int counter = 0;
  int goal = 100;
  int replays = 0;
  int total = 0;
  bool isVisibile = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
        title: IconButton(
          onPressed: () {
            setVisibility(!isVisibile);
          },
          icon: Icon(isVisibile ? Icons.color_lens : Icons.color_lens_outlined),
          iconSize: 35,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(color: mainColor),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "الهدف",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (goal > 10) {
                              setGoal(goal - 1);
                            }
                          },
                          color: Colors.white,
                          icon: const Icon(
                            Icons.remove_circle,
                            size: 35,
                          ),
                        ),
                        Text(
                          "$goal",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        IconButton(
                          onPressed: () {
                            setGoal(goal + 1);
                          },
                          color: Colors.white,
                          icon: const Icon(
                            Icons.add_circle,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setGoal(10000);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    7), // Adjust the radius as needed
                              ),
                            ),
                          ),
                          child: Text(
                            "10000",
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setGoal(1000);
                          },
                          child: Text(
                            "1000",
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    7), // Adjust the radius as needed
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setGoal(100);
                          },
                          child: Text(
                            "100",
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    7), // Adjust the radius as needed
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setGoal(10);
                          },
                          child: Text(
                            "10",
                            style: TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    7), // Adjust the radius as needed
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "تسبيح",
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "$counter",
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CircularPercentIndicator(
                    radius: 85,
                    lineWidth: 7.0,
                    percent: counter / goal < 1 ? counter / goal : 1,
                    center: GestureDetector(
                      onTap: () {
                        if (counter < goal) {
                          setCount(counter + 1);
                          setTotal(total + 1);
                        } else {
                          setCount(1);
                          setReplays(replays + 1);
                          setTotal(total + 1);
                        }
                      },
                      child: Icon(
                        Icons.touch_app_outlined,
                        size: 80.0,
                        color: mainColor,
                      ),
                    ),
                    backgroundColor: mainColor.withOpacity(0.3),
                    progressColor: mainColor,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "$replays :مرات التكرار",
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "$total :المجموع",
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        reset();
                      },
                      icon: Icon(
                        Icons.refresh,
                      ),
                      color: Colors.white,
                      iconSize: 30,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(mainColor)),
                    ),
                    Visibility(
                      visible: isVisibile,
                      child: Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xFFF2000c)),
                            value: const Color(0xFFF2000c),
                            groupValue: mainColor,
                            onChanged: (value) {
                              setColor(value as Color);
                            },
                          ),
                          Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Colors.black),
                            value: Colors.black,
                            groupValue: mainColor,
                            onChanged: (value) {
                              setColor(value as Color);
                            },
                          ),
                          Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xFFB1001c)),
                            value: const Color(0xFFB1001c),
                            groupValue: mainColor,
                            onChanged: (value) {
                              setColor(value as Color);
                            },
                          ),
                          Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => const Color(0xFF1F0CEB)),
                            value: const Color(0xFF1F0CEB),
                            groupValue: mainColor,
                            onChanged: (value) {
                              setColor(value as Color);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
