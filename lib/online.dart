import 'package:flutter/material.dart';

class Online extends StatefulWidget {
  const Online({super.key});

  @override
  State<Online> createState() => _OnlineState();
}

class _OnlineState extends State<Online> {
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
        centerTitle: true,
        title: Text(
          "Summary",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0,left: 15.0),
            child: Text("WE WILL ASSIGN YOU A TOP DOCTOR FROM BELOW",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("View our doctors currently online",style: TextStyle(color: Colors.grey,),),
          ),
          Material(
            elevation: 2,
            child: SizedBox(
              width: double.infinity,
              height: 180,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                        width: 220,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                foregroundImage: AssetImage("assets/images/img2.jpg"),
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 70.0),
                                    child: Text(
                                      "Ms. Jesin John",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text("Psychologist",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                  Text("20 years experience",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                  Row(children: [Icon(Icons.chat,color: Colors.green,size: 15),Text("  8556 Consultation",style: TextStyle(fontSize: 12,color: Colors.grey),)],),
                                ],
                              ),
                            ],
                          )


                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                          width: 220,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                foregroundImage: AssetImage("assets/images/i.png"),
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 70.0),
                                    child: Text(
                                      "Ms. Sandeep Kumar",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text("Psychologist",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                  Text("12 years experience",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                  Row(children: [Icon(Icons.chat,color: Colors.green,size: 15),Text("  8556 Consultation",style: TextStyle(fontSize: 12,color: Colors.grey),)],),
                                ],
                              ),
                            ],
                          )


                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                          width: 240,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                foregroundImage: AssetImage("assets/images/i2.png"),
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 70.0),
                                    child: Text(
                                      "Ms. Rizwana Parvin T M",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text("Counselling",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                  Text("7 years experience",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                  Row(children: [Icon(Icons.chat,color: Colors.green,size: 15),Text("  455 Consultation",style: TextStyle(fontSize: 12,color: Colors.grey),)],),
                                ],
                              ),
                            ],
                          )


                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                          width: 220,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                foregroundImage: AssetImage("assets/images/img2.jpg"),
                              ),
                              SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 70.0),
                                    child: Text(
                                      "Ms. Jesin John",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text("Psychologist",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                  Text("20 years experience",style: TextStyle(color: Colors.grey,fontSize: 12),),
                                  Row(children: [Icon(Icons.chat,color: Colors.green,size: 15),Text("  8556 Consultation",style: TextStyle(fontSize: 12,color: Colors.grey),)],),
                                ],
                              ),
                            ],
                          )


                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(width: double.infinity,height: 10,color: Colors.grey[400],),
          Material(
            elevation: 2,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
