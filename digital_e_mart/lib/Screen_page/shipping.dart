import 'package:digital_e_mart/Screen_page/payment_method.dart';
import 'package:digital_e_mart/consts/consts.dart';
import 'package:digital_e_mart/controllar/cart_controller.dart';
import 'package:digital_e_mart/widget_comom/text_field.dart';
import 'package:get/get.dart';

class ShippingDetails extends StatefulWidget {
  const ShippingDetails({super.key});

  @override
  State<ShippingDetails> createState() => _ShippingDetailsState();
}

class _ShippingDetailsState extends State<ShippingDetails> {
  var controller = Get.put(CartController());
  final _formKey = GlobalKey<FormState>(); //form key
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); //form key
    return Scaffold(
      appBar: AppBar(
        title: 'Shipping Dtails'.text.fontFamily(bold).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text_field(
                Obcuretext: false,
                textname: "Addrss",
                hitname: "Addrss",
                Controllar: controller.address,
                Validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter adress';
                  } else if (value.length < 1) {
                    return 'at least enter 12 characters';
                  } else if (value.length > 260) {
                    return 'maximum character is 260';
                  }
                  return null;
                },
              ),
              Text_field(
                Obcuretext: false,
                textname: "City",
                hitname: "city",
                Controllar: controller.city,
                Validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter fullname';
                  } else if (value.length < 10) {
                    return 'at least enter 10 characters';
                  } else if (value.length > 100) {
                    return 'maximum character is 100';
                  }
                  return null;
                },
              ),
              Text_field(
                Obcuretext: false,
                textname: "State",
                hitname: "state",
                Controllar: controller.state,
                Validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter fullname';
                  } else if (value.length < 1) {
                    return 'at least enter 1 characters';
                  } else if (value.length > 13) {
                    return 'maximum character is 13';
                  }
                  return null;
                },
              ),
              Text_field(
                Obcuretext: false,
                textname: "Postal Code",
                hitname: "postal code",
                Controllar: controller.postalcode,
                Validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter fullname';
                  } else if (value.length < 3) {
                    return 'at least enter 3 characters';
                  } else if (value.length > 13) {
                    return 'maximum character is 13';
                  }
                  return null;
                },
              ),
              Text_field(
                Obcuretext: false,
                textname: "Phone Number",
                hitname: "phone number",
                Controllar: controller.phonenumber,
                Validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter fullname';
                  } else if (value.length < 13) {
                    return 'at least enter 13 number';
                  } else if (value.length > 20) {
                    return 'maximum number is 20';
                  }
                  return null;
                },
              ),
            ],
          ),
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
                if (_formKey.currentState!.validate()) {
                  Get.to(() => Payment_Method());
                }
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
