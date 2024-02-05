import 'package:dashboard/plan_data/plan.dart';
import 'package:flutter/material.dart';


class PlanView extends StatefulWidget {
  const PlanView({super.key, required this.plan});
  final PlanDTO plan;

  @override
  State<PlanView> createState() => _PlanViewState();
}

class _PlanViewState extends State<PlanView> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onHover: (value) {
        setState(() {
          isHovering = value;
        });
      },
      onTap: () {
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
                      child: Image.asset('assets/images/project.jpg')),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(widget.plan.planName??"no name", style: theme.textTheme.titleLarge?.copyWith(
                          foreground: Paint()..style = PaintingStyle.stroke..color = Colors.black..strokeWidth = 2,

                      ),),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Text(widget.plan.planName??"no name", style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                            shadows: [BoxShadow(
                                color: Colors.black,
                                offset: Offset(2,2),
                                blurRadius: 20,
                                spreadRadius: 20
                            )]
                        ),overflow: TextOverflow.ellipsis),
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
                    padding: const EdgeInsets.fromLTRB(20,0,20,10),
                    child: Text("تاریخ ثبت 1402/10/10", style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 25
                    ),),
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

