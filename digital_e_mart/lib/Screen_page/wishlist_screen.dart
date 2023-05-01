import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:digital_e_mart/consts/firebase_obj.dart';
import 'package:digital_e_mart/firestore_Services/services.dart';

class WhishLIstScreen extends StatelessWidget {
  const WhishLIstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'My Wisglist'.text.make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getwishlist(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: "not load data".text.make());
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(child: "wishlist is empty".text.make());
          } else {
            var data = snapshot.data!.docs;

            return Column(children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color.fromARGB(255, 227, 225, 225),
                      child: ListTile(
                        leading: Image(
                            image:
                                NetworkImage("${data[index]['p_image'][0]}")),
                        title: "${data[index]['p_name']}"
                            .text
                            .size(14)
                            .fontFamily(bold)
                            .make(),
                        subtitle:
                            "${data[index]['p_price']}".text.size(14).make(),
                        trailing: Icon(
                          Icons.favorite,
                          color: redColor,
                        ).onTap(() {
                          firestore
                              .collection(productsCollection)
                              .doc(data[index].id)
                              .set({
                            'p_wishlist':
                                FieldValue.arrayRemove([currentUser!.uid])
                          }, SetOptions(merge: true));
                        }),
                      ),
                    );
                  },
                ),
              ),
            ]);
          }
        },
      ),
    );
  }
}
