part of 'searchdefault_cubit.dart';

@immutable
sealed class SearchdefaultState {}

final class SearchdefaultInitial extends SearchdefaultState {}
final class SearchdefaultIoading extends SearchdefaultState {}
final class Searchdefaultloaded extends SearchdefaultState {}
final class SearchdefaultError extends SearchdefaultState {}
