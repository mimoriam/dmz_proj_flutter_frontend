import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:
import 'package:dmz_proj_flutter_frontend/services/fetch_service.dart';

/// State:

/// Utils/Helpers:
import '../../utils/responsive_helper.dart';
import 'package:dmz_proj_flutter_frontend/constants/constants.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Entry Point:
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ResponsiveHelper(
            mobile: Container(),
            tablet: Container(),
            desktop: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Builder(
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'search_query',
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                            ]),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: "Search",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              labelStyle: const TextStyle(),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                            child: const Text("Submit"),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              _formKey.currentState?.save();
                              if (_formKey.currentState!.validate()) {
                                print(kBackendSearchURL + '${_formKey.currentState?.fields['search_query']?.value}');
                                FetchService(
                                        uri: kBackendSearchURL +
                                            '${_formKey.currentState?.fields['search_query']?.value}')
                                    .getSearchedStudent();
                              } else {
                                print("validation failed");
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
      ),
    );
  }
}
