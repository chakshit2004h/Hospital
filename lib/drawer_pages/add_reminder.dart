import 'package:flutter/material.dart';

class AddReminder extends StatefulWidget {
  @override
  _AddReminderState createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  TextEditingController medicineController = TextEditingController();
  bool isMedicine = true;
  double dropCount = 1.0;
  List<String> alarmTimes = [];
  int duration = 1;
  List<bool> weekDays = List.generate(7, (index) => false);
  List<String> weekDayNames = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

  void _saveReminder() {
    String medicineName = medicineController.text.trim();

    if (medicineName.isEmpty) return;

    Navigator.pop(context, {
      'medicine': medicineName,
      'duration': duration,
    });
  }

  void _pickAlarmTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        alarmTimes.add(pickedTime.format(context));
      });
    }
  }

  void _showRepeatDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Repeat Days"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(7, (index) {
              return CheckboxListTile(
                title: Text(weekDayNames[index]),
                value: weekDays[index],
                onChanged: (bool? value) {
                  setState(() {
                    weekDays[index] = value ?? false;
                  });
                },
              );
            }),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Done"),
            ),
          ],
        );
      },
    );
  }

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
          "Add Reminder",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xff0077B6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: medicineController,
                decoration: InputDecoration(labelText: "Medicine Name"),
              ),
              SizedBox(height: 10),
              SizedBox(height: 20),
              Text("Drop"),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => setState(() => dropCount = dropCount > 1 ? dropCount - 0.25 : 1),
                  ),
                  Text(dropCount.toStringAsFixed(1)),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => setState(() => dropCount += 0.25),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("Alarm"),
              TextButton(
                onPressed: _pickAlarmTime,
                child: Text("Set Alarm"),
              ),
              Text(alarmTimes.join(", ")),
              SizedBox(height: 20),
              Text("Repeat"),
              TextButton(
                onPressed: _showRepeatDialog,
                child: Text("Select Days"),
              ),
              SizedBox(height: 20),
              Text("Duration"),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: duration.toDouble(),
                      min: 1,
                      max: 30,
                      divisions: 29,
                      label: "$duration days",
                      onChanged: (value) {
                        setState(() {
                          duration = value.toInt();
                        });
                      },
                    ),
                  ),
                  Text("$duration days"),
                ],
              ),
              const SizedBox(height: 50,),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: _saveReminder,
                  child: const Text('Add a reminder',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}