import 'package:auth_module/src/features/data/datasource/datasource_user.dart';
import 'package:auth_module/src/features/domain/repositories/repository_user.dart';
import 'package:auth_module/src/features/domain/usecases/usecase_user.dart';



final $userUsecase = UsecaseUser(RepositoryUser(DatasourceUser()));