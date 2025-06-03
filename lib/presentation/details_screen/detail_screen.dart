import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/infrastructure/app_const/app_color_const.dart';
import 'package:news_app/infrastructure/extension/date_parse.dart';
import 'package:news_app/infrastructure/app_const/app_string_const.dart';
import 'package:news_app/services/model/news_model.dart';

class DetailScreen extends StatelessWidget {
  final Articles article;
  final controller = Get.find<NewsController>();

  DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStringConst.back)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            if (article.urlToImage != null)
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: NetworkImage(article.urlToImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  controller.isFavorite(article)
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.favorite,
                              size: 30,
                              color: AppColorConst.red,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            SizedBox(height: 8),
            Text(
              article.title ?? "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: 14),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.calendar_month_rounded, color: AppColorConst.grey),
                Text(
                  article.publishedAt.toString().toGMT().toString(),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColorConst.grey.shade600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  article.content ?? article.description ?? "",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
