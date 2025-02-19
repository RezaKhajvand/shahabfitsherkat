part of 'shagerd_bloc.dart';

@immutable
sealed class ShagerdEvent {}

final class FetchShagerdEvent extends ShagerdEvent {
  final bool? khosusi;
  final bool? monqzi;
  final String searchText;

  FetchShagerdEvent({
    this.khosusi,
    this.monqzi,
    this.searchText = '',
  });
}

final class DeleteShagerdEvent extends ShagerdEvent {
  final Shagerd shagerd;
  DeleteShagerdEvent({required this.shagerd});
}

final class CreateShagerdEvent extends ShagerdEvent {
  final Shagerd shagerd;
  CreateShagerdEvent({required this.shagerd});
}
