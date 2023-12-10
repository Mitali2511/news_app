import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/news_list_model.dart';

class HomeController extends GetxController {
  DateTime? time;
  List<bool> isSelected = [true, false, false, false];
  List<NewsListModel>? news_list;
  List<NewsListModel>? search_list;

  @override
  void onInit() {
    getResponse();

    // TODO: implement onInit
    super.onInit();
  }

  var response;

  getResponse({String? tab}) async {
    news_list = null;
    update();
    try {
      var uri = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=${tab ?? "politics"}=2023-11-07&sortBy=publishedAt&apiKey=a00083b95f1b4de282c0e74f9c1695c2"));
      if (uri.statusCode == 200) {
        response = jsonDecode(uri.body);
        update();
        print("-----------News List Response---------------");
        print(response);
        search_list = NewsListModel.getProductList(response["articles"])
            .cast<NewsListModel>();
        update();
        news_list = NewsListModel.getProductList(response["articles"])
            .cast<NewsListModel>();
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  searchNews(String query) {
    search_list = null;
    for (int i = 0; i < news_list!.length; i++) {
      if (news_list![i].title!.contains(query.toLowerCase())) {
        search_list!.add(news_list![i]);
        update();
        // print(news_list![i].title!);
      } else {
        print("not found");
      }
    }
    news_list = null;
    news_list = search_list;
    update();
  }
}
