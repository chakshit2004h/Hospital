import 'package:flutter/material.dart';

class MyDoctor extends StatefulWidget {
  const MyDoctor({super.key});

  @override
  State<MyDoctor> createState() => _MyDoctorState();
}

class _MyDoctorState extends State<MyDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          "My Doctor",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xff0077B6),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(child: Image.asset("assets/images/record.png",width: 800,height: 200,)),
          ),
          const SizedBox(height: 30,),
          Text("You have no bookmarked Doctors",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
          Text("Favourite a doctor for having an easy access to them whenever in need",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.grey,),)
        ],
      ),
    );
  }
}
