import 'dart:html';

import 'package:dashboard/helpers/httpclient.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dashboard/plan_data/datasource/plan_data_source.dart';
import 'package:dio/dio.dart';

final PlanRemoteRepository planRepository = PlanRemoteRepository(
    dataSource: PlanRemoteDateSource(httpClient: httpClient));

abstract class IPlanRepository {
  Future<void> createPlan(PlanDTO plan);
  Future<void> deletePlan(PlanDTO plan);
  Future<String> getImage(FormData formData);
  Future<List<PlanDTO>> getAllPlan();
  Future<void> updatePlan(Map<String,dynamic> changes);
  Future<List<PlanDTO>> getInvestorPlan(String number);
}

class PlanRemoteRepository implements IPlanRepository {
  final IPlanDataSource dataSource;

  PlanRemoteRepository({required this.dataSource});


  @override
  Future<void> createPlan(PlanDTO plan) {
    return dataSource.createPlan(plan);
  }

  @override
  Future<List<PlanDTO>> getAllPlan() {
    return dataSource.getAllPlan();
    throw UnimplementedError();
  }

  @override
  Future<String> getImage(FormData formData) {
    return dataSource.getImage(formData);
    throw UnimplementedError();
  }

  @override
  Future<void> deletePlan(PlanDTO plan) {
    return dataSource.deletePlan(plan);
    throw UnimplementedError();
  }

  @override
  Future<void> updatePlan(Map<String, dynamic> changes) {
    return dataSource.updatePlan(changes);
    throw UnimplementedError();
  }

  @override
  Future<List<PlanDTO>> getInvestorPlan(String number) {
    return dataSource.getInvestorPlan(number);
    throw UnimplementedError();
  }
}
