import 'package:flutter/material.dart';
import 'package:news_app/infrastructure/app_const/app_color_const.dart';
import 'package:news_app/infrastructure/extension/date_parse.dart';
import 'package:news_app/infrastructure/theme/extension_theme.dart';
import 'package:news_app/services/model/news_model.dart';

class NewsTile extends StatelessWidget {
  final ArticleData article;

  const NewsTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 9, right: 9),

      child: Card(
        color: AppColorConst.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: article.urlToImage == null
                    ? SizedBox(width: 100, height: 110)
                    : Image.network(article.urlToImage ?? '', width: 100, height: 110, fit: BoxFit.cover),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.bold.shadow,
                    ),
                    SizedBox(height: 4),
                    Text(
                      article.description ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.regular.shadow,
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.calendar_month, color: AppColorConst.grey, size: 16),
                        SizedBox(width: 4),
                        Text(
                          article.publishedAt.toString().toGMT(),
                          style: Theme.of(context).textTheme.bodySmall?.bold.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
