import 'package:dashboard/constants/theme.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key, required this.normalUser}) : super(key: key);
  final bool normalUser;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text(normalUser ? "لیست کاربران عادی" : "لیست سرمایه گذاران",
                  style: theme.textTheme.titleLarge),
              const Expanded(child: SizedBox()),
              const Text(
                "تعداد کل   نفر",
                style: TextStyle(fontSize: 20, color: LightTheme.primary),
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
                  child:
                      Text("نام خانوادگی", style: theme.textTheme.titleLarge)),
              Expanded(
                  flex: 3,
                  child:
                      Text("شماره موبایل", style: theme.textTheme.titleLarge)),
              Expanded(
                flex: 5,
                child: Text("ایمیل", style: theme.textTheme.titleLarge),
              ),
              if (!normalUser)
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
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.separated(
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
                            child:
                                Text("نام", style: theme.textTheme.labelLarge),
                          ),
                          Expanded(
                              flex: 4,
                              child: Text("نام خانوادگی",
                                  style: theme.textTheme.labelLarge)),
                          Expanded(
                              flex: 3,
                              child: Text("09876543210",
                                  style: theme.textTheme.labelLarge)),
                          Expanded(
                            flex: 5,
                            child: Text("Example@Example.com",
                                style: theme.textTheme.labelLarge),
                          ),
                          if (!normalUser)
                            Expanded(
                                flex: 3,
                                child: InkWell(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF3A94E7),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: const Center(
                                        child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "مشاهده طرح سرمایه گذاری",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )),
                                  ),
                                  onTap: () {

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
                itemCount: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.chevron_left)),
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: Color(0xFF3A94E7),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: const Center(
                  child: Text("1",style: TextStyle(
                    color: Colors.white
                  )),
                ),
              ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.chevron_right)),
            ],
          )
        ],
      ),
    );
  }
}
