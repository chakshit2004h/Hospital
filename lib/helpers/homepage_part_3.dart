import 'package:flutter/material.dart';


class HomepagePart3 extends StatelessWidget {
  const HomepagePart3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff00a55a4),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Text("LifeLine",style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            const SizedBox(height: 20,),
            Text("Our is to help mankind live healthier,longer lives by making quality healthcare accessible,affordable and conenient.",style: TextStyle(fontSize: 15,color: Colors.white,),),
            const SizedBox(height: 20,),
            Text("Made with 💙 in Chandigarh",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold,),),
            const SizedBox(height: 50,),
          ],
        ),
      ),
    );

  }
}
