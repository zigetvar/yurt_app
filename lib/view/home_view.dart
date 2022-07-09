import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:yurt_app/component/background_color_gradient.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yurt_app/customIcon/my_flutter_app_icons.dart';
import 'package:yurt_app/view/activity_view.dart';
import 'package:yurt_app/view/announcement_view.dart';
import 'package:yurt_app/view/complaint_view.dart';
import 'package:yurt_app/view/food_list_view.dart';
import 'package:yurt_app/view/points_view.dart';
import 'package:yurt_app/view/repair_support_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: background_color_gradient(),
        ),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 45,
                        color: Color.fromARGB(255, 255, 153, 0),
                      )),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 31, right: 20),
              child: Container(
                height: 170,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(31)),
                    image: DecorationImage(
                        image: AssetImage("assets/image/kyk.png"))),
              ),
            ),
            Flexible(
              child: GridView.count(
                padding: EdgeInsets.only(top: 80, right: 55, left: 30),
                mainAxisSpacing: 35,
                crossAxisSpacing: 35,
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                children: [
                  GridviewContainer(
                    category_name: "Duyurular",
                    icon: MyFlutterApp.megaphone,
                    page: AnnouncementView(),
                  ),
                  GridviewContainer(
                    category_name: "Yemek Listesi",
                    icon: MyFlutterApp.food,
                    page: FoodListView(),
                  ),
                  GridviewContainer(
                    category_name: "Şikayet",
                    icon: MyFlutterApp.attach,
                    page: ComplaintView(),
                  ),
                  GridviewContainer(
                    category_name: "Oda Teknik Destek",
                    icon: MyFlutterApp.hammer,
                    page: RepairSupportView(),
                  ),
                  GridviewContainer(
                    category_name: "Etkinlikler",
                    icon: MyFlutterApp.local_activity,
                    page: ActivityView(),
                  ),
                  GridviewContainer(
                    category_name: "Puanla",
                    icon: MyFlutterApp.star,
                    page: PointsView(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [ Color.fromARGB(255, 2, 53, 206),Color.fromARGB(255, 18, 17, 102), Colors.orange,Color.fromARGB(255, 22, 46, 118),],
                  center: Alignment(0.6, -0.3),
                  focal: Alignment(0.3, -0.1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 180,top: 50),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purple,
                      
                    ),
                    Text("Hasan ÖZ",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                MyFlutterApp.info,
              ),
              title: Text("Bilgilerim"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                
              },
            ),
            ListTile(
                leading: Icon(MyFlutterApp.settings),
                title: Text("Ayarlar"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  
                }),
            ListTile(
                leading: Icon(Icons.people),
                title: Text("Hakkımızda"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  
                }),
            ListTile(
                leading: Icon(MyFlutterApp.security),
                title: Text(
                  "Gizlilik Politikası",
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  
                }),
            ListTile(
                leading: Icon(MyFlutterApp.logout),
                title: Text("Çıkış Yap"),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  
                }),
            
            AboutListTile(
              applicationName: " LİSANS",
              applicationIcon: Icon(Icons.save),
              applicationVersion: "3.8",
              child: Text("UYGULAMA HAKKINDA"),
              icon: Icon(Icons.save),
              applicationLegalese: null,
            )
            
          ],
        ),
      ),
    
    );
  }
}

class GridviewContainer extends StatelessWidget {
  String category_name;
  IconData icon;
  dynamic page;

  GridviewContainer(
      {Key? key,
      required this.category_name,
      required this.icon,
      required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(page);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(35))),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 55),
              child: Icon(
                icon,
                color: Colors.orange,
                size: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Center(
                  child: Text(
                category_name,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
