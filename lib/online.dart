import 'package:flutter/material.dart';
import 'package:flutter_upi_india/flutter_upi_india.dart';

class Online extends StatefulWidget {
  const Online({super.key});

  @override
  State<Online> createState() => _OnlineState();
}

class _OnlineState extends State<Online> {
  int _selectedOption = 0;
  String? _transactionStatus;

  Future<void> initiateTransaction() async {
    try {
      UpiTransactionResponse response = await UpiPay.initiateTransaction(
        amount: (_selectedOption == 0 ? 449.0 : _selectedOption == 1 ? 1199.0 : 2499.0).toString(),
        transactionNote: "Payment for online consultation",
        app: UpiApplication.googlePay, // Use Google Pay as default
        receiverUpiAddress: "chakshitguleria2004@oksbi", // Replace with actual UPI ID
        receiverName: "Doctor Consultation",
        transactionRef: "TXN${DateTime.now().millisecondsSinceEpoch}",
      );

      print("Transaction Response: $response"); // Debugging output

      if (response.status == UpiTransactionStatus.success) {
        _showPaymentDialog("Payment Successful: ${response.toString() ?? 'No Transaction ID'}");
      } else {
        _showPaymentDialog("Payment Failed: ${response.status}\nResponse: $response");
      }
    } catch (e) {
      _showPaymentDialog("Payment Error: $e");
    }
  }


  void _showPaymentDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Payment Status"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
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
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Color(0xff0077B6),
        centerTitle: true,
        title: Text(
          "Summary",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 15.0),
              child: Text(
                "WE WILL ASSIGN YOU A TOP DOCTOR FROM BELOW",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                "View our doctors currently online",
                style: TextStyle(color: Colors.grey),
              ),
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
                      _buildDoctorCard("Ms. Jesin John", "Psychologist", "20 years experience", "assets/images/img2.jpg", "8556"),
                      _buildDoctorCard("Ms. Sandeep Kumar", "Psychologist", "12 years experience", "assets/images/i.png", "8556"),
                      _buildDoctorCard("Ms. Rizwana Parvin T M", "Counselling", "7 years experience", "assets/images/i2.png", "455"),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 10,
              color: Colors.grey[400],
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Apply Coupon Code", style: TextStyle(color: Colors.blue)),
                  SizedBox(height: 16),
                  _buildOption(0, "Single online consultation", "₹449.0", "₹549.0", "Chat, audio, video consultation and free 7 day follow-up", true),
                  _buildOption(1, "Covers 15 consultations across all specialities for 1 month", "₹1199", "₹3000", "24/7 access to doctors, consultations for the entire family across all 22 specialties.", false, "Save ₹1800"),
                  _buildOption(2, "Covers 15 consultations/month across all specialities for 3 months", "₹2499", "₹9000", "24/7 access to doctors, consultations for the entire family across all 22 specialties.", false, "Save ₹6500"),
                  SizedBox(height: 20),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹${_selectedOption == 0 ? '449' : _selectedOption == 1 ? '1199' : '2499'}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: (){initiateTransaction();},
                        child: Text("Pay And Consult"),
                      ),
                    ],
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text("View Breakup", style: TextStyle(color: Colors.blue)),
                    ),
                  ),
                  if (_transactionStatus != null)
                    Center(
                      child: Text(
                        _transactionStatus!,
                        style: TextStyle(color: _transactionStatus == "Payment Successful!" ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorCard(String name, String speciality, String experience, String imagePath, String consultations) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: SizedBox(
        width: 220,
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                foregroundImage: AssetImage(imagePath),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(speciality, style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Text(experience, style: TextStyle(color: Colors.grey, fontSize: 12)),
                  Row(
                    children: [
                      Icon(Icons.chat, color: Colors.green, size: 15),
                      Text("  $consultations Consultation", style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(int value, String title, String price, String oldPrice, String description, bool isHighlighted, [String? saveText]) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Radio<int>(
          value: value,
          groupValue: _selectedOption,
          onChanged: (int? newValue) {
            setState(() {
              _selectedOption = newValue!;
            });
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(description, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            Row(
              children: [
                Text(price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(width: 8),
                Text(oldPrice, style: TextStyle(fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
