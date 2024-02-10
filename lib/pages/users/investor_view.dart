import 'package:dashboard/constants/theme.dart';
import 'package:dashboard/plan_data/bloc/get_investor_plan_bloc.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dashboard/plan_data/repository/plan_repo.dart';
import 'package:dashboard/user_data/bloc/user_bloc.dart';
import 'package:dashboard/user_data/repository/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvestorView extends StatefulWidget {
  InvestorView({super.key});
  int currentPage = 1;
  int totalUser = -1;

  @override
  State<InvestorView> createState() => _InvestorViewState();
}

class _InvestorViewState extends State<InvestorView> {
  @override
  Widget build(BuildContext context) {

    Future<void> _showAlertDialog(BuildContext context,String number) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return BlocProvider(
            create: (BuildContext context) {
              final bloc = GetInvestorPlanBloc(planRepository)..add(GetInvestorPlanClicked(number: number));
              return bloc;
            },
            child: AlertDialog(
              title: const Text("طرح های سرمایه گذاری شده"),
              content: SizedBox(
                width: MediaQuery.of(context).size.width/3,
                height: MediaQuery.of(context).size.height/2,
                child: BlocBuilder<GetInvestorPlanBloc, GetInvestorPlanState>(
                  builder: (context, GetInvestorPlanState state) {
                    if(state is GetInvestorPlanSuccess){
                      return ListView.builder(itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(state.plans[index].planName??""),
                                    Text("${state.plans[index].yearOfPlanRegistrationDate}/${state.plans[index].monthOfPlanRegistrationDate}/${state.plans[index].dayOfPlanRegistrationDate}")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },itemCount: state.plans.length);
                    }
                    else if(state is GetInvestorPlanLoading){
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    else if(state is GetInvestorPlanFailed){
                      return Center(child: Text(state.message),);
                    }
                    else {
                      return Text("salam");
                    }
                  }
                ),
              )
            ),
          );
        },
      );
    }
    
    final theme = Theme.of(context);
    return BlocProvider(
      create: (BuildContext context) {
        final bloc = UserBloc(userRepository)
          ..add(GetAllUserClicked(normal: false));

        return bloc;
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<UserBloc, UserState>(
            builder: (context, UserState state) {
              if (state is GetAllUserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetAllUserSuccess) {
                widget.totalUser = state.users.length;
                return Column(
                  children: [
                    Row(
                      children: [
                        Text("لیست سرمایه گذاران",
                            style: theme.textTheme.titleLarge),
                        const Expanded(child: SizedBox()),
                        Text(
                          "تعداد کل ${state.users.length}  نفر",
                          style: const TextStyle(
                              fontSize: 20, color: LightTheme.primary),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Color(0xFFB7B7B7),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text("نام", style: theme.textTheme.titleLarge),
                        ),
                        Expanded(
                            flex: 4,
                            child: Text("نام خانوادگی",
                                style: theme.textTheme.titleLarge)),
                        Expanded(
                            flex: 3,
                            child: Text("شماره موبایل",
                                style: theme.textTheme.titleLarge)),
                        Expanded(
                          flex: 5,
                          child: Text("ایمیل", style: theme.textTheme
                              .titleLarge),
                        ),
                          const Expanded(
                            flex: 3,
                            child: SizedBox(),
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.6,
                      child:
                      ListView.separated(
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(state.users[index +
                                          (widget.currentPage - 1) * 10]
                                          .firstName!,
                                          style: theme.textTheme.labelLarge),
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Text(state.users[index +
                                            (widget.currentPage - 1) * 10]
                                            .lastName!,
                                            style: theme.textTheme.labelLarge)),
                                    Expanded(
                                        flex: 3,
                                        child: Text(state.users[index +
                                            (widget.currentPage - 1) * 10]
                                            .phoneNumber!,
                                            style: theme.textTheme.labelLarge)),
                                    Expanded(
                                      flex: 5,
                                      child: Text(state.users[index +
                                          (widget.currentPage - 1) * 10].email!,
                                          style: theme.textTheme.labelLarge),
                                    ),
                                      Expanded(
                                          flex: 3,
                                          child: InkWell(
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0xFF3A94E7),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                              child: const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        8.0),
                                                    child: Text(
                                                      "مشاهده طرح سرمایه گذاری",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  )),
                                            ),
                                            onTap: () {
                                              _showAlertDialog(context,state.users[index +
                                                  (widget.currentPage - 1) * 10].phoneNumber??"0");
                                            },
                                          ))
                                  ],
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: Color(0xFFB7B7B7),
                                )
                              ],
                            );
                          },
                          itemCount: widget.totalUser -
                              (widget.currentPage - 1) * 10 > 9 ? 10 : widget
                              .totalUser - (widget.currentPage - 1) * 10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (widget.currentPage > 1) {
                                  setState(() {
                                    widget.currentPage--;
                                  });
                                }
                              });
                            }, icon: const Icon(Icons.chevron_left)),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              color: Color(0xFF3A94E7),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))),
                          child: Center(
                            child: Text("${widget.currentPage}",
                                style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              if (widget.totalUser > 0) {
                                print(widget.totalUser);
                                if (widget.totalUser -
                                    (widget.currentPage - 1) * 10 > 9) {
                                  setState(() {
                                    widget.currentPage++;
                                  });
                                }
                              }
                            }, icon: const Icon(Icons.chevron_right)),
                      ],
                    )
                  ],
                );
              }
              else {
                return const Center(
                  child: Text("دریافت کاربران با مشکل مواجه شده است"),
                );
              }
            }
        ),
      ),
    );
  }
}