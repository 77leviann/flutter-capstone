import 'package:dio/dio.dart';

class ChallengeErrorHelper {
  static String tryGetUserChallenge(int? statusCode) {
    switch (statusCode) {
      case 401:
        return 'Anda belum melakukan login. Silakan login terlebih dahulu.';
      case 404:
        return 'Data challenge tidak ditemukan. Silahkan ikuti challenge terlebih dahulu.';
      default:
        return 'Terjadi kesalahan (Status Code: $statusCode).';
    }
  }

  static String catchGetUserChallenge(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      return tryGetUserChallenge(
        e.response!.statusCode,
      );
    } else {
      return 'Koneksi internet tidak tersedia. Silahkan periksa koneksi Anda dan coba lagi.';
    }
  }
}