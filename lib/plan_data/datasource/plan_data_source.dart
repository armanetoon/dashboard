import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:dashboard/exception.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dio/dio.dart';

abstract class IPlanDataSource {
  Future<void> createPlan(PlanDTO plan);
  Future<String> getImage(FormData formData);
  Future<List<PlanDTO>> getAllPlan();
}

class PlanRemoteDateSource implements IPlanDataSource {
  final Dio httpClient;

  PlanRemoteDateSource({required this.httpClient});

  @override
  Future<void> createPlan(PlanDTO plan) async{
    try{
      await httpClient.post('/plan',data: plan.toJson());
    } on DioException catch (dioException){
      if (dioException.response != null){
        print(dioException.response!.statusCode);
        if(dioException.response!.statusCode == 403){
          throw NewPlanFailureExc();
        }
        else{
          throw ServerErrorExc();
        }
      }
    }
  }

  @override
  Future<List<PlanDTO>> getAllPlan() async{
    try{
      final response = await httpClient.get('/allPlans');
      List<PlanDTO> plans = [];
      if(response.data != null){
        for (var item in response.data){
          plans.add(PlanDTO.fromJson(item));
        }
      }
      return plans;
    } on DioException catch(dioException){
      if(dioException.response != null){
        if(dioException.response!.statusCode == 404){
          throw GetAllPlansNotFoundException();
        }
      }
    }
    catch(_){
      throw AppException();
    }
    throw UnimplementedError();
  }

  @override
  Future<String> getImage(FormData formData) async{
    try{
      final response = await httpClient.post('/plan/image',data: formData);
      return response.data;
    } on DioException catch(dioException){
      if (dioException.response!=null){
        if(dioException.response!.statusCode != 200){
          print(dioException.message);
          throw GetImageFailureExc();
        }
      }
    }
    return "";
  }
}
