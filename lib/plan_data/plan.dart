class PlanDTO {
  String? _planName;
  int? _yearOfPlanRegistrationDate;
  int? _monthOfPlanRegistrationDate;
  int? _dayOfPlanRegistrationDate;
  String? _planCapacity;
  int? _directEmployment;
  String? _applicationOfTheProduct;
  String? _sellingPriceOfProducts;
  String? _analysisOfTheMarketSituation;
  String? _theAmountOfDomesticProduction;
  String? _landArea;
  String? _technicalKnowledge;
  String? _water;
  String? _fuel;
  String? _electricity;
  String? _typeOfEquipmentRequired;
  String? _typeAndAmountOfMajorRawMaterials;
  String? _theMainSourceOfRawMaterials;
  String? _foreignExchangeCapital;
  String? _rialCapital;
  String? _currency;
  int? _exchangeRate;
  String? _workingCapital;
  String? _totalCapital;
  String? _annualSales;
  String? _paybackTime;
  String? _imagePath;

  PlanDTO(
      {String? planName,
        int? yearOfPlanRegistrationDate,
        int? monthOfPlanRegistrationDate,
        int? dayOfPlanRegistrationDate,
        String? planCapacity,
        int? directEmployment,
        String? applicationOfTheProduct,
        String? sellingPriceOfProducts,
        String? analysisOfTheMarketSituation,
        String? theAmountOfDomesticProduction,
        String? landArea,
        String? technicalKnowledge,
        String? water,
        String? fuel,
        String? electricity,
        String? typeOfEquipmentRequired,
        String? typeAndAmountOfMajorRawMaterials,
        String? theMainSourceOfRawMaterials,
        String? foreignExchangeCapital,
        String? rialCapital,
        String? currency,
        int? exchangeRate,
        String? workingCapital,
        String? totalCapital,
        String? annualSales,
        String? paybackTime,
        String? imagePath
      }) {
    if (planName != null) {
      _planName = planName;
    }
    if (yearOfPlanRegistrationDate != null) {
      _yearOfPlanRegistrationDate = yearOfPlanRegistrationDate;
    }
    if (monthOfPlanRegistrationDate != null) {
      _monthOfPlanRegistrationDate = monthOfPlanRegistrationDate;
    }
    if (dayOfPlanRegistrationDate != null) {
      _dayOfPlanRegistrationDate = dayOfPlanRegistrationDate;
    }
    if (planCapacity != null) {
      _planCapacity = planCapacity;
    }
    if (directEmployment != null) {
      _directEmployment = directEmployment;
    }
    if (applicationOfTheProduct != null) {
      _applicationOfTheProduct = applicationOfTheProduct;
    }
    if (sellingPriceOfProducts != null) {
      _sellingPriceOfProducts = sellingPriceOfProducts;
    }
    if (analysisOfTheMarketSituation != null) {
      _analysisOfTheMarketSituation = analysisOfTheMarketSituation;
    }
    if (theAmountOfDomesticProduction != null) {
      _theAmountOfDomesticProduction = theAmountOfDomesticProduction;
    }
    if (landArea != null) {
      _landArea = landArea;
    }
    if (technicalKnowledge != null) {
      _technicalKnowledge = technicalKnowledge;
    }
    if (water != null) {
      _water = water;
    }
    if (fuel != null) {
      _fuel = fuel;
    }
    if (electricity != null) {
      _electricity = electricity;
    }
    if (typeOfEquipmentRequired != null) {
      _typeOfEquipmentRequired = typeOfEquipmentRequired;
    }
    if (typeAndAmountOfMajorRawMaterials != null) {
      _typeAndAmountOfMajorRawMaterials = typeAndAmountOfMajorRawMaterials;
    }
    if (theMainSourceOfRawMaterials != null) {
      _theMainSourceOfRawMaterials = theMainSourceOfRawMaterials;
    }
    if (foreignExchangeCapital != null) {
      _foreignExchangeCapital = foreignExchangeCapital;
    }
    if (rialCapital != null) {
      _rialCapital = rialCapital;
    }
    if (currency != null) {
      _currency = currency;
    }
    if (exchangeRate != null) {
      _exchangeRate = exchangeRate;
    }
    if (workingCapital != null) {
      _workingCapital = workingCapital;
    }
    if (totalCapital != null) {
      _totalCapital = totalCapital;
    }
    if (annualSales != null) {
      _annualSales = annualSales;
    }
    if (paybackTime != null) {
      _paybackTime = paybackTime;
    }
    if(imagePath != null){
      _imagePath = imagePath;
    }
  }

  String? get imagePath => _imagePath;

  set imagePath(String? value) {
    _imagePath = value;
  }

  String? get planName => _planName;
  set planName(String? planName) => _planName = planName;
  int? get yearOfPlanRegistrationDate => _yearOfPlanRegistrationDate;
  set yearOfPlanRegistrationDate(int? yearOfPlanRegistrationDate) =>
      _yearOfPlanRegistrationDate = yearOfPlanRegistrationDate;
  int? get monthOfPlanRegistrationDate => _monthOfPlanRegistrationDate;
  set monthOfPlanRegistrationDate(int? monthOfPlanRegistrationDate) =>
      _monthOfPlanRegistrationDate = monthOfPlanRegistrationDate;
  int? get dayOfPlanRegistrationDate => _dayOfPlanRegistrationDate;
  set dayOfPlanRegistrationDate(int? dayOfPlanRegistrationDate) =>
      _dayOfPlanRegistrationDate = dayOfPlanRegistrationDate;
  String? get planCapacity => _planCapacity;
  set planCapacity(String? planCapacity) => _planCapacity = planCapacity;
  int? get directEmployment => _directEmployment;
  set directEmployment(int? directEmployment) =>
      _directEmployment = directEmployment;
  String? get applicationOfTheProduct => _applicationOfTheProduct;
  set applicationOfTheProduct(String? applicationOfTheProduct) =>
      _applicationOfTheProduct = applicationOfTheProduct;
  String? get sellingPriceOfProducts => _sellingPriceOfProducts;
  set sellingPriceOfProducts(String? sellingPriceOfProducts) =>
      _sellingPriceOfProducts = sellingPriceOfProducts;
  String? get analysisOfTheMarketSituation => _analysisOfTheMarketSituation;
  set analysisOfTheMarketSituation(String? analysisOfTheMarketSituation) =>
      _analysisOfTheMarketSituation = analysisOfTheMarketSituation;
  String? get theAmountOfDomesticProduction => _theAmountOfDomesticProduction;
  set theAmountOfDomesticProduction(String? theAmountOfDomesticProduction) =>
      _theAmountOfDomesticProduction = theAmountOfDomesticProduction;
  String? get landArea => _landArea;
  set landArea(String? landArea) => _landArea = landArea;
  String? get technicalKnowledge => _technicalKnowledge;
  set technicalKnowledge(String? technicalKnowledge) =>
      _technicalKnowledge = technicalKnowledge;
  String? get water => _water;
  set water(String? water) => _water = water;
  String? get fuel => _fuel;
  set fuel(String? fuel) => _fuel = fuel;
  String? get electricity => _electricity;
  set electricity(String? electricity) => _electricity = electricity;
  String? get typeOfEquipmentRequired => _typeOfEquipmentRequired;
  set typeOfEquipmentRequired(String? typeOfEquipmentRequired) =>
      _typeOfEquipmentRequired = typeOfEquipmentRequired;
  String? get typeAndAmountOfMajorRawMaterials =>
      _typeAndAmountOfMajorRawMaterials;
  set typeAndAmountOfMajorRawMaterials(
      String? typeAndAmountOfMajorRawMaterials) =>
      _typeAndAmountOfMajorRawMaterials = typeAndAmountOfMajorRawMaterials;
  String? get theMainSourceOfRawMaterials => _theMainSourceOfRawMaterials;
  set theMainSourceOfRawMaterials(String? theMainSourceOfRawMaterials) =>
      _theMainSourceOfRawMaterials = theMainSourceOfRawMaterials;
  String? get foreignExchangeCapital => _foreignExchangeCapital;
  set foreignExchangeCapital(String? foreignExchangeCapital) =>
      _foreignExchangeCapital = foreignExchangeCapital;
  String? get rialCapital => _rialCapital;
  set rialCapital(String? rialCapital) => _rialCapital = rialCapital;
  String? get currency => _currency;
  set currency(String? currency) => _currency = currency;
  int? get exchangeRate => _exchangeRate;
  set exchangeRate(int? exchangeRate) => _exchangeRate = exchangeRate;
  String? get workingCapital => _workingCapital;
  set workingCapital(String? workingCapital) =>
      _workingCapital = workingCapital;
  String? get totalCapital => _totalCapital;
  set totalCapital(String? totalCapital) => _totalCapital = totalCapital;
  String? get annualSales => _annualSales;
  set annualSales(String? annualSales) => _annualSales = annualSales;
  String? get paybackTime => _paybackTime;
  set paybackTime(String? paybackTime) => _paybackTime = paybackTime;

  PlanDTO.fromJson(Map<String, dynamic> json) {
    _planName = json['plan_name'];
    _yearOfPlanRegistrationDate = json['year_of_plan_registration_date'];
    _monthOfPlanRegistrationDate = json['month_of_plan_registration_date'];
    _dayOfPlanRegistrationDate = json['day_of_plan_registration_date'];
    _planCapacity = json['plan_capacity'];
    _directEmployment = json['Direct_employment'];
    _applicationOfTheProduct = json['Application_of_the_product'];
    _sellingPriceOfProducts = json['Selling_price_of_products'];
    _analysisOfTheMarketSituation = json['Analysis_of_the_market_situation'];
    _theAmountOfDomesticProduction = json['The_amount_of_domestic_production'];
    _landArea = json['land_area'];
    _technicalKnowledge = json['Technical_knowledge'];
    _water = json['water'];
    _fuel = json['fuel'];
    _electricity = json['electricity'];
    _typeOfEquipmentRequired = json['Type_of_equipment_required'];
    _typeAndAmountOfMajorRawMaterials =
    json['Type_and_amount_of_major_raw_materials'];
    _theMainSourceOfRawMaterials = json['The_main_source_of_raw_materials'];
    _foreignExchangeCapital = json['Foreign_exchange_capital'];
    _rialCapital = json['Rial_capital'];
    _currency = json['currency'];
    _exchangeRate = json['exchange_rate'];
    _workingCapital = json['working_capital'];
    _totalCapital = json['total_capital'];
    _annualSales = json['Annual_sales'];
    _paybackTime = json['Payback_time'];
    _imagePath = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_name'] = _planName;
    data['year_of_plan_registration_date'] = _yearOfPlanRegistrationDate;
    data['month_of_plan_registration_date'] = _monthOfPlanRegistrationDate;
    data['day_of_plan_registration_date'] = _dayOfPlanRegistrationDate;
    data['plan_capacity'] = _planCapacity;
    data['Direct_employment'] = _directEmployment;
    data['Application_of_the_product'] = _applicationOfTheProduct;
    data['Selling_price_of_products'] = _sellingPriceOfProducts;
    data['Analysis_of_the_market_situation'] =
        _analysisOfTheMarketSituation;
    data['The_amount_of_domestic_production'] =
        _theAmountOfDomesticProduction;
    data['land_area'] = _landArea;
    data['Technical_knowledge'] = _technicalKnowledge;
    data['water'] = _water;
    data['fuel'] = _fuel;
    data['electricity'] = _electricity;
    data['Type_of_equipment_required'] = _typeOfEquipmentRequired;
    data['Type_and_amount_of_major_raw_materials'] =
        _typeAndAmountOfMajorRawMaterials;
    data['The_main_source_of_raw_materials'] =
        _theMainSourceOfRawMaterials;
    data['Foreign_exchange_capital'] = _foreignExchangeCapital;
    data['Rial_capital'] = _rialCapital;
    data['currency'] = _currency;
    data['exchange_rate'] = _exchangeRate;
    data['working_capital'] = _workingCapital;
    data['total_capital'] = _totalCapital;
    data['Annual_sales'] = _annualSales;
    data['Payback_time'] = _paybackTime;
    data['image'] = _imagePath;
    return data;
  }
}