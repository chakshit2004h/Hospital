import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String height = "add";
  String weight = "add";
  String email = "add";
  String dob = "add";
  String emergencyContact = "add";
  String location = "add";
  String maritalStatus = "add";
  String bloodGroup = "add";


  void _showHeightPicker(BuildContext context) {
    int selectedFeet = 5;
    int selectedInches = 5;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Select Height", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 40,
                        onSelectedItemChanged: (index) {
                          selectedFeet = index + 2;
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return Center(child: Text("${index + 2} Feet"));
                          },
                          childCount: 8,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 40,
                        onSelectedItemChanged: (index) {
                          selectedInches = index;
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            return Center(child: Text("$index Inch"));
                          },
                          childCount: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    height = "$selectedFeet Feet $selectedInches Inch";
                  });
                  Navigator.pop(context);
                },
                child: const Text("Done"),
              )
            ],
          ),
        );
      },
    );
  }
  void _showWeightPicker(BuildContext context) {
    double selectedWeight = 50; // Default weight

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Select Weight",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${selectedWeight.toInt()} kg",
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  ),
                  Slider(
                    value: selectedWeight,
                    min: 50,
                    max: 150,
                    divisions: 10, // Creates stops at 50, 60, 70, ... 150
                    label: "${selectedWeight.toInt()} kg",
                    onChanged: (double value) {
                      setModalState(() {
                        selectedWeight = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        weight = "${selectedWeight.toInt()} kg";
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("Done"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  void _showMaritalStatusPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select Marital Status",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text("Married"),
                onTap: () {
                  setState(() {
                    maritalStatus = "Married";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Unmarried"),
                onTap: () {
                  setState(() {
                    maritalStatus = "Unmarried";
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
  void _showEmergencyContactInput(BuildContext context) {
    TextEditingController contactController = TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _buildTextFieldInput("Enter Emergency Contact", contactController, () {
          setState(() {
            emergencyContact = contactController.text;
          });
        });
      },
    );
  }
  void _showBloodGroupPicker(BuildContext context) {
    List<String> bloodGroups = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select Blood Group",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: bloodGroups.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(bloodGroups[index]),
                      onTap: () {
                        setState(() {
                          bloodGroup = bloodGroups[index];
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        location = "Location services are disabled.";
      });
      return;
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          location = "Location permissions are denied.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        location = "Location permissions are permanently denied.";
      });
      return;
    }

    // Get current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      location = "Lat: ${position.latitude}, Long: ${position.longitude}";
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }
  Future<void> _loadProfileData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (mounted) {
        setState(() {
          height = prefs.getString("height") ?? "add";
          weight = prefs.getString("weight") ?? "add";
          email = prefs.getString("email") ?? "add";
          dob = prefs.getString("dob") ?? "add";
          emergencyContact = prefs.getString("emergencyContact") ?? "add";
          location = prefs.getString("location") ?? "add";
          maritalStatus = prefs.getString("maritalStatus") ?? "add";
          bloodGroup = prefs.getString("bloodGroup") ?? "add";
        });
      }
    } catch (e) {
      debugPrint("Error loading profile data: $e");
    }
  }


  Future<void> _saveAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("height", height);
    await prefs.setString("weight", weight);
    await prefs.setString("email", email);
    await prefs.setString("dob", dob);
    await prefs.setString("emergencyContact", emergencyContact);
    await prefs.setString("location", location);
    await prefs.setString("maritalStatus", maritalStatus);
    await prefs.setString("bloodGroup", bloodGroup);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _saveAllData().then((_) {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              });
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: const Text(
            "My Profile",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: const Color(0xff0077B6),
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name", style: TextStyle(color: Colors.blueGrey)),
                      Text("Chakshit", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildInfoTile("Contact Number", "+91-7018201209"),
                    _buildInfoTile("Email Id", "chakshitguleria2004@gmail.com"),
                    _buildInfoTile("Gender", "Male"),
                    _buildInfoTile("Date of Birth", "12/01/2004"),
                    _buildInfoTile("Blood Group",  bloodGroup,onTap: () => _showBloodGroupPicker(context)),
                    _buildInfoTile("Marital Status", maritalStatus,onTap: () => _showMaritalStatusPicker(context)),
                    _buildInfoTile("Height", height, onTap: () => _showHeightPicker(context)),
                    _buildInfoTile("Weight", weight,onTap: () => _showWeightPicker(context)),
                    _buildInfoTile("Emergency Contact",emergencyContact, onTap: () => _showEmergencyContactInput(context)),
                    _buildInfoTile("Location", location,onTap: _getCurrentLocation),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
  Widget _buildTextFieldInput(String title, TextEditingController controller, VoidCallback onSave) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: controller, keyboardType: TextInputType.number),
          ),
          ElevatedButton(onPressed: () { onSave(); Navigator.pop(context); }, child: const Text("Save"))
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String value, {VoidCallback? onTap}) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.blueGrey)),
        trailing: Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        onTap: onTap,
      ),
    );
  }
  Widget _buildPicker(String title, VoidCallback onDone) {
    return Container(
      height: 250,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(onPressed: () { onDone(); Navigator.pop(context); }, child: const Text("Done"))
        ],
      ),
    );
  }
}
