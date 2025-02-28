import 'package:flutter/material.dart';

class BookClinic2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0077B6),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,),),
        title: Text(
                  "Dr. Ravishankar Reddy C R",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Clinic Visit Slots",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _dateSlot("Today, 28 Feb", "No slots available", true),
                _dateSlot("Tom, 1 Mar", "4 slots available", false),
                _dateSlot("Sun, 2 Mar", "No slots available", false),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Today, 28 Feb",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
              child: const Text(
                "No slots available",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Next availability on Sat, 1 Mar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: const Text(
                "or",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.call, color: Colors.blue),
                label: const Text(
                  "Call clinic",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateSlot(String date, String availability, bool isSelected) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade100 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
        ),
      ),
      child: Column(
        children: [
          Text(
            date,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            availability,
            style: TextStyle(fontSize: 12, color: isSelected ? Colors.red : Colors.green),
          ),
        ],
      ),
    );
  }
}
