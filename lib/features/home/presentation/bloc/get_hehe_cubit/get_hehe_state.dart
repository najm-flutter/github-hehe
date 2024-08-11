part of 'get_hehe_cubit.dart';

enum GetHeheStatus {
  init,
  loading,
  success,
  onReadyToSend ,
  noTReadyToSend
}

final class GetHeheState extends Equatable {
  final GetHeheStatus status;
  final String message;

  const GetHeheState({
    this.status = GetHeheStatus.init,
    this.message = '',
  });

  GetHeheState copyWith({
    GetHeheStatus? status,
    String? message,
  }) {
    return GetHeheState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, message];
}