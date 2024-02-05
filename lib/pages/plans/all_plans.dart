import 'package:dashboard/plan_data/bloc/get_all_plan_bloc.dart';
import 'package:dashboard/plan_data/repository/plan_repo.dart';
import 'package:dashboard/widgets/plan_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class DashAllPlans extends StatelessWidget {
  DashAllPlans({super.key});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(create: (BuildContext context) {
      final bloc = GetAllPlanBloc(planRepository)..add(GetAllPlanClicked());
      return bloc;
    },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20,20,20,12),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Text("لیست طرح ها",style: theme.textTheme.titleLarge),
              InkWell(
                child: const Row(
                  children: [
                    Icon(Icons.search,color: Color(0xFF3A94E7),size: 20),
                    Text("جستجو",style: TextStyle(
                        color: Color(0xFF3A94E7),
                        fontSize: 20
                    ),)
                  ],
                ),
                onTap: () {

                },
              )
            ],),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: MediaQuery.of(context).size.height/1.5,
              child: BlocBuilder<GetAllPlanBloc, GetAllPlanState>(
                builder: (context,GetAllPlanState state) {
                  if(state is GetAllPlanLoading){
                    return const Center(child: CircularProgressIndicator(),);
                  }else if(state is GetAllPlanFailure){
                    return Center(child: Text(state.message),);
                  }
                  else if(state is GetAllPlanSuccess){
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: state.plans.length,
                      gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          childAspectRatio: 1,
                          crossAxisSpacing: 60,
                          mainAxisSpacing: 60),
                      itemBuilder: (context, index) {
                        return PlanView(plan: state.plans[index]);
                      },
                    );
                  } else if(state is GetAllPlanNotFound){
                    return Center(child: Text(state.message),);
                  } else{
                    throw();
                  }
                }
              ),
            ),
          ),
        ],
      ),

    );
  }
}
