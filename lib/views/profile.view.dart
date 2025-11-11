import 'package:flutter/material.dart';
import 'package:reyes_socialmediaclone/model/usercomment.dart';
import 'package:reyes_socialmediaclone/model/userdata.dart';
import 'package:reyes_socialmediaclone/model/userpost.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.userPost});

  final UserPost userPost;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final UserData userData = UserData();
  final TextEditingController _commentController = TextEditingController();

  var nametxtStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  var boldTxtStyle = const TextStyle(fontWeight: FontWeight.bold);
  var boldTxtStyle1 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  Widget commentBtn(UserComment userComment) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [Text('Like'), SizedBox(width: 15), Text('Reply')],
    ),
  );

  Widget commentDesc(UserComment userComment) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(userComment.commenterName, style: boldTxtStyle),
        const SizedBox(height: 5),
        Text(userComment.commenterContent),
      ],
    ),
  );

  Widget commentSpace(UserComment userComment) => Container(
    decoration: const BoxDecoration(
      color: Color.fromARGB(35, 158, 158, 158),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: commentDesc(userComment),
  );

  Widget commenterPic(UserComment userComment) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: CircleAvatar(
      backgroundImage: AssetImage(userComment.commenterImg),
      radius: 20,
    ),
  );

  Widget usercommenterline(UserComment userComment) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      commenterPic(userComment),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [commentSpace(userComment), commentBtn(userComment)],
      ),
    ],
  );

  Widget userpostdetails(UserComment userComment) => Column(
    children: [const SizedBox(height: 15), usercommenterline(userComment)],
  );

  Widget commenters() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [Text(widget.userPost.numshare, style: boldTxtStyle)],
        ),
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('All comments', style: boldTxtStyle1),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    ],
  );

  Widget buttons() => Column(
    children: [
      const Divider(color: Colors.grey),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: widget.userPost.isLiked
                    ? Colors.grey
                    : Colors.blue,
              ),
              onPressed: () {},
              icon: const Icon(Icons.thumb_up, size: 20),
              label: const Text('Like'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble, size: 20),
              label: const Text('Comment'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: () {},
              icon: const Icon(Icons.share, size: 20),
              label: const Text('Share'),
            ),
          ],
        ),
      ),
    ],
  );

  Widget userline() => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          backgroundImage: AssetImage(widget.userPost.userimg),
          radius: 20,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.userPost.username, style: nametxtStyle),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(widget.userPost.time),
              const Text(' · '),
              const Icon(Icons.group, size: 15, color: Colors.grey),
            ],
          ),
        ],
      ),
    ],
  );

  Widget postimage() => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.userPost.postcontent,
          style: const TextStyle(fontSize: 16),
          softWrap: true,
        ),
        const SizedBox(height: 15),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            widget.userPost.postimg,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );

  Widget commentInput() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(userData.myUserAccount.img),
          radius: 18,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'Write a comment...',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send, color: Colors.blue),
          onPressed: () {
            if (_commentController.text.trim().isEmpty) return;

            final newComment = UserComment(
              commenterImg: userData.myUserAccount.img,
              commenterName: userData.myUserAccount.name,
              commenterTime: 'Now',
              commenterContent: _commentController.text.trim(),
            );

            setState(() {
              userData.commentList.insert(0, newComment);
              _commentController.clear();
            });
          },
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                userline(),
                postimage(),
                buttons(),
                commenters(),
                const SizedBox(height: 10),
                ...userData.commentList.map((c) => userpostdetails(c)),
                const SizedBox(height: 70),
              ],
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, -2),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: commentInput(),
            ),
          ),
        ],
      ),
    );
  }
}
