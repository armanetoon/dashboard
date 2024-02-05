import 'package:dashboard/pages/project_detail/large_project_detail.dart';
import 'package:dashboard/widgets/detail_texts.dart';
import 'package:flutter/material.dart';

class DashPlanShow extends StatelessWidget {
  const DashPlanShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height/1.2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30,20,30,5),
        child: ListView(
          children: [
            const LargeProjectDetail(),
            const DetailTexts(),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Column(
                  children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: const BoxDecoration(
                            color: Color(0xFF19CC56),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Center(
                          child: Text("ثبت تغییرات",style: theme.textTheme.titleLarge?.copyWith(
                              color: Colors.white
                          ),),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
