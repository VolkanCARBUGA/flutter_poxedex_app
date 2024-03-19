import 'package:flutter/material.dart';
import 'package:flutter_poxedex_app/consts/app_consts.dart';
import 'package:flutter_poxedex_app/consts/ui_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTitle extends StatefulWidget {
  const AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: UIHelper.getAppTitleWidgetHeight(),
    
      child: Center(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
             Consts.title,
              style: Consts.getTitleStyle(),
              textAlign: TextAlign.center,
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
            child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  Consts.imageUrl,
                  width: ScreenUtil().orientation == Orientation.portrait?0.15.sh:0.15.sw,
                  fit: BoxFit.fitWidth,
                
                )),
          )
        ]),
      ),
    );
  }
}
