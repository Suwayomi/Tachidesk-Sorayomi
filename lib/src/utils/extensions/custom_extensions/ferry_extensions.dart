part of '../custom_extensions.dart';

extension FerryExtensions on Client {
  Stream<T?> fetch<T, TData, TVars>(
    OperationRequest<TData, TVars> request, [
    T? Function(TData)? converter,
    forward,
  ]) =>
      this.request(request, forward).map((event) {
        TData? data = event.data;
        if (event.hasErrors) {
          if (event.linkException != null) {
            throw event.linkException!;
          } else {
            throw GraphQlException(event.graphqlErrors!);
          }
        }
        return data != null ? converter?.call(data) : null;
      });
}

class GraphQlException implements Exception {
  final List<GraphQLError> errors;

  GraphQlException(this.errors);

  @override
  String toString() => "GraphQlExceptions(errors: $errors)";
}
