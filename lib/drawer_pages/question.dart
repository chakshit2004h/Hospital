import 'package:flutter/material.dart';
import 'package:hospital/drawer_pages/consulation.dart';

class ConsultationsPage extends StatefulWidget {
  final String problemType;
  final String title;
  final String description;

  const ConsultationsPage({
    super.key,
    required this.problemType,
    required this.title,
    required this.description,
  });

  @override
  State<ConsultationsPage> createState() => _ConsultationsPageState();
}

class _ConsultationsPageState extends State<ConsultationsPage> {
  bool isFreeSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0077B6),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text("Consultations",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildToggleButtons(),
          const SizedBox(height: 20),
          _buildConsultationCard(widget.problemType, widget.title, widget.description),
          const SizedBox(height: 450),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue
              ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FreeQuestionPage()));
                },
                child: Text("Free Question",style: TextStyle(color: Colors.white),)),
          )
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Container(
      color: const Color(0xff0077B6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildToggleButton("Paid", !isFreeSelected),
          _buildToggleButton("Free", isFreeSelected),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFreeSelected = text == "Free";
        });
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildConsultationCard(String problemType, String title, String description) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        title: Text(problemType, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title: $title"),
            Text("Description: $description"),
          ],
        ),
      ),
    );
  }
}
