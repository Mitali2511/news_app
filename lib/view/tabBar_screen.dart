import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/home_controller.dart';
import 'news_details_screen.dart';

class TabBarViewScreen extends StatelessWidget {
  TabBarViewScreen({super.key});
  final h = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    vsize(
      double height,
    ) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height * height,
      );
    }

    hsize(
      double width,
    ) {
      return SizedBox(
        width: MediaQuery.sizeOf(context).width * width,
      );
    }

    return DefaultTabController(
        length: 4,
        child: Column(children: [
          TabBar(
            onTap: (value) {
              switch (value) {
                case 0:
                  h.getResponse(tab: "politics");
                  break;
                case 1:
                  h.getResponse(tab: "movies");
                  break;
                case 2:
                  h.getResponse(tab: "sports");
                  break;
                case 3:
                  h.getResponse(tab: "crime");
                  break;
              }
            },
            unselectedLabelStyle: const TextStyle(),
            indicator: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 254, 208, 208)),
            labelColor: const Color.fromARGB(255, 248, 67, 67),
            unselectedLabelColor: const Color.fromARGB(255, 2, 2, 2),
            tabs: const [
              Tab(icon: Icon(Icons.mic), text: "Politics"),
              Tab(icon: Icon(Icons.local_movies_rounded), text: "Movies"),
              Tab(icon: Icon(Icons.sports_hockey_outlined), text: "Sports"),
              Tab(icon: Icon(Icons.gavel_sharp), text: "Crime"),
            ],
          ),
          vsize(0.05),

//Tab bar view

          Container(
            height: MediaQuery.sizeOf(context).height / 1,
            child: TabBarView(children: [
              //
              Column(
                children: [
                  h.news_list == null
                      //
                      ? const CircularProgressIndicator()
                      : h.news_list!.isEmpty
                          ? const Text("no data ")
//Politics List
                          : Expanded(
                              child: ListView.builder(
                                // padding: EdgeInsets.all(10),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: h.news_list!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(NewsDetailScreen(
                                            index: index,
                                          ));
                                        },
                                        child: Row(
                                          children: [
                                            h.news_list![index].urlToImage ==
                                                    null
                                                ? const Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 20,
                                                                left: 20),
                                                        child:
                                                            Icon(Icons.image_not_supported),
                                                      )
                                                    ],
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              h
                                                                  .news_list![
                                                                      index]
                                                                  .urlToImage!,
                                                            ),
                                                            fit: BoxFit.cover)),
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.1,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.35,
                                                  ),
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.03,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width /
                                                        3,
                                                    child: Text(
                                                      h.news_list![index]
                                                              .title ??
                                                          'No Title',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                 vsize(0.01),
                                                Text(
                                                    DateFormat.yMMMd().format(DateTime.parse(h.news_list![index].publishedAt!)))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                      )
                                    ],
                                  );
                                },
                              ),
                            )
                ],
              ),
              //
              Column(
                children: [
                  h.news_list == null
                      //
                      ? const CircularProgressIndicator()
                      : h.news_list!.isEmpty
                          ? const Text("no data ")
//Movies List
                          : Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(15),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: h.news_list!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(NewsDetailScreen(
                                            index: index,
                                          ));
                                        },
                                        child: Row(
                                          children: [
                                            h.news_list![index].urlToImage ==
                                                    null
                                                ? const Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 20,
                                                                left: 20),
                                                        child: Icon(Icons
                                                            .image_not_supported_rounded),
                                                      )
                                                    ],
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              h
                                                                  .news_list![
                                                                      index]
                                                                  .urlToImage!,
                                                            ),
                                                            fit: BoxFit.cover)),
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.1,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.35,
                                                  ),
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.03,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width /
                                                        3,
                                                    child: Text(
                                                      h.news_list![index]
                                                              .title ??
                                                          'No Title',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                vsize(0.01),
                                                Text(
                                                    DateFormat.yMMMd().format(DateTime.parse(h.news_list![index].publishedAt!)))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                      )
                                    ],
                                  );
                                },
                              ),
                            )
                ],
              ),
              //
              Column(
                children: [
                  h.news_list == null
                      //
                      ? const CircularProgressIndicator()
                      : h.news_list!.isEmpty
                          ? const Text("no data ")
//Sports List
                          : Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(15),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: h.news_list!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(NewsDetailScreen(
                                            index: index,
                                          ));
                                        },
                                        child: Row(
                                          children: [
                                            h.news_list![index].urlToImage ==
                                                    null
                                                ? const Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 20,
                                                                left: 20),
                                                        child:
                                                            Icon(Icons.image),
                                                      )
                                                    ],
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              h
                                                                  .news_list![
                                                                      index]
                                                                  .urlToImage!,
                                                            ),
                                                            fit: BoxFit.cover)),
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.1,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.35,
                                                  ),
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.03,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width /
                                                        3,
                                                    child: Text(
                                                      h.news_list![index]
                                                              .title ??
                                                          'No Title',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                vsize(0.01),
                                                Text(
                                                    DateFormat.yMMMd().format(DateTime.parse(h.news_list![index].publishedAt!)))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                      )
                                    ],
                                  );
                                },
                              ),
                            )
                ],
              ),
              //
              Column(
                children: [
                  h.news_list == null
                      //
                      ? const CircularProgressIndicator()
                      : h.news_list!.isEmpty
                          ? const Text("no data ")
//Crime List
                          : Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(15),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: h.news_list!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(NewsDetailScreen(
                                            index: index,
                                          ));
                                        },
                                        child: Row(
                                          children: [
                                            h.news_list![index].urlToImage ==
                                                    null
                                                ? const Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 20,
                                                                left: 20),
                                                        child:
                                                            Icon(Icons.image),
                                                      )
                                                    ],
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              h
                                                                  .news_list![
                                                                      index]
                                                                  .urlToImage!,
                                                            ),
                                                            fit: BoxFit.cover)),
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.1,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.35,
                                                  ),
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.03,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width /
                                                        3,
                                                    child: Text(
                                                      h.news_list![index]
                                                              .title ??
                                                          'No Title',
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                  vsize(0.01),
                                                Text(
                                                    DateFormat.yMMMd().format(DateTime.parse(h.news_list![index].publishedAt!)))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                      )
                                    ],
                                  );
                                },
                              ),
                            )
                ],
              ),
            ]),
          )
        ]));
  }
}
