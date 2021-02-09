import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../core/Constant/Constand.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String name = Hive.box('user').get('name');
    final String phone = Hive.box('user').get('phone');
    final String email = Hive.box('user').get('email');
    final String dp = Hive.box('user').get('dp');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipOval(
                      child: Image.network(dp == null
                          ? "https://st.depositphotos.com/1779253/5140/v/600/depositphotos_51405259-stock-illustration-male-avatar-profile-picture-use.jpg:widget.profilePictureUrl"
                          : dp),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(name, style: sub),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    email,
                    style: sub,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  phone == null
                      ? Container()
                      : Text(
                          phone,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            AccountBox(
              text: "Help & Support",
              subtext: "Help Center and legal terms",
            ),
            AccountBox(
              text: "About us",
              subtext: "About the app",
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
              },
              child: AccountBox(
                text: "Logout",
                subtext: "Leave from this app",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountBox extends StatelessWidget {
  const AccountBox({
    Key key,
    this.text,
    this.subtext,
  }) : super(key: key);
  final String text;
  final String subtext;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: sub),
              Text(
                subtext,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
            ],
          )),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            //                    <--- top side
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
