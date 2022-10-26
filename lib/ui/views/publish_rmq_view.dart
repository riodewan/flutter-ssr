import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_iot/ui/shared/ui_helper.dart';
import 'package:flutter_with_iot/ui/widgets/text_field_widget.dart';
import 'package:flutter_with_iot/viewmodels/publish_rmq_view_model.dart';
import 'package:stacked/stacked.dart';

class PublishRmqView extends StatefulWidget {
  const PublishRmqView({Key key}) : super(key: key);

  @override
  _PublishRmqViewState createState() => _PublishRmqViewState();
}

class _PublishRmqViewState extends State<PublishRmqView> {
  bool index = false;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PublishViewModel>.reactive(
        viewModelBuilder: () => PublishViewModel(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Publish data to RMQ'
            ),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                verticalSpaceMedium,
                TextFieldWidget(
                    controller: model.guidController,
                    label: 'GUID'
                ),
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    splashColor: Colors.white,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.decelerate,
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          color: index ? Colors.black : Colors.lightBlueAccent
                        ),
                        color: index ? Colors.lightBlueAccent :Colors.white
                      ),
                      child: AnimatedAlign(
                        duration: const Duration(milliseconds: 300),
                        alignment: index ? Alignment.centerRight : Alignment.centerLeft,
                        curve: Curves.decelerate,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: index ? Colors.white : Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(100)
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      setState(() {
                        index =! index;
                        model.controlLamp(index);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
