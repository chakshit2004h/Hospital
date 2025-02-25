import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

class Records extends StatefulWidget {
  const Records({super.key});

  @override
  State<Records> createState() => _RecordsState();
}

class _RecordsState extends State<Records> {
  List<Map<String, String>> files = []; // List to store files with date

  // Function to open file picker
  Future<void> _pickFile(bool isImage) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: isImage ? FileType.image : FileType.custom,
      allowedExtensions: isImage ? null : ['pdf'],
    );

    if (result != null) {
      setState(() {
        files.add({
          "name": result.files.single.name,
          "date": DateFormat('dd MMM').format(DateTime.now()), // Format date
        });
      });
    }

    if (mounted) Navigator.pop(context); // Close bottom sheet
  }

  // Function to show bottom sheet
  void _showFilePickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          child: Column(
            children: [
              const Text(
                "Choose File Type",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Pick Image Button
                  ElevatedButton.icon(
                    onPressed: () => _pickFile(true),
                    icon: const Icon(Icons.image, color: Colors.white),
                    label: const Text("Photos", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                  // Pick PDF Button
                  ElevatedButton.icon(
                    onPressed: () => _pickFile(false),
                    icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
                    label: const Text("PDF", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0077B6),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Medical records",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            if (files.isEmpty) ...[
              Image.asset("assets/images/record.png", height: 150),
              const SizedBox(height: 20),
              const Text(
                "Add a medical record.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "A detailed health history helps a doctor diagnose you better.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ] else ...[
              Expanded(
                child: ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2, // Elevation for shadow effect
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Text(
                          files[index]['date']!,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        title: Text(files[index]['name']!),
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff0077B6)),
                onPressed: _showFilePickerBottomSheet,
                child: const Text(
                  "Add a record",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
