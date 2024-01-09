part of 'trade_cubit.dart';

sealed class TradeState extends Equatable {
  const TradeState();

  @override
  List<Object> get props => [];
}

final class TradeInitial extends TradeState {}
