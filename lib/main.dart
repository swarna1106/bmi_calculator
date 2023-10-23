import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => homePageSet();
}
class homePageSet extends State<MyHomePage>{
  var wtcontroller=TextEditingController();
  var ftcontroller=TextEditingController();
  var ichcontroller=TextEditingController();
  var bmiScore=0.0;
  var bmiType="";
  var bgColor=Colors.white;
  var imgType=" ";
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: bgColor,
    appBar: AppBar(
      title: Center(child: Text("BMI Calculator",style: TextStyle(color: Colors.white,fontSize: 18),)),
    ),
    body: SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SizedBox(
             height: 35,
           ), Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller:wtcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    label: Text("Enter your weight(kg)"),
                  ),
                  keyboardType: TextInputType.number,
                ),
          ),
          SizedBox(
            height: 5,
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
                controller:ftcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    label: Text("Enter your height(ft)")
                ),
              ),
           ),
          SizedBox(
            height: 5,
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
                controller:ichcontroller,
                  keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    label: Text("Enter your height(inches)")
                ),
              ),
        ),
          SizedBox(
            height:5 ,
          ),
          ElevatedButton(onPressed: (){
         calculateBmi();
          },
              child: Text("Calculate",style: TextStyle(color: Colors.white),)),
          SizedBox(
            height: 10,
          ) ,
         imgType!=0 ? Image.asset(imgType):Container(),
           bmiScore==0.0 ? Container() :Text("Your BMI is ${bmiScore.toStringAsFixed(2)}",style: TextStyle(fontSize: 24),),
          bmiType==""? Container():Text("You are $bmiType")
        ],
      ),
    ),
  );
  }
  void calculateBmi(){
    var wt=wtcontroller.text.toString();
    var htFt=ftcontroller.text.toString();
    var htIch=ichcontroller.text.toString();
    var iWt=int.parse(wt);
    var iFt=int.parse(htFt);
    var iIch=int.parse(htIch);
    var tInch=(iFt*12)+iIch;
    var tCm=tInch*2.54;
    var tMt=tCm/100;
    var bmi=iWt/(tMt*tMt);
    if(bmi>25){
      bmiType="Over weight";
      bgColor=Colors.orange.shade100;
      imgType="assets/images/ic_fat.png";
    }
    else if(bmi>18){
      bmiType="Under weight";
      bgColor=Colors.red.shade100;
      imgType="assets/images/ic_thin.png";
    }
    else{
      bmiType="Healthy";
      bgColor=Colors.green.shade200;
      imgType="assets/images/ic_healthy.png";
    }
    bmiScore=bmi;
    wtcontroller.text="";
    ftcontroller.text="";
    ichcontroller.text="";
    setState(() {
      print(bmi);
    });
  }
}
