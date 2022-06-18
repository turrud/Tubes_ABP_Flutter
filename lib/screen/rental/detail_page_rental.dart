import 'package:flutter/material.dart';
import 'package:tubes_abp_flutter/models/rental_model.dart';
import 'package:tubes_abp_flutter/widgets/constants.dart';

class DetailPage extends StatefulWidget {
  final int kendaraanId;
  const DetailPage({Key? key, required this.kendaraanId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Kendaraan> kendaraanList = Kendaraan.kendaraanList;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Constants.primaryColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .5,
              height: size.height * .5,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                      top: 10,
                      left: 0,
                      child: SizedBox(
                          height: 200,
                          child: Image.asset(
                              kendaraanList[widget.kendaraanId].imageURL))),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: SizedBox(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KendaraanFeature(
                            title: 'Penumpang',
                            kendaraanFeature:
                                kendaraanList[widget.kendaraanId].penumpang,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * .5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(.4),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            kendaraanList[widget.kendaraanId].nama,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            kendaraanList[widget.kendaraanId].harga.toString(),
                            style: TextStyle(
                              color: Constants.blackColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Text(
                      kendaraanList[widget.kendaraanId].decription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 18,
                          color: Constants.blackColor.withOpacity(.7)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .4,
        height: 50,
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(0.3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'RENT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class KendaraanFeature extends StatelessWidget {
  const KendaraanFeature({
    Key? key,
    required this.title,
    required this.kendaraanFeature,
  }) : super(key: key);

  final String kendaraanFeature;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
          ),
        ),
        Text(
          kendaraanFeature,
          style: TextStyle(
            color: Constants.primaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
