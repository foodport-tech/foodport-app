import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/posts.dart';
import '../../utils/colors.dart';
import '../../widgets/post_card/post_card_page_view.dart';

class FeedPostForYouScreen extends StatelessWidget {
  FeedPostForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Listener
    final postsData = Provider.of<Posts>(context, listen: false);
    // IMPROVEMENT: postsData.forYouItems
    // to only get posts from the accounts followed

    print("//feed_post_for_you_screen.dart - postsData 1: $postsData");
    print(
        "//feed_post_for_you_screen.dart - postsData.postItems 1: ${postsData.postItems}");

    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: FutureBuilder(
        future: postsData.fetchAllPostsFromBackend(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("//feed_post_for_you_screen.dart - postsData 2: $postsData");
            print(
                "//feed_post_for_you_screen.dart - postsData.postItems 2: ${postsData.postItems}");
            return const Center(
              child: CircularProgressIndicator(),
            );
            // } else if (snapshot.hasError) {
            //   return const Center(
            //     child: Text('An error occurred!'),
            //   );
          } else {
            final posts = postsData.postItems;
            print("//feed_post_for_you_screen.dart - postsData: $postsData");
            print("//feed_post_for_you_screen.dart - posts: $posts");
            return PostCardPageView(posts: posts);
            // return Container(
            //   child: Text("postsData: $postsData \n posts: $posts"),
            // );
          }
        },
      ),
    );

    // return Scaffold(
    //   backgroundColor: mobileBackgroundColor,
    //   body: Consumer<Posts>(
    //     builder: (context, postsData, _) {
    //       final posts = postsData.postItems;
    //       print("feed_post_for_you_screen.dart - posts: $posts");

    //       return PostCardPageView(posts: posts);
    //     },
    //   ),
    // );
  }
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../providers/posts.dart';
// import '../../utils/colors.dart';
// import '../../widgets/post_card/post_card_page_view.dart';

// class FeedPostForYouScreen extends StatefulWidget {
//   FeedPostForYouScreen({super.key});

//   @override
//   State<FeedPostForYouScreen> createState() => _FeedPostForYouScreenState();
// }

// class _FeedPostForYouScreenState extends State<FeedPostForYouScreen> {
//   var _isInit = true;
//   var _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     if (_isInit) {
//       setState(() {
//         _isLoading = true;
//       });
//       Provider.of<Posts>(context).fetchPostsFromBackend().then((_) {
//         setState(() {
//           _isLoading = false;
//         });
//       });
//     }
//     _isInit = false;
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Listener
//     final postsData = Provider.of<Posts>(context);
//     // IMPROVEMENT: postsData.forYouItems
//     // to only get posts from the accounts followed
//     final posts = postsData.postItems;

//     return Scaffold(
//       backgroundColor: mobileBackgroundColor,
//       body: PostCardPageView(posts: posts),
//     );
//   }
// }
