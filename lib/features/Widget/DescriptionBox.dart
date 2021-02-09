
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/Constant/Constand.dart';
import '../pet/domain/entity/pet.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({
    Key key,
    @required this.pet,
  }) : super(key: key);

  final Pet pet;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "₹" + pet.amount,
                    style: sub,
                  ),
                  Text(pet.petName, style: name),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blueAccent,
                            size: 20,
                          ),
                          Text(
                            pet.location,
                            style: text2,
                          ),
                        ],
                      ),
                      Text(
                        DateFormat('EEE, d MMM').format(pet.createddate),
                        style: textfield1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: ClipOval(
              child: Image.network(pet.userImage == null
                  ? "https://st.depositphotos.com/1779253/5140/v/600/depositphotos_51405259-stock-illustration-male-avatar-profile-picture-use.jpg:widget.profilePictureUrl"
                  : pet.userImage),
            ),
            title: Text(
              pet.userName,
              style: sub,
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Category",
                    style: sub,
                  ),
                  SizedBox(
                    width: 62,
                  ),
                  Text(
                    pet.petCategory,
                    style: sub,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Transporation",
                    style: sub,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    pet.transportation ? "Available" : "Not Available",
                    style: sub,
                  ),
                ],
              ),
            ),
          ),
          pet.age == null || pet.age.isEmpty
              ? Container()
              : Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Age",
                          style: sub,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          pet.age,
                          style: sub,
                        ),
                      ],
                    ),
                  ),
                ),
          Divider(
            thickness: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: sub,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    pet.description,
                    style: sub,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
