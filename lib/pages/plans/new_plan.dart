import 'dart:html';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dashboard/plan_data/repository/plan_repo.dart';
import 'package:flutter/services.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dashboard/plan_data/bloc/new_plan_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

OutlineInputBorder inputBorder() {
  return const OutlineInputBorder(
      borderSide: BorderSide(
    color: Colors.grey,
  ));
}

class NewPlan extends StatefulWidget {
  const NewPlan({super.key});

  @override
  State<NewPlan> createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  Uint8List? _imageBytes;
  String? _imageName;
  String? imageLink;

  final TextEditingController _planName = TextEditingController(text: "");
  final TextEditingController _date = TextEditingController(text: "");
  final TextEditingController _planCapacity = TextEditingController(text: "");
  final TextEditingController _directEmployment =
      TextEditingController(text: "");
  final TextEditingController _applicationOfTheProduct =
      TextEditingController(text: "");
  final TextEditingController _sellingPriceOfProducts =
      TextEditingController(text: "");
  final TextEditingController _analysisOfTheMarketSituation =
      TextEditingController(text: "");
  final TextEditingController _theAmountOfDomesticProduction =
      TextEditingController(text: "");
  final TextEditingController _countryNeed = TextEditingController(text: "");
  final TextEditingController _nominalCapacityOfExistingActiveUnits =
      TextEditingController(text: "");
  final TextEditingController _theNominalCapacityOfProjectsInProgress =
      TextEditingController(text: "");
  final TextEditingController _landArea = TextEditingController(text: "");
  final TextEditingController _technicalKnowledge =
      TextEditingController(text: "");
  final TextEditingController _water = TextEditingController(text: "");
  final TextEditingController _fuel = TextEditingController(text: "");
  final TextEditingController _electricity = TextEditingController(text: "");
  final TextEditingController _typeOfEquipmentRequired =
      TextEditingController(text: "");
  final TextEditingController _typeAndAmountOfMajorRawMaterials =
      TextEditingController(text: "");
  final TextEditingController _theMainSourceOfRawMaterials =
      TextEditingController(text: "");
  final TextEditingController _foreignExchangeCapital =
      TextEditingController(text: "");
  final TextEditingController _rialCapital = TextEditingController(text: "");
  final TextEditingController _currency = TextEditingController(text: "");
  final TextEditingController _exchangeRate = TextEditingController(text: "");
  final TextEditingController _workingCapital = TextEditingController(text: "");
  final TextEditingController _totalCapital = TextEditingController(text: "");
  final TextEditingController _annualSales = TextEditingController(text: "");
  final TextEditingController _paybackTime = TextEditingController(text: "");
  int _yearOfPlanRegistrationDate = 0;
  int _monthOfPlanRegistrationDate = 0;
  int _dayOfPlanRegistrationDate = 0;
  StreamSubscription<NewPlanState>? subscription;

  @override
  void dispose() {
    _planName.dispose();
    _date.dispose();
    _planCapacity.dispose();
    _directEmployment.dispose();
    _applicationOfTheProduct.dispose();
    _sellingPriceOfProducts.dispose();
    _analysisOfTheMarketSituation.dispose();
    _theAmountOfDomesticProduction.dispose();
    _countryNeed.dispose();
    _nominalCapacityOfExistingActiveUnits.dispose();
    _theNominalCapacityOfProjectsInProgress.dispose();
    _landArea.dispose();
    _technicalKnowledge.dispose();
    _water.dispose();
    _electricity.dispose();
    _fuel.dispose();
    _typeOfEquipmentRequired.dispose();
    _typeAndAmountOfMajorRawMaterials.dispose();
    _theMainSourceOfRawMaterials.dispose();
    _rialCapital.dispose();
    _exchangeRate.dispose();
    _currency.dispose();
    _foreignExchangeCapital.dispose();
    _workingCapital.dispose();
    _totalCapital.dispose();
    _annualSales.dispose();
    _paybackTime.dispose();

    super.dispose();
  }

  void _startFilePicker(BuildContext context) async {
    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.multiple = false;
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((e) async {
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        final file = files.first;
        FileReader reader = FileReader();

        reader.onLoadEnd.listen((e) async {
          setState(() {
            _imageBytes = reader.result as Uint8List?;
            _imageName = file.name;
            FormData formData = FormData.fromMap({
              "image":
                  MultipartFile.fromBytes(_imageBytes!, filename: _imageName),
            });
            BlocProvider.of<NewPlanBloc>(context)
                .add(AddImageClicked(formData: formData));
          });
        });
        reader.readAsArrayBuffer(file);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime dt = DateTime.now();
    Jalali? j = dt.toJalali();
    _date.text = "${j.year}/${j.month}/${j.day}";
    _yearOfPlanRegistrationDate = j.year;
    _monthOfPlanRegistrationDate = j.month;
    _dayOfPlanRegistrationDate = j.day;
    final theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) {
        final bloc = NewPlanBloc(planRepository);
        subscription = bloc.stream.listen((state) {
          if (state is NewPlanSuccess) {
            _planName.clear();
            _date.clear();
            _planCapacity.clear();
            _directEmployment.clear();
            _applicationOfTheProduct.clear();
            _sellingPriceOfProducts.clear();
            _analysisOfTheMarketSituation.clear();
            _theAmountOfDomesticProduction.clear();
            _landArea.clear();
            _countryNeed.clear();
            _nominalCapacityOfExistingActiveUnits.clear();
            _theNominalCapacityOfProjectsInProgress.clear();
            _technicalKnowledge.clear();
            _water.clear();
            _electricity.clear();
            _fuel.clear();
            _typeOfEquipmentRequired.clear();
            _typeAndAmountOfMajorRawMaterials.clear();
            _theMainSourceOfRawMaterials.clear();
            _rialCapital.clear();
            _exchangeRate.clear();
            _currency.clear();
            _foreignExchangeCapital.clear();
            _workingCapital.clear();
            _totalCapital.clear();
            _annualSales.clear();
            _paybackTime.clear();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ));
          } else if (state is NewPlanFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
          }
        });
        return bloc;
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.3,
          child: ListView(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "ایجاد طرح جدید",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BlocBuilder<NewPlanBloc, NewPlanState>(
                  builder: (context, NewPlanState state) {
                    if (state is! GetImageLoading) {
                      if (state is GetImageSuccess) {
                        imageLink = state.image;
                      }
                      return Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              _startFilePicker(context);
                            },
                            child: Container(
                              height: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: _imageBytes != null
                                  ? Image.memory(_imageBytes!)
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add_a_photo,
                                          color: Color(0xFF3A94E7),
                                        ),
                                        Text(
                                          "انتخاب عکس",
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                  color:
                                                      const Color(0xFF3A94E7)),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width / 4.1,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "نام طرح", enabledBorder: inputBorder()),
                      controller: _planName,
                    ),
                  ),
                  SizedBox(
                      width: width / 4.1,
                      child: TextFormField(
                        controller: _planCapacity,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "ظرفیت طرح",
                            enabledBorder: inputBorder()),
                      )),
                  SizedBox(
                    width: width / 4.1,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "اشتغال مستقیم",
                          enabledBorder: inputBorder()),
                      controller: _directEmployment,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width / 4.1,
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "زمان بازگشت سرمایه",
                            enabledBorder: inputBorder()),
                        controller: _paybackTime),
                  ),
                  SizedBox(
                      width: width / 4.1,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "مساحت زمین(هکتار)",
                            enabledBorder: inputBorder()),
                        controller: _landArea,
                      )),
                  SizedBox(
                    width: width / 4.1,
                    child: TextFormField(
                      readOnly: true,
                      onTap: () async {
                        Jalali? j = await showPersianDatePicker(
                          context: context,
                          initialDate: Jalali.now(),
                          firstDate: Jalali(1400, 1),
                          lastDate: Jalali(1410, 12),
                        );
                        if (j?.month != null) {
                          _date.text = "${j?.year}/${j?.month}/${j?.day}";
                          _yearOfPlanRegistrationDate = j!.year;
                          _monthOfPlanRegistrationDate = j.month;
                          _dayOfPlanRegistrationDate = j.day;
                        }
                      },
                      keyboardType: TextInputType.datetime,
                      controller: _date,
                      decoration: InputDecoration(
                          label: const Text("تاریخ ثبت طرح"),
                          hintText: "تاریخ ثبت طرح",
                          enabledBorder: inputBorder()),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "کاربرد محصول", enabledBorder: inputBorder()),
                  controller: _applicationOfTheProduct),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "• برسی بازار",
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "قیمت فروش محصولات",
                      enabledBorder: inputBorder()),
                  controller: _sellingPriceOfProducts),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "تحلیل وضعیت بازار",
                    enabledBorder: inputBorder(),
                  ),
                  controller: _analysisOfTheMarketSituation),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "میزان تولید داخل",
                      enabledBorder: inputBorder()),
                  controller: _theAmountOfDomesticProduction),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: _countryNeed,
                  decoration: InputDecoration(
                    hintText: "نیاز کشور",
                    enabledBorder: inputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _nominalCapacityOfExistingActiveUnits,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "ظرفیت اسمی واحد های فعال موجود",
                      enabledBorder: inputBorder())),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _theNominalCapacityOfProjectsInProgress,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "ظرفیت اسمی طرح های در دست اجرا",
                      enabledBorder: inputBorder())),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "• برسی فنی طرح",
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _technicalKnowledge,
                  decoration: InputDecoration(
                    hintText: "دارنده دانش فنی",
                    enabledBorder: inputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "مصرف صالانه حامل های انرژی",
                    enabledBorder: inputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  controller: _typeOfEquipmentRequired,
                  decoration: InputDecoration(
                    hintText: "نوع تجهیزات مورد نیاز",
                    enabledBorder: inputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: _typeAndAmountOfMajorRawMaterials,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "نوع و میزان مواد اولیه عمده",
                    enabledBorder: inputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _theMainSourceOfRawMaterials,
                  decoration: InputDecoration(
                    hintText: "عمده محل تامین مواد اولیه",
                    enabledBorder: inputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width / 4.1,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "آب", enabledBorder: inputBorder()),
                      controller: _water,
                    ),
                  ),
                  SizedBox(
                      width: width / 4.1,
                      child: TextFormField(
                        controller: _electricity,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "برق", enabledBorder: inputBorder()),
                      )),
                  SizedBox(
                    width: width / 4.1,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "سوخت", enabledBorder: inputBorder()),
                      controller: _fuel,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "• برسی مالی طرح",
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "سرمایه ثابت",
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width / 6.1,
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "نام ارز",
                            enabledBorder: inputBorder()),
                        controller: _currency),
                  ),
                  SizedBox(
                    width: width / 6.1,
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "قیمت ارز",
                            enabledBorder: inputBorder()),
                        controller: _exchangeRate),
                  ),
                  SizedBox(
                      width: width / 5.1,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "ریالی",
                            enabledBorder: inputBorder()),
                        controller: _rialCapital,
                      )),
                  SizedBox(
                      width: width / 5.1,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "ارزی",
                            enabledBorder: inputBorder()),
                        controller: _foreignExchangeCapital,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _totalCapital,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "سرمایه کل", enabledBorder: inputBorder())),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _workingCapital,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "سرمایه در گردش",
                      enabledBorder: inputBorder())),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _annualSales,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "پیش بینی فروش سالیانه",
                      enabledBorder: inputBorder())),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  BlocBuilder<NewPlanBloc, NewPlanState>(
                      builder: (context, NewPlanState state) {
                    if (state is! NewPlanLoading) {
                      return InkWell(
                        onTap: () {
                          PlanDTO plan = PlanDTO(
                              planName: _planName.text,
                              planCapacity: _planCapacity.text,
                              directEmployment: int.parse(
                                  _directEmployment.text == ""
                                      ? "0"
                                      : _directEmployment.text),
                              applicationOfTheProduct:
                                  _applicationOfTheProduct.text,
                              yearOfPlanRegistrationDate:
                                  _yearOfPlanRegistrationDate,
                              monthOfPlanRegistrationDate:
                                  _monthOfPlanRegistrationDate,
                              dayOfPlanRegistrationDate:
                                  _dayOfPlanRegistrationDate,
                              sellingPriceOfProducts:
                                  _sellingPriceOfProducts.text,
                              analysisOfTheMarketSituation:
                                  _analysisOfTheMarketSituation.text,
                              theAmountOfDomesticProduction:
                                  _theAmountOfDomesticProduction.text,
                              countryNeed: _countryNeed.text,
                              electricity: _electricity.text,
                              fuel: _fuel.text,
                              water: _water.text,
                              nominalCapacityOfExistingActiveUnits:
                                  _nominalCapacityOfExistingActiveUnits.text,
                              theNominalCapacityOfProjectsInProgress:
                                  _theNominalCapacityOfProjectsInProgress.text,
                              landArea: _landArea.text,
                              technicalKnowledge: _technicalKnowledge.text,
                              typeOfEquipmentRequired:
                                  _typeOfEquipmentRequired.text,
                              typeAndAmountOfMajorRawMaterials:
                                  _typeAndAmountOfMajorRawMaterials.text,
                              theMainSourceOfRawMaterials:
                                  _theMainSourceOfRawMaterials.text,
                              currency: _currency.text,
                              exchangeRate: int.parse(_exchangeRate.text == ""?"0":_exchangeRate.text),
                              foreignExchangeCapital: _foreignExchangeCapital.text,
                              rialCapital: _rialCapital.text,
                              workingCapital: _workingCapital.text,
                              totalCapital: _totalCapital.text,
                              annualSales: _annualSales.text,
                              paybackTime: _paybackTime.text,
                              imagePath: imageLink);
                          BlocProvider.of<NewPlanBloc>(context)
                              .add(CreatePlanClicked(plan: plan));
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: const BoxDecoration(
                              color: Color(0xFF19CC56),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: Text(
                              "ثبت طرح",
                              style: theme.textTheme.titleLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: 50,
                        width: 200,
                        decoration: const BoxDecoration(
                            color: Color(0xFF19CC56),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    }
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
