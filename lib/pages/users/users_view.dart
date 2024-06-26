import 'package:dashboard/constants/theme.dart';
import 'package:dashboard/user_data/bloc/user_bloc.dart';
import 'package:dashboard/user_data/repository/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends StatefulWidget {
  UserView({super.key});
  int currentPage = 1;
  int totalUser = -1;

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (BuildContext context) {
        final bloc = UserBloc(userRepository)
          ..add(GetAllUserClicked(normal: true));
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
                        Text("لیست کاربران عادی",
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

                      /*BlocBuilder<UserBloc,UserState>(
                        builder: (context, UserState state) {

                          if(state is GetAllUserSuccess){


                          }
                        }
                    ),*/
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