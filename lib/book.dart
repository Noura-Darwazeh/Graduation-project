// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:time_range/time_range.dart';

import 'package:soft/dates.dart';
import 'package:soft/features/home/screens/home_screens.dart';
import 'package:soft/models/book.dart';
import 'package:soft/models/salonmodel.dart';
import 'package:soft/providers/booking.dart';

class book extends StatefulWidget {
  String id;
  String time;
  String owner;
  book({
    Key? key,
    required this.id,
    required this.time,
    required this.owner,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _book();
}

class _book extends State<book> {
  List<Book> Books = [];
  List<Book> books = [];
  List timestart = [];
  List timesend = [];
  List<Book> times2 = [];
  List<TimeRangeResult?> times1 = [];

  bool allow = false;
  @override
  void initState() {
    Booking.getallBooks().then((value) {
      Books = bookFromJson(value);
    }).then((value) {
      // getalltimebook(); //
      // print(times);
    });

    //  TODO: implement initState
    super.initState();
  }

  cleanTime(String time) {
    time = time.split(' ').first;

    return time.split(':');
  }

  getalltimebook(List<Book> boo) {
    print(boo);
    boo.forEach((element) {
      if (element.salonid == widget.id &&
          _selectedDate.day == element.bookDate.day) {
        times1.add(TimeRangeResult(
            TimeOfDay(
                hour: int.parse(cleanTime(element.startbook)[0]),
                minute: int.parse(cleanTime(element.startbook)[1])),
            TimeOfDay(
                hour: int.parse(cleanTime(element.endbook)[0]),
                minute: int.parse(cleanTime(element.endbook)[1]))));
        timestart.add(TimeOfDay(
            hour: int.parse(cleanTime(element.startbook)[0]),
            minute: int.parse(cleanTime(element.startbook)[1])));
        timesend.add(TimeOfDay(
            hour: int.parse(cleanTime(element.endbook)[0]),
            minute: int.parse(cleanTime(element.endbook)[1])));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  TimeRangeResult? _timeRange;
  static const orange = Color(0xFFFE9A75);
  static const dark = Color(0xFF333A47);
  static const double leftPadding = 50;
  Widget initWidget(BuildContext context) {
    final _defaultTimeRange = TimeRangeResult(
        TimeOfDay(
            hour: int.parse(
                widget.time.split('-')[0].replaceAll(RegExp('am'), '')),
            minute: 00),
        TimeOfDay(
            hour: int.parse(
                widget.time.split('-')[1].replaceAll(RegExp('am'), '')),
            minute: 00));
    return Container(
      decoration: BoxDecoration(
          gradient: new LinearGradient(colors: [Colors.black87, Colors.pink])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.notifications_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Container(
                  margin: EdgeInsets.only(left: 30, bottom: 30),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Image.asset(
                          "assets/logo.png",
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Text(
                                'Select Date & time',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, bottom: 3.0, left: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    'Nabluse',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 6.0, bottom: 4.0, left: 4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "${widget.time}",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Container(
              //   height: 100,
              //   child: times2.isEmpty
              //       ? Text("Not Booked")
              //       : ListView.builder(
              //           shrinkWrap: true,
              //           scrollDirection: Axis.horizontal,
              //           itemCount: times2.length,
              //           itemBuilder: (context, index) {
              //             return Center(
              //                 child: Text(
              //                     times2[index].startbook +
              //                         " - " +
              //                         times2[index].endbook,
              //                     style: TextStyle(color: Colors.white)));
              //           },
              //         ),
              // ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 30),
                child: Text(
                  'Booking Date',
                  style: TextStyle(
                    color: Color(0xff363636),
                    fontSize: 25,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                height: 100,
                child: demoDates("Mon", "21", true),
                margin: EdgeInsets.only(left: 20, top: 20, right: 20),

                // child: ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: [
                //     demoDates("Mon", "21", true),
                //     demoDates("Tue", "22", false),
                //     demoDates("Wed", "23", false),
                //     demoDates("Thur", "24", false),
                //     demoDates("Fri", "25", false),
                //     demoDates("Sat", "26", false),
                //     demoDates("Sun", "27", false),
                //     demoDates("Mon", "28", false),
                //   ],
                // ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 20, top: 30),
              //   child: Text(
              //     'AM',
              //     style: TextStyle(
              //       color: Color(0xff363636),
              //       fontSize: 25,
              //       fontFamily: 'Roboto',
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),

              // Container(
              //   margin: EdgeInsets.only(right: 20),
              //   child: GridView.count(
              //     shrinkWrap: true,
              //     crossAxisCount: 3,
              //     physics: NeverScrollableScrollPhysics(),
              //     childAspectRatio: 2.7,
              //     children: [
              //       SALONTIME("08:30 AM", true),
              //       SALONTIME("08:30 AM", false),
              //       SALONTIME("08:30 AM", false),
              //       SALONTIME("08:30 AM", false),
              //       SALONTIME("08:30 AM", false),
              //       SALONTIME("08:30 AM", false),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(left: 25, top: 30),
              //   child: Text(
              //     'PM',
              //     style: TextStyle(
              //       color: Color(0xff363636),
              //       fontSize: 25,
              //       fontFamily: 'Roboto',
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(right: 20),
              //   child: GridView.count(
              //     shrinkWrap: true,
              //     crossAxisCount: 3,
              //     physics: NeverScrollableScrollPhysics(),
              //     childAspectRatio: 2.6,
              //     children: [
              //       SALONTIME("08:30 AM", true),
              //       SALONTIME("08:30 AM", false),
              //       SALONTIME("08:30 AM", false),
              //       SALONTIME("08:30 AM", false),
              //       SALONTIME("08:30 AM", false),
              //       SALONTIME("08:30 AM", false),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: TimeRange(
                  alwaysUse24HourFormat: true,
                  fromTitle: const Text(
                    'FROM',
                    style: TextStyle(
                      fontSize: 14,
                      color: dark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  toTitle: const Text(
                    'TO',
                    style: TextStyle(
                      fontSize: 14,
                      color: dark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  titlePadding: leftPadding,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: dark,
                  ),
                  activeTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: orange,
                  ),
                  borderColor: dark,
                  activeBorderColor: dark,
                  backgroundColor: Colors.transparent,
                  activeBackgroundColor: dark,
                  firstTime: TimeOfDay(
                      hour: int.parse(widget.time
                          .split('-')[0]
                          .replaceAll(RegExp('am'), '')),
                      minute: 00),
                  lastTime: TimeOfDay(
                      hour: int.parse(widget.time
                          .split('-')[1]
                          .replaceAll(RegExp('am'), '')),
                      minute: 00),
                  initialRange: _timeRange,
                  timeStep: 30,
                  timeBlock: 30,
                  onRangeCompleted: (range) {
                    print(verify(range));

                    if (!verify(range)) {
                      print("reserved");
                      setState(() {
                        allow = false;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Salon Reserved in This Periode"),
                        ));
                      });
                    } else {
                      setState(() {
                        allow = true;
                      });
                    }
                    setState(() {
                      _timeRange = range;
                    });
                  },
                  onFirstTimeSelected: (startHour) {
                    print(startHour);
                  },
                ),
              ),
              const SizedBox(height: 30),

              allow
                  ? Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 54,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xff107163),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x17000000),
                            offset: Offset(0, 15),
                            blurRadius: 15,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: TextButton(
                        child: Text(
                          'Confirmation',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {
                          print(widget.id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => dates(
                                      timeRange: _timeRange,
                                      selectedDate: _selectedDate,
                                      id: widget.id,
                                      owner: widget.owner)));
                        },
                      ))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  DateTime _selectedDate = DateTime.now();

  Widget demoDates(String day, String date, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 100,
      child: DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        height: 100,
        selectionColor: Colors.black,
        selectedTextColor: Colors.white,
        inactiveDates: [
          // DateTime.now().add(Duration(days: 3)),
          // DateTime.now().add(Duration(days: 4)),
          // DateTime.now().add(Duration(days: 7))
        ],
        onDateChange: (date) {
          // New date selected
          setState(() {
            //          _timeRange = _defaultTimeRange;
            _selectedDate = date;
            books = Books.where((element) {
              return element.bookDate.day == date.day &&
                  element.salonid == widget.id;
            }).toList();
            print(books.length);
            times1 = [];
            getalltimebook(books);
            print(_selectedDate);
          });
        },
      ),
    );

    // return isSelected ? Container(
    //   width: 70,
    //   margin: EdgeInsets.only(right: 15),
    //   decoration: BoxDecoration(
    //     color: Color(0xff107163),
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Container(
    //         child: Text(
    //           day,
    //           style: TextStyle(
    //             color: Colors.white,
    //             fontSize: 20,
    //             fontFamily: 'Roboto',
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         margin: EdgeInsets.only(top: 10),
    //         padding: EdgeInsets.all(7),
    //         child: Text(
    //           date,
    //           style: TextStyle(
    //               color: Colors.white,
    //               fontSize: 15,
    //               fontFamily: 'Roboto',
    //               fontWeight: FontWeight.bold
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ) : Container(
    //   width: 70,
    //   margin: EdgeInsets.only(right: 15),
    //   decoration: BoxDecoration(
    //     color: Color(0xffEEEEEE),
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Container(
    //         child: Text(
    //           day,
    //           style: TextStyle(
    //             color: Colors.black,
    //             fontSize: 20,
    //             fontFamily: 'Roboto',
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //       ),
    //       Container(
    //         margin: EdgeInsets.only(top: 10),
    //         padding: EdgeInsets.all(7),
    //         child: Text(
    //           date,
    //           style: TextStyle(
    //               color: Colors.black,
    //               fontSize: 15,
    //               fontFamily: 'Roboto',
    //               fontWeight: FontWeight.bold
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget SALONTIME(String time, bool isSelected) {
    return isSelected
        ? Container(
            margin: EdgeInsets.only(left: 20, top: 10),
            decoration: BoxDecoration(
              color: Color(0xff107163),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 2),
                  child: Icon(
                    Icons.access_time,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text(
                    '08:30 AM',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(left: 20, top: 10),
            decoration: BoxDecoration(
              color: Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 2),
                  child: Icon(
                    Icons.access_time,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2),
                  child: Text(
                    '08:30 AM',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  bool verify(TimeRangeResult? range) {
    print(times1);
    return times1
        .where((element) {
          final startTime = DateTime(_selectedDate.year, _selectedDate.month,
              _selectedDate.day, element!.start.hour, element.start.minute);
          final endTime = DateTime(_selectedDate.year, _selectedDate.month,
              _selectedDate.day, element.end.hour, element.end.minute);
          final startTime2 = DateTime(_selectedDate.year, _selectedDate.month,
              _selectedDate.day, range!.start.hour, range.start.minute);
          final endTime2 = DateTime(_selectedDate.year, _selectedDate.month,
              _selectedDate.day, range.end.hour, range.end.minute);

          final currentTime = DateTime.now();
          return ((startTime2.isAfter(startTime) &&
                  endTime2.isBefore(endTime)) ||
              (startTime2 == startTime && startTime2 == endTime) ||
              (endTime2.isAfter(startTime) && startTime2.isBefore(endTime) ||
                  endTime2 == startTime && endTime2 == endTime));
        })
        .toList()
        .isEmpty;
  }
}
