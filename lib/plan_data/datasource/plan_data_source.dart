import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:dashboard/exception.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dio/dio.dart';

abstract class IPlanDataSource {
  Future<void> createPlan(PlanDTO plan);

  Future<void> deletePlan(PlanDTO plan);

  Future<List<PlanDTO>> getInvestorPlan(String number);

  Future<void> updatePlan(Map<String,dynamic> changes);
  
  Future<String> getImage(FormData formData);

  Future<List<PlanDTO>> getAllPlan();
}

class PlanRemoteDateSource implements IPlanDataSource {
  final Dio httpClient;

  PlanRemoteDateSource({required this.httpClient});

  @override
  Future<void> createPlan(PlanDTO plan) async {
    try {
      await httpClient.post('/plan', data: plan.toJson());
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        print(dioException.response!.statusCode);
        if (dioException.response!.statusCode == 403) {
          throw NewPlanFailureExc();
        }
        else {
          throw ServerErrorExc();
        }
      }
    }
  }

  @override
  Future<List<PlanDTO>> getAllPlan() async {
    try {
      final response = await httpClient.get('/allPlans');
      List<PlanDTO> plans = [];
      if (response.data != null) {
        for (var item in response.data) {
          plans.add(PlanDTO.fromJson(item));
        }
      }
      return plans;
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode == 404) {
          throw GetAllPlansNotFoundException();
        }
      }
    }
    catch (_) {
      throw AppException();
    }
    throw UnimplementedError();
  }

  @override
  Future<String> getImage(FormData formData) async {
    try {
      final response = await httpClient.post('/plan/image', data: formData);
      return response.data;
    } on DioException catch (dioException) {
      if (dioException.response != null) {
        if (dioException.response!.statusCode != 200) {
          throw GetImageFailureExc();
        }
      }
    }
    return "";
  }

  @override
  Future<void> deletePlan(PlanDTO plan) async {
    try {
      await httpClient.delete('/DeletePlan', data: {
        'plan_name': plan.planName,
        'year_of_plan_registration_date': plan.yearOfPlanRegistrationDate,
        'month_of_plan_registration_date' : plan.monthOfPlanRegistrationDate,
        'day_of_plan_registration_date' : plan.dayOfPlanRegistrationDate
      });
    }on DioException catch(dioException){
      if(dioException.response != null){
        if(dioException.response!.statusCode != 200){
          throw DeletePlanExc();
        }
      }
    }
  }

  @override
  Future<void> updatePlan(Map<String, dynamic> changes) async{
    try{
      final res = await httpClient.put('/UpdatePlan', data: changes);
    }on DioException catch(dioException){
      if (dioException.response != null){
        if(dioException.response!.statusCode == 500){
          throw UpdateUserNotFoundExc();
        }
        else if(dioException.response!.statusCode != 200){
          throw UpdateUserFailureExc();
        }
      }
    }
  }

  @override
  Future<List<PlanDTO>> getInvestorPlan(String number)async {
    try{
      final response = await httpClient.post('/GetInvestor_Plans',data: {'phone_number':number});
      List<PlanDTO> plans = [];
      if (response.data != null) {
        for (var item in response.data) {
          plans.add(PlanDTO.fromJson(item));
        }
      }
      return plans;
    }on DioException catch(dioException){
      if(dioException.response != null){
        if(dioException.response!.statusCode == 404){
          throw GetInvestorPlanNotFoundExc();
        }
        else if(dioException.response!.statusCode != 200){
          throw GetInvestorPlanExc();
        }
      }
    }
    List<PlanDTO> plans = [];
    return plans;
  }
}
