
    // return _file == null
    //     // If no file was selected
    //     ? Center(
    //         child: IconButton(
    //           icon: const Icon(Icons.upload),
    //           // Direct user to take a photo or select a file
    //           onPressed: () => _selectImage(context),
    //         ),
    //       )
    //     // If file was selected
    //     : Scaffold(
    //         appBar: AppBar(
    //           backgroundColor: mobileBackgroundColor,
    //           elevation: 0, // Remove shadow
    //           leading: IconButton(
    //             icon: Icon(
    //               Icons.close,
    //               color: neutral6Color,
    //             ),
    //             onPressed: () {},
    //           ),
    //           title: const Text(
    //             "New Post",
    //             style: TextStyle(
    //               color: neutral6Color,
    //             ),
    //           ),
    //           actions: [
    //             TextButton(
    //               onPressed: () {},
    //               child: const Text(
    //                 'Post',
    //                 style: TextStyle(
    //                   color: primaryColor,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 16,
    //                 ),
    //               ),
    //             ),
    //           ],
    //           // actions: [
    //           //   IconButton(
    //           //       onPressed: () {},
    //           //       icon: Icon(
    //           //         Icons.arrow_forward,
    //           //         color: primaryColor,
    //           //       )),
    //           // ],
    //         ),
    //         body: Column(
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 CircleAvatar(
    //                   backgroundImage: NetworkImage(
    //                       // If user don't have profile picture
    //                       userProvider.getUser.photoUrl == null
    //                           // Display nothing
    //                           ? ''
    //                           // Else display his profile picture
    //                           : userProvider.getUser.photoUrl),
    //                 ),
    //                 SizedBox(
    //                   width: MediaQuery.of(context).size.width * 0.4,
    //                   child: TextField(
    //                     controller: _reviewController,
    //                     decoration: const InputDecoration(
    //                       hintText: 'Write a review',
    //                       border: InputBorder.none,
    //                     ),
    //                     maxLines: 8,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 45,
    //                   width: 45,
    //                   child: AspectRatio(
    //                     aspectRatio: 487 / 451,
    //                     child: Container(
    //                       decoration: BoxDecoration(
    //                         image: DecorationImage(
    //                           // '!' in '_fill!' means variable will never be null
    //                           image: MemoryImage(_file!),
    //                           fit: BoxFit.fill,
    //                           alignment: FractionalOffset.topCenter,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 const Divider(),
    //               ],
    //             ),
    //           ],
    //         ),
    //       );