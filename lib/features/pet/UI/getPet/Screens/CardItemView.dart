import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../../Home/Screens/Widget/CardItem.dart';
import '../../../../Home/Screens/Widget/CardItemDetails.dart';
import '../../../../Widget/Screens/Error_loading.dart';
import '../../../../Widget/network_loading.dart';
import '../../../domain/repository/pet_repo.dart';
import '../bloc/getpet_bloc.dart';

class CardItemView extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.6;
    final double itemWidth = size.width / 2;

    return Expanded(
        child: BlocProvider(
      key: UniqueKey(),
      create: (context) =>
          GetpetBloc(petRepo: sl<PetRepo>())..add(GetpetEventStarted()),
      child: BlocBuilder<GetpetBloc, GetpetState>(
        builder: (context, state) {
          if (state is GetpetSucess) {
            return state.pet.length == 0
                ? ErrorLoding()
                : GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: List.generate(state.pet.length, (int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CardItemDetails(
                                          pet: state.pet[index],
                                        )));
                          },
                          child: CardItem(
                            amount: state.pet[index].amount,
                            image: state.pet[index].photo1,
                            location: state.pet[index].location,
                            petName: state.pet[index].petName,
                          ));
                    }),
                  );
          }
          return NetworkLoading();
        },
      ),
    ));
  }
}
