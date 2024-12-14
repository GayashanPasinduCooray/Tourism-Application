import 'package:flutter/material.dart';
import '../services/news_api_service.dart';
import '../widgets/news_tile.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sri Lanka News'),
      ),
      body: FutureBuilder(
        future: ApiService.fetchSriLankaNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching news'));
          } else {
            final newsList = snapshot.data as List;

            // Handle the case where the list is empty
            if (newsList.isEmpty) {
              return Center(child: Text('No news available'));
            }

            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final newsItem = newsList[index];
                return NewsTile(
                  title: newsItem['title'] ?? 'No Title Available', // Default value for null
                  description: newsItem['description'] ?? 'No Description Available', // Default value for null
                  url: newsItem['url'] ?? '', // Fallback to empty string
                  imageUrl: newsItem['urlToImage'] ?? '', // Fallback to placeholder
                );
              },
            );
          }
        },
      ),
    );
  }
}
