import 'package:dartz/dartz.dart';
import '../../../../core/errors/fauilers.dart';
import '../entities/agents_entity.dart';

abstract class AgentsRepository{
  Future<Either<Failure,Agents>> getAgents();


}