import 'package:fpdart/fpdart.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:models/failures/failure.dart';
import 'package:jobs_pot/main.dart';
import 'package:jobs_pot/system/domain/repositories/system_respository_interface.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:models/entities/authentication/refresh_token_response/resfresh_token_response_entity.dart';
import 'package:network/network.dart';

class SytemRepository implements SystemRepositoryInterface {
  late ApiClient _apiClient;

  SytemRepository() {
    _apiClient =
        appProvider.read(apiControllerProvider.notifier).getAppApiClient();
  }

  @override
  Future<Either<Failure, RefreshTokenResponseEntity>> refreshToken(
      String refreshToken) async {
    try {
      final Map<String, dynamic> body = {
        ApiParameterKeyName.refreshTokenSnake: refreshToken,
      };
      final refreshTokenRes = await _apiClient.refreshToken(body);

      return right(RefreshTokenResponseEntity.fromJson(refreshTokenRes));
    } catch (error) {
      return left(const Failure.empty());
    }
  }
}
