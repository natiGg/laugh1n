import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laugh1/screens/constants/constants.dart';
import 'package:laugh1/screens/home/controller/initialcontroller.dart';
import 'package:laugh1/screens/home/widgets/reaction.dart';
import 'package:laugh1/screens/home/widgets/userbar.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'content.dart';
import 'hashtags.dart';

class ShimerPost extends GetView<InitialController> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        elevation: 3.0,
        child: Container(
          height: 450,
          decoration: BoxDecoration(
              color:
                  controller.isDarkMode.value ? Colors.black87 : Colors.white),
          width: double.infinity,
          child: Expanded(
            child: Shimmer.fromColors(
              baseColor: (controller.isDarkMode.value
                  ? Colors.grey[800]
                  : Colors.grey[300])!,
              highlightColor: (controller.isDarkMode.value
                  ? Colors.grey[500]!
                  : Colors.grey[100])!,
              enabled: _enabled,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  width: 100.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                      color: controller.isDarkMode.value
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10))),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 1.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.6),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: controller.isDarkMode.value
                                          ? Colors.black
                                          : Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: controller.isDarkMode.value
                                              ? Colors.black
                                              : Colors.white,
                                          width: 0.2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 100.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                  color: controller.isDarkMode.value
                                      ? Colors.black
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                        Container(
                            width: double.infinity,
                            height: 8.0,
                            decoration: BoxDecoration(
                                color: controller.isDarkMode.value
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10))),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0),
                        ),
                        Container(
                            width: double.infinity,
                            height: 8.0,
                            decoration: BoxDecoration(
                                color: controller.isDarkMode.value
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10))),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: 80.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                  color: controller.isDarkMode.value
                                      ? Colors.black
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  height: 200.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: controller.isDarkMode.value
                                          ? Colors.black
                                          : Colors.white)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        // HashTags(),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 1.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
