part of 'Search_cubit.dart';

@immutable
sealed class Search_state {}

final class SearchInitial extends Search_state {}

final class StartSearch extends Search_state {}

final class SearchDone extends Search_state {}

final class SearchError extends Search_state {}
