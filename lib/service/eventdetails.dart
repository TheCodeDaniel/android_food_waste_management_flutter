// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyDetails extends StatefulWidget {
  final index;
  const MyDetails({super.key, required this.index});

  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  GoogleMapController? mapController;
  Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: const Text("Event Details"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Guests: ${widget.index['guest']}"),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.index['name'],
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 202, 201, 201),
                  ),
                  child: GoogleMap(
                    markers: markers,
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: false,
                    buildingsEnabled: true,
                    trafficEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      zoom: 10,
                      target: LatLng(widget.index['lat'], widget.index['lng']),
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                      setState(() {
                        markers.add(
                          Marker(
                            markerId: const MarkerId('marker1'),
                            position: LatLng(
                                widget.index['lat'], widget.index['lng']),
                            infoWindow: InfoWindow(
                              title: widget.index['location'],
                              snippet: 'location marker',
                            ),
                            icon: BitmapDescriptor
                                .defaultMarker, // default marker icon
                          ),
                        );
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.date_range_outlined, size: 17),
                    const SizedBox(width: 3),
                    Text(
                      widget.index['date'],
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.timelapse_outlined, size: 17),
                    const SizedBox(width: 3),
                    Text(
                      widget.index['time'],
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 21),
                    const SizedBox(width: 3),
                    Text(
                      widget.index['location'],
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  "Description",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.index['description'],
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "Dress code:   ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.index['dress-code'],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Food options",
                  style: TextStyle(
                    fontSize: 19,
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    children: [
                      CheckboxMenuButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        ),
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        child: const Text("Japanese ramen"),
                      ),
                      const SizedBox(height: 15),
                      CheckboxMenuButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        ),
                        value: isChecked2,
                        onChanged: (value) {
                          setState(() {
                            isChecked2 = value!;
                          });
                        },
                        child: const Text("Chinese pasta"),
                      ),
                      const SizedBox(height: 15),
                      CheckboxMenuButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        ),
                        value: isChecked3,
                        onChanged: (value) {
                          setState(() {
                            isChecked3 = value!;
                          });
                        },
                        child: const Text("Indian Sweets"),
                      ),
                      const SizedBox(height: 15),
                      CheckboxMenuButton(
                        style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        ),
                        value: isChecked4,
                        onChanged: (value) {
                          setState(() {
                            isChecked4 = value!;
                          });
                        },
                        child: const Text("Hamburgers"),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
