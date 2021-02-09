import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Constant/Constand.dart';
import '../../../../../injection_container.dart';
import '../../../../Home/Screens/Widget/CardItemDetails.dart';
import '../../../../Widget/myCard.dart';
import '../../../../Widget/network_loading.dart';
import '../../../domain/repository/pet_repo.dart';
import '../bloc/search_bloc.dart';

class SearchUI extends StatefulWidget {
  @override
  _SearchUIState createState() => _SearchUIState();
}

class _SearchUIState extends State<SearchUI> {
  String search;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        title: Text("Search"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              style: textfield1,
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
              decoration: new InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20.0),
                  hintText: "Find Cats,Dogs,Birds.......",
                  hintStyle: textfield1,
                  filled: true,
                  //enabled: false,
                  fillColor: Colors.white,
                  border: form,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  enabledBorder: form,
                  focusedBorder: form),
            ),
          ),
        ),
        actions: [],
      ),
      body: SafeArea(
        child: SearchData(search: search),
      ),
    );
  }
}

class SearchData extends StatelessWidget {
  const SearchData({
    Key key,
    @required this.search,
  }) : super(key: key);

  final String search;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: UniqueKey(),
      create: (context) => SearchBloc(
        petRepo: sl<PetRepo>(),
      )..add(SearchEventStarted(search)),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchSuccess) {
            print("##################");
            print(search);
            return ListView.builder(
                shrinkWrap: true,
                //scrollDirection: Axis.vertical,

                itemCount: state.pet.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CardItemDetails(
                                    pet: state.pet[index],
                                  )));
                    },
                    child: MyCard(
                      amount: state.pet[index].amount,
                      createddate: state.pet[index].createddate,
                      location: state.pet[index].location,
                      petName: state.pet[index].petName,
                      photo1: state.pet[index].photo1,
                      saled: state.pet[index].saled,
                      id: state.pet[index].id,
                      search: true,
                    ),
                  );
                });
          }
          return NetworkLoading();
        },
      ),
    );
  }
}
