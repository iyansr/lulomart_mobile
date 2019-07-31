import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lulomart_mobile/view/view_jurnal.dart';
import 'package:lulomart_mobile/view/view_login.dart';
import 'package:lulomart_mobile/view/view_profile.dart';
import 'package:lulomart_mobile/view/view_splash_logout.dart';
import 'package:lulomart_mobile/view/view_store.dart';
// import 'package:lulomart_mobile/view/view_profile.dart';
import 'package:lulomart_mobile/view/view_about.dart';
import 'package:lulomart_mobile/widget/widget_aboutpage.dart';
import 'package:lulomart_mobile/widget/widget_historylist.dart';
import 'package:lulomart_mobile/widget/widget_right_jurnal.dart';
import 'package:lulomart_mobile/widget/widget_profilepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageLayout createState() => MainPageLayout();
}

class MainPageLayout extends State<MainPage> {
  String image = "";
  read() async {
    final prefs = await SharedPreferences.getInstance();
    var key = 'image';
    final image = prefs.get(key) ?? "jgfjhg";

    setState(() {
      this.image = image;
    });
    debugPrint('read : $image');
  }
  @override
  void initState() {
    read();
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    mainPage = StorePage(
      onListItemTap: (Item item) {
        debugPrint("StorePage : " + item.productPicture);
        rightDrawer.addReceip(new Receipt(
          name: item.productName,
          qty: item.productPrice,
          price: item.productPrice,
        ));
      },
    );
    rightDrawer = RightDrawerStorePage();
    flexCountNav = 3;
    flexCountDrawer = 9;
    profileSelColor = Color(0xfff96f5d);
    storeSelColor = Colors.white;
    hisSelColor = Color(0xfff96f5d);
    jurSelColor = Color(0xfff96f5d);
    abtSelColor = Color(0xfff96f5d);
  }

  var mainPage;
  var profileSelColor;
  var storeSelColor;
  var hisSelColor;
  var jurSelColor;
  var abtSelColor;
  var rightDrawer;
  var flexCountNav;
  var flexCountDrawer;
  var images = ProfilePageLayout().image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: flexCountNav,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfff84c35),
                      Color(0xfff96f5d),
                    ],
                    stops: [0, 1],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      //PROFILE BUTTON
                      RawMaterialButton(
                        onPressed: () {
                          print('$images');
                          setState(() {
                            mainPage = ProfilePage();
                            rightDrawer = RightDrawerProfilePage();
                            profileSelColor = Colors.white;
                            storeSelColor = Color(0xfff96f5d);
                            hisSelColor = Color(0xfff96f5d);
                            jurSelColor = Color(0xfff96f5d);
                            abtSelColor = Color(0xfff96f5d);
                            flexCountNav = 5;
                            flexCountDrawer = 25;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage("http://todolist.madukubah.com/uploads/users_photo/" +
                          image),
                            ),
                          ),
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: profileSelColor,
                        padding: const EdgeInsets.all(1.0),
                      ),

                      //STORE BUTTON
                      SizedBox(height: 25.0),
                      RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            mainPage = new StorePage(
                              onListItemTap: (Item item) {
                                debugPrint("item list : " + item.productName);
                                rightDrawer.addReceip(
                                  new Receipt(
                                    name: item.productName,
                                    qty: item.productPrice,
                                    price: item.productPrice,
                                  ),
                                );
                              },
                            );
                            rightDrawer = RightDrawerStorePage();
                            profileSelColor = Color(0xfff96f5d);
                            storeSelColor = Colors.white;
                            hisSelColor = Color(0xfff96f5d);
                            jurSelColor = Color(0xfff96f5d);
                            abtSelColor = Color(0xfff96f5d);
                            flexCountNav = 3;
                            flexCountDrawer = 9;
                          });
                        },
                        child: Icon(
                          Icons.shopping_cart,
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: storeSelColor,
                        padding: const EdgeInsets.all(10.0),
                      ),

                      //HISTORY BUTTON
                      SizedBox(height: 5.0),
                      RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            mainPage = HistoryList(
                              onListItemTapHistory: (ItemHistory item) {
                                debugPrint("StorePage : " + item.transaksiDate);
                                rightDrawer.addReceip(new ReceiptHistory(
                                  name: item.transaksiTotalprice,
                                  qty: item.transaksiTotalprice,
                                  price: item.transaksiTotalprice,
                                ));
                              },
                            );
                            rightDrawer = RightDrawerHistoryPage();
                            profileSelColor = Color(0xfff96f5d);
                            storeSelColor = Color(0xfff96f5d);
                            hisSelColor = Colors.white;
                            jurSelColor = Color(0xfff96f5d);
                            abtSelColor = Color(0xfff96f5d);
                            flexCountNav = 3;
                            flexCountDrawer = 9;
                          });
                        },
                        child: Icon(
                          Icons.local_offer,
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: hisSelColor,
                        padding: const EdgeInsets.all(10.0),
                      ),

                      //JOURNAL BUTTON
                      SizedBox(height: 5.0),
                      RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            mainPage = JurnalPage();
                            rightDrawer = RightDrawerJurnal();
                            profileSelColor = Color(0xfff96f5d);
                            storeSelColor = Color(0xfff96f5d);
                            hisSelColor = Color(0xfff96f5d);
                            jurSelColor = Colors.white;
                            abtSelColor = Color(0xfff96f5d);
                            flexCountNav = 3;
                            flexCountDrawer = 9;
                          });
                        },
                        child: Icon(
                          Icons.book,
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: jurSelColor,
                        padding: const EdgeInsets.all(10.0),
                      ),

                      //ABOUT BUTTON
                      SizedBox(height: 5.0),
                      RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            mainPage = AboutPage();
                            rightDrawer = RightDrawerAboutPage();
                            profileSelColor = Color(0xfff96f5d);
                            storeSelColor = Color(0xfff96f5d);
                            hisSelColor = Color(0xfff96f5d);
                            jurSelColor = Color(0xfff96f5d);
                            abtSelColor = Colors.white;
                            flexCountNav = 3;
                            flexCountDrawer = 9;
                          });
                        },
                        child: Icon(
                          Icons.person_pin,
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: abtSelColor,
                        padding: const EdgeInsets.all(10.0),
                      ),

                      //LOGOUT BUTTON
                      SizedBox(height: 90.0),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: RawMaterialButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text("Logout"),
                                  content: new Text("Anda Ingin Logout ?"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: new Text("Iya"),
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        SplashScreenLogout()));
                                      },
                                    ),
                                    FlatButton(
                                      child: new Text("Tidak"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Icon(
                            Icons.exit_to_app,
                          ),
                          shape: CircleBorder(),
                          elevation: 2.0,
                          fillColor: Color(0xfff96f5d),
                          padding: const EdgeInsets.all(10.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: mainPage,
            ),
            Expanded(
              flex: flexCountDrawer,
              child: rightDrawer,
            ),
          ],
        ),
      ),
    );
  }
}
