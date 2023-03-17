// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medicine_app/Models/medicineModel.dart';

import '../Components/appbarCom.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({
    required this.Product,
    super.key,
  });
  MedicineModel Product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isMore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("DetailsScreen"),
        actions: [CustomAppbar()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child:
                    Image.asset('assests/Images/${widget.Product.ImagePath}')),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$ ${widget.Product.Price}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.green),
                    child: Text(
                      "New",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber[900],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber[900],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber[900],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber[900],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber[900],
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Icon(
                    Icons.place,
                    color: Colors.amber[900],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Deyab Pharmacy",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Details :",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "Paracetamol, also known as acetaminophen, is a medication used to treat fever and mild to moderate pain. Common brand names include Tylenol and Panadol,At a standard dose, paracetamol only slightly decreases body temperature; it is inferior to ibuprofen in that respect,and the benefits of its use for fever are unclear. Paracetamol may relieve pain in acute mild migraine but only slightly in episodic tension headache. However, the aspirin/paracetamol/caffeine combination helps with both conditions where the pain is mild and is recommended as a first-line treatment for them. Paracetamol is effective for post-surgical pain, but it is inferior to ibuprofen. The paracetamol/ibuprofen combination provides further increase in potency and is superior to either drug alone. The pain relief paracetamol provides in osteoarthritis is small and clinically insignificant. The evidence in its favor for the use in low back pain, cancer pain, and neuropathic pain is insufficien",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: isMore ? 3 : null,
                overflow: TextOverflow.fade,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isMore = !isMore;
                  });
                },
                child: Text(
                  isMore ? " Show More" : " Show Less",
                  style: TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
