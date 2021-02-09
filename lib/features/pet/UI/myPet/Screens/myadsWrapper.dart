// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:petapp/features/pet/UI/myPet/Screens/editPage.dart';
// import 'package:petapp/features/pet/UI/myPet/Screens/myadDetails.dart';
// import 'package:petapp/features/pet/domain/repository/pet_repo.dart';
// import 'package:petapp/features/ui/Widget/network_loading.dart';

// import '../../../../../injection_container.dart';
// import 'bloc/myads_bloc.dart';

// class MyAdsWrapper extends StatelessWidget {
//   final int id;

//   const MyAdsWrapper({Key key, this.id}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         //TODO : give id bloc [id]
//         create: (context) =>
//             MyadsBloc(id: id, petRepo: sl<PetRepo>())..add(MyadStartEvent()),
//         child: BlocBuilder<MyadsBloc, MyadsState>(
//           builder: (context, state) {
//             if (state is MyadsGetState) {
//               return MyAdDetails(
//                 pet: state.pet,
//               );
//             } else if (state is MyadsUpdateState) {
//               return EditAds(
//                 edit: (pet) => BlocProvider.of<MyadsBloc>(context)
//                     .add(MyadUpdateEvent(pet: pet)),
//                 pet: state.pet,
//               );
//             } else if (state is MyadsSuccessState) {
//               return MyAdDetails(
//                 pet: state.pet,
//                 delete: () =>
//                     BlocProvider.of<MyadsBloc>(context).add(MyadDeleteEvent()),
//               );
//             }
//             return NetworkLoading();
//           },
//         ),
//       ),
//     );
//   }
// }
