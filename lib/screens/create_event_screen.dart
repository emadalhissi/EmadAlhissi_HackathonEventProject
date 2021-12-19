import 'package:emad_alhissi_hackathon/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CreateEvenScreen extends StatefulWidget {
  const CreateEvenScreen({Key? key}) : super(key: key);

  @override
  _CreateEvenScreenState createState() => _CreateEvenScreenState();
}

class _CreateEvenScreenState extends State<CreateEvenScreen> {
  // var format = DateFormat.yMd('en');

  // var dateString = format.format(DateTime.now());

  late TextEditingController _nameEditingController;
  late TextEditingController _numberOfHoursEditingController;
  late TextEditingController _locationEditingController;

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController();
    _numberOfHoursEditingController = TextEditingController();
    _locationEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _numberOfHoursEditingController.dispose();
    _locationEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'New Event',
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
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(
                  color: Color(0xff040404),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 5.h),
              InputTextField(
                hint: 'Enter event name',
                editingController: _nameEditingController,
                obscure: false,
                borderColor: Color(0xff707070),
                function: () {
                  setState(() {
                    _nameEditingController;
                  });
                },
              ),
              SizedBox(height: 22.h),
              Text(
                'Date',
                style: TextStyle(
                  color: Color(0xff040404),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 5.h),
              TextField(
                cursorColor: Color(0xff707070),
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    maxHeight: 60.h,
                    maxWidth: double.infinity,
                  ),
                  hintText: '21 December 2021',
                  hintStyle: TextStyle(
                    color: Color(0xff9A9696),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide(
                      color: Color(0xff040404),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide(
                      color: Color(0xff040404),
                    ),
                  ),
                ),
                obscureText: false,
              ),
              SizedBox(height: 22.h),
              Text(
                'Time',
                style: TextStyle(
                  color: Color(0xff040404),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 5.h),
              TextField(
                cursorColor: Color(0xff707070),
                decoration: InputDecoration(
                  constraints: BoxConstraints(
                    maxHeight: 60.h,
                    maxWidth: double.infinity,
                  ),
                  hintText: '12:00 PM',
                  hintStyle: TextStyle(
                    color: Color(0xff9A9696),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide(
                      color: Color(0xff040404),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide(
                      color: Color(0xff040404),
                    ),
                  ),
                ),
                obscureText: false,
              ),
              SizedBox(height: 22.h),
              Text(
                'Hours',
                style: TextStyle(
                  color: Color(0xff040404),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 5.h),
              InputTextField(
                hint: 'No. Of Hours',
                editingController: _numberOfHoursEditingController,
                obscure: false,
                borderColor: Color(0xff707070),
                function: () {
                  setState(() {
                    _numberOfHoursEditingController;
                  });
                },
              ),
              SizedBox(height: 22.h),
              Text(
                'Location',
                style: TextStyle(
                  color: Color(0xff040404),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 5.h),
              InputTextField(
                hint: 'Location',
                editingController: _locationEditingController,
                obscure: false,
                borderColor: Color(0xff707070),
                function: () {
                  setState(() {
                    _locationEditingController;
                  });
                },
              ),
              SizedBox(height: 22.h),
              Text(
                'Information',
                style: TextStyle(
                  color: Color(0xff040404),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 5.h),
              TextField(
                maxLength: 100,
                maxLines: 7,
                decoration: InputDecoration(
                  hintText: 'Enter the description',
                  hintStyle: TextStyle(
                    color: Color(0xff9A9696),
                  ),
                  focusedBorder: border(),
                  enabledBorder: border(),
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                'Capture',
                style: TextStyle(
                  color: Color(0xff040404),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 25.h),
              Container(
                alignment: Alignment.center,
                height: 200.h,
                width: 170.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Add'),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, '/');
                },
                child: Text('Create New Event'),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff253975),
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder border({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
