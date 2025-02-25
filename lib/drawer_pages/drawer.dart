import 'package:flutter/material.dart';
import 'package:hospital/drawer_pages/consulation.dart';
import 'package:hospital/drawer_pages/helpCenter.dart';
import 'package:hospital/drawer_pages/my_doctor.dart';
import 'package:hospital/drawer_pages/orders.dart';
import 'package:hospital/drawer_pages/question.dart';
import 'package:hospital/drawer_pages/records.dart';
import 'package:hospital/drawer_pages/reminder.dart';
import 'package:hospital/drawer_pages/setting.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Chakshit',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            accountEmail: const Text('View and Edit Profile'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, size: 40, color: Colors.white),
            ),
            decoration: const BoxDecoration(
              color: Color(0xff0077B6),
            ),
          ),
          _buildMenuItem(Icons.calendar_today, 'Appointments', () {}),
          _buildMenuItem(Icons.science, 'Test Bookings', () {}),
          _buildMenuItem(Icons.shopping_cart, 'Orders', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrdersPage()),
            );
          }),
          _buildMenuItem(Icons.chat, 'Consultations', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConsultationsPage(problemType: 'NA', title: 'NA', description: 'NA',)),
            );
          }),
          _buildMenuItem(Icons.people, 'My Doctors', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyDoctor()),
            );
          }),
          _buildMenuItem(Icons.folder, 'Medical Records', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Records()),
            );
          }),
          _buildMenuItem(Icons.policy, 'My Insurance Policy', () {}),
          _buildMenuItem(Icons.alarm, 'Reminders', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Reminder()),
            );
          }),
          _buildMenuItem(Icons.payment, 'Payments & Health Cash', () {}),
          _buildMenuItem(Icons.article, 'Read Health Articles', () {}),
          _buildMenuItem(Icons.help, 'Help Center', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpCenterPage()),
            );
          }),
          _buildMenuItem(Icons.settings, 'Settings', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Setting()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xff0077B6)),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
