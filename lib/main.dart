import 'package:flutter/material.dart';
import 'package:messenger/model/data_model.dart';
import 'package:messenger/model/user_model.dart';

void main() {
  runApp(Messenger());
}

class Messenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/1.jpeg"),
                  radius: 20,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "Chat",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ],
          ),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: IconButton(
                icon: Icon(
                  Icons.camera,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: IconButton(
                    icon: Icon(
                      Icons.pending,
                      color: Colors.black,
                    ),
                    onPressed: () {}),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Search",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) => story(data[index]),
                    separatorBuilder: (ctx, index) => SizedBox(
                      width: 9,
                    ),
                    itemCount: data.length,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildChatItem(data[index]),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: data.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChatItem(UserModel chatData) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  chatData.images,
                ),
                radius: 36,
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
              ),
              chatData.active
                  ? Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: 2,
                        bottom: 2,
                      ),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.green,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: 2,
                        bottom: 2,
                      ),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                      ),
                    ),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatData.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        chatData.messege,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      chatData.time,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget story(UserModel userData) {
    return Container(
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  userData.images,
                ),
                radius: 40,
              ),
              userData.active
                  ? CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                    )
                  : Container(),
              userData.active
                  ? Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: 2,
                        bottom: 2,
                      ),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.green,
                      ),
                    )
                  : Container(),
            ],
          ),
          Text(
            userData.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
