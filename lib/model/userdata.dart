import 'package:reyes_socialmediaclone/model/account.dart';
import 'package:reyes_socialmediaclone/model/friend.dart';
import 'package:reyes_socialmediaclone/model/usercomment.dart';
import 'package:reyes_socialmediaclone/model/userpost.dart';

class UserData {
  List<UserPost> userList = [
    UserPost(
      userimg: 'assets/person1.jpg',
      username: 'Cyrene',
      time: '2 hrs ago',
      postcontent: 'We will definitly meet again in the distant future!',
      postimg: 'assets/amazing.jpg',
      numshare: '10',
      numComments: '24',
    ),
    UserPost(
      userimg: 'assets/person2.jpg',
      username: 'Hu My Tao',
      time: '1 hr ago',
      postcontent: 'Loving the new cafe in town!',
      postimg: 'assets/pavlova.jpg',
      numshare: '20',
      numComments: '15',
    ),
    UserPost(
      userimg: 'assets/person3.jpg',
      username: 'Mac Barbara',
      time: '30 mins ago',
      postcontent: 'Just finished a marathon!',
      postimg: 'assets/person3.jpg',
      numshare: '5',
      numComments: '2',
    ),
  ];
  List<Friend> friendList = [
    Friend(name: 'Cyrene', img: 'assets/person1.jpg'),
    Friend(name: 'Hu My Tao', img: 'assets/person2.jpg'),
    Friend(name: 'Mac Barbara', img: 'assets/person3.jpg'),
    Friend(name: 'Cartweel', img: 'assets/person4.jpg'),
    Friend(name: 'Chibi Carlotta', img: 'assets/person5.jpg'),
  ];

  List<UserComment> commentList = [
    UserComment(
      commenterImg: 'assets/person1.jpg',
      commenterName: 'Cyrene',
      commenterContent: 'Wow, that looks amazing!',
      commenterTime: '1 hr ago',
    ),
    UserComment(
      commenterImg: 'assets/person2.jpg',
      commenterName: 'Hu My Tao',
      commenterContent: 'Great job on the marathon!',
      commenterTime: '30 mins ago',
    ),
    UserComment(
      commenterImg: 'assets/person4.jpg',
      commenterName: 'Cartweel',
      commenterContent: 'I need to check out that cafe!',
      commenterTime: '15 mins ago',
    ),
  ];

  Account myUserAccount = Account(
    name: 'Kei Sen',
    email: 'kei_sen@example.com',
    password: 'password123',
    img: 'assets/yuh.jpg',
    numFollowers: '150',
    numFollowing: '200',
    numPosts: '75',
    numFriends: '50',
  );
}
