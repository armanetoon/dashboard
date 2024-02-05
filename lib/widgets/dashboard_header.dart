import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  DashboardHeader({super.key, required this.isdash});
  final ValueChanged<bool> isdash;
  bool situation = false;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)]),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 8, bottom: 8),
        child: Row(
          children: [
            IconButton(onPressed: () {
              situation = !situation;
              isdash(situation);
            }, icon: const Icon(Icons.menu)),
            const SizedBox(
              width: 8,
            ),
            Text("پنل مديریت",style: theme.textTheme.titleLarge),

          ],
        ),
      ),
    );
  }
}
