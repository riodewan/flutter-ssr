import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_iot/ui/shared/ui_helper.dart';
import 'package:flutter_with_iot/ui/widgets/field_data_widget.dart';
import 'package:flutter_with_iot/viewmodels/subscribe_rmq_view_model.dart';
import 'package:stacked/stacked.dart';

class SubscribeRmqView extends StatefulWidget {
  const SubscribeRmqView({Key key}) : super(key: key);

  @override
  _SubscribeRmqViewState createState() => _SubscribeRmqViewState();
}

class _SubscribeRmqViewState extends State<SubscribeRmqView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubscribeRmqViewModel>.reactive(
        viewModelBuilder: () => SubscribeRmqViewModel(),
        onModelReady: (model) => model.initState(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Subscribe data from RMQ'
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 15, left: 10, right: 10),
                    child: Text('Data Sensor Soil'),
                  ),
                  FieldDataWidget(
                      controller: model.serialSoilController,
                      label: 'Serial Number Sensor Soil',
                      hint: 'Serial Number Sensor Soil'
                  ),
                  FieldDataWidget(
                      controller: model.valueSoilController,
                      label: 'Nilai Sensor Soil',
                      hint: 'Nilai Sensor Soil'
                  ),
                  FieldDataWidget(
                      controller: model.statusSoilController,
                      label: 'Keadaan Tanah',
                      hint: 'Keadaan Tanah'
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 15, left: 10, right: 10),
                    child: Text('Data Pompa'),
                  ),
                  FieldDataWidget(
                      controller: model.serialPompController,
                      label: 'Serial Number Pompa',
                      hint: 'Serial Number Pompa'
                  ),
                  FieldDataWidget(
                      controller: model.statusPompController,
                      label: 'Keadaan Pompa',
                      hint: 'Keadaan Pompa'
                  ),
                ],
              ),
            )
          ),
        )
    );
  }
}
