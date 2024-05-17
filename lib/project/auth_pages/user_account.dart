import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touch2truth/project/classes/constants.dart';

class UserAccount extends StatefulWidget {
  @override
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  List<String> textList = [
    "Personal information",
    "Change password",
    "Sign out"
  ];
  List<IconData> iconList = [
    Icons.person,
    Icons.admin_panel_settings_sharp,
    Icons.logout
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(270.h),
        child: Container(
          height: 270,
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Center(
                  child: CircleAvatar(
                    child: CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Color.fromRGBO(210, 234, 251, 1),
                      backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.euqcyHvusXHENYgYwF-C5wHaFh?rs=1&pid=ImgDetMain', // Replace with the actual image URL
                      ),
                    ),
                    radius: 45.r,
                    backgroundColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    "User name",
                    style: TextStyle(
                        fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            title: Center(
              child: Text(
                'Hey There!',
                style: TextStyle(fontSize: 25.sp),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: iconList.length,
              itemBuilder: (context, int) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Handle the button click for the corresponding item
                        // You can add your navigation logic here
                        print("Button clicked for ${textList[int]}");
                        // _auth.signOut();
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                        leading: Icon(
                          iconList[int],
                          size: 30.sp,
                        ),
                        title: Text(
                          textList[int],
                          style: TextStyle(fontSize: 25.sp),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    Divider(
                      height: 0,
                      thickness: 0.8.w,
                      color: grey,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
