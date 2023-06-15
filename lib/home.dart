import 'package:android_food_waste_management/service/eventdetails.dart';
import 'package:android_food_waste_management/service/list.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var event = Event().ongoingEvents;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: const Text("Events"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Hi there,\nWelcome to the event",
                    style: TextStyle(
                      fontSize: 29,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: event.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      width: 300,
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event[index]['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            event[index]['date'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: MyDetails(
                                    index: event[index],
                                  ),
                                  type: PageTransitionType.rightToLeft,
                                  childCurrent: widget,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              "View Event",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Recent events",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.history_rounded, size: 35),
                contentPadding: EdgeInsets.zero,
                title: const Text("World Health Event"),
                subtitle:
                    const Text("Discussion on world health organizations"),
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.history_rounded, size: 35),
                contentPadding: EdgeInsets.zero,
                title: const Text("Apple Product Release"),
                subtitle:
                    const Text("Apple release of new products and software"),
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.history_rounded, size: 35),
                contentPadding: EdgeInsets.zero,
                title: const Text("Fast X movie pre meet"),
                subtitle: const Text(
                    "Meeting with the new Fast X actors. Vin Diesel.."),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
