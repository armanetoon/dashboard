import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LargeProjectDetail extends StatelessWidget {
  const LargeProjectDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'نام طرح',
                style: theme.textTheme.headlineMedium!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/project1.jpg',
                        width: MediaQuery.of(context).size.width * 0.4,
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  Flexible(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 0.77,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
                        decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceVariant,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [BoxShadow(color: Colors.grey)]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('ظرفیت طرح'),
                                Icon(
                                  CupertinoIcons.circle_filled,
                                  color: Colors.white38,
                                  size: 8,
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('اشتغال مستقیم'),
                                Icon(
                                  CupertinoIcons.circle_filled,
                                  color: Colors.white38,
                                  size: 8,
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('زمان بازگشت سرمایه'),
                                Icon(
                                  CupertinoIcons.circle_filled,
                                  color: Colors.white38,
                                  size: 8,
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('مساحت زمین'),
                                Icon(
                                  CupertinoIcons.circle_filled,
                                  color: Colors.white38,
                                  size: 8,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        theme.colorScheme.primaryContainer),
                                child: const Text(
                                  'سرمایه گذاری در این طرح',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
