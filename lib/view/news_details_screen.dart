import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/home_controller.dart';

class NewsDetailScreen extends StatelessWidget {
  final index;
  NewsDetailScreen({this.index, super.key});

  final controller = Get.put(HomeController());

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
        iconTheme: IconThemeData(
            color: Colors.black, size: MediaQuery.sizeOf(context).width * 0.1),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 248, 67, 67),
                    child: Text(controller.news_list![index].source!.name![0]),
                  ),
                  hsize(0.05),
                  Container(
                    color: Colors.black,
                    height: MediaQuery.sizeOf(context).height * 0.06,
                    width: MediaQuery.sizeOf(context).width * 0.008,
                  ),
                  hsize(0.05),
                  RichText(
                    text: TextSpan(
                      text: '${DateFormat.yMMMd().format(DateTime.parse(controller.news_list![index].publishedAt!))}\n ',
                      style: const TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: controller.news_list![index].source!.name!,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ],
              ),
              vsize(0.05),
              Text(
                controller.news_list![index].title!,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              vsize(0.02),
              Text(
                controller.news_list![index].description!,
              ),
              vsize(0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        launchUrl(Uri.parse(controller.news_list![index].url!));
                      },
                      child: const Text(
                        "Read Story",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )),
                      new Divider(
            color: Colors.red,
          ),
                  TextButton(
                      onPressed: () {
                        Share.share('check out this website https://example.com',
                            subject: 'Look what I made!');
                      },
                      child: const Text("Share Now",
                          style: TextStyle(color: Colors.black)))
                ],
              ),
              vsize(0.02),
              controller.news_list![index].urlToImage == null
                  ? const Center(
                      child: Icon(Icons.image_not_supported),
                    )
                  : Center(
                      child: Image.network(
                          controller.news_list![index].urlToImage!))
            ],
          ),
        );
      }),
    );
  }
}
