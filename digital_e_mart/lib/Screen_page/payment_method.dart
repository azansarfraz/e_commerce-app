import 'package:digital_e_mart/consts/consts.dart';
import 'package:digital_e_mart/consts/list.dart';
import 'package:digital_e_mart/controllar/cart_controller.dart';
import 'package:digital_e_mart/home.dart';
import 'package:get/get.dart';

class Payment_Method extends StatelessWidget {
  const Payment_Method({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: " Choose payment method".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: List.generate(payment_methodpicturelist.length, (index) {
            return GestureDetector(
              onTap: () {
                try {
                  if (index == 2) {
                    print("jkjcdk");
                    controller.placemyorder(
                        orderpaymentmethod: payment_methodnamelist[
                            controller.paymentindex.value],
                        totalAmont: controller.totalproduct.value);
                    VxToast.show(context, msg: 'order successfull ');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  }
                  controller.changepayment(index);
                } catch (e) {
                  print(e);
                  print("value not get");
                }
              },
              child: Obx(
                () => Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: controller.paymentindex == index
                            ? redColor
                            : Colors.transparent,
                        style: BorderStyle.solid),
                  ),
                  margin: EdgeInsets.all(8),
                  child: Stack(alignment: Alignment.topRight, children: [
                    Image.asset(
                      payment_methodpicturelist[index],
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    // controller.paymentindex == index
                    //     ? Checkbox(
                    //         activeColor: Colors.red,
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(12)),
                    //         value: true,
                    //         onChanged: (value) {},
                    //       )
                    Container(),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: '${payment_methodnamelist[index]}'
                            .text
                            .color(Color.fromARGB(255, 238, 4, 4))
                            .size(18)
                            .fontFamily(bold)
                            .make()),
                  ]),
                ),
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              try {
                controller.placemyorder(
                    orderpaymentmethod:
                        payment_methodnamelist[controller.paymentindex.value],
                    totalAmont: controller.totalproduct.value);
              } catch (e) {
                print(e);
                print("value not show");
              }
            },
            child: 'Process is shipping'.text.make()),
      ),
    );
  }
}
