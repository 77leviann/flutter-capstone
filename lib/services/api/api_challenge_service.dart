import 'package:dio/dio.dart';
import 'package:greeve/models/api_responses/get_user_challenge_response_model.dart';
import 'package:greeve/utils/constants/api_constant.dart';
import 'package:greeve/utils/helpers/challenge_error_helper.dart';

class ApiChallengeService {
  final Dio _dio = Dio();

  Future<GetUserChallengeResponseModel> getUserChallenge(String token) async {
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      final response = await _dio.get(
        ApiConstant.userChallenge,
        options: options,
      );
      if (response.statusCode == 200) {
        return GetUserChallengeResponseModel.fromJson(response.data);
      } else {
        throw ChallengeErrorHelper.tryGetUserChallenge(response.statusCode);
      }
    } on DioException catch (e) {
      throw ChallengeErrorHelper.catchGetUserChallenge(e);
    }
  }
}
