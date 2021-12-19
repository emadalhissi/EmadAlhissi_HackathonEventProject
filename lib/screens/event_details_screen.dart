import 'package:emad_alhissi_hackathon/models/api_models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Event Name',
          style: TextStyle(
            fontSize: 18.sp,
            color: Color(0xff3E3A57),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff423D5B),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Color(0xff403B58),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_enhance,
              color: Color(0xff403B58),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 206.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                      image: NetworkImage(widget.event.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 25.h,
                  left: 21,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.only(
                          bottom: 5.h,
                        ),
                        height: 25.h,
                        // width: 85.w,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.alarm),
                            SizedBox(width: 2.w),
                            Text(
                              '${widget.event.durationHours} Hours',
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   height: 25.h,
                      //   // width: 80.w,
                      //   decoration: BoxDecoration(
                      //     color: Colors.grey.withOpacity(0.7),
                      //     borderRadius: BorderRadius.circular(25),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       Icon(Icons.star),
                      //       SizedBox(width: 2.w),
                      //       Text(
                      //         '2 Hours',
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Text(
              '${widget.event.name}',
              style: TextStyle(
                fontSize: 20.sp,
                color: Color(0xff403B58),
              ),
            ),
            SizedBox(height: 7.h),
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.grey.shade500,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '${widget.event.time}',
                      style: TextStyle(
                        color: Color(0xff8E8B9D),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.grey.shade500,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '${widget.event.date}',
                      style: TextStyle(
                        color: Color(0xff8E8B9D),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.grey.shade500,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '${widget.event.imagesCount} Images',
                      style: TextStyle(
                        color: Color(0xff8E8B9D),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 13.h),
            Row(
              children: [
                Icon(
                  Icons.add_location,
                  color: Color(0xff403B58),
                  size: 24.w,
                ),
                SizedBox(width: 7.w),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Color(0xff403B58),
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.h),
            Row(
              children: [
                Icon(
                  Icons.info,
                  color: Color(0xff403B58),
                  size: 24.w,
                ),
                SizedBox(width: 7.w),
                Text(
                  'Info',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Color(0xff403B58),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Text(
              '${widget.event.info}',
              style: TextStyle(
                color: Color(0xff807C94),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
