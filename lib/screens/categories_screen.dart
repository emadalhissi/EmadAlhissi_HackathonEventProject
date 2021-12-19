import 'package:emad_alhissi_hackathon/api/controllers/auth_api_controller.dart';
import 'package:emad_alhissi_hackathon/api/controllers/category_api_controller.dart';
import 'package:emad_alhissi_hackathon/models/api_models/category.dart';
import 'package:emad_alhissi_hackathon/screens/category_name_screen.dart';
import 'package:emad_alhissi_hackathon/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> _categoriesList = <Category>[];
  late Future<List<Category>> _future;

  @override
  void initState() {
    super.initState();
    _future = CategoriesApiController().getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Categories',
          style: TextStyle(
            color: Color(0xff1B2D49),
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
            fontFamily: 'Cairo',
          ),
        ),
        actions: [

          Padding(
            padding: const EdgeInsetsDirectional.only(end: 16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.grey.shade300,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/create_event_screen');
                },
                icon: Icon(
                  Icons.add,
                  color: Color(0xff4E486A),
                  size: 30.w,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () async => await logout(),
            icon: Icon(
              Icons.logout,
              color: Color(0xff4E486A),
              size: 30.w,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: FutureBuilder<List<Category>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              _categoriesList = snapshot.data ?? [];
              return GridView.builder(
                itemCount: _categoriesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryNameScreen(
                              category: _categoriesList[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35.r),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            _categoriesList[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10.h,
                                    left: 10.w,
                                    child: Container(
                                      height: 25.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(35.r),
                                      ),
                                      child: Row(
                                        children: [
                                          // Icon(
                                          //   Icons.star,
                                          //   size: 18,
                                          //   color: Colors.white,
                                          // ),
                                          Spacer(),
                                          Text(
                                            // ' 6 Events',
                                            '${_categoriesList[index].eventsCount} Events',
                                            style: TextStyle(
                                              fontSize: 11.sp,
                                              fontFamily: 'Cairo',
                                              color: Colors.white,
                                            ),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              _categoriesList[index].nameEn,
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('No Data'),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> logout() async {
    bool status = await AuthApiController().logout(context);
    if(status) {
      SharedPreferencesController().logout();
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }
}
