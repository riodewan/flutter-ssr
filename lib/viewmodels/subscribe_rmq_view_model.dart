import 'package:flutter/cupertino.dart';
import 'package:flutter_with_iot/locator.dart';
import 'package:flutter_with_iot/services/rmq_service.dart';
import 'package:flutter_with_iot/viewmodels/base_model.dart';

class SubscribeRmqViewModel extends BaseModel{
  final RmqService _rmqService = locator<RmqService>();

  TextEditingController valueSoilController = TextEditingController();
  TextEditingController serialSoilController = TextEditingController();
  TextEditingController statusSoilController = TextEditingController();
  TextEditingController serialPompController = TextEditingController();
  TextEditingController statusPompController = TextEditingController();

  bool checkStatus = false;

  String pompSerial;
  String pompValue;
  String sensorSerial;
  String sensorValue;
  String sensorStatus;

  //Fungsi untuk mengatur format data dan split message yang diterima
  void setValuePump(String message){
    List<String> list = message.split('#');
    int checkValuePump = int.parse(list[1]);
    setBusy(true);
    pompSerial = list[0];
    if (checkValuePump == 1) {
      pompValue = 'On';
    }else if( checkValuePump == 0){
      pompValue = 'Off';
    }
    serialPompController.text = list[0];
    statusPompController.text = pompValue;
    setBusy(false);
  }

  //Fungsi untuk mengatur format data dan split message yang diterima
  void setValueSensor(String message){
    List<String> list = message.split('#');
    int checkValueSensor = int.parse(list[1]);
    setBusy(true);
    sensorValue = list[1];
    sensorSerial = list[0];
    if (checkValueSensor < 350) {
      sensorStatus = 'Lembab';
    } else if(checkValueSensor >700) {
      sensorStatus = 'Kering';
    } else if(checkValueSensor >= 350 && checkValueSensor <= 700){
      sensorStatus = 'Normal';
    }
    valueSoilController.text = list[1];
    serialSoilController.text = list[0];
    statusSoilController.text = sensorStatus;
    setBusy(false);
  }

  //Fungsi untuk mengatur data dan topic dari message yang akan diterima
  void sensor(){
    _rmqService.dataDevice('Log', setValueSensor);
  }

  //Fungsi untuk mengatur data dan topic dari message yang akan diterima
  void actuator(){
    _rmqService.dataDevice('Aktuator', setValuePump);
  }

  //Fungsi untuk menerima message dari RMQ
  void subscribeData(){
    _rmqService.subscribe(sensor, actuator, checkStatus);
  }

  //Fungsi yang dijalanlkan saat pertama kali page/halaman dibuka
  void initState(){
    setBusy(true);
    subscribeData();
    setBusy(false);
  }
}
