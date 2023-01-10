import 'package:dio/dio.dart';
import 'package:final_project/features/agents_feature/data/models/agents_model.dart';

import '../../../../core/app_network/cache_helper.dart';
import '../../../../core/errors/exceptions.dart';

abstract class AgentsRemoteDataSource{
  Future <AgentsModel> getAgents();


}
class AgentsRemoteImp implements AgentsRemoteDataSource {
  final Dio dio;
  AgentsRemoteImp({
    required this.dio
  });
  @override
  Future<AgentsModel> getAgents()async {

    Response response=await dio.get('https://aseel.sirius-it.dev/api/users/all',
        options: Options(
            headers: {
              'Authorization':'Bearer ${SharedPrefs().token}'
            }
        )
    );
    // if(response.statusCode==200){
    //   AgentsModel   agents=AgentsModel.fromJson((response.data));
    //   print(agents.data.length);
    //   print(agents);
    //   return agents;
    //
    // }else{
    //   throw ServerException();
    // }

    throw ServerException();
  }
}