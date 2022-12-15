// Helper file to make coverage work for all dart files\n
// ignore_for_file: unused_import, directives_ordering
import 'package:tag_sdk/tag_sdk.dart';
import 'package:tag_sdk/src/features/features.dart';
import 'package:tag_sdk/src/features/classroom/check_discipline_id.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/classroom_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/instructors_teaching_data_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/classroom_create_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/instructor_teaching_data_create_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/entities/update_instructor_teaching_data_entity.dart';
import 'package:tag_sdk/src/features/classroom/domain/usecases/update_classroom_usecase.dart';
import 'package:tag_sdk/src/features/classroom/domain/usecases/create_instructor_teaching_data_usecase.dart';
import 'package:tag_sdk/src/features/classroom/domain/usecases/update_instructor_teaching_data_usecase.dart';
import 'package:tag_sdk/src/features/classroom/domain/usecases/list_instructors_usecase.dart';
import 'package:tag_sdk/src/features/classroom/domain/usecases/list_instructors_teaching_data_usecase.dart';
import 'package:tag_sdk/src/features/classroom/domain/usecases/create_classroom_usecase.dart';
import 'package:tag_sdk/src/features/classroom/domain/usecases/delete_classroom_usecase.dart';
import 'package:tag_sdk/src/features/classroom/domain/usecases/list_classrooms_usecase.dart';
import 'package:tag_sdk/src/features/classroom/domain/repositories/classroom_repository.dart';
import 'package:tag_sdk/src/features/classroom/classroom_module.dart';
import 'package:tag_sdk/src/features/classroom/data/model/classroom_create_model.dart';
import 'package:tag_sdk/src/features/classroom/data/model/instructor_teaching_data_create_model.dart';
import 'package:tag_sdk/src/features/classroom/data/model/instructor_teaching_data_update_model.dart';
import 'package:tag_sdk/src/features/classroom/data/model/classroom_model.dart';
import 'package:tag_sdk/src/features/classroom/data/model/instructor_teaching_data_model.dart';
import 'package:tag_sdk/src/features/classroom/data/datasource/classroom_datasource.dart';
import 'package:tag_sdk/src/features/classroom/data/repositories/repositories.dart';
import 'package:tag_sdk/src/features/classroom/data/repositories/classroom_repository_impl.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/entities/edcenso_discipline.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/entities/entities.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/domain.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/usecases/list_disciplines_usecase.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/usecases/usecases.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/repositories/repositories.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/domain/repositories/edcenso_disciplines_repositories.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/data/datasources/edcenso_locations_remote_datasource.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/data/datasources/edcenso_locations_local_datasource.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/data/models/edcenso_discipline.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/data/repositories/edcenso_disciplines_repositories_impl.dart';
import 'package:tag_sdk/src/features/edcenso_disciplines/edcenso_disciplines_module.dart';
import 'package:tag_sdk/src/features/auth/domain/entities/auth_response.dart';
import 'package:tag_sdk/src/features/auth/domain/entities/user.dart';
import 'package:tag_sdk/src/features/auth/domain/entities/auth_login.dart';
import 'package:tag_sdk/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:tag_sdk/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:tag_sdk/src/features/auth/domain/usecases/verify_auth_usecase.dart';
import 'package:tag_sdk/src/features/auth/domain/usecases/update_user_info.dart';
import 'package:tag_sdk/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:tag_sdk/src/features/auth/auth_module.dart';
import 'package:tag_sdk/src/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:tag_sdk/src/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:tag_sdk/src/features/auth/data/models/auth_model.dart';
import 'package:tag_sdk/src/features/auth/data/models/user_model.dart';
import 'package:tag_sdk/src/features/auth/data/models/auth_login.dart';
import 'package:tag_sdk/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tag_sdk/src/features/teacher/domain/entities/instructor.dart';
import 'package:tag_sdk/src/features/teacher/domain/usecases/create_instructor_usecase.dart';
import 'package:tag_sdk/src/features/teacher/domain/usecases/list_teachers_usecase.dart';
import 'package:tag_sdk/src/features/teacher/domain/usecases/get_teachers_usecase.dart';
import 'package:tag_sdk/src/features/teacher/domain/usecases/update_instructor_usecase.dart';
import 'package:tag_sdk/src/features/teacher/domain/repositories/instructor_repository.dart';
import 'package:tag_sdk/src/features/teacher/data/datasources/local/local.dart';
import 'package:tag_sdk/src/features/teacher/data/datasources/local/teacher_local_datasource.dart';
import 'package:tag_sdk/src/features/teacher/data/datasources/remote/teacher_remote_datasource.dart';
import 'package:tag_sdk/src/features/teacher/data/models/instructor_model.dart';
import 'package:tag_sdk/src/features/teacher/data/repositories/teacher_repository_impl.dart';
import 'package:tag_sdk/src/features/teacher/teacher_module.dart';
import 'package:tag_sdk/src/features/student/domain/entities/resource.dart';
import 'package:tag_sdk/src/features/student/domain/entities/enrollment.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student.dart';
import 'package:tag_sdk/src/features/student/domain/entities/responsable.dart';
import 'package:tag_sdk/src/features/student/domain/entities/deficiency.dart';
import 'package:tag_sdk/src/features/student/domain/entities/filiation.dart';
import 'package:tag_sdk/src/features/student/domain/entities/student_documents.dart';
import 'package:tag_sdk/src/features/student/domain/usecases/load_student_usecase.dart';
import 'package:tag_sdk/src/features/student/domain/usecases/update_student_usecase.dart';
import 'package:tag_sdk/src/features/student/domain/usecases/load_student_docs_usecase.dart';
import 'package:tag_sdk/src/features/student/domain/usecases/update_student_enrollment_usecase.dart';
import 'package:tag_sdk/src/features/student/domain/usecases/create_documents_and_address.dart';
import 'package:tag_sdk/src/features/student/domain/usecases/load_student_enrollment_usecase.dart';
import 'package:tag_sdk/src/features/student/domain/usecases/list_student_usecase.dart';
import 'package:tag_sdk/src/features/student/domain/usecases/update_address_documents_usecase.dart';
import 'package:tag_sdk/src/features/student/domain/usecases/create_student_enrollment_usecase.dart';
import 'package:tag_sdk/src/features/student/domain/usecases/fast_enrollment_usecase.dart';
import 'package:tag_sdk/src/features/student/domain/usecases/create_student_usecase.dart';
import 'package:tag_sdk/src/features/student/domain/usecases/delete_student_usecase.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_repositories.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_doc_address_repositories.dart';
import 'package:tag_sdk/src/features/student/domain/repositories/student_enrollment_repositories.dart';
import 'package:tag_sdk/src/features/student/student_module.dart';
import 'package:tag_sdk/src/features/student/data/datasources/local/local.dart';
import 'package:tag_sdk/src/features/student/data/datasources/remote/student_remote_datasource.dart';
import 'package:tag_sdk/src/features/student/data/datasources/remote/student_doc_address_remote_datasource.dart';
import 'package:tag_sdk/src/features/student/data/datasources/remote/student_enrollment_remote_datasource.dart';
import 'package:tag_sdk/src/features/student/data/models/student_enrollment_model.dart';
import 'package:tag_sdk/src/features/student/data/models/student_docs_model.dart';
import 'package:tag_sdk/src/features/student/data/repositories/student_repository_impl.dart';
import 'package:tag_sdk/src/features/student/data/repositories/student_docs_addrs_repository_impl.dart';
import 'package:tag_sdk/src/features/student/data/repositories/student_enrollment_repository_impl.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/food.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/meal_component.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/entities.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/meal.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/meals_menu.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/ingredient.dart';
import 'package:tag_sdk/src/features/meals/domain/entities/inventory_ingredient.dart';
import 'package:tag_sdk/src/features/meals/domain/usecases/list_meals_menu_usecase.dart';
import 'package:tag_sdk/src/features/meals/domain/usecases/usecases.dart';
import 'package:tag_sdk/src/features/meals/domain/usecases/list_ingredients_stock_usecase.dart';
import 'package:tag_sdk/src/features/meals/domain/repositories/ingredient_repository.dart';
import 'package:tag_sdk/src/features/meals/domain/repositories/meals_menu_repository.dart';
import 'package:tag_sdk/src/features/meals/data/datasources/local/meals_menu_dumb_datasource.dart';
import 'package:tag_sdk/src/features/meals/data/datasources/local/local.dart';
import 'package:tag_sdk/src/features/meals/data/datasources/local/ingredient_dumb_datasource.dart';
import 'package:tag_sdk/src/features/meals/data/datasources/remote/meals_remote_datasource.dart';
import 'package:tag_sdk/src/features/meals/data/datasources/remote/remote.dart';
import 'package:tag_sdk/src/features/meals/data/datasources/remote/stock_remote_datasource.dart';
import 'package:tag_sdk/src/features/meals/data/models/food_menu_model.dart';
import 'package:tag_sdk/src/features/meals/data/models/component_model.dart';
import 'package:tag_sdk/src/features/meals/data/models/meal_model.dart';
import 'package:tag_sdk/src/features/meals/data/models/food_model.dart';
import 'package:tag_sdk/src/features/meals/data/models/ingredient_inventory.dart';
import 'package:tag_sdk/src/features/meals/data/models/ingredient_model.dart';
import 'package:tag_sdk/src/features/meals/data/models/models.dart';
import 'package:tag_sdk/src/features/meals/data/repositories/meals_menu_repository_impl.dart';
import 'package:tag_sdk/src/features/meals/data/repositories/repositories.dart';
import 'package:tag_sdk/src/features/meals/data/repositories/ingredient_repository_impl.dart';
import 'package:tag_sdk/src/features/meals/meals_module.dart';
import 'package:tag_sdk/src/features/meals/mappers/meal_menu_api_to_entity.dart';
import 'package:tag_sdk/src/features/meals/mappers/mappers.dart';
import 'package:tag_sdk/src/features/school/domain/entities/school.dart';
import 'package:tag_sdk/src/features/school/domain/usecases/show_school_usecase.dart';
import 'package:tag_sdk/src/features/school/domain/usecases/edit_school_usecase.dart';
import 'package:tag_sdk/src/features/school/domain/usecases/usecases.dart';
import 'package:tag_sdk/src/features/school/domain/usecases/list_schools_usecase.dart';
import 'package:tag_sdk/src/features/school/domain/repositories/school_repositories.dart';
import 'package:tag_sdk/src/features/school/school_module.dart';
import 'package:tag_sdk/src/features/school/data/datasources/school_remote_datasource.dart';
import 'package:tag_sdk/src/features/school/data/datasources/school_local_datasource.dart';
import 'package:tag_sdk/src/features/school/data/models/school_model.dart';
import 'package:tag_sdk/src/features/school/data/repositories/school_repository_impl.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/entities/edcenso_uf.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/entities/edcenso_city.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/usecases/list_ufs_usecase.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/usecases/list_cities_usecase.dart';
import 'package:tag_sdk/src/features/edcenso_locations/domain/repositories/edcenso_locations_repositories.dart';
import 'package:tag_sdk/src/features/edcenso_locations/edcenso_locations_module.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/datasources/edcenso_locations_remote_datasource.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/datasources/edcenso_locations_local_datasource.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/datasources/datasources.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/models/edcenso_uf_models.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/models/edcenso_city_model.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/models/models.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/data.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/repositories/repositories.dart';
import 'package:tag_sdk/src/features/edcenso_locations/data/repositories/edcenso_locations_repositories_impl.dart';
import 'package:tag_sdk/src/core/core.dart';
import 'package:tag_sdk/src/core/defaults/params.dart';
import 'package:tag_sdk/src/core/defaults/data_source.dart';
import 'package:tag_sdk/src/core/defaults/usecase.dart';
import 'package:tag_sdk/src/core/defaults/paginated_params.dart';
import 'package:tag_sdk/src/core/defaults/mapper.dart';
import 'package:tag_sdk/src/core/enums/scholarity_enum.dart';
import 'package:tag_sdk/src/core/enums/color_race_enum.dart';
import 'package:tag_sdk/src/core/enums/modalidades_enum.dart';
import 'package:tag_sdk/src/core/enums/previous_stage_situation_enum.dart';
import 'package:tag_sdk/src/core/enums/enums.dart';
import 'package:tag_sdk/src/core/enums/professor_tipo_enum.dart';
import 'package:tag_sdk/src/core/enums/nationality_enum.dart';
import 'package:tag_sdk/src/core/enums/current_stage_situation_enum.dart';
import 'package:tag_sdk/src/core/enums/sex_enum.dart';
import 'package:tag_sdk/src/core/enums/etapa_ensino_enum.dart';
import 'package:tag_sdk/src/core/enums/admission_type_enum.dart';
import 'package:tag_sdk/src/core/enums/stage_enum.dart';
import 'package:tag_sdk/src/core/enums/unified_class_enum.dart';
import 'package:tag_sdk/src/core/enums/professor_cargo_enum.dart';
import 'package:tag_sdk/src/core/enums/mediacao_enum.dart';
import 'package:tag_sdk/src/core/enums/filliation_type_enum.dart';
import 'package:tag_sdk/src/core/api/student_docs/post_student_docs_endpoint.dart';
import 'package:tag_sdk/src/core/api/student_docs/put_student_docs_endpoint.dart';
import 'package:tag_sdk/src/core/api/student_docs/student_docs.dart';
import 'package:tag_sdk/src/core/api/student_docs/get_student_docs_endpoint.dart';
import 'package:tag_sdk/src/core/api/food_inventory/get_food_inventory_endpoint.dart';
import 'package:tag_sdk/src/core/api/food_menu/get_food_menu_endpoint.dart';
import 'package:tag_sdk/src/core/api/api.dart';
import 'package:tag_sdk/src/core/api/classroom/delete_classroom_endpoint.dart';
import 'package:tag_sdk/src/core/api/classroom/get_edcenso_disciplines_endpoint.dart';
import 'package:tag_sdk/src/core/api/classroom/post_classroom_endpoint.dart';
import 'package:tag_sdk/src/core/api/classroom/classroom.dart';
import 'package:tag_sdk/src/core/api/classroom/put_classroom_endpoint.dart';
import 'package:tag_sdk/src/core/api/classroom/get_classroom_endpoint.dart';
import 'package:tag_sdk/src/core/api/instructor/put_instructor_endpoint.dart';
import 'package:tag_sdk/src/core/api/instructor/put_instructor_teaching_data_endpoint.dart';
import 'package:tag_sdk/src/core/api/instructor/get_instructor_endpoint.dart';
import 'package:tag_sdk/src/core/api/instructor/create_instructor_teaching_data_endpoint.dart';
import 'package:tag_sdk/src/core/api/instructor/get_instructors_endpoint.dart';
import 'package:tag_sdk/src/core/api/instructor/post_instructor_endpoint.dart';
import 'package:tag_sdk/src/core/api/instructor/get_instructors_teaching_data_endpoint.dart';
import 'package:tag_sdk/src/core/api/instructor/instructor.dart';
import 'package:tag_sdk/src/core/api/auth/post_auth_login.dart';
import 'package:tag_sdk/src/core/api/auth/auth.dart';
import 'package:tag_sdk/src/core/api/users/get_users_endpoint.dart';
import 'package:tag_sdk/src/core/api/school/post_school_endpoint.dart';
import 'package:tag_sdk/src/core/api/school/get_school_endpoint.dart';
import 'package:tag_sdk/src/core/api/school/put_school_endpoint.dart';
import 'package:tag_sdk/src/core/api/school/get_schools_endpoint.dart';
import 'package:tag_sdk/src/core/api/school/dto/school_update.dto.dart';
import 'package:tag_sdk/src/core/api/edcenso_city/get_edcenso_city_endpoint.dart';
import 'package:tag_sdk/src/core/api/edcenso_city/get_edcenso_uf_endpoint.dart';
import 'package:tag_sdk/src/core/api/students/get_students_endpoint.dart';
import 'package:tag_sdk/src/core/api/students/delete_students_endpoint.dart';
import 'package:tag_sdk/src/core/api/students/post_students_endpoint.dart';
import 'package:tag_sdk/src/core/api/students/students.dart';
import 'package:tag_sdk/src/core/api/students/put_students_endpoint.dart';
import 'package:tag_sdk/src/core/api/student_enrollment/student_enrollment.dart';
import 'package:tag_sdk/src/core/api/student_enrollment/put_student_enrollment_endpoint.dart';
import 'package:tag_sdk/src/core/api/student_enrollment/get_student_enrollment_endpoint.dart';
import 'package:tag_sdk/src/core/api/student_enrollment/post_student_enrollment_endpoint.dart';

// ignore: no-empty-block
void main() {}