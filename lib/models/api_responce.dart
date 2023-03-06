class ApiResponse<T> {
  Status status;
  T? data;
  String? message;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.success(this.data) : status = Status.SUCCESS;

  ApiResponse.failure(this.message) : status = Status.FAILURE;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

// ignore: constant_identifier_names
enum Status { LOADING, SUCCESS, FAILURE }
