import 'dart:io';

import 'package:emad_alhissi_hackathon/api/api_helper.dart';
import 'package:emad_alhissi_hackathon/api/controllers/images_api_controller.dart';
import 'package:emad_alhissi_hackathon/helpers/helpers.dart';
import 'package:emad_alhissi_hackathon/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateEvenScreen extends StatefulWidget {
  const CreateEvenScreen({Key? key}) : super(key: key);

  @override
  _CreateEvenScreenState createState() => _CreateEvenScreenState();
}

class _CreateEvenScreenState extends State<CreateEvenScreen> with ApiHelper {
  // var format = DateFormat.yMd('en');

  // var dateString = format.format(DateTime.now());
  ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedFile;

  late TextEditingController _nameEditingController;
  late TextEditingController _dateEditingController;
  late TextEditingController _timeEditingController;
  late TextEditingController _numberOfHoursEditingController;
  late TextEditingController _locationEditingController;
  late TextEditingController _infoEditingController;

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController();
    _dateEditingController = TextEditingController();
    _timeEditingController = TextEditingController();
    _numberOfHoursEditingController = TextEditingController();
    _locationEditingController = TextEditingController();
    _infoEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _dateEditingController.dispose();
    _timeEditingController.dispose();
    _numberOfHoursEditingController.dispose();
    _locationEditingController.dispose();
    _infoEditingController.dispose();
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
                controller: _dateEditingController,
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
                      color: Color(0xff707070),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide(
                      color: Color(0xff707070),
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
                controller: _timeEditingController,
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
                      color: Color(0xff707070),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide(
                      color: Color(0xff707070),
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
                controller: _infoEditingController,
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
              SizedBox(height: 10.h),
              Text(
                'Capture',
                style: TextStyle(
                  color: Color(0xff040404),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 25.h),
              Row(
                children: [
                  InkWell(
                    onTap: () async => _pickImage(),
                    child: Container(
                      alignment: Alignment.center,
                      height: 200.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                          ),
                          SizedBox(width: 5.w),
                          Text('Add'),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  _pickedFile != null
                      ? Container(
                          alignment: Alignment.center,
                          height: 200.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(File(_pickedFile!.path)),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        )
                      : Center(),
                  SizedBox(width: 15.w),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              ElevatedButton(
                onPressed: () async{
                  await create();
                  Navigator.pop(context);
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

  Future<void> _pickImage() async {
    XFile? imageFile = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    if (imageFile != null) {
      setState(() {
        _pickedFile = imageFile;
      });
    }
  }

  Future<void> performCreate() async {
    if (checkData()) {
      await create();
    }
  }

  bool checkData() {
    if (_pickedFile != null &&
        _nameEditingController.text.isNotEmpty &&
        _dateEditingController.text.isNotEmpty &&
        _timeEditingController.text.isNotEmpty &&
        _numberOfHoursEditingController.text.isNotEmpty &&
        _locationEditingController.text.isNotEmpty &&
        _infoEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> create() async {
    ImagesApiController().uploadImage(
      context,
      path: _pickedFile!.path,
      uploadImageCallback: (
          {event, required String message, required bool status}) {
        if (status) {
          // _changeProgressValue(value: 1);
          showSnackBar(context, message: message);
        } else {
          // _changeProgressValue(value: 0);
          showSnackBar(context, message: message, error: true);
        }
      },
      id: '1',
      name: _nameEditingController.text,
      info: _infoEditingController.text,
      date: _dateEditingController.text,
      time: _timeEditingController.text,
      address: _locationEditingController.text,
      hours: _numberOfHoursEditingController.text,
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
