import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'others/helper.dart';
import 'others/outline_button.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {

  Future<void> _checkConnectivity()async{
    await Helper().checkConnectivity().then((connected){
      if(connected) {
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) =>
        const HomePage()), (route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async{
        return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Do you want to exit?'),
            actions:[
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child:const Text('Yes',style: TextStyle(color: Colors.red)),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No',style: TextStyle(color: Colors.green)),
              )
            ],
          ),
        )) ?? false;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: size.width*.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.wifi_exclamationmark,
                color: Colors.grey,
                size: size.width*.4,
              ),
              Text(
                'No Internet Connection \u{1F61F}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600,
                    fontSize:size.width*.06),
              ),
              SizedBox(height: size.width*.04),
              Text(
                'Connect your device with wifi or cellular data',
                textAlign: TextAlign.center,
                style:  TextStyle(color: Colors.grey.shade400,fontSize: size.width*.045),
              ),
              SizedBox(height: size.width*.05),

              CustomOutlineButton(
                  onPressed: ()async => await _checkConnectivity(),
                  height: size.width*.09,
                  width: size.width*.35,
                  borderColor: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh_sharp,color: Colors.green,size: size.width*.06),
                      SizedBox(width: size.width*.025),
                      Text(
                        'Refresh',
                        style: TextStyle(color: Colors.green,fontSize: size.width*.04),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
