import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/routs_constants.dart';
import 'package:loopi_driver/cubits/app_theme_cubit/cubit/app_theme_cubit.dart';
import 'package:loopi_driver/cubits/phone_cubit/phone_auth_cubit.dart';
import 'package:loopi_driver/views/profile_screen/widgets/divider_custom_widget.dart';
import 'package:loopi_driver/views/profile_screen/widgets/list_item_custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //final LoginRegisterCubit loginRegisterCubit = LoginRegisterCubit();

  @override
  Widget build(BuildContext context) {
    String? authUser =
        BlocProvider.of<PhoneAuthCubit>(context).getLoggedInUser().phoneNumber;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: 80,
              height: 80,
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48), // Image radius
                  child: Image.asset(
                    'assets/images/icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                authUser!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            DividerCustomWidget(),
            const SizedBox(height: 10),
            ListItemButton(
              leadingIcon: FontAwesomeIcons.person,
              title: 'المعلومات الشخصية',
              trailing: Icon(Icons.arrow_forward_ios),

              onTap: () {},
            ),
            DividerCustomWidget(),
            const SizedBox(height: 10),
            ListItemButton(
              leadingIcon: Icons.dark_mode_outlined,
              title: 'الحالة المظلمة',
              trailing: CupertinoSwitch(
                value: BlocProvider.of<AppThemeCubit>(context).isTheme,
                onChanged: (val) {
                  BlocProvider.of<AppThemeCubit>(context).changeTheme(val);

                  setState(() {});
                },
              ),

              onTap: () {},
            ),
            // DividerCustomWidget(),
            // const SizedBox(height: 10),
            // ListItemButton(
            //   leadingIcon: FontAwesomeIcons.clockRotateLeft,
            //   title: 'Ticket History',
            //   trailing: Icon(Icons.arrow_forward_ios),

            //   onTap: () {},
            // ),
            const SizedBox(height: 10),
            DividerCustomWidget(),
            const SizedBox(height: 10),
            ListItemButton(
              leadingIcon: Icons.settings,
              title: 'ألاعدادات',
              trailing: Icon(Icons.arrow_forward_ios),

              onTap: () {},
            ),
            const SizedBox(height: 10),
            DividerCustomWidget(),
            const SizedBox(height: 10),
            ListItemButton(
              leadingIcon: Icons.chat,
              title: 'الدردشة',
              trailing: Icon(Icons.arrow_forward_ios),

              onTap: () {},
            ),
            const SizedBox(height: 10),
            DividerCustomWidget(),
            const SizedBox(height: 10),
            ListItemButton(
              leadingIcon: FontAwesomeIcons.backward,
              title: 'تسجيل الخروج',
              trailing: Icon(Icons.arrow_back_ios_new),

              onTap: () {
                BlocProvider.of<PhoneAuthCubit>(context).logOut();
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, getStartedScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
