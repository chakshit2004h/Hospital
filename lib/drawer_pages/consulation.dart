import 'package:flutter/material.dart';
import 'package:hospital/drawer_pages/question.dart';

class FreeQuestionPage extends StatefulWidget {
  const FreeQuestionPage({super.key});

  @override
  State<FreeQuestionPage> createState() => _FreeQuestionPageState();
}

class _FreeQuestionPageState extends State<FreeQuestionPage> {
  String selectedProblemType = "Select Problem Type";
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<String> problemTypes = [
    "Gynaecology", "General physician", "Dermatology", "Sexology",
    "Psychiatry", "Stomach and digestion", "Pediatrics", "Ear, Nose, Throat",
    "Urology", "Orthopedic", "Neurology", "Cardiology", "Diet and nutrition",
    "Diabetology", "Eye and Vision", "Dental", "Pulmonology"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0077B6),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text("Free Question",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _showProblemTypeDialog(),
              child: _buildTile(selectedProblemType),
            ),
            _buildTextField("Title (min 10 characters)", titleController, 40),
            _buildTextField("Describe the problem in detail (min 100 characters)", descriptionController, 1000, maxLines: 5),
            const SizedBox(height: 10),
            const Text("Please do not include your name, email and phone number above.", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildTile(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200], borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(fontSize: 16)),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, int maxLength, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          maxLength: maxLength,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.grey.shade300))),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          onPressed: () {
            if (selectedProblemType != "Select Problem Type" && titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConsultationsPage(
                    problemType: selectedProblemType,
                    title: titleController.text,
                    description: descriptionController.text,
                  ),
                ),
              );
            }
          },
          child: const Text("ASK A DOCTOR", style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }

  void _showProblemTypeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Problem Type"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: problemTypes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(problemTypes[index]),
                  onTap: () {
                    setState(() {
                      selectedProblemType = problemTypes[index];
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
