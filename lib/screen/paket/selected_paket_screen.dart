import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tubes_abp_flutter/models/paket_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Future<List<dynamic>> fetchData() async {
  var result = await http.get(Uri.parse("http://10.0.2.2:8000/api/paket"));
  return json.decode(result.body)['data'];
}

class SelectedPaketScreen extends StatelessWidget {
  final _pageController = PageController();

  final RecommendedModel recommendedModel;

  SelectedPaketScreen({Key? key, required this.recommendedModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Stack(
              children: <Widget>[
                /// PageView for Image
                PageView(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    recommendedModel.images.length,
                    (int index) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                              recommendedModel.images[index]),
                        ),
                      ),
                    ),
                  ),
                ),

                /// Custom Button
                SafeArea(
                  child: Container(
                    height: 57.6,
                    margin: const EdgeInsets.only(
                        top: 28.8, left: 28.8, right: 28.8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 57.6,
                            width: 57.6,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.6),
                              color: const Color(0x10000000),
                            ),
                            child: SvgPicture.asset(
                                'assets/svg/icon_left_arrow.svg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Content
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.4,
                        maxHeight: MediaQuery.of(context).size.height * 0.5),
                    padding: const EdgeInsets.only(
                        left: 28.8, bottom: 48, right: 28.8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: recommendedModel.images.length,
                          effect: const ExpandingDotsEffect(
                              activeDotColor: Color(0xFFFFFFFF),
                              dotColor: Color(0xFFababab),
                              dotHeight: 4.8,
                              dotWidth: 6,
                              spacing: 4.8),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19.2),
                          child: Text(
                            recommendedModel.tagLine,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.playfairDisplay(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19.2),
                          child: Text(
                            recommendedModel.description,
                            maxLines: 3,
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                FittedBox(
                                  child: Text(
                                    'Start from',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    '\$ ${recommendedModel.price.toString()} / person',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 62.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.6),
                                  color: Colors.white),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 28.8, right: 28.8),
                                  child: FittedBox(
                                    child: Text(
                                      'Explore Now >>',
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
