import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const DisplayPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("User Data",
          style: TextStyle(fontSize: 34,
          fontWeight: FontWeight.bold,
          color: Colors.white),
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                "Login Successful!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
              child: Card(
                shadowColor: Colors.deepOrange,

                // margin: const EdgeInsets.all(10),
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Token: ${data['id']},",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Username: ${data['username']}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Email: ${data['email']}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "First Name: ${data['firstName']}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Last Name: ${data['lastName']}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Gender: ${data['gender']}",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Image: ${data['image']}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            )
            // Text(
            //   "Expires In: ${data['accessToken']} ",
            //   style: const TextStyle(fontSize: 16),
            // ),
            // Text(
            //   "Expires In: ${data['refreshToken']} ",
            //   style: const TextStyle(fontSize: 16),
            // ),
          ],
        ),
      ),
    );
  }
}
