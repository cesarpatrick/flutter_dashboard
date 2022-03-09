import 'dart:convert';

import 'package:admin/models/Template.dart';
import 'package:admin/models/json_to_form/JsonToForm.dart';
import 'package:admin/service/template_service.dart';
import 'package:flutter/material.dart';

class AServiceForm extends StatefulWidget {
  final ValueChanged<dynamic>? onChanged;

  const AServiceForm({Key? key, this.onChanged}) : super(key: key);

  @override
  _AServiceFormState createState() => _AServiceFormState();
}

class _AServiceFormState extends State<AServiceForm> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  TemplateService templateService = TemplateService();

  Template formHeader = Template(name: "", questions: []);
  Template formCab = Template(name: "", questions: []);
  Template formLighting = Template(name: "", questions: []);
  Template formEngine = Template(name: "", questions: []);
  Template formCoolant = Template(name: "", questions: []);
  Template formES = Template(name: "", questions: []);
  Template formTransmission = Template(name: "", questions: []);
  Template formSuspension = Template(name: "", questions: []);
  Template formCompactor = Template(name: "", questions: []);
  Template formBrakeSystem = Template(name: "", questions: []);

  dynamic response;

  void _handleChanged() {
    widget.onChanged!(true);
  }

  @override
  void initState() {
    super.initState();

    templateService.getTemplateById(24).then((result) {
      setState(() {
        formHeader = result;
      });
    });

    templateService.getTemplateById(25).then((result) {
      setState(() {
        formCab = result;
      });
    });

    templateService.getTemplateById(35).then((result) {
      setState(() {
        formLighting = result;
      });
    });

    templateService.getTemplateById(27).then((result) {
      setState(() {
        formEngine = result;
      });
    });

    templateService.getTemplateById(28).then((result) {
      setState(() {
        formCoolant = result;
      });
    });

    templateService.getTemplateById(29).then((result) {
      setState(() {
        formES = result;
      });
    });

    templateService.getTemplateById(30).then((result) {
      setState(() {
        formTransmission = result;
      });
    });

    templateService.getTemplateById(31).then((result) {
      setState(() {
        formSuspension = result;
      });
    });

    templateService.getTemplateById(32).then((result) {
      setState(() {
        formCompactor = result;
      });
    });

    templateService.getTemplateById(33).then((result) {
      setState(() {
        formBrakeSystem = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(bodyColor: Colors.black, displayColor: Colors.black);

    print(formHeader.toJson());

    return Container(
        color: Colors.white,
        child: Theme(
            data: ThemeData(
              textTheme: textTheme,
              primarySwatch: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      ' A Service Form',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )),
                Stepper(
                  type: stepperType,
                  physics: ClampingScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      title: new Text('Header'),
                      content: Column(
                        children: <Widget>[
                          Center(
                              child: JsonToForm(
                            form: jsonEncode(formHeader),
                            onChanged: (dynamic response) {
                              // setState(() {
                              //   this.response = response;
                              // });
                            },
                            actionSave: (data) {
                              print(data);
                            },
                            // buttonSave: Container(
                            //   height: 40.0,
                            //   color: Colors.blueAccent,
                            //   child: const Center(
                            //     child: Text("Submit",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold)),
                            //   ),
                            // ),
                          ))
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Cab'),
                      content: Column(
                        children: <Widget>[
                          Center(
                              child: JsonToForm(
                            form: jsonEncode(formCab),
                            onChanged: (dynamic response) {
                              // setState(() {
                              //   this.response = response;
                              // });
                            },
                            actionSave: (data) {
                              print(data);
                            },
                            // buttonSave: Container(
                            //   height: 40.0,
                            //   color: Colors.blueAccent,
                            //   child: const Center(
                            //     child: Text("Submit",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold)),
                            //   ),
                            // ),
                          ))
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Lighting'),
                      content: Column(
                        children: <Widget>[
                          Center(
                              child: JsonToForm(
                            form: jsonEncode(formLighting),
                            onChanged: (dynamic response) {
                              // setState(() {
                              //   this.response = response;
                              // });
                            },
                            actionSave: (data) {
                              print(data);
                            },
                            // buttonSave: Container(
                            //   height: 40.0,
                            //   color: Colors.blueAccent,
                            //   child: const Center(
                            //     child: Text("Submit",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold)),
                            //   ),
                            // ),
                          ))
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Engine'),
                      content: Column(
                        children: <Widget>[
                          Center(
                              child: JsonToForm(
                            form: jsonEncode(formEngine),
                            onChanged: (dynamic response) {
                              // setState(() {
                              //   this.response = response;
                              // });
                            },
                            actionSave: (data) {
                              print(data);
                            },
                            // buttonSave: Container(
                            //   height: 40.0,
                            //   color: Colors.blueAccent,
                            //   child: const Center(
                            //     child: Text("Submit",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold)),
                            //   ),
                            // ),
                          ))
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 3
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Coolant'),
                      content: Column(
                        children: <Widget>[
                          Center(
                              child: JsonToForm(
                            form: jsonEncode(formCoolant),
                            onChanged: (dynamic response) {
                              // setState(() {
                              //   this.response = response;
                              // });
                            },
                            actionSave: (data) {
                              print(data);
                            },
                            // buttonSave: Container(
                            //   height: 40.0,
                            //   color: Colors.blueAccent,
                            //   child: const Center(
                            //     child: Text("Submit",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold)),
                            //   ),
                            // ),
                          ))
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 4
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Exhaust System'),
                      content: Column(
                        children: <Widget>[
                          Center(
                              child: JsonToForm(
                            form: jsonEncode(formES),
                            onChanged: (dynamic response) {
                              // setState(() {
                              //   this.response = response;
                              // });
                            },
                            actionSave: (data) {
                              print(data);
                            },
                            // buttonSave: Container(
                            //   height: 40.0,
                            //   color: Colors.blueAccent,
                            //   child: const Center(
                            //     child: Text("Submit",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold)),
                            //   ),
                            // ),
                          ))
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 5
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Transmission'),
                      content: Column(
                        children: <Widget>[
                          Center(
                              child: JsonToForm(
                            form: jsonEncode(formTransmission),
                            onChanged: (dynamic response) {
                              // setState(() {
                              //   this.response = response;
                              // });
                            },
                            actionSave: (data) {
                              print(data);
                            },
                            // buttonSave: Container(
                            //   height: 40.0,
                            //   color: Colors.blueAccent,
                            //   child: const Center(
                            //     child: Text("Submit",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold)),
                            //   ),
                            // ),
                          ))
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 6
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Suspension'),
                      content: Column(
                        children: <Widget>[
                          Center(
                              child: JsonToForm(
                            form: jsonEncode(formSuspension),
                            onChanged: (dynamic response) {
                              // setState(() {
                              //   this.response = response;
                              // });
                            },
                            actionSave: (data) {
                              print(data);
                            },
                            // buttonSave: Container(
                            //   height: 40.0,
                            //   color: Colors.blueAccent,
                            //   child: const Center(
                            //     child: Text("Submit",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold)),
                            //   ),
                            // ),
                          ))
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 7
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Compactor/Tail Lift'),
                      content: Column(
                        children: <Widget>[
                          Center(
                              child: JsonToForm(
                            form: jsonEncode(formCompactor),
                            onChanged: (dynamic response) {
                              // setState(() {
                              //   this.response = response;
                              // });
                            },
                            actionSave: (data) {
                              print(data);
                            },
                            // buttonSave: Container(
                            //   height: 40.0,
                            //   color: Colors.blueAccent,
                            //   child: const Center(
                            //     child: Text("Submit",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold)),
                            //   ),
                            // ),
                          ))
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 8
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Brake System'),
                      content: Column(
                        children: <Widget>[
                          Center(
                              child: JsonToForm(
                            form: jsonEncode(formBrakeSystem),
                            onChanged: (dynamic response) {
                              // setState(() {
                              //   this.response = response;
                              // });
                            },
                            actionSave: (data) {
                              print(data);
                            },
                            // buttonSave: Container(
                            //   height: 40.0,
                            //   color: Colors.blueAccent,
                            //   child: const Center(
                            //     child: Text("Submit",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontWeight: FontWeight.bold)),
                            //   ),
                            // ),
                          ))
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 9
                          ? StepState.complete
                          : StepState.disabled,
                    ),
                  ],
                ),
              ],
            )));
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 9 ? setState(() => _currentStep += 1) : null;
    _handleChanged();
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
    _handleChanged();
  }
}
