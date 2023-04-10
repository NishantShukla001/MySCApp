import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 237, 244, 249),
          leading: IconButton(
                  color: const Color.fromRGBO(70, 70, 70, 1),
              icon: const Icon(Icons.arrow_back_sharp,),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            IconButton(
                  color: const Color.fromRGBO(70, 70, 70, 1),
                icon: const Icon(Icons.add),
                onPressed: () {}),
            const SizedBox(width: 10),
            IconButton(
                  color: const Color.fromRGBO(70, 70, 70, 1),
                icon: const Icon(Icons.edit),
                onPressed: () {}),
            const SizedBox(width: 10),
          ]),
      body: SafeArea(
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  width: 236,
                  height: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(
                      image: AssetImage("graphics/img_1.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  height: 60,
                  width: 270,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60,
                        width: 46,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: const Image(
                            image: AssetImage("graphics/img_1.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                const Text(
                  "Amy Carrie | 24",
                  style: TextStyle(
                      fontSize: 18,
                      color:  Color.fromRGBO(70, 70, 70, 1),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.location_pin,
                      size: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("New South Wales, Australia",
                        style: TextStyle(
                            color: Color.fromRGBO(70, 70, 70, 1),
                            fontSize: 13)),
                  ],
                ),
                const SizedBox(
                  height: 27,
                ),
                const Text("Bio",
                    style: TextStyle(color: Color.fromRGBO(141, 141, 141, 1), fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 8,
                ),
               const SizedBox(
                  width: 265,
                  child:  Text(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromRGBO(70, 70, 70, 1), fontSize: 12)),
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
