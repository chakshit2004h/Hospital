import 'package:flutter/material.dart';

class BookClinic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dr. Parthasarathi Dutta Roy",style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff0077B6),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Chirag Global Hospitals, JP Nagar 2 Phase",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const Text(
              "Clinic Visit Slots",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _dateSlot("Today, 28 Feb", "2 slots available", true),
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
            _timeSlot("Morning", "No slots", Icons.wb_sunny),
            _timeSlot("Afternoon", "No slots", Icons.wb_sunny_outlined),
            _timeSlot("Evening", "2 slots", Icons.nightlight_round, isEvening: true),
            Row(
              children: [
                _availableTimeButton("5:30 PM"),
                const SizedBox(width: 10),
                _availableTimeButton("6:30 PM"),
              ],
            ),
            _timeSlot("Night", "No slots", Icons.nights_stay),
          ],
        ),
      ),
    );
  }

  Widget _dateSlot(String date, String availability, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade100 : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            date,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            availability,
            style: TextStyle(fontSize: 12, color: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _timeSlot(String timeOfDay, String status, IconData icon, {bool isEvening = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: isEvening ? Colors.blue : Colors.black),
          const SizedBox(width: 10),
          Text(
            timeOfDay,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            status,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _availableTimeButton(String time) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.blue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        time,
        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }
}
