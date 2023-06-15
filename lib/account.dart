import 'package:flutter/material.dart';

class AcountPage extends StatefulWidget {
  const AcountPage({super.key});

  @override
  State<AcountPage> createState() => _AcountPageState();
}

class _AcountPageState extends State<AcountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: const Text("Accounts"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Center(
                child: CircleAvatar(
                  maxRadius: 70,
                  backgroundColor: Color.fromARGB(255, 222, 221, 221),
                ),
              ),
              const SizedBox(height: 30),
              const Text("Account"),
              const Divider(),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.email_outlined),
                title: Text("johndoeuser@gmail.com"),
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.language_outlined),
                title: Text("English"),
              ),
              const SizedBox(height: 15),
              const Text("Actions"),
              const Divider(),
              ListTile(
                onTap: () {},
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.logout_outlined),
                title: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
