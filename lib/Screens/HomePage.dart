// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicine_app/Components/custom_card.dart';
import 'package:medicine_app/Models/medicineModel.dart';
import 'package:medicine_app/Screens/DetailsScreen.dart';
import 'package:medicine_app/provider/cart.dart';
import 'package:provider/provider.dart';

import '../Components/appbarCom.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  late List<MedicineModel> medicineList = [
    MedicineModel(
        NameofMedicine: 'PanadolNight', Price: 77, ImagePath: '1.jpeg'),
    MedicineModel(
        NameofMedicine: 'PanadolCold', Price: 66, ImagePath: '2.jpeg'),
    MedicineModel(
        NameofMedicine: 'PanadolExtra', Price: 22, ImagePath: '3.jpeg'),
    MedicineModel(
        NameofMedicine: 'PanadolVapor', Price: 65, ImagePath: '4.jpeg'),
    MedicineModel(
        NameofMedicine: 'PanadolAdvance', Price: 87, ImagePath: '5.jpeg'),
    MedicineModel(NameofMedicine: 'PanadolEx', Price: 98, ImagePath: '6.jpeg'),
    MedicineModel(NameofMedicine: 'Dolcyl M', Price: 87.7, ImagePath: '7.jpeg'),
    MedicineModel(
        NameofMedicine: 'Concor Tablet', Price: 13.98, ImagePath: '8.jpeg'),
    MedicineModel(NameofMedicine: 'Concor Cor', Price: 11, ImagePath: '9.jpeg'),
    MedicineModel(NameofMedicine: 'Nebilet ', Price: 43, ImagePath: '10.jpeg'),
    MedicineModel(
        NameofMedicine: 'Congestal ', Price: 97.23, ImagePath: '11.jpeg'),
    MedicineModel(
        NameofMedicine: 'Immunoflu ', Price: 98, ImagePath: '12.jpeg'),
    MedicineModel(
        NameofMedicine: 'PanadolNight', Price: 12, ImagePath: '1.jpeg'),
    MedicineModel(
        NameofMedicine: 'PanadolCold', Price: 17, ImagePath: '2.jpeg'),
    MedicineModel(
        NameofMedicine: 'PanadolExtra', Price: 12.9, ImagePath: '3.jpeg'),
    MedicineModel(
        NameofMedicine: 'PanadolVapor', Price: 14.7, ImagePath: '4.jpeg'),
    MedicineModel(
        NameofMedicine: 'PanadolAdvance', Price: 17.1, ImagePath: '5.jpeg'),
    MedicineModel(NameofMedicine: 'PanadolEx', Price: 50, ImagePath: '6.jpeg'),
    MedicineModel(NameofMedicine: 'Dolcyl M', Price: 67, ImagePath: '7.jpeg'),
    MedicineModel(
        NameofMedicine: 'Concor Tablet', Price: 90, ImagePath: '8.jpeg'),
    MedicineModel(
        NameofMedicine: 'Concor Cor', Price: 43.5, ImagePath: '9.jpeg'),
    MedicineModel(
        NameofMedicine: 'Nebilet ', Price: 23.5, ImagePath: '10.jpeg'),
    MedicineModel(
        NameofMedicine: 'Congestal ', Price: 55, ImagePath: '11.jpeg'),
    MedicineModel(
        NameofMedicine: 'Immunoflu ', Price: 25, ImagePath: '12.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    final CartPass = Provider.of<Cart>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 2),
            itemCount: medicineList.length,
            itemBuilder: (context, i) {
              return GridTile(
                  child: CustomCard(
                onTapIcon: () {
                  CartPass.addPrdouct(medicineList[i]);
                },
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailsScreen(
                      Product: medicineList[i],
                    );
                  }));
                },
                medicineModel: medicineList[i],
              ));
            }),
      ),
      drawer: Drawer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assests/Images/picbackground.jpg'),
                          fit: BoxFit.cover)),
                  currentAccountPictureSize: Size.square(99),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assests/Images/Ahmed.jpg'),
                  ),
                  accountName: Text(
                    "AhmedSetta",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  accountEmail: Text("AhmedSetta@gmail.com")),
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.home,
                  size: 35,
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'HomePage');
                },
              ),
              ListTile(
                title: Text(
                  'My Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.add_shopping_cart,
                  size: 35,
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'CheckOut');
                },
              ),
              ListTile(
                title: Text(
                  'About',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.help_center,
                  size: 35,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.exit_to_app,
                  size: 35,
                ),
                onTap: () {
                  Future<void> user = FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, 'LoginPage');
                },
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 12),
            child: Text(
              "Developed by AhmedSetta © 2023",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      )),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text("HomePage"),
          actions: [CustomAppbar()]),
    );
  }
}
