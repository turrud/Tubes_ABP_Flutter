import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:tubes_abp_flutter/screen/rental/detail_page_rental.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tubes_abp_flutter/models/rental_model.dart';
import 'package:tubes_abp_flutter/widgets/constants.dart';

Future<List<dynamic>> fetchData() async {
  var result = await http.get(Uri.parse("http://10.0.2.2:8000/api/sewa"));
  return json.decode(result.body)['data'];
}

class RentScreen extends StatefulWidget {
  const RentScreen({Key? key}) : super(key: key);

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Kendaraan> kendaraanList = Kendaraan.kendaraanList;

    List<String> kendaraanTypes = [
      'Recommended',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Rental'),
            Text(' '),
            Text('GoWis', style: TextStyle(color: Colors.blue))
          ],
        ),
        elevation: 1.0,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          width: size.width * .8,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: kendaraanTypes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                              debugPrint(selectedIndex.toString());
                            },
                            child: Text(
                              kendaraanTypes[index],
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: selectedIndex == index
                                    ? FontWeight.bold
                                    : FontWeight.w300,
                                color: selectedIndex == index
                                    ? Constants.primaryColor
                                    : Constants.blackColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * .3,
                    child: ListView.builder(
                        itemCount: kendaraanList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      child: DetailPage(
                                        kendaraanId: kendaraanList[index].id,
                                      )));
                            },
                            child: Container(
                              width: 200,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: Constants.primaryColor.withOpacity(.8),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 25,
                                    right: 25,
                                    top: 10,
                                    bottom: 25,
                                    child: Image.asset(
                                      kendaraanList[index].imageURL,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 50,
                                    left: 20,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          kendaraanList[index].nama,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    right: 20,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        kendaraanList[index].harga.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, bottom: 20, top: 20),
                    child: const Text(
                      'Sewa Kendaraan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: size.height * .5,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    child: DetailPage(
                                      kendaraanId: kendaraanList[index].id,
                                    )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Constants.primaryColor.withOpacity(.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 80,
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            margin: const EdgeInsets.only(bottom: 10, top: 10),
                            width: size.width,
                            //height: 30.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: 75.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Constants.primaryColor
                                            .withOpacity(.8),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: SizedBox(
                                        height: 65,
                                        child: Image.network(
                                          snapshot.data[index]['url'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 83,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data[index]['nama_kendaraan'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Constants.blackColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    snapshot.data[index]['harga'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black87),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
