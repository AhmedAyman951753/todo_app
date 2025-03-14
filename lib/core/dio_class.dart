import 'package:dio/dio.dart';

class DioHelper {
  // Private static instance of the class
  static final DioHelper _instance = DioHelper._internal();

  // Dio instance
  late final Dio dio;

  // Private constructor
  DioHelper._internal() {
    // Initialize Dio with base options
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://nti-production.up.railway.app/api/',
        connectTimeout: const Duration(seconds: 10), // Connection timeout
        receiveTimeout: const Duration(seconds: 10), // Receive timeout
        headers: {
          'Content-Type': 'application/json', // Default headers
        },
      ),
    );

    // Add interceptors (optional)
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // You can modify the request here (e.g., add auth tokens)
          print('Request: ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // You can modify the response here
          print('Response: ${response.statusCode}');
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          // Handle errors globally
          print('Error: ${error.message}');
          return handler.next(error);
        },
      ),
    );
  }

  // Public factory constructor to access the instance
  factory DioHelper() {
    return _instance;
  }

  // Example GET request
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(path, queryParameters: queryParameters);
  }

  // Example POST request
  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return await dio.post(path, data: data, queryParameters: queryParameters);
  }

  // Example PUT request
  Future<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters}) async {
    return await dio.put(path, data: data, queryParameters: queryParameters);
  }

  // Example DELETE request
  Future<Response> delete(String path, {Map<String, dynamic>? queryParameters}) async {
    return await dio.delete(path, queryParameters: queryParameters);
  }
}