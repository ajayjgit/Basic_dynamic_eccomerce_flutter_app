import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mart/models/today_model.dart';
import 'package:mart/components/bottomnav.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodayModel> today = [];
  List<BoxModel> box = [];

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  void _getInitialInfo() {
    today = TodayModel.gettoday();
    box = BoxModel.getbox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 63, 63),
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 63, 63)),
                accountName: Text(
                  "ALL IS WELL",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("alliswell@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 63, 63),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Orders '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Stack for the custom header with a curve and centered title
          Stack(
            children: [
              // Background
              ClipPath(
                clipper: CustomShapeBorder(),
                child: Container(
                  height: 110, // Adjust height as needed
                  color: Color.fromARGB(255, 255, 63, 63),
                ),
              ),
              // Centered Title
              Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'MART',
                    style: TextStyle(
                      color: Colors.white, // Text color (white)
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Row of containers positioned on the curve
              Positioned(
                top: 0, // Adjust this value based on the curve height
                left: 0,
                right: 0,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildListViewContainer(
                        'assets/images/cheese.webp', 'Home', 1),
                    _buildListViewContainer(
                        'assets/images/col.jpg', 'Grocies', 2),
                    _buildListViewContainer(
                        'assets/images/dark.webp', 'toys', 3),
                    _buildListViewContainer(
                        'assets/images/him.webp', 'view all', 4),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          // CarouselSlider
          CarouselSlider(
            items: [
              // Images for the slider
              _buildCarouselItem("assets/images/a.jpg"),
              _buildCarouselItem("assets/images/b.jpg"),
              _buildCarouselItem("assets/images/c.jpg"),
            ],
            options: CarouselOptions(
              height: 170.0,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
            ),
          ),
          SizedBox(height: 20),

          _todaySection(),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // First item
                  Container(
                    width: 180,
                    height: 120,
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.symmetric(
                        horizontal: 10.0), // Add horizontal margin here
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/images/sub1.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 120,
                    margin: EdgeInsets.symmetric(
                        horizontal: 10.0), // Add horizontal margin here
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/images/sub2.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    height: 120,
                    margin: EdgeInsets.symmetric(
                        horizontal: 10.0), // Add horizontal margin here
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage("assets/images/sub3.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Second item
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          _boxSection(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      bottomNavigationBar:
          BottomNavBar(currentPage: 1), // Use BottomNavBar here
    );
  }

  Container _buildNewArrivalItem(String itemName) {
    return Container(
      width: 150,
      height: 150,
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          itemName,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Container _buildCarouselItem(String imagePath) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Column _subbannerImageSection(String imagePath) {
    return Column(
      children: [
        Container(
          width: double
              .infinity, // Set width to fill the entire width of the screen
          height: 200, // Adjust height as needed
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath), // Use the provided imagePath
              fit: BoxFit.cover, // Ensure the image covers the entire area
            ),
          ),
        ),
      ],
    );
  }

  Column _todaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Today Deal',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 130,
          child: ListView.separated(
            itemCount: today.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 130,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(today[index].iconPath),
                      ),
                    ),
                    Text(
                      today[index].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Column _boxSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Top Deals',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              GridView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // Prevents GridView from scrolling
                shrinkWrap:
                    true, // Makes the GridView take only as much space as it needs
                itemCount: box.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10, // Horizontal space between items
                  mainAxisSpacing: 10, // Vertical space between items
                  childAspectRatio: 1, // Aspect ratio for each item
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(box[index].iconPath),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  box[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '\₹${box[index].price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomShapeBorder extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height - 40); // Start position flipped
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - 40); // Curve flipped
    path.lineTo(size.width, 0); // Right side flipped
    path.lineTo(0, 0); // Left side flipped
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomShapeBorder oldClipper) => false;
}

Container _buildListViewContainer(String imagePath, String name, int index) {
  // Calculate y-coordinate based on index to place items on the curve
  double yOffset = math.sin(math.pi / 5 * index);

  return Container(
    width: 70,
    height: 100, // Adjusted height to accommodate the name
    margin: EdgeInsets.only(right: 10.0),
    transform: Matrix4.translationValues(0.0, yOffset * 60, 0.0),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -7, // Adjust this value to position the text below the circle
          child: Text(
            name,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

AppBar appBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 80, // Set the height to 80
    backgroundColor: Color.fromARGB(255, 255, 63, 63),
    centerTitle: true,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white, // Set the color to white
            size: 40, // Increase the size of the icon
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    ),

    flexibleSpace: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: _searchField(), // Place the search field widget
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white, // Set the icon color to white
                  size: 35, // Increase the size of the icon
                ),
                onPressed: () {
                  // Handle cart icon press
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Container _searchField() {
  return Container(
    margin: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      border: Border.all(
        color: Colors.grey, // Add border color if needed
        width: 1.0, // Add border width if needed
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none, // Remove TextField border
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Implement search functionality here
          },
        ),
      ],
    ),
  );
}
