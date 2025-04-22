import 'package:bmi/bmi_provider.dart';
import 'package:bmi/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weightController = TextEditingController();
  final cmController = TextEditingController();
  final inController = TextEditingController();
  final ftController = TextEditingController();
  bool isKgsSelected = true;
  bool isCmSelected = true;
  bool isLbsSelected = false;
  bool isInSelected = false;
  double bmiNumber = 0.0;
  @override
  Widget build(BuildContext context) {
    final bmiProvider = Provider.of<BmiProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffFDF4F0),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Weight', style: boldTextStyle),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 50.w,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}'),
                              ),
                            ],
                            controller: weightController,
                            decoration: InputDecoration(
                              labelStyle: regulerTextStyle,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLbsSelected = true;
                                  isInSelected = true;
                                  isKgsSelected = false;
                                  isCmSelected = false;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.h,
                                  horizontal: 3.w,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isLbsSelected
                                          ? Color(0xFFFFB62E)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'lbs',
                                  style: TextStyle(
                                    color:
                                        isLbsSelected
                                            ? Colors.white
                                            : Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLbsSelected = false;
                                  isInSelected = false;
                                  isKgsSelected = true;
                                  isCmSelected = true;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.h,
                                  horizontal: 3.w,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isKgsSelected
                                          ? Color(0xFFFFB62E)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'kgs',
                                  style: TextStyle(
                                    color:
                                        isKgsSelected
                                            ? Colors.white
                                            : Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffFDF4F0),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Height', style: boldTextStyle),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isCmSelected
                            ? SizedBox(
                              width: 50.w,
                              child: TextFormField(
                                controller: cmController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d{0,2}'),
                                  ),
                                ],
                                decoration: InputDecoration(
                                  labelStyle: regulerTextStyle,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 24.w,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp(r'^\d+\.?\d{0,2}'),
                                          ),
                                        ],
                                        controller: ftController,
                                        decoration: InputDecoration(
                                          labelStyle: regulerTextStyle,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 1.w),
                                    Text('ft', style: regulerTextStyle),
                                  ],
                                ),
                                SizedBox(width: 2.w),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 22.w,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp(r'^\d+\.?\d{0,2}'),
                                          ),
                                        ],
                                        controller: inController,
                                        decoration: InputDecoration(
                                          labelStyle: regulerTextStyle,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 1.w),
                                    Text('in', style: regulerTextStyle),
                                  ],
                                ),
                              ],
                            ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLbsSelected = false;
                                  isInSelected = false;
                                  isKgsSelected = true;
                                  isCmSelected = true;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.h,
                                  horizontal: 3.w,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isCmSelected
                                          ? Color(0xFFFFB62E)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'cm',
                                  style: TextStyle(
                                    color:
                                        isCmSelected
                                            ? Colors.white
                                            : Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLbsSelected = true;
                                  isInSelected = true;
                                  isKgsSelected = false;
                                  isCmSelected = false;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.h,
                                  horizontal: 3.w,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isInSelected
                                          ? Color(0xFFFFB62E)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'ft & in',
                                  style: TextStyle(
                                    color:
                                        isInSelected
                                            ? Colors.white
                                            : Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* Tombol Hitung BMI
                  ElevatedButton(
                    onPressed: () {
                      //* Jika user mengisi semua field dan nilai Cm serta Kg dipilih, maka akan menghitung BMI
                      if (weightController.text.isNotEmpty &&
                          cmController.text.isNotEmpty &&
                          isCmSelected == true &&
                          isKgsSelected == true) {
                        bmiProvider.setWeight(
                          double.parse(weightController.text),
                        );
                        bmiProvider.setHeight(double.parse(cmController.text));

                        bmiProvider.calculateBmi();
                        setState(() {
                          bmiNumber = bmiProvider.bmi;
                        });
                      }
                      //* Jika user mengisi semua field dan nilai Lb serta FtIn dipilih, maka akan menghitung BMI
                      else if (weightController.text.isNotEmpty &&
                          inController.text.isNotEmpty &&
                          ftController.text.isNotEmpty &&
                          isInSelected == true &&
                          isLbsSelected == true) {
                        bmiProvider.setHeight(
                          ((double.parse(ftController.text) * 30.48) +
                              (double.parse(inController.text) * 2.54)),
                        );
                        bmiProvider.setWeight(
                          double.parse(
                            (double.parse(weightController.text) * 0.45359237)
                                .toStringAsFixed(2),
                          ),
                        );

                        bmiProvider.calculateBmi();
                        setState(() {
                          bmiNumber = bmiProvider.bmi;
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.black,
                            content: Text(
                              'Please fill in all fields',
                              style: boldTextStyle.copyWith(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      fixedSize: Size.fromWidth(70.w),
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    ),

                    child: Text(
                      'Calculate',
                      style: boldTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  //* Tombol Reset
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        weightController.clear();
                        cmController.clear();
                        inController.clear();
                        ftController.clear();
                        bmiNumber = 0.0;
                        isKgsSelected = true;
                        isCmSelected = true;
                        isLbsSelected = false;
                        isInSelected = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      fixedSize: Size.fromWidth(18.w),
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                    ),
                    child: Text(
                      'Reset',
                      style: boldTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.5.h),
              bmiNumber > 0.0
                  ? Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xffFDF4F0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('BMI', style: boldTextStyle),
                            Text(
                              bmiNumber.toStringAsFixed(1),
                              style: boldTextStyle,
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        bmiNumber > 0.0 && bmiNumber < 18.5
                            ? Column(
                              children: [
                                bmiResult(
                                  'Berat Badan Kurang',
                                  0xff4A78EF,
                                  '18.5',
                                  isSelected: true,
                                ),
                                bmiResult('Normal', 0xff21DF85, '18.5 - 25'),
                                bmiResult(
                                  'Kelebihan Berat Badan',
                                  0xffFEB23A,
                                  '25 - 30',
                                ),
                                bmiResult('Obesitas', 0xffFF8A3A, '30 - 40'),
                                bmiResult(
                                  'Obesitas Morbid',
                                  0xffFE5B62,
                                  '> 40',
                                ),
                              ],
                            )
                            : bmiNumber >= 18.5 && bmiNumber < 24.9
                            ? Column(
                              children: [
                                bmiResult(
                                  'Berat Badan Kurang',
                                  0xff4A78EF,
                                  '18.5',
                                ),
                                bmiResult(
                                  'Normal',
                                  0xff21DF85,
                                  '18.5 - 25',
                                  isSelected: true,
                                ),
                                bmiResult(
                                  'Kelebihan Berat Badan',
                                  0xffFEB23A,
                                  '25 - 30',
                                ),
                                bmiResult('Obesitas', 0xffFF8A3A, '30 - 40'),
                                bmiResult(
                                  'Obesitas Morbid',
                                  0xffFE5B62,
                                  '> 40',
                                ),
                              ],
                            )
                            : bmiNumber >= 25 && bmiNumber < 29.9
                            ? Column(
                              children: [
                                bmiResult(
                                  'Berat Badan Kurang',
                                  0xff4A78EF,
                                  '18.5',
                                ),
                                bmiResult('Normal', 0xff21DF85, '18.5 - 25'),
                                bmiResult(
                                  'Kelebihan Berat Badan',
                                  0xffFEB23A,
                                  '25 - 30',
                                  isSelected: true,
                                ),
                                bmiResult('Obesitas', 0xffFF8A3A, '30 - 40'),
                                bmiResult(
                                  'Obesitas Morbid',
                                  0xffFE5B62,
                                  '> 40',
                                ),
                              ],
                            )
                            : bmiNumber >= 30 && bmiNumber < 40
                            ? Column(
                              children: [
                                bmiResult(
                                  'Berat Badan Kurang',
                                  0xff4A78EF,
                                  '18.5',
                                ),
                                bmiResult('Normal', 0xff21DF85, '18.5 - 25'),
                                bmiResult(
                                  'Kelebihan Berat Badan',
                                  0xffFEB23A,
                                  '25 - 30',
                                ),
                                bmiResult(
                                  'Obesitas',
                                  0xffFF8A3A,
                                  '30 - 40',
                                  isSelected: true,
                                ),
                                bmiResult(
                                  'Obesitas Morbid',
                                  0xffFE5B62,
                                  '> 40',
                                ),
                              ],
                            )
                            : bmiNumber >= 40
                            ? Column(
                              children: [
                                bmiResult(
                                  'Berat Badan Kurang',
                                  0xff4A78EF,
                                  '18.5',
                                ),
                                bmiResult('Normal', 0xff21DF85, '18.5 - 25'),
                                bmiResult(
                                  'Kelebihan Berat Badan',
                                  0xffFEB23A,
                                  '25 - 30',
                                ),
                                bmiResult('Obesitas', 0xffFF8A3A, '30 - 40'),
                                bmiResult(
                                  'Obesitas Morbid',
                                  0xffFE5B62,
                                  '> 40',
                                  isSelected: true,
                                ),
                              ],
                            )
                            : SizedBox(height: 0),
                        SizedBox(height: 2.h),
                        Container(
                          color: Colors.black,
                          height: 0.1.h,
                          width: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.weightScale, size: 5.w),
                                SizedBox(width: 2.w),
                                Text(
                                  'Berat Ideal',
                                  style: regulerTextStyle.copyWith(
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ],
                            ),
                            isLbsSelected
                                ? Text(
                                  '${(((bmiProvider.height * bmiProvider.height / 10000) * 18.5) * 2.2046226218).toStringAsFixed(1)} - ${(((bmiProvider.height * bmiProvider.height / 10000) * 25) * 2.2046226218).toStringAsFixed(1)} lb',
                                  style: regulerTextStyle.copyWith(
                                    fontSize: 15.sp,
                                  ),
                                )
                                : Text(
                                  '${((bmiProvider.height * bmiProvider.height / 10000) * 18.5).toStringAsFixed(1)} - ${((bmiProvider.height * bmiProvider.height / 10000) * 25).toStringAsFixed(1)} kg',
                                  style: regulerTextStyle.copyWith(
                                    fontSize: 15.sp,
                                  ),
                                ),
                          ],
                        ),
                        SizedBox(height: 1.5.h),
                      ],
                    ),
                  )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget bmiResult(
  String info,
  int color,
  String number, {
  bool isSelected = false,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 1.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(color),
                borderRadius: BorderRadius.circular(4),
              ),
              width: 5.w,
              height: 5.w,
            ),
            SizedBox(width: 2.w),
            Text(
              info,
              style:
                  isSelected
                      ? boldTextStyle.copyWith(
                        fontSize: 15.sp,
                        color: Colors.deepPurple,
                      )
                      : regulerTextStyle.copyWith(fontSize: 15.sp),
            ),
          ],
        ),
        Text(
          number,
          style:
              isSelected
                  ? boldTextStyle.copyWith(
                    fontSize: 15.sp,
                    color: Colors.deepPurple,
                  )
                  : regulerTextStyle.copyWith(fontSize: 15.sp),
        ),
      ],
    ),
  );
}
