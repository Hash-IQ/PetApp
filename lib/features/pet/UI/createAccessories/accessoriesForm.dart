import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

import '../../../../core/Constant/Constand.dart';
import '../../../../core/location/get_location.dart';
import '../../../Home/Screens/Widget/Button.dart';
import '../pet/UI/Sell/ImagePicker.dart';
import '../pet/UI/Sell/SellDataForm.dart';

class SellAccessaForm extends StatefulWidget {
  const SellAccessaForm({Key key, this.category}) : super(key: key);
  final String category;

  @override
  _SellAccessaFormState createState() => _SellAccessaFormState();
}

class _SellAccessaFormState extends State<SellAccessaForm> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scafold = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  String name;
  String age;
  String amount;
  String description;
  String location;
  Address address; //from geocoder package
  bool transporation = false;
  @override
  void initState() {
    initPlatformState();
    categoryController.text = widget.category;
    super.initState();
  }

  initPlatformState() async {
    Address first = await getUserLocation();
    setState(() {
      address = first;
    });
  }

  buildLocationChip(String locationName) {
    if (locationName != null ?? locationName.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: InputChip(
          onPressed: () {
            setState(() {
              locationController.text = locationName;
            });
          },
          label: Text(locationName),
        ),
      );
    } else
      return Container();
  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafold,
      appBar: AppBar(
        title: Text(
          "Fill Form",
          style: appHead,
        ),
        backgroundColor: purple,
      ),
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Textfield(
                      height: 10.0,
                      hint: "Accessories Name",
                      controller: nameController,
                    ),
                    TextFormField(
                      readOnly: true,
                      autofocus: false,
                      controller: categoryController,
                      enabled: false,
                      decoration: new InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: "category",
                          hintStyle: textfield1),
                    ),
                    Textfield(
                      height: 10.0,
                      hint: "Amount",
                      controller: amountController,
                    ),
                  
                  
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            //                    <--- top side
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Textfield2(
                        height: 10.0,
                        hint: "Accessories Description",
                        controller: descriptionController,
                      ),
                    ),
                    Textfield(
                      height: 10.0,
                      hint: "Location",
                      controller: locationController,
                    ),
                    (address == null)
                        ? Container()
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                buildLocationChip(address.featureName),
                                buildLocationChip(address.subLocality),
                                buildLocationChip(address.locality),
                                buildLocationChip(address.subAdminArea),
                                buildLocationChip(address.adminArea),
                                buildLocationChip(address.countryName),
                              ],
                            ),
                          ),
                    //  (address == null) ? Container() : Divider(),
                   
                  ],
                ),
              )),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (_formKey.currentState.validate()) {
            setState(() {
              name = nameController.text;
              age = ageController.text;
              amount = amountController.text;
              description = descriptionController.text;
              location = locationController.text;
            });
            print("object");
            print(name);
            print(age);
            print(description);
            print(location);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SingleImageUpload(
                        age: age,
                        amount: amount,
                        description: description,
                        location: locationController.text,
                        name: name,
                        category: widget.category)));
          }
        },
        child: Button(
          label: "Next",
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
