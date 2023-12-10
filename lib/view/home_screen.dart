import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/view/tabBar_screen.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final search = TextEditingController();
  

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "News",
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Center(
            child: Text(
              DateFormat.yMMMd().format(DateTime.now()),
              
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Hey, James!"),
                vsize(0.02),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: const Text(
                    "Discover Latest News",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                vsize(0.05),

                // SearchField

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            controller.getResponse(tab: value);
                            // controller.searchNews(value);
                          },
                          controller: search,
                          decoration: const InputDecoration(
                            hintText: "Search For News",
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                        controller.searchNews(search.text);
                        },
                        child: const Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
                vsize(0.05),
                TabBarViewScreen(),
                

              
              
              ],
            ),
          );
        },
      ),
    );
  }
}
