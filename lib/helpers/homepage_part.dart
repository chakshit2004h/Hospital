import 'package:flutter/material.dart';

class HomepagePart extends StatefulWidget {
  const HomepagePart({super.key});

  @override
  State<HomepagePart> createState() => _HomepagePartState();
}

class _HomepagePartState extends State<HomepagePart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff00a55a4),
        child:Padding(
          padding: const EdgeInsets.only(left: 15,top: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.discount_outlined,color: Colors.white,),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Best Offer",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                      Text("Explore deal,offers,health,updates and more",style: TextStyle(fontSize: 12,color: Colors.white),),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: 210,
                        height: 130,
                        child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/images/doc1.jpg",fit: BoxFit.fill)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: 210,
                        height: 130,
                        child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/images/doc2.jpg",fit: BoxFit.fill)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: 210,
                        height: 130,
                        child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/images/doc3.jpg",fit: BoxFit.fill)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: 210,
                        height: 130,
                        child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/images/doc4.jpg",fit: BoxFit.fill)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              Row(
                children: [
                  Icon(Icons.person,color: Colors.white,),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Safe and Secure surgeries",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                      Text("Get your first consultation FREE",style: TextStyle(fontSize: 12,color: Colors.white),),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: 210,
                        height: 130,
                        child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/images/doc5.jpg",fit: BoxFit.fill)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: 210,
                        height: 130,
                        child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/images/doc6.jpg",fit: BoxFit.fill)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        width: 210,
                        height: 130,
                        child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/images/doc7.jpg",fit: BoxFit.fill)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
            ],
          ),
        ),
      );
  }
}
