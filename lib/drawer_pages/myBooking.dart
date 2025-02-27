import 'package:flutter/material.dart';
import 'package:hospital/doctor.dart';
import 'package:hospital/homepage.dart';

class Mybooking extends StatefulWidget {
  const Mybooking({super.key});

  @override
  State<Mybooking> createState() => _MybookingState();
}

class _MybookingState extends State<Mybooking> {

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
          "My Booking",
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
          Text("You haven't booked any appointments yet",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
          Text("Start by looking for a doctors near you, read patient stories and book appointments",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.black,),),
          const SizedBox(height: 30,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue
              ),
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Doctor()));
                },
                child: Text("Book Now",style: TextStyle(color: Colors.white),)),
          )
        ],
      ),
    );
  }
}
