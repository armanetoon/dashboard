import 'package:dashboard/pages/plans/all_plans.dart';
import 'package:dashboard/pages/plans/dash_plan.dart';
import 'package:dashboard/pages/plans/new_plan.dart';
import 'package:dashboard/pages/plans/plan_detail.dart';
import 'package:dashboard/pages/users/investor_view.dart';
import 'package:dashboard/pages/users/users_view.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dashboard/widgets/dashboard_drawer.dart';
import 'package:dashboard/widgets/dashboard_header.dart';
import 'package:flutter/material.dart';

class LargeDashboard extends StatelessWidget {
  LargeDashboard({super.key, required this.isDash});
  final ValueChanged<bool>isDash;
  final ValueNotifier<bool> _isDash = ValueNotifier(false);
  final ValueNotifier<String> selectItem = ValueNotifier(" ");
  final ValueNotifier<int> selectPlan = ValueNotifier(-1);
  final ValueNotifier<PlanDTO> plan = ValueNotifier(PlanDTO());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DashboardHeader(isdash: (value) {
            isDash(value);
            _isDash.value = value;
          },),
          ValueListenableBuilder(valueListenable: _isDash, builder: (context, value, child) {
            if(value){
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                          height: MediaQuery.of(context).size.height-80,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF9F9F9),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, blurRadius: 5)
                              ]),
                          child: DashboardDrawer(item: (value) {
                            selectItem.value = value;
                          }, select: selectItem.value,)
                      )),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20,left: 20),
                        child: rightView(context),
                      )
                  ),
                ],
              );
            }
            else{
              return rightView(context);
            }
          }),
        ],
      ),
    );
  }
  Widget rightView(BuildContext context){

    return Column(
      children: [
        ValueListenableBuilder(valueListenable: selectItem, builder: (context, value, child) {
          if(value == "change"){
            return const DashPlanShow();
          }
          else{
            return Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  color: const Color(0xFFF9F9F9),
                  child: pageReturn(value)
              ),
            );
          }
        },)
      ],
    );
  }
  Widget pageReturn(String type){
    if(type == "investor") {
      return InvestorView();
    }
    else if(type == "normal"){
      return UserView();
    }
    else if(type == "plans"){
      return DashAllPlans(item: (String value) {
        selectItem.value = value;
      }, plan: (PlanDTO value) {
        plan.value = value;
      },);
    }
    else if(type == "newPlan"){
      return NewPlan();
    }
    else if(type == "plan"){
      print(plan.value.planName);
      return PlanDetail(plan: plan.value);
    }
    return Container();
  }
}
