import 'package:catan_gui_flutter/features/leaderboard/cubit/leaderboard_cubit.dart';
import 'package:catan_gui_flutter/features/leaderboard/models/graph_easy_interval.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/widgets/cat_choice_chip.dart';
import 'package:catan_gui_flutter/widgets/cat_scaffold.dart';
import 'package:catan_gui_flutter/widgets/simple_paginated_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  DateTime _startDate =
      DateTime.now().subtract(const Duration(days: 30)).toUtc();
  DateTime _endDate = DateTime.now().toUtc();

  GraphEasyInterval _graphEasyInterval = GraphEasyInterval.last30Days;

  final _leaderboardCubit = LeaderboardCubit();

  @override
  void initState() {
    super.initState();

    _getLeaderbord();
  }

  void _getLeaderbord() {
    _leaderboardCubit.getLeaderboard(
        startDate: _startDate, endDate: _endDate, pageSize: 10, pageNo: 0);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;

      return BlocProvider.value(
        value: _leaderboardCubit,
        child: CATScaffold(
          body: Stack(fit: StackFit.expand, children: [
            Assets.images.catanBackground.image(fit: BoxFit.cover),
            Padding(
                padding: EdgeInsets.all(maxSize * 0.05),
                child: Container(
                    padding: EdgeInsets.all(maxSize * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: maxSize * 0.1,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                FittedBox(
                                  child: IconButton(
                                    color: Colors.orange.shade100,
                                    icon: const Icon(Icons.arrow_back_rounded),
                                    onPressed: () {
                                      context.pop();
                                    },
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: maxSize * 0.05,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // FittedBox(
                                //   child: CATChoiceChip(
                                //     label: 'Custom',
                                //     isSelected: _graphEasyInterval ==
                                //         GraphEasyInterval.custom,
                                //     onSelected: (value) {
                                //       setState(() {
                                //         _graphEasyInterval =
                                //             GraphEasyInterval.custom;
                                //       });
                                //     },
                                //   ),
                                // ),
                                // SizedBox(width: maxSize * 0.01),
                                FittedBox(
                                  child: CATChoiceChip(
                                    label: 'Last 24 Hours',
                                    isSelected: _graphEasyInterval ==
                                        GraphEasyInterval.last24Hours,
                                    onSelected: (value) {
                                      setState(() {
                                        _graphEasyInterval =
                                            GraphEasyInterval.last24Hours;
                                        _startDate = DateTime.now()
                                            .subtract(const Duration(hours: 24))
                                            .toUtc();
                                        _endDate = DateTime.now().toUtc();
                                      });
                                      _getLeaderbord();
                                    },
                                  ),
                                ),
                                SizedBox(width: maxSize * 0.01),
                                FittedBox(
                                  child: CATChoiceChip(
                                    label: 'Last 7 Days',
                                    isSelected: _graphEasyInterval ==
                                        GraphEasyInterval.last7Days,
                                    onSelected: (value) {
                                      setState(() {
                                        _graphEasyInterval =
                                            GraphEasyInterval.last7Days;
                                        _startDate = DateTime.now()
                                            .subtract(const Duration(days: 7))
                                            .toUtc();

                                        _endDate = DateTime.now().toUtc();
                                      });
                                      _getLeaderbord();
                                    },
                                  ),
                                ),
                                SizedBox(width: maxSize * 0.01),
                                FittedBox(
                                  child: CATChoiceChip(
                                    label: 'Last 30 Days',
                                    isSelected: _graphEasyInterval ==
                                        GraphEasyInterval.last30Days,
                                    onSelected: (value) {
                                      setState(() {
                                        _graphEasyInterval =
                                            GraphEasyInterval.last30Days;
                                        _startDate = DateTime.now()
                                            .subtract(const Duration(days: 30))
                                            .toUtc();
                                        _endDate = DateTime.now().toUtc();
                                      });
                                      _getLeaderbord();
                                    },
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(height: maxSize * 0.05),
                        Expanded(
                          child:
                              BlocBuilder<LeaderboardCubit, LeaderboardState>(
                            builder: (context, state) {
                              if (state is! LeaderboardLoaded) {
                                return Center(
                                  child: SizedBox(
                                    height: maxSize * 0.25,
                                    width: maxSize * 0.25,
                                    child: CircularProgressIndicator(
                                      color: Colors.orange.shade100,
                                    ),
                                  ),
                                );
                              }

                              final userWithPoints = state.usersWithPoints;

                              return ListView(
                                children: [
                                  Container(
                                    width: maxSize,
                                    padding: EdgeInsets.all(maxSize * 0.05),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: SimplePaginatedTable(
                                        headers: [
                                          SimplePaginatedTableHeader(
                                              child: Text('User',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orange.shade100))),
                                          SimplePaginatedTableHeader(
                                              child: Text('Points',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orange.shade100))),
                                        ],
                                        itemCount: userWithPoints.length,
                                        itemTotal: userWithPoints.length,
                                        itemBuilder: ((
                                            {required columnIndex,
                                            required rowIndex}) {
                                          final userWithPoint =
                                              userWithPoints[rowIndex];

                                          switch (columnIndex) {
                                            case 0:
                                              return Text(
                                                  "${userWithPoint.user.firstName} ${userWithPoint.user.lastName}",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orange.shade100));
                                            case 1:
                                              return Row(
                                                children: [
                                                  SizedBox(
                                                      height: maxSize * 0.025,
                                                      child: Assets.icons.points
                                                          .image()),
                                                  SizedBox(
                                                      width: maxSize * 0.01),
                                                  Text(
                                                      userWithPoint.points
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.orange
                                                              .shade100)),
                                                ],
                                              );
                                            default:
                                              return const SizedBox.shrink();
                                          }
                                        }),
                                        onPageChanged: (newPage) {},
                                        onPageSizeChanged: (newPageSize) {}),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    )))
          ]),
        ),
      );
    });
  }
}
