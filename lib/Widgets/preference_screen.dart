import 'package:demo_app/Utility/constant.dart';
import 'package:demo_app/Widgets/range_slider_theme.dart';
import 'package:demo_app/Widgets/slider_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreferenceBottomSheet extends StatefulWidget {
  const PreferenceBottomSheet({super.key});

  @override
  State<PreferenceBottomSheet> createState() => _PreferenceBottomSheetState();
}

class _PreferenceBottomSheetState extends State<PreferenceBottomSheet> {
  String selectedGender = Gender.male.name;
  String selectedLanguage = Language.hindi.name;
  double selectedMinAge = 18.0;
  double selectedMaxAge = 32.0;
  double selectedRadius = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          // height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 22.0),
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Set Preference",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  const Text("Gender",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        height: 40,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  selectedGender == Gender.male.name
                                      ? const Color.fromRGBO(0, 213, 217, 1)
                                      : Colors.white,
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Color.fromRGBO(
                                                229, 229, 229, 1))))),
                            onPressed: () {
                              setState(() {
                                selectedGender = Gender.male.name;
                              });
                            },
                            child: Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 14,
                                color: selectedGender == Gender.male.name
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 90,
                        height: 40,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  selectedGender == Gender.female.name
                                      ? const Color.fromRGBO(0, 213, 217, 1)
                                      : Colors.white,
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Color.fromRGBO(
                                                229, 229, 229, 1))))),
                            onPressed: () {
                              setState(() {
                                selectedGender = Gender.female.name;
                              });
                            },
                            child: Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 14,
                                color: selectedGender == Gender.female.name
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 90,
                        height: 40,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  selectedGender == Gender.both.name
                                      ? const Color.fromRGBO(0, 213, 217, 1)
                                      : Colors.white,
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Color.fromRGBO(
                                                229, 229, 229, 1))))),
                            onPressed: () {
                              setState(() {
                                selectedGender = Gender.both.name;
                              });
                            },
                            child: Text(
                              "Both",
                              style: TextStyle(
                                fontSize: 14,
                                color: selectedGender == Gender.both.name
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  const Text("Age Range (18-60)",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color.fromRGBO(0, 213, 217, 1),
                      inactiveTrackColor:
                          const Color.fromRGBO(235, 235, 235, 1),
                      trackHeight: 2.0,
                      rangeThumbShape: CustomRangeShape(
                        thumbRadius: 22,
                        min: selectedMinAge,
                        max: selectedMaxAge,
                      ),
                    ),
                    child: RangeSlider(
                      min: 18.0,
                      max: 60.0,
                      values: RangeValues(selectedMinAge, selectedMaxAge),
                      onChanged: (values) {
                        setState(() {
                          selectedMinAge = values.start;
                          selectedMaxAge = values.end;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Radius ( Max 50km )",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),

                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color.fromRGBO(0, 213, 217, 1),
                      inactiveTrackColor:
                          const Color.fromRGBO(235, 235, 235, 1),
                      trackHeight: 2.0,
                      thumbShape: const CustomSliderThumbCircle(
                        thumbRadius: 22,
                        min: 5,
                        max: 50,
                      ),
                    ),
                    child: Slider(
                        value: selectedRadius,
                        onChanged: (value) {
                          setState(() {
                            selectedRadius = value;
                          });
                        }),
                  ),

                  const SizedBox(height: 30),

                  const Text("Language",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        height: 40,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  selectedLanguage == Language.hindi.name
                                      ? const Color.fromRGBO(0, 213, 217, 1)
                                      : Colors.white,
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Color.fromRGBO(
                                                229, 229, 229, 1))))),
                            onPressed: () {
                              setState(() {
                                selectedLanguage = Language.hindi.name;
                              });
                            },
                            child: Text(
                              "Hindi",
                              style: TextStyle(
                                fontSize: 14,
                                color: selectedLanguage == Language.hindi.name
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 90,
                        height: 40,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  selectedLanguage == Language.english.name
                                      ? const Color.fromRGBO(0, 213, 217, 1)
                                      : Colors.white,
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Color.fromRGBO(
                                                229, 229, 229, 1))))),
                            onPressed: () {
                              setState(() {
                                selectedLanguage = Language.english.name;
                              });
                            },
                            child: Text(
                              "English",
                              style: TextStyle(
                                fontSize: 14,
                                color: selectedLanguage == Language.english.name
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text("Location",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  // Need to add widget here
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(
                                color: Color.fromRGBO(229, 229, 229, 1),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.location_pin,
                              size: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                              "Select Location",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            )
                            
                          ],
                        )),
                  ),

                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(68, 97, 115, 1),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Apply",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
    ;
  }
}
