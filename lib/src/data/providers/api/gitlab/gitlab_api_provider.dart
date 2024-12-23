import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../models/merge_request_model.dart';

part 'gitlab_api_provider.g.dart';

@RestApi()
abstract class GitLabApiProvider {
  factory GitLabApiProvider(Dio dio, {String baseUrl}) = _GitLabApiProvider;

  @GET('/api/v4/projects/{projectId}/merge_requests')
  Future<List<MergeRequestModel>> fetchLastMergedRequests({
    @Path('projectId') required String projectId,
    @Query('state') String state = 'merged',
    @Query('per_page') int perPage = 100,
    @Query('page') int page = 1,
    @Query('order_by') String orderBy = 'updated_at',
    @Query('sort') String sort = 'desc',
  });
}
