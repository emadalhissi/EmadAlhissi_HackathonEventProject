import 'package:emad_alhissi_hackathon/api/controllers/event_api_controller.dart';
import 'package:emad_alhissi_hackathon/models/api_models/category.dart';
import 'package:emad_alhissi_hackathon/models/api_models/event.dart';
import 'package:emad_alhissi_hackathon/screens/event_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryNameScreen extends StatefulWidget {
  const CategoryNameScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  _CategoryNameScreenState createState() => _CategoryNameScreenState();
}

class _CategoryNameScreenState extends State<CategoryNameScreen> {
  List<Event> _eventsList = <Event>[];
  late Future<List<Event>> _future;

  @override
  void initState() {
    super.initState();
    _future = EventsApiController().getEvent(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Events',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.sp,
            fontFamily: 'Cairo',
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Event>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            _eventsList = snapshot.data ?? [];
            return Column(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 196.h,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xff253975),
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          widget.category.nameEn,
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3E3A57),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          '${widget.category.eventsCount} Events',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: Color(0xffFF4E62),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 137.h,
                      left: 142.w,
                      right: 142.w,
                      child: CircleAvatar(
                        radius: 45.r,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(widget.category.image),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      itemCount: _eventsList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventDetailsScreen(
                                    event: _eventsList[index]),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15.h),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: Color(0xffECECEF),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 14),
                              child: Row(
                                children: [
                                  Container(
                                    width: 97.w,
                                    height: 79.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.r),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            _eventsList[index].imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                '${_eventsList[index].time} - ${_eventsList[index].durationHours} hours'),
                                            Spacer(),
                                            Container(
                                              width: 50.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                color: Color(0xff11A38D)
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(5.r),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Active',
                                                  style: TextStyle(
                                                    color: Color(0xff11A38D),
                                                    fontSize: 10.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          '${_eventsList[index].name}',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Color(0xff423E5B),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          '${_eventsList[index].date}',
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            color: Color(0xff4253975),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text('No Data'),
            );
          }
        },
      ),
    );
  }
}
