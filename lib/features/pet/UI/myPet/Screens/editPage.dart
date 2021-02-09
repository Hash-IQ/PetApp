import 'package:flutter/material.dart';

import '../../../domain/entity/pet.dart';

class EditAds extends StatelessWidget {
  final Pet pet;
  final Function(Pet) edit;
  const EditAds({Key key, this.pet, this.edit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IconButton(
        onPressed: () {
          edit(pet);
        },
        icon: Icon(Icons.ac_unit),
      )),
    );
  }
}
