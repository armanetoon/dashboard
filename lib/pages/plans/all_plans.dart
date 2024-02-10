import 'package:dashboard/pages/plans/new_plan.dart';
import 'package:dashboard/plan_data/bloc/get_all_plan_bloc.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dashboard/plan_data/repository/plan_repo.dart';
import 'package:dashboard/widgets/plan_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

OutlineInputBorder inputBorder2() {
  return const OutlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        color: Colors.white,
      ));
}


class DashAllPlans extends StatelessWidget {
  const DashAllPlans({super.key, required this.item, required this.plan});
  final ValueChanged<String> item;
  final ValueChanged<PlanDTO> plan;

  @override
  Widget build(BuildContext context) {
    ValueNotifier isVisible = ValueNotifier(false);
    TextEditingController _search = TextEditingController(text: "");
    ValueNotifier<String> _searchNotifier = ValueNotifier<String>('');
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
                child: Row(
                  children: [
                    ValueListenableBuilder(valueListenable: isVisible, builder: (context, value, child) {
                      if(value){
                        return SizedBox(
                          width: 200,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              label: const Text("جستجو"),
                                enabledBorder: inputBorder()),
                            controller: _search,
                            onChanged: (value) {
                              _searchNotifier.value = value;
                            },
                          ),
                        );
                      }
                      else{
                        return Container();
                      }
                    },),
                    const SizedBox(width: 5,),
                    const Icon(Icons.search,color: Color(0xFF3A94E7),size: 20),
                    const Text("جستجو",style: TextStyle(
                        color: Color(0xFF3A94E7),
                        fontSize: 20
                    ),)
                  ],
                ),
                onTap: () {
                  isVisible.value = !isVisible.value;
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
            child: SizedBox(
              height: MediaQuery.of(context).size.height/1.5,
              child: BlocBuilder<GetAllPlanBloc, GetAllPlanState>(
                builder: (context,GetAllPlanState state) {
                  if(state is GetAllPlanLoading){
                    return const Center(child: CircularProgressIndicator(),);
                  }else if(state is GetAllPlanFailure){
                    return Center(child: Text(state.message),);
                  }
                  else if(state is GetAllPlanSuccess){
                    return ValueListenableBuilder<String>(
                      builder: (BuildContext context, String value, Widget? child) {
                        final List<PlanDTO>plans;
                        if(_searchNotifier.value.isEmpty){
                          plans = state.plans;
                        }
                        else{
                          plans = state.plans.where((element) {
                            final val = value.trim().replaceAll(RegExp(r'\s+'), ' ');
                            return element.planName!.contains(val);
                          }).toList();
                        }
                        return GridView.builder(
                          shrinkWrap: true,
                          itemCount: plans.length,
                          gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 400,
                              childAspectRatio: 1,
                              crossAxisSpacing: 60,
                              mainAxisSpacing: 60),
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: PlanView(plan: plans[index], planValue: (PlanDTO value) {
                              plan(plans[index]);
                              item("plan");
                            },),);
                          },
                        );
                      }, valueListenable: _searchNotifier,
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
