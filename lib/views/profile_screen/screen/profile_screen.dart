import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/routs_constants.dart';
import 'package:loopi_driver/cubits/app_theme_cubit/cubit/app_theme_cubit.dart';
import 'package:loopi_driver/cubits/home_cubit/cubit/home_cubit.dart';
import 'package:loopi_driver/cubits/phone_cubit/phone_auth_cubit.dart';
import 'package:loopi_driver/models/driver_model.dart';
import 'package:loopi_driver/views/home_screen/screens/home_screen.dart';
import 'package:loopi_driver/views/profile_screen/widgets/divider_custom_widget.dart';
import 'package:loopi_driver/views/profile_screen/widgets/list_item_custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarCustomWidget(
                    driverModell:
                        state is HomeSuccess
                            ? state.driverModel
                            : DriverModel(
                              driverName: '',
                              phoneNumber: '',
                              licenseNumber: '',
                              driverImage: '',
                              fromWhere: '',
                              toWhere: '', address: '',
                            ),
                  ),
                  const SizedBox(height: 30),
                  const SizedBox(height: 10),
                  ListItemButton(
                    leadingIcon: FontAwesomeIcons.person,
                    title: 'المعلومات الشخصية',
                    trailing: Icon(Icons.arrow_forward_ios),

                    onTap: () {
                      Navigator.pushNamed(context, personalInfoPage);
                    },
                  ),
                  DividerCustomWidget(),
                  const SizedBox(height: 10),
                  ListItemButton(
                    leadingIcon: Icons.dark_mode_outlined,
                    title: 'الحالة المظلمة',
                    trailing: CupertinoSwitch(
                      value: BlocProvider.of<AppThemeCubit>(context).isTheme,
                      onChanged: (val) {
                        BlocProvider.of<AppThemeCubit>(
                          context,
                        ).changeTheme(val);

                        setState(() {});
                      },
                    ),

                    onTap: () {},
                  ),
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

                    onTap: () {
                      Navigator.pushNamed(context, messageScreen);
                    },
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
              );
            },
          ),
        ),
      ),
    );
  }
}
