import 'dart:async';
import 'dart:html';
import 'dart:typed_data';
import 'package:dashboard/plan_data/bloc/update_user_bloc.dart';
import 'package:dashboard/plan_data/repository/plan_repo.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:dashboard/pages/plans/new_plan.dart';
import 'package:dashboard/plan_data/bloc/new_plan_bloc.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanDetail extends StatefulWidget {
  const PlanDetail({super.key, required this.plan});

  final PlanDTO plan;

  @override
  State<PlanDetail> createState() => _PlanDetailState();
}

class _PlanDetailState extends State<PlanDetail> {

  Uint8List? _imageBytes;
  String? _imageName;
  String? imageLink;

  StreamSubscription<UpdateUserState>? subscription;

  void _startFilePicker(BuildContext context) async{
    FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.multiple = false;
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((e) async{
      final files = uploadInput.files;
      if (files != null && files.isNotEmpty) {
        final file = files.first;
        FileReader reader = FileReader();

        reader.onLoadEnd.listen((e) async{
          setState((){
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

  final TextEditingController _planName = TextEditingController(text: "");
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

  @override
  void dispose() {
    _planName.dispose();
    _planCapacity.dispose();
    _directEmployment.dispose();
    _applicationOfTheProduct.dispose();
    _sellingPriceOfProducts.dispose();
    _analysisOfTheMarketSituation.dispose();
    _theAmountOfDomesticProduction.dispose();
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    _planName.text = widget.plan.planName ?? "";
    _planCapacity.text = widget.plan.planCapacity ?? "";
    _directEmployment.text = widget.plan.directEmployment.toString();
    _applicationOfTheProduct.text = widget.plan.applicationOfTheProduct ?? "";
    _sellingPriceOfProducts.text = widget.plan.sellingPriceOfProducts ?? "";
    _analysisOfTheMarketSituation.text =
        widget.plan.analysisOfTheMarketSituation ?? "";
    _theAmountOfDomesticProduction.text =
        widget.plan.theAmountOfDomesticProduction ?? "";
    _landArea.text = widget.plan.landArea ?? "";
    _technicalKnowledge.text = widget.plan.technicalKnowledge ?? "";
    _water.text = widget.plan.water ?? "";
    _fuel.text = widget.plan.fuel ?? "";
    _electricity.text = widget.plan.electricity ?? "";
    _typeOfEquipmentRequired.text = widget.plan.typeOfEquipmentRequired ?? "";
    _typeAndAmountOfMajorRawMaterials.text =
        widget.plan.typeAndAmountOfMajorRawMaterials ?? "";
    _theMainSourceOfRawMaterials.text =
        widget.plan.theMainSourceOfRawMaterials ?? "";
    _foreignExchangeCapital.text = widget.plan.foreignExchangeCapital ?? "";
    _rialCapital.text = widget.plan.rialCapital ?? "";
    _currency.text = widget.plan.currency ?? "";
    _exchangeRate.text = widget.plan.exchangeRate.toString();
    _workingCapital.text = widget.plan.workingCapital ?? "";
    _totalCapital.text = widget.plan.totalCapital ?? "";
    _annualSales.text = widget.plan.annualSales ?? "";
    _paybackTime.text = widget.plan.paybackTime ?? "";
    imageLink = widget.plan.imagePath??"";
    final theme = Theme.of(context);
    return BlocProvider(create: (context) {
      final bloc = UpdateUserBloc(planRepository);
      subscription = bloc.stream.listen((state) {
        if (state is UpdateUserSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("طرح با موفقیت بروزرسانی شد"),
            backgroundColor: Colors.green,
          ));
        } else if (state is UpdateUserFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: Colors.red,
          ));
        }
      });
      return bloc;
    },child: BlocProvider<NewPlanBloc>(
      create: (BuildContext context) {
        final bloc = NewPlanBloc(planRepository);
        return bloc;
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.3,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text("تغییر طرح", style: theme.textTheme.headlineLarge),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BlocBuilder<NewPlanBloc, NewPlanState>(
                  builder: (context, NewPlanState state) {
                    if (state is! GetImageLoading) {
                      if (state is GetImageSuccess){
                        imageLink = state.image;
                      }
                      return Column(
                        children: [
                          InkWell(
                            onTap: () async{
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
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.plan.planName!,
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    "تاریخ ثبت",
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    "${widget.plan.yearOfPlanRegistrationDate}/${widget.plan.monthOfPlanRegistrationDate}/${widget.plan.dayOfPlanRegistrationDate}",
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: width / 4.1,
                      child: TextFormField(
                        controller: _planCapacity,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            label: const Text("ظرفیت طرح"),
                            enabledBorder: inputBorder()),
                      )),
                  SizedBox(
                    width: width / 4.1,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: const Text("اشتغال مستقیم"),
                          enabledBorder: inputBorder()),
                      controller: _directEmployment,
                    ),
                  ),
                  SizedBox(
                    width: width / 4.1,
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            label: const Text("زمان بازگشت سرمایه"),
                            enabledBorder: inputBorder()),
                        controller: _paybackTime),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: width / 4.1,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: const Text("مساحت زمین(هکتار)"),
                        enabledBorder: inputBorder()),
                    controller: _landArea,
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      label: const Text("کاربرد محصول"),
                      enabledBorder: inputBorder()),
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
                      label: const Text("قیمت فروش محصولات"),
                      enabledBorder: inputBorder()),
                  controller: _sellingPriceOfProducts),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                    label: const Text("تحلیل وضعیت بازار"),
                    enabledBorder: inputBorder(),
                  ),
                  controller: _analysisOfTheMarketSituation),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      label: const Text("میزان تولید داخل"),
                      enabledBorder: inputBorder()),
                  controller: _theAmountOfDomesticProduction),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  //TODO::controller: ,
                  decoration: InputDecoration(
                    label: const Text("نیاز کشور"),
                    enabledBorder: inputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                //TODO::controller: ,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: const Text("ظرفیت اسمی واحد های فعال موجود"),
                      enabledBorder: inputBorder())),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: const Text("ظرفیت اسمی طرح های در دست اجرا"),
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
                    label: const Text("دارنده دانش فنی"),
                    enabledBorder: inputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: const Text("مصرف صالانه حامل های انرژی"),
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
                    label: const Text("نوع تجهیزات مورد نیاز"),
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
                    label: const Text("نوع و میزان مواد اولیه عمده"),
                    enabledBorder: inputBorder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _theMainSourceOfRawMaterials,
                  decoration: InputDecoration(
                    label: const Text("عمده محل تامین مواد اولیه"),
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
                          label: const Text("آب"), enabledBorder: inputBorder()),
                      controller: _water,
                    ),
                  ),
                  SizedBox(
                      width: width / 4.1,
                      child: TextFormField(
                        controller: _electricity,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            label: const Text("برق"),
                            enabledBorder: inputBorder()),
                      )),
                  SizedBox(
                    width: width / 4.1,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: const Text("سوخت"),
                          enabledBorder: inputBorder()),
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
                      label: const Text("سرمایه کل"),
                      enabledBorder: inputBorder())),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _workingCapital,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: const Text("سرمایه در گردش"),
                      enabledBorder: inputBorder())),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: _annualSales,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: const Text("پیش بینی فروش سالیانه"),
                      enabledBorder: inputBorder())),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  BlocBuilder<UpdateUserBloc,UpdateUserState>(
                    builder: (context, UpdateUserState state) {
                      return InkWell(
                        onTap: (){
                          Map<String,dynamic> changes = {};
                          changes['plan_name'] = widget.plan.planName;
                          changes['year_of_plan_registration_date'] = widget.plan.yearOfPlanRegistrationDate;
                          changes['month_of_plan_registration_date'] = widget.plan.monthOfPlanRegistrationDate;
                          changes['day_of_plan_registration_date'] = widget.plan.dayOfPlanRegistrationDate;
                          if(_planCapacity.text != widget.plan.planCapacity){
                            changes['plan_capacity'] = _planCapacity.text;
                          }
                          if(_directEmployment.text != widget.plan.directEmployment.toString()){
                            changes['Direct_employment'] = int.parse(_directEmployment.text);
                          }
                          if(_applicationOfTheProduct.text != widget.plan.applicationOfTheProduct){
                            changes['Application_of_the_product'] = _applicationOfTheProduct.text;
                          }
                          if(_sellingPriceOfProducts.text != widget.plan.sellingPriceOfProducts){
                            changes['Selling_price_of_products'] = _sellingPriceOfProducts.text;
                          }
                          if(_analysisOfTheMarketSituation.text != widget.plan.analysisOfTheMarketSituation){
                            changes['Analysis_of_the_market_situation'] = _analysisOfTheMarketSituation.text;
                          }
                          if(_theAmountOfDomesticProduction.text != widget.plan.theAmountOfDomesticProduction){
                            changes['The_amount_of_domestic_production'] = _theAmountOfDomesticProduction.text;
                          }
                          if(_landArea.text != widget.plan.landArea){
                            changes['land_area'] = _landArea.text;
                          }
                          if(_technicalKnowledge.text != widget.plan.technicalKnowledge){
                            changes['Technical_knowledge'] = _technicalKnowledge.text;
                          }
                          if(_water.text != widget.plan.water){
                            changes['water'] = _water.text;
                          }
                          if(_fuel.text != widget.plan.fuel){
                            changes['fuel'] = _fuel.text;
                          }
                          if(_electricity.text != widget.plan.electricity){
                            changes['electricity'] = _electricity.text;
                          }
                          if(_typeOfEquipmentRequired.text != widget.plan.typeOfEquipmentRequired){
                            changes['Type_of_equipment_required'] = _typeOfEquipmentRequired.text;
                          }
                          if(_typeAndAmountOfMajorRawMaterials.text != widget.plan.typeAndAmountOfMajorRawMaterials){
                            changes['Type_and_amount_of_major_raw_materials'] = _typeAndAmountOfMajorRawMaterials.text;
                          }
                          if(_theMainSourceOfRawMaterials.text!=widget.plan.theMainSourceOfRawMaterials){
                            changes['The_main_source_of_raw_materials'] = _theMainSourceOfRawMaterials.text;
                          }
                          if(_foreignExchangeCapital.text != widget.plan.foreignExchangeCapital){
                            changes['Foreign_exchange_capital'] = _foreignExchangeCapital.text;
                          }
                          if(_rialCapital.text != widget.plan.rialCapital){
                            changes['Rial_capital'] = _rialCapital.text;
                          }
                          if(_currency.text != widget.plan.currency){
                            changes['currency'] = _currency.text;
                          }
                          if(_exchangeRate.text != widget.plan.exchangeRate.toString()){
                            changes['exchange_rate'] = int.parse(_exchangeRate.text);
                          }
                          if(_workingCapital.text != widget.plan.workingCapital){
                            changes['working_capital'] = _workingCapital.text;
                          }
                          if(_totalCapital.text != widget.plan.totalCapital){
                            changes['total_capital'] = _totalCapital.text;
                          }
                          if(_annualSales.text != widget.plan.annualSales){
                            changes['Annual_sales'] = _annualSales.text;
                          }
                          if(_paybackTime.text != widget.plan.paybackTime){
                            changes['Payback_time'] = _paybackTime.text;
                          }
                          if(imageLink != widget.plan.imagePath){
                            changes['image'] = imageLink;
                          }
                          BlocProvider.of<UpdateUserBloc>(context).add(UpdateUserClicked(changes: changes));
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: const BoxDecoration(
                              color: Color(0xFF19CC56),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: state is UpdateUserLoading?const CircularProgressIndicator():Text(
                              "افزودن تغییرات",
                              style: theme.textTheme.titleLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),);
  }
}
