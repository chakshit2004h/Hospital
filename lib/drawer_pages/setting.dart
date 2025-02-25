import 'package:flutter/material.dart';
import 'package:hospital/Login.dart';
import 'package:hospital/signup.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingPageState();
}

class _SettingPageState extends State<Setting> {
  bool isReminderOn = true; // Toggle state for notification switch

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
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xff0077B6),
      ),
      body: ListView(
        children: [
          // Toggle Switch
          ListTile(
            title: const Text(
              "Show reminder notification",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            trailing: Switch(
              value: isReminderOn,
              onChanged: (value) {
                setState(() {
                  isReminderOn = value;
                });
              },
              activeColor: Colors.green,
            ),
          ),

          // Info Text Below Toggle
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              "Show alerts on the Lock screen, and in Notification Centre when it is accessed from the Lock screen.",
              style: TextStyle(color: Colors.grey),
            ),
          ),

          const Divider(),

          // "Are you a doctor?" Section
          ListTile(
            title: const Text(
              "Are you a doctor?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "Grow your business and help your patients",
              style: TextStyle(color: Colors.grey),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            onTap: () {},
          ),

          const Divider(),

          // Other Menu Items
          _buildMenuItem("Help family and friends stay healthy"),
          _buildMenuItem("About LifeLine"),
          _buildMenuItem("Rate us on App Store"),

          // Support button opens the dialog box
          _buildMenuItem("Support", isSupport: true),

          const Divider(),

          // Logout Button
          ListTile(
            title: const Text(
              "Logout",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),

          // Delete Account Button
          ListTile(
            title: const Text(
              "Delete Account",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup()));
            },
          ),
        ],
      ),
    );
  }

  // Function to create a menu item with an optional dialog trigger
  Widget _buildMenuItem(String title, {bool isSupport = false}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        if (isSupport) {
          _showSupportDialog();
        }
      },
    );
  }

  // Function to show the Support Dialog
  void _showSupportDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Support Options
                _supportOption("Existing Appointments"),
                _supportOption("FAQs & Support"),
                _supportOption("Have a Feature in Mind?"),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to create support menu items
  Widget _supportOption(String title) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Handle support option selection
        Navigator.pop(context);
      },
    );
  }
}