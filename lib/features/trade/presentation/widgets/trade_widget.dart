import 'package:catan_gui_flutter/features/auth/cubit/authentication_cubit.dart';
import 'package:catan_gui_flutter/features/game/cubit/game_cubit.dart';
import 'package:catan_gui_flutter/features/trade/cubit/trade_cubit.dart';
import 'package:catan_gui_flutter/features/trade/presentation/widgets/resource_count_arrange_widget.dart';
import 'package:catan_gui_flutter/gen/assets.gen.dart';
import 'package:catan_gui_flutter/widgets/cat_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class TradeWidget extends StatefulWidget {
  const TradeWidget({super.key});

  @override
  State<TradeWidget> createState() => _TradeWidgetState();
}

class _TradeWidgetState extends State<TradeWidget> {
  int wantHills = 0;
  int wantForest = 0;
  int wantMountains = 0;
  int wantFields = 0;
  int wantPasture = 0;

  int giveHills = 0;
  int giveForest = 0;
  int giveMountains = 0;
  int giveFields = 0;
  int givePasture = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxSize = constraints.maxWidth > constraints.maxHeight
          ? constraints.maxHeight
          : constraints.maxWidth;
      maxSize = maxSize * 3;

      return BlocProvider(
        create: (context) => TradeCubit(),
        child: BlocBuilder<GameCubit, GameState>(
          builder: (context, state) {
            if (state is! GameLoaded) {
              return Center(
                  child: SizedBox(
                width: maxSize * 0.25,
                height: maxSize * 0.25,
                child: CircularProgressIndicator(
                  strokeWidth: maxSize * 0.01,
                  color: Colors.orange.shade100,
                ),
              ));
            }

            final trade = state.gameStateModel.trade;
            final turnUser = state.gameStateModel.turnUser;
            final me =
                (GetIt.I.get<AuthenticationCubit>().state as LoggedIn).user;

            final isMe = turnUser.id == me.id;
            final isThereTrade = trade != null;

            final userState = state.userStates
                .firstWhere((element) => element.user.id == me.id);

            final availableNumberOfBricks = userState.numberOfBricks;
            final availableNumberOfLumber = userState.numberOfLumber;
            final availableNumberOfOre = userState.numberOfOre;
            final availableNumberOfGrain = userState.numberOfGrain;
            final availableNumberOfWool = userState.numberOfWool;

            if (isMe) {
              return Container(
                padding: EdgeInsets.all(maxSize * 0.02),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Want',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black, fontSize: maxSize * 0.02)),
                    SizedBox(
                      width: maxSize * 0.5,
                      height: maxSize * 0.05,
                      child: Row(
                        children: [
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: isThereTrade ? trade.wantHills : wantHills,
                            maxCount: 100,
                            resourceIcon: Assets.images.hills.image(),
                            onMinusPressed: () {
                              setState(() {
                                wantHills = wantHills <= 0 ? 0 : wantHills - 1;
                              });
                            },
                            onPlusPressed: () {
                              setState(() {
                                wantHills++;
                              });
                            },
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: isThereTrade ? trade.wantForest : wantForest,
                            maxCount: 100,
                            resourceIcon: Assets.images.forest.image(),
                            onMinusPressed: () {
                              setState(() {
                                wantForest =
                                    wantForest <= 0 ? 0 : wantForest - 1;
                              });
                            },
                            onPlusPressed: () {
                              setState(() {
                                wantForest++;
                              });
                            },
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: isThereTrade
                                ? trade.wantMountains
                                : wantMountains,
                            maxCount: 100,
                            resourceIcon: Assets.images.mountains.image(),
                            onMinusPressed: () {
                              setState(() {
                                wantMountains =
                                    wantMountains <= 0 ? 0 : wantMountains - 1;
                              });
                            },
                            onPlusPressed: () {
                              setState(() {
                                wantMountains++;
                              });
                            },
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: isThereTrade ? trade.wantFields : wantFields,
                            maxCount: 100,
                            resourceIcon: Assets.images.fields.image(),
                            onMinusPressed: () {
                              setState(() {
                                wantFields =
                                    wantFields <= 0 ? 0 : wantFields - 1;
                              });
                            },
                            onPlusPressed: () {
                              setState(() {
                                wantFields++;
                              });
                            },
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count:
                                isThereTrade ? trade.wantPasture : wantPasture,
                            maxCount: 100,
                            resourceIcon: Assets.images.pasture.image(),
                            onMinusPressed: () {
                              setState(() {
                                wantPasture =
                                    wantPasture <= 0 ? 0 : wantPasture - 1;
                              });
                            },
                            onPlusPressed: () {
                              setState(() {
                                wantPasture++;
                              });
                            },
                          )),
                        ],
                      ),
                    ),
                    Text('Give',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black, fontSize: maxSize * 0.02)),
                    SizedBox(
                      width: maxSize * 0.5,
                      height: maxSize * 0.05,
                      child: Row(
                        children: [
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: isThereTrade ? trade.giveHills : giveHills,
                            maxCount: availableNumberOfBricks,
                            resourceIcon: Assets.images.hills.image(),
                            onMinusPressed: () {
                              setState(() {
                                giveHills = giveHills <= 0 ? 0 : giveHills - 1;
                              });
                            },
                            onPlusPressed: () {
                              setState(() {
                                giveHills++;
                              });
                            },
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: isThereTrade ? trade.giveForest : giveForest,
                            maxCount: availableNumberOfLumber,
                            resourceIcon: Assets.images.forest.image(),
                            onMinusPressed: () {
                              setState(() {
                                giveForest =
                                    giveForest <= 0 ? 0 : giveForest - 1;
                              });
                            },
                            onPlusPressed: () {
                              setState(() {
                                giveForest++;
                              });
                            },
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: isThereTrade
                                ? trade.giveMountains
                                : giveMountains,
                            maxCount: availableNumberOfOre,
                            resourceIcon: Assets.images.mountains.image(),
                            onMinusPressed: () {
                              setState(() {
                                giveMountains =
                                    giveMountains <= 0 ? 0 : giveMountains - 1;
                              });
                            },
                            onPlusPressed: () {
                              setState(() {
                                giveMountains++;
                              });
                            },
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: isThereTrade ? trade.giveFields : giveFields,
                            maxCount: availableNumberOfGrain,
                            resourceIcon: Assets.images.fields.image(),
                            onMinusPressed: () {
                              setState(() {
                                giveFields =
                                    giveFields <= 0 ? 0 : giveFields - 1;
                              });
                            },
                            onPlusPressed: () {
                              setState(() {
                                giveFields++;
                              });
                            },
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count:
                                isThereTrade ? trade.givePasture : givePasture,
                            maxCount: availableNumberOfWool,
                            resourceIcon: Assets.images.pasture.image(),
                            onMinusPressed: () {
                              setState(() {
                                givePasture =
                                    givePasture <= 0 ? 0 : givePasture - 1;
                              });
                            },
                            onPlusPressed: () {
                              setState(() {
                                givePasture++;
                              });
                            },
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: maxSize * 0.02),
                    isThereTrade
                        ? CATElevatedButton(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.orange.shade100,
                            onPressed: () {
                              context
                                  .read<TradeCubit>()
                                  .cancelTradeOffer(gameId: state.game.id);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Cancel Trade",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: maxSize * 0.02),
                              ),
                            ),
                          )
                        : CATElevatedButton(
                            backgroundColor: Colors.orange.shade500,
                            foregroundColor: Colors.orange.shade100,
                            onPressed: () {
                              context.read<TradeCubit>().createTradeOffer(
                                    gameId: state.game.id,
                                    wantHills: wantHills,
                                    wantForest: wantForest,
                                    wantMountains: wantMountains,
                                    wantFields: wantFields,
                                    wantPasture: wantPasture,
                                    giveHills: giveHills,
                                    giveForest: giveForest,
                                    giveMountains: giveMountains,
                                    giveFields: giveFields,
                                    givePasture: givePasture,
                                  );

                              setState(() {
                                wantHills = 0;
                                wantForest = 0;
                                wantMountains = 0;
                                wantFields = 0;
                                wantPasture = 0;

                                giveHills = 0;
                                giveForest = 0;
                                giveMountains = 0;
                                giveFields = 0;
                                givePasture = 0;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "Ask",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: maxSize * 0.02),
                              ),
                            ),
                          ),
                  ],
                ),
              );
            } else {
              if (!isThereTrade) return const SizedBox.shrink();

              final wantHills = trade.wantHills;
              final wantForest = trade.wantForest;
              final wantMountains = trade.wantMountains;
              final wantFields = trade.wantFields;
              final wantPasture = trade.wantPasture;

              final giveHills = trade.giveHills;
              final giveForest = trade.giveForest;
              final giveMountains = trade.giveMountains;
              final giveFields = trade.giveFields;
              final givePasture = trade.givePasture;

              return Container(
                padding: EdgeInsets.all(maxSize * 0.02),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Want',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black, fontSize: maxSize * 0.02)),
                    SizedBox(
                      width: maxSize * 0.5,
                      height: maxSize * 0.05,
                      child: Row(
                        children: [
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: wantHills,
                            maxCount: 100,
                            resourceIcon: Assets.images.hills.image(),
                            onMinusPressed: () {},
                            onPlusPressed: () {},
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: wantForest,
                            maxCount: 100,
                            resourceIcon: Assets.images.forest.image(),
                            onMinusPressed: () {},
                            onPlusPressed: () {},
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: wantMountains,
                            maxCount: 100,
                            resourceIcon: Assets.images.mountains.image(),
                            onMinusPressed: () {},
                            onPlusPressed: () {},
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: wantFields,
                            maxCount: 100,
                            resourceIcon: Assets.images.fields.image(),
                            onMinusPressed: () {},
                            onPlusPressed: () {},
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: wantPasture,
                            maxCount: 100,
                            resourceIcon: Assets.images.pasture.image(),
                            onMinusPressed: () {},
                            onPlusPressed: () {},
                          )),
                        ],
                      ),
                    ),
                    Text('Give',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black, fontSize: maxSize * 0.02)),
                    SizedBox(
                      width: maxSize * 0.5,
                      height: maxSize * 0.05,
                      child: Row(
                        children: [
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: giveHills,
                            maxCount: 100,
                            resourceIcon: Assets.images.hills.image(),
                            onMinusPressed: () {},
                            onPlusPressed: () {},
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: giveForest,
                            maxCount: 100,
                            resourceIcon: Assets.images.forest.image(),
                            onMinusPressed: () {},
                            onPlusPressed: () {},
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: giveMountains,
                            maxCount: 100,
                            resourceIcon: Assets.images.mountains.image(),
                            onMinusPressed: () {},
                            onPlusPressed: () {},
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: giveFields,
                            maxCount: 100,
                            resourceIcon: Assets.images.fields.image(),
                            onMinusPressed: () {},
                            onPlusPressed: () {},
                          )),
                          SizedBox(width: maxSize * 0.02),
                          Expanded(
                              child: ResourceCountArrangeWidget(
                            canBeChanged: !isThereTrade,
                            count: givePasture,
                            maxCount: 100,
                            resourceIcon: Assets.images.pasture.image(),
                            onMinusPressed: () {},
                            onPlusPressed: () {},
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: maxSize * 0.02),
                    CATElevatedButton(
                      backgroundColor: Colors.orange.shade500,
                      foregroundColor: Colors.orange.shade100,
                      onPressed: availableNumberOfBricks >= trade.wantHills &&
                              availableNumberOfLumber >= trade.wantForest &&
                              availableNumberOfOre >= trade.wantMountains &&
                              availableNumberOfGrain >= trade.wantFields &&
                              availableNumberOfWool >= trade.wantPasture
                          ? () {
                              context.read<TradeCubit>().acceptTradeOffer(
                                    gameId: state.game.id,
                                    userId: me.id,
                                  );
                            }
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Accept",
                          style: TextStyle(
                              color: Colors.black, fontSize: maxSize * 0.02),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      );
    });
  }
}
