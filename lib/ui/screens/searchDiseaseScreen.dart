import 'package:flutter/material.dart';
import 'package:medicare/ui/components/commonDiseaseListComponent.dart';
import 'package:medicare/ui/model/diseaseData.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class SearchDiseaseScreen extends StatefulWidget {
  static String tag = '/SearchDiseaseScreen';

  @override
  SearchDiseaseScreenState createState() => SearchDiseaseScreenState();
}

class SearchDiseaseScreenState extends State<SearchDiseaseScreen> {
  TextEditingController searchController = TextEditingController();
  late final Autocomplete textField;
  List<DiseaseData> data = diseaseDataList();
  List<String?> choice = [
    'Covid-19',
    'Fever',
    'Black Eye',
    'Headache',
    'Stomachache',
    'Covid-19',
    'Fever',
    'Black Eye',
    'Headache',
    'Stomachache'
  ];
  bool? selectedIndex = false;
  int? _value = 1;

  static String _displayStringForOption(DiseaseData option) =>
      option.title.validate();

  @override
  void initState() {
    super.initState();
    textField = Autocomplete<DiseaseData>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<DiseaseData>.empty();
        }
        return data.where(
          (DiseaseData title) {
            return title.toString().contains('');
          },
        );
      },
      onSelected: (DiseaseData title) {
        print('You just selected');
      },
    );
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  backToPreviousIcon(context, white),
                  8.width,
                  Text('Search', style: boldTextStyle(size: 20, color: white))
                      .expand(),
                ],
              ).paddingAll(16.0),
              16.height,
              Container(
                padding: EdgeInsets.all(16.0),
                width: context.width(),
                decoration: boxDecorationWithRoundedCorners(
                    borderRadius: radiusOnly(topRight: 32)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.search, color: colorBlue, size: 24)
                            .expand(flex: 1),
                        8.width,
                        textField.expand(flex: 13),
                        Icon(Icons.mic, color: Colors.grey, size: 24)
                            .expand(flex: 1),
                      ],
                    ),
                    32.height,
                    Text('Popular search', style: boldTextStyle()),
                    16.height,
                    Wrap(
                      spacing: 8.0,
                      children: List.generate(choice.length, (index) {
                        return ChoiceChip(
                          labelStyle: boldTextStyle(
                              color: Colors.blue.shade900, size: 14),
                          backgroundColor: colorGreyShade,
                          selectedColor: Colors.blue,
                          label: Text(choice[index].validate())
                              .paddingOnly(right: 8.0, left: 8.0),
                          selected: _value == index,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? index : null;
                            });
                          },
                        );
                      }),
                    ),
                    16.height,
                    Divider(thickness: 0.5),
                    16.height,
                    Text('Common Disease', style: boldTextStyle()),
                    16.height,
                    CommonDiseaseListComponent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
