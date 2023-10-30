import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(ARPAGE());
}

class BlogPost {
  final String title;
  final String content;

  BlogPost(this.title, this.content);
}

class ARPAGE extends StatefulWidget {
  @override
  _ARPAGEState createState() => _ARPAGEState();
}

class _ARPAGEState extends State<ARPAGE> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/images/Argentina Buenos Aires La Boca colorful buildings and tourists tilt up_preview.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Blog'),
        ),
        body: ListView(
          children: <Widget>[
            // Local Video Player
            Container(
              height: 240,
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : CircularProgressIndicator(),
            ),
            // Blog Posts - You should define your blog posts here
            BlogPostCard(
              post: BlogPost(
                'NGO Overview',
                'Our NGO is dedicated to making a positive impact on society. We focus on education, healthcare, and community building to create a better future for all. Join us in our mission to make the world a better place.',
              ),
            ),
            BlogPostCard(
              post: BlogPost(
                'Be a Warrior',
                'Starting a blog is an exciting journey.to making a positive impact on society. We focus on education, healthcare,  You need to choose a niche, create content, and engage your audience.',
              ),
            ),
            BlogPostCard(
              post: BlogPost(
                'Top 10 Tips',
                'Successful bloggers follow specific strategies. Here are the top 10 tips to make rested, you should write engaging and informative content. Learn how to do it he your blog stand out.',
              ),
            ),
            BlogPostCard(
              post: BlogPost(
                'Writing Engaging Content',
                'To keep your readers interested, you should write engaging and informative content. thcare, and community building to create a better future for all. Join us in our mission to make the world a better placeLearn how to do it here.',
              ),
            ),
            BlogPostCard(
              post: BlogPost(
                'Writing Engaging Content',
                'To keep your readers interested, you should write engaging and informative content. thcare, and community building to create a better future for all. Join us in our mission to make the world a better placeLearn how to do it here.',
              ),
            ),
            BlogPostCard(
              post: BlogPost(
                'Writing Engaging Content',
                'To keep your readers interested, you should write engaging and informative content. thcare, and community building to create a better future for all. Join us in our mission to make the world a better placeLearn how to do it here.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class BlogPostCard extends StatelessWidget {
  final BlogPost post;

  BlogPostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              post.title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              post.content,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
