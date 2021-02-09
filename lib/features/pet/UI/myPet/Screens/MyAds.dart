import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Constant/Constand.dart';
import '../../../../../injection_container.dart';
import '../../../../Widget/Screens/Error_loading.dart';
import '../../../../Widget/myCard.dart';
import '../../../../Widget/network_loading.dart';
import '../../../domain/repository/pet_repo.dart';
import '../bloc/mypet_bloc.dart';

class MyAdsPage extends StatefulWidget {
  @override
  _MyAdsPageState createState() => _MyAdsPageState();
}

class _MyAdsPageState extends State<MyAdsPage> {
  // final GetUserPet getUserPet = GetUserPet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: purple,
          title: Text(
            'My Ads',
            style: appHead,
          ),
        ),
        body: SafeArea(
          child: BlocProvider(
            key: UniqueKey(),
            create: (context) =>
                MypetBloc(petRepo: sl<PetRepo>())..add(MypetEventStarted()),
            child: BlocBuilder<MypetBloc, MypetState>(
              builder: (context, state) {
                if (state is MypetSuccess) {
                  return state.pet.length == 0
                      ? ErrorLoding()
                      : ListView.builder(
                          shrinkWrap: true,
                          //scrollDirection: Axis.vertical,

                          itemCount: state.pet.length,
                          itemBuilder: (BuildContext context, int index) {
                            return MyCard(
                              pet: state.pet[index],
                              amount: state.pet[index].amount,
                              createddate: state.pet[index].createddate,
                              location: state.pet[index].location,
                              petName: state.pet[index].petName,
                              photo1: state.pet[index].photo1,
                              saled: state.pet[index].saled,
                              id: state.pet[index].id,
                              search: false,
                            );
                          });
                }
                return NetworkLoading();
              },
            ),
          ),
        ));
  }
}
