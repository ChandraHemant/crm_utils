import 'package:flutter/material.dart';
import 'package:crm_utils/crm_utils.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  final CRMSelectBoxController _select1 = CRMSelectBoxController(options: [
    const CRMSelectBoxOption(value: 1, text: Text('1')),
    const CRMSelectBoxOption(value: 2, text: Text('2')),
    const CRMSelectBoxOption(value: 3, text: Text('3')),
  ]);

  final CRMSelectBoxController _select2 = CRMSelectBoxController(options: [
    const CRMSelectBoxOption(value: 1, text: Text('1')),
    const CRMSelectBoxOption(value: 2, text: Text('2')),
    const CRMSelectBoxOption(value: 3, text: Text('3')),
  ]);

  final CRMSelectBoxController _select3 = CRMSelectBoxController(multiple: true);

  final CRMSelectBoxController _select4 = CRMSelectBoxController();
  final CRMSelectBoxController _select5 = CRMSelectBoxController();

  final CRMSelectBoxController _select6 = CRMSelectBoxController(multiple: true, options: [
    const CRMSelectBoxOption(value: 1, text: Text('1')),
    const CRMSelectBoxOption(value: 2, text: Text('2')),
    const CRMSelectBoxOption(value: 3, text: Text('3')),
    const CRMSelectBoxOption(value: 4, text: Text('4')),
    const CRMSelectBoxOption(value: 5, text: Text('5')),
    const CRMSelectBoxOption(value: 6, text: Text('6')),
  ]);

  @override
  void initState() {
    super.initState();
  }

  Future<CRMSelectBoxResponse> selectApi(Map<String, String> params) async {
    Uri url = Uri.http('localhost', 'api-json.php', params);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      List json = convert.jsonDecode(response.body);
      return CRMSelectBoxResponse.createFromJson(json);
    }

    return const CRMSelectBoxResponse(options: []);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          CRMSelectBoxOverlay.removeAll();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Select Box'),
          ),
          body: Scrollbar(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formState,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: CRMSelectBox(
                          hintText: 'Select One',
                          controller: _select1,
                          validators: [
                            CRMSelectValidators.required
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: CRMSelectBox(
                          padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                          hintTextLabel: 'Select One',
                          controller: _select2,
                          searchable: true,
                          dialogStyle: CRMDialogBoxStyle(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          style: CRMSelectBoxStyle(
                            backgroundColor: Colors.blueAccent,
                            hintTextColor: Colors.white,
                            selectedColor: const Color(0xff3872d1),
                            selectedTextColor: Colors.white,
                            textColor: Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                            focusedTextColor: const Color(0xff3367bd),
                          ),
                          paddingDialog: const EdgeInsets.all(15),
                          marginDialog: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: CRMSelectBox(
                          padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                          hintTextLabel: 'Select One',
                          controller: _select2,
                          searchable: true,
                          style: CRMSelectBoxStyle(
                            backgroundColor: Colors.lightGreen,
                            hintTextColor: Colors.white,
                            selectedColor: const Color(0xff608733),
                            selectedTextColor: Colors.white,
                            textColor: Colors.white,
                            focusedTextColor: const Color(0xff608733),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          dialogStyle: CRMDialogBoxStyle(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          paddingDialog: const EdgeInsets.all(15),
                          marginDialog: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: CRMSelectBox(
                          hintText: 'Pilih multiple',
                          controller: _select3,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: CRMSelectBox(
                          searchable: true,
                          disabled: true,
                          hintText: 'Select One',
                          controller: _select5,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: CRMSelectBox(
                          hintText: 'Select One',
                          searchable: true,
                          controller: _select4,
                          serverSide: selectApi,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: CRMButton(
                          label: const Text('Validate'),
                          prefixIcon: Icons.open_in_new,
                          style: CRMButtonStyle.primary,
                          onPressed: () {
                            _formState.currentState!.validate();
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: CRMButton(
                          label: const Text('Set Selected Multiple'),
                          prefixIcon: Icons.open_in_new,
                          style: CRMButtonStyle.primary,
                          onPressed: () {
                            _select3.setSelected(const CRMSelectBoxOption(value: '1', text: Text('Test')));

                            setState(() {
                            });
                          },
                        ),
                      ),
                      CRMButton(
                        label: const Text('Open Modal'),
                        prefixIcon: Icons.open_in_new,
                        style: CRMButtonStyle.primary,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => CRMModal(
                              context: context,
                              dialog: CRMModalDialog(
                                child: CRMModalContent(
                                  children: [
                                    const CRMModalContainer(title: Text('Modal Select Box'), closeButton: true),
                                    CRMModalContainer(child: Column(
                                      children: [
                                        CRMCol(
                                          sizes: const ColScreen(sm: Col.col_2),
                                          child: CRMSelectBox(
                                            hintText: 'Select One',
                                            searchable: true,
                                            controller: _select6,
                                            autoClose: false,
                                            alwaysUpdate: false,
                                            serverSide: selectApi,
                                          ),
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: CRMSelectBox(
                          margin: const EdgeInsets.only(top: 200.0),
                          hintText: 'Select One',
                          controller: _select1,
                          validators: [
                            CRMSelectValidators.required
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
