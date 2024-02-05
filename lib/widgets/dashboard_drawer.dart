import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({super.key, required this.item, required this.select});
  final ValueChanged<String> item;
  final String select;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> _select = ValueNotifier(select);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: const Row(
                children: [Icon(Icons.people), Text("کاربرها")],
              ),
              children: [
                InkWell(
                  child: Row(
                    children: [
                      ValueListenableBuilder(valueListenable: _select, builder: (context, value, child) {
                        return Text("عادی",
                            style: theme.textTheme.titleMedium
                                ?.copyWith(color: value == "normal"?const Color(0xFF3A94E7):Colors.black));
                      },)

                    ],
                  ),
                  onTap: () {
                    item("normal");
                    _select.value = "normal";
                  },
                ),
                const SizedBox(height: 10,),
                InkWell(
                  child:
                  Row(
                    children: [
                      ValueListenableBuilder(valueListenable: _select, builder: (context, value, child) {
                        return Text("سرمایه گذار", style: theme.textTheme.titleMedium
                            ?.copyWith(color: value == "investor"?const Color(0xFF3A94E7):Colors.black));
                      },)

                    ],
                  ),
                  onTap: () {
                    item("investor");
                    _select.value = "investor";
                  },
                )
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(title: const Row(
              children: [Icon(Icons.text_snippet), Text("طرح ها")],
            ),
              children: [
                InkWell(
                  child: Row(
                    children: [
                      ValueListenableBuilder(valueListenable: _select, builder: (context, value, child) {
                        return Text("لیست طرح ها",
                            style: theme.textTheme.titleMedium
                                ?.copyWith(color: value == "plans"?const Color(0xFF3A94E7):Colors.black));
                      },)

                    ],
                  ),
                  onTap: () {
                    item("plans");
                    _select.value = "plans";
                  },
                ),
                const SizedBox(height: 10,),
                InkWell(
                  child:
                  Row(
                    children: [
                      ValueListenableBuilder(valueListenable: _select, builder: (context, value, child) {
                        return Text("ایجاد طرح جدید", style: theme.textTheme.titleMedium
                            ?.copyWith(color: value == "newPlan"?const Color(0xFF3A94E7):Colors.black));
                      },)

                    ],
                  ),
                  onTap: () {
                    item("newPlan");
                    _select.value = "newPlan";
                  },
                )
              ],),
          )
        ],
      ),
    );
  }
}



