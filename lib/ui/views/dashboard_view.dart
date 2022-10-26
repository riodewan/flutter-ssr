import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_iot/constants/route_name.dart';
import 'package:flutter_with_iot/ui/shared/ui_helper.dart';
import 'package:flutter_with_iot/viewmodels/dashboard_view_model.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        //onModelReady: (model) => model.initState(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Publish & Subscribe RMQ'
            ),
          ),
          body: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  verticalSpaceLarge,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: InkWell(
                          onTap: (){
                            model.navigationToVoid(publishRmqViewRoute);
                          },
                          child: const Center(
                            child: Text(
                              'PUBLISH',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: InkWell(
                          onTap: (){
                            model.navigationToVoid(subscribeRmqViewRoute);
                          },
                          child: const Center(
                            child: Text(
                              'SUBSCRIBE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
