import 'dart:convert';
import '../../nucleus_one_dart_sdk.dart';
import '../api_model/project_permissions.dart' as api_mod;
import '../api_model/project_packages.dart' as api_mod;
import '../http.dart' as http;
import '../nucleus_one.dart';

class NucleusOneAppProjects with NucleusOneAppDependent {
  NucleusOneAppProjects({
    required NucleusOneAppInternal app,
  }) {
    this.app = app;
  }

  /// Gets project permissions for the current user.
  ///
  /// [projectId] The project id.
  Future<ProjectPermissions> getPermissions(String projectId) async {
    if (projectId.isEmpty) {
      throw ArgumentError.value(projectId, 'projectId', 'Value cannot be blank.');
    }

    final qp = http.StandardQueryParams.get();

    final responseBody = await http.executeGetRequestWithTextResponse(
      http.apiPaths.tenantPermissionsFormat.replaceFirst('<tenantId>', projectId),
      app,
      query: qp,
    );

    final apiModel = api_mod.ProjectPermissions.fromJson(jsonDecode(responseBody));
    return ProjectPermissions.fromApiModel(apiModel);
  }

  /// Gets project packages for the current user.
  Future<ProjectPackageCollection> getPackages() async {
    final qp = http.StandardQueryParams.get();

    final responseBody = await http.executeGetRequestWithTextResponse(
      http.apiPaths.tenantPackagesForCurrentUser,
      app,
      query: qp,
    );

    final apiModel = api_mod.ProjectPackageCollection.fromJson(jsonDecode(responseBody));
    return ProjectPackageCollection.fromApiModel(apiModel);
  }
}
