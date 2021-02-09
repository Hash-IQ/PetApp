import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petapp/core/Constant/Constand.dart';
import 'package:petapp/features/Home/location/domain/repository/location_repo.dart';
import 'package:petapp/features/Home/location/ui/SearchLocation/bloc/searchlocation_bloc.dart';
import 'package:petapp/features/Widget/network_loading.dart';

import '../../../../../../injection_container.dart';

class SearchLocationUI extends StatefulWidget {
  @override
  _SearchLocationUIState createState() => _SearchLocationUIState();
}

class _SearchLocationUIState extends State<SearchLocationUI> {
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
                  hintText: "Find Places.......",
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
      create: (context) => SearchlocationBloc(
        locationRepo: sl<LocationRepo>(),
      )..add(SearchLocationEventStarted(name: search)),
      child: BlocBuilder<SearchlocationBloc, SearchlocationState>(
        builder: (context, state) {
           print("##################");
            print("##################");
         
           print( state.toString());
            print("##################");
          if (state is SearchlocationSuccess) {
            print("##################");
            print("##################");
            print("##################");
            print("##################");
            print("##################");
            print(search);
            return ListView.separated(
                shrinkWrap: true,
                //scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: state.location.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      state.location[index].place,
                      style: TextStyle(fontSize: 18),
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
