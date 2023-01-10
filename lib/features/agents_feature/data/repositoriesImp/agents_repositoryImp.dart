import 'package:dartz/dartz.dart';
import 'package:final_project/core/errors/fauilers.dart';
import 'package:final_project/features/agents_feature/data/datasources/agents_remote_data_source.dart';
import 'package:final_project/features/agents_feature/domain/entities/agents_entity.dart';
import 'package:final_project/features/agents_feature/domain/repositories/agents_repository.dart';

import '../../../../core/app_network/network_info.dart';

class AgentsRepositoryImp implements AgentsRepository{
  final NetworkInfo networkInfo;
  AgentsRemoteDataSource agentsRemoteDataSource;

  AgentsRepositoryImp({
    required this.agentsRemoteDataSource,
    required this.networkInfo
});


  @override
  Future<Either<Failure, Agents>> getAgents() {
    // TODO: implement getAgents
    throw UnimplementedError();
  }


}