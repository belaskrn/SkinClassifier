import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // final String username; // Pass the username as a parameter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 50),
            Icon(
              Icons.person,
              size: 72,
              color: Color.fromARGB(255, 250, 239, 228),
            ),
            const SizedBox(height: 10),
            Text(
              'Your Profile',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 50),

            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                  color: Color.fromARGB(255, 250, 239, 228),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.only(left: 15, bottom: 15),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Email',
                      style: TextStyle(
                        color: Colors.grey[500]
                        ),),
                      
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings,
                            color: Colors.grey[500],
                          ))
                    ],
                  ),

                  Text('user@gmail.com'),

                ],
              ),
            ),

            const SizedBox(height: 10),
                  
                  // Padding(
                  //   padding: const EdgeInsets.all(24.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text('Logout',
                  //       style: TextStyle(
                  //         ),),
                        
                  //       IconButton(
                  //           onPressed: () {},
                  //           icon: Icon(
                  //             Icons.logout,
                  //             color: Colors.grey[500],
                  //           ))
                  //     ],
                  //   ),
                  // ),
          ],
        ),
      ),
    );
  }
}
