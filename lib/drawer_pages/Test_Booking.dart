import 'package:flutter/material.dart';
import 'package:hospital/doctor.dart';

class TestBooking extends StatefulWidget {
  const TestBooking({super.key});

  @override
  State<TestBooking> createState() => _TestBookingState();
}

class _TestBookingState extends State<TestBooking> {
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
          "Diagnostics Tests",
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
          Text("You haven't booked any test yet",style: TextStyle(fontSize: 18,color: Colors.black),),
          Text("Get Started with your first health checkup",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.black,),),
          const SizedBox(height: 30,),
          OutlinedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Doctor()));
              },
              child: Text("Book Now",style: TextStyle(color: Colors.lightBlue),))
        ],
      ),
    );
  }
}
