import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:lulomart_mobile/main_page.dart';

class AboutPage extends StatefulWidget {
  AboutPageLayout createState() => AboutPageLayout();
}

class AboutPageLayout extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

   return Container(
     child: Container(
       height: 500,
       child: Center(
         child: Column(
           children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/images/loginicon.jpeg', scale: 4,),
                      Text("© Techno's Studio", style: TextStyle(fontSize: 20)),
                      SizedBox(height: 20,),
                      Text("Contact info", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8,),
                      Text("Jln. Supu Yusuf No.9 Kota Kendari", style: TextStyle(fontSize: 12)),
                      Text("technos.studio@gmail.com", style: TextStyle(fontSize: 12)),
                      Text("0811-4091-027", style: TextStyle(fontSize: 12)),
                      SizedBox(height: 15,),
                      Text("Copyright © 2019 by Techno's Studio All rights reserved. No part of this publication may be reproduced, distributed, or transmitted in any form or by any means, including photocopying, recording, or other electronic or mechanical methods, without the prior written permission of the publisher, except in the case of brief quotations embodied in critical reviews and certain other noncommercial uses permitted by copyright law. For permission requests, write to the publisher, addressed “Attention: Permissions Coordinator,” at the address below.", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
           ],
         ),
       ),
     ),
   );
  }
}