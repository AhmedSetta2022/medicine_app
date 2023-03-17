import 'package:flutter/material.dart';
import 'package:medicine_app/Models/medicineModel.dart';
import 'package:medicine_app/provider/cart.dart';
import 'package:provider/provider.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {super.key, required this.medicineModel, this.onTap, this.onTapIcon});
  MedicineModel medicineModel;
  void Function()? onTap;
  void Function()? onTapIcon;
  bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    final CartClick = Provider.of<Cart>(context);
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            height: 130,
            width: 220,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: Offset(10, 10),
                  blurRadius: 40,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(.4))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$ ${medicineModel.Price.round()}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.green,
                          child: GestureDetector(
                            onTap: onTapIcon,
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 5,
              bottom: 60,
              child: Image.asset(
                'assests/Images/${medicineModel.ImagePath}',
                height: 60,
              )),
          Positioned(
            top: 40,
            left: 10,
            child: Text(
              "${medicineModel.NameofMedicine}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    );
  }
}
