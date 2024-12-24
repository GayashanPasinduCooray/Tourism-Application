import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../screens/news_detail_screen.dart';
import '../widgets/news_tile.dart';
import '../screens/home_screen.dart'; // Import your HomeScreen
import '../screens/favorite_screen_news.dart';


class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool _isGridView = false;

  @override
  void initState() {
    super.initState();
    // Fetch articles when the screen is first loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsProvider>(context, listen: false).fetchArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    // Handle sorting based on user's selection
    void _sortArticles(String sortOption) {
      switch (sortOption) {
        case 'A-Z':
          newsProvider.sortArticlesAlphabetically(true); // A-Z
          break;
        case 'Z-A':
          newsProvider.sortArticlesAlphabetically(false); // Z-A
          break;
        case 'Latest News':
          newsProvider.sortArticlesByDate(); // Latest news
          break;
        default:
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Sri Lanka News"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border, // Black heart icon
              color: Colors.black, // Set the icon color to black
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesScreen()),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: _sortArticles,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'Latest News',
                child: Text('Latest News'),
              ),
              PopupMenuItem(
                value: 'A-Z',
                child: Text('A-Z'),
              ),
              PopupMenuItem(
                value: 'Z-A',
                child: Text('Z-A'),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              _isGridView ? Icons.grid_view : Icons.view_list,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: newsProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : newsProvider.articles.isEmpty
          ? Center(child: Text("No news articles available."))
          : _isGridView
          ? GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.7,
        ),
        itemCount: newsProvider.articles.length,
        itemBuilder: (context, index) {
          final article = newsProvider.articles[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NewsDetailScreen(article: article),
                ),
              );
            },
            child: NewsTile(article: article),
          );
        },
      )
          : ListView.builder(
        itemCount: newsProvider.articles.length,
        itemBuilder: (context, index) {
          final article = newsProvider.articles[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      NewsDetailScreen(article: article),
                ),
              );
            },
            child: NewsTile(article: article),
          );
        },
      ),
    );
  }
}
