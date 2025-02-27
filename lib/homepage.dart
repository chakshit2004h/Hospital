import 'package:flutter/material.dart';
import 'package:hospital/doctor.dart';
import 'package:hospital/helpers/homepage_part.dart';
import 'package:hospital/helpers/homepage_part_2.dart';
import 'package:hospital/helpers/homepage_part_3.dart';
import 'package:hospital/online.dart';
import 'package:hospital/drawer_pages/drawer.dart';
import 'package:hospital/widgets/style.dart';

class Homepage extends StatefulWidget {
  final String userName;
  final String userEmail;

  const Homepage({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Size mq;
  bool _isScrolled = false;
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50) {
        setState(() {
          _isScrolled = true;
        });
      } else {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    mq = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: Column(
        children: [
          if(!_isScrolled)...[
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                child: Container(
                  width: double.infinity,
                  height: screenHeight * 0.21,
                  color: const Color(0xff0077B6),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              icon: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey[300],
                                child: const Icon(Icons.person, size: 30, color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.userName,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  widget.userEmail,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Search Bar
                        Container(
                          height: 45,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon:
                              const Icon(Icons.search, color: Colors.grey),
                              border: InputBorder.none,
                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),],
          Expanded(
            child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Doctor()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),  // Adjust the radius as needed
                                child: Image.asset(
                                  "assets/images/img2.jpg",
                                  width: 150,
                                  height: 130,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Online()));},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),  // Adjust the radius as needed
                                child: Image.asset(
                                  "assets/images/img3.jpg",
                                  width: 150,
                                  height: 130,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],

                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Book In-Clinic\nAppointment",textAlign: TextAlign.center,style: robotoLarge.copyWith(color: Colors.black,fontSize: 12),),
                          Text("Instant Video\nConsolation",style: robotoLarge.copyWith(color: Colors.black,fontSize: 12),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: mq.width*.07,vertical: mq.height*.03),
                      child: Text("Find a Doctor for your Health Problem",style: robotoLarge.copyWith(color: Colors.black),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/img4.jpg",width: 80,height: 80,)),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/img6.jpg",width: 80,height: 80,fit: BoxFit.fill,)),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/img7.jpg",width: 80,height: 80,)),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/img10.jpg",width: 80,height: 80,fit: BoxFit.fill,)),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("General\nPhysician",textAlign:TextAlign.center,style: robotoSmall.copyWith(color: Colors.black,)),
                        Text("Skin & Hair",style: robotoSmall.copyWith(color: Colors.black,)),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text("Women's\nHealth",textAlign:TextAlign.center,style: robotoSmall.copyWith(color: Colors.black,)),
                        ),
                        Text("Dental Care",style: robotoSmall.copyWith(color: Colors.black,)),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/img8.jpg",width: 80,height: 80,)),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/img9.jpg",width: 80,height: 80,)),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/img11.jpg",width: 80,height: 80,)),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset("assets/images/plus.png",width: 60,height: 60,)),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text("Child\nSpecialist",textAlign:TextAlign.center,style: robotoSmall.copyWith(color: Colors.black,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Text("Ear,Nose,\nThroat",style: robotoSmall.copyWith(color: Colors.black,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Text("Mental\nWellness",textAlign:TextAlign.center,style: robotoSmall.copyWith(color: Colors.black,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45.0),
                          child: Text("more",style: robotoSmall.copyWith(color: Colors.black,)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                              child: Icon(Icons.star_border,size: 35,)),
                        ),
                        const SizedBox(width: 20,),
                        Text("Featured service",style: robotoLarge.copyWith(color: Colors.black,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                        width: 350,
                          height: 220,
                          child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset("assets/images/tp.jpg",fit: BoxFit.fill,))
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              width: 150,
                              height: 200,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/images/image_h4.jpg",fit: BoxFit.fill)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              width: 150,
                              height: 200,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/images/image_h3.jpg",fit: BoxFit.fill)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              width: 150,
                              height: 200,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/images/image_h2.jpg",fit: BoxFit.fill)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              width: 150,
                              height: 200,
                              child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/images/image_h.jpg",fit: BoxFit.fill)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SafeArea(child: Expanded(child: HomepagePart())),
                    SafeArea(child: Expanded(child: HomepagePart2())),
                    SafeArea(child: Expanded(child: HomepagePart3())),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
