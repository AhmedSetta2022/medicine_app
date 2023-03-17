import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/appbarCom.dart';
import '../provider/cart.dart';

class CheckOut extends StatelessWidget {
  CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final CartPass = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text("CheckOut"),
          actions: [CustomAppbar()]),
      body: Column(children: [
        SingleChildScrollView(
          child: SizedBox(
            height: 550,
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: CartPass.SelctedProduct.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: ListTile(
                      subtitle: Text("DeyabPharmacy"),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assests/Images/${CartPass.SelctedProduct[index].ImagePath}'),
                      ),
                      title:
                          Text(CartPass.SelctedProduct[index].NameofMedicine),
                      trailing: IconButton(
                          onPressed: () {
                            CartPass.RemoveProduct(
                                CartPass.SelctedProduct[index]);
                          },
                          icon: Icon(Icons.remove)),
                    ),
                  );
                })),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Pay \$${CartPass.Price.round()}",
            style: TextStyle(fontSize: 19),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)))),
        ),
      ]),
    );
  }
}
