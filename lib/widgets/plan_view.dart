import 'dart:async';
import 'package:dashboard/plan_data/bloc/delete_plan_bloc.dart';
import 'package:dashboard/plan_data/plan.dart';
import 'package:dashboard/plan_data/repository/plan_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanView extends StatefulWidget {
  const PlanView({super.key, required this.plan, required this.planValue});
  final ValueChanged<PlanDTO> planValue;
  final PlanDTO plan;

  @override
  State<PlanView> createState() => _PlanViewState();
}

class _PlanViewState extends State<PlanView> {
  bool isHovering = false;
  StreamSubscription<DeletePlanState>? subscription;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Future<void> _showAlertDialog(BuildContext context, PlanDTO plan) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return BlocProvider(
            create: (BuildContext context) {
              final bloc = DeletePlanBloc(planRepository);
              subscription = bloc.stream.listen((state) {
                if (state is DeletePlanFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ));
                } else if (state is DeletePlanSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("طرح با موفقیت پاک شد"),
                    backgroundColor: Colors.green,
                  ));
                }
              });
              return bloc;
            },
            child: AlertDialog(
              title: Text('حذف "${plan.planName}"'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                        'آیا می خواهید طرح "${plan.planName}" را حذف کنید؟ '),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('خیر', style: TextStyle(color: Colors.green)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                BlocBuilder<DeletePlanBloc, DeletePlanState>(
                  builder: (context,DeletePlanState state) {
                    return TextButton(
                      child: const Text('بله', style: TextStyle(color: Colors.red)),
                      onPressed: () {
                        BlocProvider.of<DeletePlanBloc>(context)
                            .add(DeletePlanClicked(plan: plan));
                        Navigator.of(context).pop();
                      },
                    );
                  }
                ),

              ],
            ),
          );
        },
      );
    }

    return InkWell(
      onLongPress: () {_showAlertDialog(context,widget.plan);},
      onHover: (value) {
        setState(() {
          isHovering = value;
        });
      },
      onTap: () {
        widget.planValue(widget.plan);
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              boxShadow: isHovering
                  ? const [BoxShadow(color: Colors.grey, blurRadius: 10)]
                  : null),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: Image.network("C:\\Users\\Lenovo\\Desktop\\server\\images\\${widget.plan.imagePath!}")),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        widget.plan.planName ?? "no name",
                        style: theme.textTheme.titleLarge?.copyWith(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..color = Colors.black
                            ..strokeWidth = 2,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Text(widget.plan.planName ?? "no name",
                            style: theme.textTheme.titleLarge
                                ?.copyWith(color: Colors.white, shadows: [
                              const BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 20,
                                  spreadRadius: 20)
                            ]),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                ],
              ),
              /* Row(
                children: [

                  const Expanded(child: SizedBox())
                ],
              ),*/
              const Expanded(child: SizedBox()),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Text(
                      "تاریخ ثبت ${widget.plan.yearOfPlanRegistrationDate}/${widget.plan.monthOfPlanRegistrationDate}/${widget.plan.dayOfPlanRegistrationDate}",
                      style:
                          theme.textTheme.labelLarge?.copyWith(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

