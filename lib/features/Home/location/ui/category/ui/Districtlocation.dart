import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:petapp/core/Constant/Constand.dart';
import 'package:petapp/features/Home/Screens/Home/Home.dart';
import 'package:petapp/features/Home/location/domain/repository/location_repo.dart';
import 'package:petapp/features/Home/location/ui/category/bloc/district_bloc.dart';
import 'package:petapp/features/Widget/Screens/Error_loading.dart';
import 'package:petapp/features/Widget/network_loading.dart';

import '../../../../../../injection_container.dart';

class DistrictLocation extends StatelessWidget {
  final String category;

  const DistrictLocation({Key key, this.category}) : super(key: key);
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        title: Text(category),
      ),
      body: SafeArea(
        child: BlocProvider(
          key: UniqueKey(),
          create: (context) => DistrictBloc(locationRepo: sl<LocationRepo>())
            ..add(DistrictEventStarted(district: category)),
          child: BlocBuilder<DistrictBloc, DistrictState>(
            builder: (context, state) {
              if (state is DistrictSuccess) {
                return state.location.length == 0
                    ? ErrorLoding()
                    : ListView.separated(
                        shrinkWrap: true,
                        //scrollDirection: Axis.vertical,
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: state.location.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: GestureDetector(
                              onTap: () {
                                Hive.box('location').clear().then((value) {
                                  Hive.box('location').put("latitude",
                                      state.location[index].latitude);
                                  Hive.box('location').put("longitude",
                                      state.location[index].longitude);
                                  Hive.box('location').put("locationName",
                                      state.location[index].place);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                });
                              },
                              child: Text(
                                state.location[index].place,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          );
                        });
              }
              return NetworkLoading();
            },
          ),
        ),
      ),
    );
  }
}
