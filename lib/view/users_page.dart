import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:registred_api/model/my_movie.dart';

class MyTasksWidget extends StatelessWidget {
  const MyTasksWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesRef = FirebaseFirestore.instance.
    collection("register").
    withConverter<MyMovie>(fromFirestore: (snapshot, _) =>
        MyMovie.fromJson(snapshot.data()!),
      toFirestore: (register, _) => register.toJson(),);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Foydalanuvchilar",
        ),
      ),
      body: StreamBuilder<QuerySnapshot<MyMovie>>(
        stream: moviesRef.snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }
          return ListView.builder(
              itemCount: snapshot.data?.size,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(snapshot.data!.docs[index]
                        .data()
                        .name!),
                    Text(snapshot.data!.docs[index]
                        .data()
                        .phone),
                  ],
                );
              });

        },
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(top: 48),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           const Text(
        //             'Tasks',
        //             style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
        //           ),
        //           InkWell(
        //             onTap: () {},
        //             child: Container(
        //                 height: 48,
        //                 width: 110,
        //                 alignment: Alignment.center,
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(32),
        //                   gradient: const LinearGradient(
        //                     begin: Alignment.topRight,
        //                     end: Alignment.bottomRight,
        //                     colors: [],
        //                   ),
        //                 ),
        //                 child: const Text(
        //                   '+  Add Task',
        //                   style: TextStyle(
        //                     fontSize: 16,
        //                     fontWeight: FontWeight.w600,
        //                     color: Colors.white,
        //                   ),
        //                 )),
        //           ),
        //         ],
        //       ),
        //     ),
        //     ListView.builder(
        //         shrinkWrap: true,
        //         physics: const BouncingScrollPhysics(),
        //         itemBuilder: (context, index) {
        //           return Container(
        //             height: 100,
        //             width: double.infinity,
        //             margin: const EdgeInsets.only(top: 20),
        //             padding: const EdgeInsets.only(left: 16, right: 4),
        //             decoration: BoxDecoration(
        //               color: Colors.white,
        //               borderRadius: BorderRadius.circular(20),
        //             ),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Row(
        //                   children: [
        //                     Container(
        //                       height: 48,
        //                       width: 48,
        //                       padding: const EdgeInsets.all(10),
        //                       decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(16),
        //                         gradient: const LinearGradient(
        //                           begin: Alignment.topRight,
        //                           end: Alignment.bottomRight,
        //                           colors: [],
        //                         ),
        //                       ),
        //                     ),
        //                     const SizedBox(width: 16),
        //                     Column(
        //                       mainAxisAlignment: MainAxisAlignment.center,
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Text(
        //                           "Omonov Qahramon",
        //                           style: const TextStyle(
        //                             fontSize: 20,
        //                             fontWeight: FontWeight.w600,
        //                           ),
        //                         ),
        //                         const SizedBox(height: 6),
        //                         Text(
        //                           " +99899 495 81 86,",
        //                           style: const TextStyle(
        //                             fontSize: 16,
        //                             color: Colors.grey,
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //                 IconButton(
        //                   onPressed: () {},
        //                   icon: const Icon(
        //                     Icons.more_vert,
        //                     color: Colors.grey,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           );
        //         }),
        //   ],
        // ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.grey,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Image.asset("assets/home.png"),
      //         label: 'Home',
      //        ),
      //     BottomNavigationBarItem(
      //         icon: Image.asset("assets/shopping.png"),
      //         label: 'Shop',
      //        ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset("assets/square.png"),
      //       label: 'group',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset("assets/money.png"),
      //       label: 'Money',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset("assets/setting.png"),
      //       label: 'Interface',
      //     ),
      //   ],
      // ),
    );
  }
}
