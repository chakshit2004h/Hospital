import 'package:flutter/material.dart';

class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Color(0xff0077B6),
        title: Text(
          "Find Your Doctor",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search doctor...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff0077B6)),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            foregroundImage: AssetImage("assets/images/img2.jpg"),
                          ),
                          const SizedBox(width: 16), // Add some space between image and text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dr. Parthasarathi\nDutta Roy",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                             Text("Dermatologist",style: TextStyle(color: Colors.grey,),),
                             Text("22 yrs of exp. overall",style: TextStyle(color: Colors.grey,),),
                              Row(
                                children: [
                                  Icon(Icons.chat,color: Colors.green,),
                                  Text("4939 Patient Stories",style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("NEXT AVAILABLE AT",style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.bold,fontFamily: 'Pacifico'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(children: [Icon(Icons.home_outlined,color: Colors.grey,size: 20,),Text("03:00 PM,today",style: TextStyle(color: Colors.grey,fontSize: 12),)],),
                      ),
        
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Hospital Contact Number',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                              'Call +91 80-46810723',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context); // Close the bottom sheet
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Contact Hospital',
                                style: TextStyle(color: Colors.blue),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Background color
                                side: const BorderSide(color: Colors.blue, width: 2), // Blue border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Add your onPressed action here
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Book Clinic Visit',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Background color// Blue border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
        
        
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            foregroundImage: AssetImage("assets/images/i.png"),
                          ),
                          const SizedBox(width: 16), // Add some space between image and text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dr. Ravishankar Reddy C R",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                             Text("General Physician",style: TextStyle(color: Colors.grey,),),
                             Text("32 yrs of exp. overall",style: TextStyle(color: Colors.grey,),),
                              Row(
                                children: [
                                  Icon(Icons.chat,color: Colors.green,),
                                  Text("969 Patient Stories",style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("NEXT AVAILABLE AT",style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.bold,fontFamily: 'Pacifico'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(children: [Icon(Icons.home_outlined,color: Colors.grey,size: 20,),Text("03:00 PM,today",style: TextStyle(color: Colors.grey,fontSize: 12),)],),
                      ),
        
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Hospital Contact Number',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                              'Call +91 79-49105977',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context); // Close the bottom sheet
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Contact Hospital',
                                style: TextStyle(color: Colors.blue),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Background color
                                side: const BorderSide(color: Colors.blue, width: 2), // Blue border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Add your onPressed action here
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Book Clinic Visit',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Background color// Blue border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
        
        
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            foregroundImage: AssetImage("assets/images/i2.png"),
                          ),
                          const SizedBox(width: 16), // Add some space between image and text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dr. Leela Bhagavan",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text("Gynecologist",style: TextStyle(color: Colors.grey,),),
                              Text("51 yrs of exp. overall",style: TextStyle(color: Colors.grey,),),
                              Row(
                                children: [
                                  Icon(Icons.chat,color: Colors.green,),
                                  Text("215 Patient Stories",style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("NEXT AVAILABLE AT",style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.bold,fontFamily: 'Pacifico'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(children: [Icon(Icons.home_outlined,color: Colors.grey,size: 20,),Text("11:30 AM,today",style: TextStyle(color: Colors.grey,fontSize: 12),)],),
                      ),
        
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Hospital Contact Number',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                              'Call +91 80-46809214',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context); // Close the bottom sheet
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Contact Hospital',
                                style: TextStyle(color: Colors.blue),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Background color
                                side: const BorderSide(color: Colors.blue, width: 2), // Blue border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Add your onPressed action here
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Book Clinic Visit',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Background color// Blue border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
        
        
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            foregroundImage: AssetImage("assets/images/img2.jpg"),
                          ),
                          const SizedBox(width: 16), // Add some space between image and text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dr. Karishma",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text("Ear-Nose-Throat Specialist",style: TextStyle(color: Colors.grey,),),
                              Text("17 yrs of exp. overall",style: TextStyle(color: Colors.grey,),),
                              Row(
                                children: [
                                  Icon(Icons.chat,color: Colors.green,),
                                  Text("1057 Patient Stories",style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("NEXT AVAILABLE AT",style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.bold,fontFamily: 'Pacifico'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(children: [Icon(Icons.home_outlined,color: Colors.grey,size: 20,),Text("03:00 PM,today",style: TextStyle(color: Colors.grey,fontSize: 12),)],),
                      ),
        
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Hospital Contact Number',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                              'Call +91 80-46810723',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context); // Close the bottom sheet
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Contact Hospital',
                                style: TextStyle(color: Colors.blue),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Background color
                                side: const BorderSide(color: Colors.blue, width: 2), // Blue border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Add your onPressed action here
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Book Clinic Visit',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Background color// Blue border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
        
        
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            foregroundImage: AssetImage("assets/images/img2.jpg"),
                          ),
                          const SizedBox(width: 16), // Add some space between image and text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dr. Parthasarathi\nDutta Roy",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text("Dermatologist",style: TextStyle(color: Colors.grey,),),
                              Text("22 yrs of exp. overall",style: TextStyle(color: Colors.grey,),),
                              Row(
                                children: [
                                  Icon(Icons.chat,color: Colors.green,),
                                  Text("4939 Patient Stories",style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("NEXT AVAILABLE AT",style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.bold,fontFamily: 'Pacifico'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(children: [Icon(Icons.home_outlined,color: Colors.grey,size: 20,),Text("03:00 PM,today",style: TextStyle(color: Colors.grey,fontSize: 12),)],),
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Hospital Contact Number',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                              'Call +91 80-46810723',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context); // Close the bottom sheet
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Contact Hospital',
                                style: TextStyle(color: Colors.blue),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Background color
                                side: const BorderSide(color: Colors.blue, width: 2), // Blue border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Add your onPressed action here
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Book Clinic Visit',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Background color// Blue border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                              ),
                            ),
                          ),
                        ],
                      )


                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            foregroundImage: AssetImage("assets/images/img2.jpg"),
                          ),
                          const SizedBox(width: 16), // Add some space between image and text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dr. Parthasarathi\nDutta Roy",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text("Dermatologist",style: TextStyle(color: Colors.grey,),),
                              Text("22 yrs of exp. overall",style: TextStyle(color: Colors.grey,),),
                              Row(
                                children: [
                                  Icon(Icons.chat,color: Colors.green,),
                                  Text("4939 Patient Stories",style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("NEXT AVAILABLE AT",style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.bold,fontFamily: 'Pacifico'),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(children: [Icon(Icons.home_outlined,color: Colors.grey,size: 20,),Text("03:00 PM,today",style: TextStyle(color: Colors.grey,fontSize: 12),)],),
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'Hospital Contact Number',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                              'Call +91 80-46810723',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context); // Close the bottom sheet
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Contact Hospital',
                                style: TextStyle(color: Colors.blue),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, // Background color
                                side: const BorderSide(color: Colors.blue, width: 2), // Blue border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Add your onPressed action here
                              },
                              icon: const Icon(
                                Icons.call,
                                color: Colors.blue,
                              ),
                              label: const Text(
                                'Book Clinic Visit',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Background color// Blue border
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8), // Rounded corners
                                ),
                              ),
                            ),
                          ),
                        ],
                      )


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}