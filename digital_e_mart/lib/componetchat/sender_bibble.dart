import 'package:digital_e_mart/consts/consts.dart';

class semderbubble extends StatelessWidget {
  const semderbubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      child: Column(
        children: [
          'Meaage here..'.text.white.size(16).make(),
          10.heightBox,
          '11.45pm'.text.color(Colors.white.withOpacity(0.5)).make(),
        ],
      ),
    );
  }
}
