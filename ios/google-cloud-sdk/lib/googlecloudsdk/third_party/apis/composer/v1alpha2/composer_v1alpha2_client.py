"""Generated client library for composer version v1alpha2."""
# NOTE: This file is autogenerated and should not be edited by hand.

from __future__ import absolute_import

from apitools.base.py import base_api
from googlecloudsdk.third_party.apis.composer.v1alpha2 import composer_v1alpha2_messages as messages


class ComposerV1alpha2(base_api.BaseApiClient):
  """Generated client library for service composer version v1alpha2."""

  MESSAGES_MODULE = messages
  BASE_URL = 'https://composer.googleapis.com/'
  MTLS_BASE_URL = 'https://composer.mtls.googleapis.com/'

  _PACKAGE = 'composer'
  _SCOPES = ['https://www.googleapis.com/auth/cloud-platform']
  _VERSION = 'v1alpha2'
  _CLIENT_ID = '1042881264118.apps.googleusercontent.com'
  _CLIENT_SECRET = 'x_Tw5K8nnjoRAqULM9PFAC2b'
  _USER_AGENT = 'google-cloud-sdk'
  _CLIENT_CLASS_NAME = 'ComposerV1alpha2'
  _URL_VERSION = 'v1alpha2'
  _API_KEY = None

  def __init__(self, url='', credentials=None,
               get_credentials=True, http=None, model=None,
               log_request=False, log_response=False,
               credentials_args=None, default_global_params=None,
               additional_http_headers=None, response_encoding=None):
    """Create a new composer handle."""
    url = url or self.BASE_URL
    super(ComposerV1alpha2, self).__init__(
        url, credentials=credentials,
        get_credentials=get_credentials, http=http, model=model,
        log_request=log_request, log_response=log_response,
        credentials_args=credentials_args,
        default_global_params=default_global_params,
        additional_http_headers=additional_http_headers,
        response_encoding=response_encoding)
    self.projects_locations_environments_dags_dagRuns_taskInstances = self.ProjectsLocationsEnvironmentsDagsDagRunsTaskInstancesService(self)
    self.projects_locations_environments_dags_dagRuns = self.ProjectsLocationsEnvironmentsDagsDagRunsService(self)
    self.projects_locations_environments_dags_tasks = self.ProjectsLocationsEnvironmentsDagsTasksService(self)
    self.projects_locations_environments_dags = self.ProjectsLocationsEnvironmentsDagsService(self)
    self.projects_locations_environments = self.ProjectsLocationsEnvironmentsService(self)
    self.projects_locations_imageVersions = self.ProjectsLocationsImageVersionsService(self)
    self.projects_locations_operations = self.ProjectsLocationsOperationsService(self)
    self.projects_locations = self.ProjectsLocationsService(self)
    self.projects = self.ProjectsService(self)

  class ProjectsLocationsEnvironmentsDagsDagRunsTaskInstancesService(base_api.BaseApiService):
    """Service class for the projects_locations_environments_dags_dagRuns_taskInstances resource."""

    _NAME = 'projects_locations_environments_dags_dagRuns_taskInstances'

    def __init__(self, client):
      super(ComposerV1alpha2.ProjectsLocationsEnvironmentsDagsDagRunsTaskInstancesService, self).__init__(client)
      self._upload_configs = {
          }

    def List(self, request, global_params=None):
      r"""Lists task instances for a specified DAG run.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsDagsDagRunsTaskInstancesListRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (ListTaskInstancesResponse) The response message.
      """
      config = self.GetMethodConfig('List')
      return self._RunMethod(
          config, request, global_params=global_params)

    List.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}/dags/{dagsId}/dagRuns/{dagRunsId}/taskInstances',
        http_method='GET',
        method_id='composer.projects.locations.environments.dags.dagRuns.taskInstances.list',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=['pageSize', 'pageToken'],
        relative_path='v1alpha2/{+parent}/taskInstances',
        request_field='',
        request_type_name='ComposerProjectsLocationsEnvironmentsDagsDagRunsTaskInstancesListRequest',
        response_type_name='ListTaskInstancesResponse',
        supports_download=False,
    )

  class ProjectsLocationsEnvironmentsDagsDagRunsService(base_api.BaseApiService):
    """Service class for the projects_locations_environments_dags_dagRuns resource."""

    _NAME = 'projects_locations_environments_dags_dagRuns'

    def __init__(self, client):
      super(ComposerV1alpha2.ProjectsLocationsEnvironmentsDagsDagRunsService, self).__init__(client)
      self._upload_configs = {
          }

    def Get(self, request, global_params=None):
      r"""Retrieves a DAG run.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsDagsDagRunsGetRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (DagRun) The response message.
      """
      config = self.GetMethodConfig('Get')
      return self._RunMethod(
          config, request, global_params=global_params)

    Get.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}/dags/{dagsId}/dagRuns/{dagRunsId}',
        http_method='GET',
        method_id='composer.projects.locations.environments.dags.dagRuns.get',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1alpha2/{+name}',
        request_field='',
        request_type_name='ComposerProjectsLocationsEnvironmentsDagsDagRunsGetRequest',
        response_type_name='DagRun',
        supports_download=False,
    )

    def List(self, request, global_params=None):
      r"""Lists DAG runs of a DAG.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsDagsDagRunsListRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (ListDagRunsResponse) The response message.
      """
      config = self.GetMethodConfig('List')
      return self._RunMethod(
          config, request, global_params=global_params)

    List.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}/dags/{dagsId}/dagRuns',
        http_method='GET',
        method_id='composer.projects.locations.environments.dags.dagRuns.list',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=['pageSize', 'pageToken'],
        relative_path='v1alpha2/{+parent}/dagRuns',
        request_field='',
        request_type_name='ComposerProjectsLocationsEnvironmentsDagsDagRunsListRequest',
        response_type_name='ListDagRunsResponse',
        supports_download=False,
    )

  class ProjectsLocationsEnvironmentsDagsTasksService(base_api.BaseApiService):
    """Service class for the projects_locations_environments_dags_tasks resource."""

    _NAME = 'projects_locations_environments_dags_tasks'

    def __init__(self, client):
      super(ComposerV1alpha2.ProjectsLocationsEnvironmentsDagsTasksService, self).__init__(client)
      self._upload_configs = {
          }

    def List(self, request, global_params=None):
      r"""Lists tasks of a DAG.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsDagsTasksListRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (ListTasksResponse) The response message.
      """
      config = self.GetMethodConfig('List')
      return self._RunMethod(
          config, request, global_params=global_params)

    List.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}/dags/{dagsId}/tasks',
        http_method='GET',
        method_id='composer.projects.locations.environments.dags.tasks.list',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=['pageSize', 'pageToken'],
        relative_path='v1alpha2/{+parent}/tasks',
        request_field='',
        request_type_name='ComposerProjectsLocationsEnvironmentsDagsTasksListRequest',
        response_type_name='ListTasksResponse',
        supports_download=False,
    )

  class ProjectsLocationsEnvironmentsDagsService(base_api.BaseApiService):
    """Service class for the projects_locations_environments_dags resource."""

    _NAME = 'projects_locations_environments_dags'

    def __init__(self, client):
      super(ComposerV1alpha2.ProjectsLocationsEnvironmentsDagsService, self).__init__(client)
      self._upload_configs = {
          }

    def Get(self, request, global_params=None):
      r"""Retrieves a DAG.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsDagsGetRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Dag) The response message.
      """
      config = self.GetMethodConfig('Get')
      return self._RunMethod(
          config, request, global_params=global_params)

    Get.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}/dags/{dagsId}',
        http_method='GET',
        method_id='composer.projects.locations.environments.dags.get',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1alpha2/{+name}',
        request_field='',
        request_type_name='ComposerProjectsLocationsEnvironmentsDagsGetRequest',
        response_type_name='Dag',
        supports_download=False,
    )

    def List(self, request, global_params=None):
      r"""Lists DAGs in an environment.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsDagsListRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (ListDagsResponse) The response message.
      """
      config = self.GetMethodConfig('List')
      return self._RunMethod(
          config, request, global_params=global_params)

    List.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}/dags',
        http_method='GET',
        method_id='composer.projects.locations.environments.dags.list',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=['pageSize', 'pageToken'],
        relative_path='v1alpha2/{+parent}/dags',
        request_field='',
        request_type_name='ComposerProjectsLocationsEnvironmentsDagsListRequest',
        response_type_name='ListDagsResponse',
        supports_download=False,
    )

    def ListStats(self, request, global_params=None):
      r"""List DAGs with statistics for a given time interval.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsDagsListStatsRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (ListDagStatsResponse) The response message.
      """
      config = self.GetMethodConfig('ListStats')
      return self._RunMethod(
          config, request, global_params=global_params)

    ListStats.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}/dags:listStats',
        http_method='GET',
        method_id='composer.projects.locations.environments.dags.listStats',
        ordered_params=['environment'],
        path_params=['environment'],
        query_params=['interval_endTime', 'interval_startTime', 'pageSize', 'pageToken'],
        relative_path='v1alpha2/{+environment}/dags:listStats',
        request_field='',
        request_type_name='ComposerProjectsLocationsEnvironmentsDagsListStatsRequest',
        response_type_name='ListDagStatsResponse',
        supports_download=False,
    )

    def Trigger(self, request, global_params=None):
      r"""Trigger a DAG run.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsDagsTriggerRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (DagRun) The response message.
      """
      config = self.GetMethodConfig('Trigger')
      return self._RunMethod(
          config, request, global_params=global_params)

    Trigger.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}/dags/{dagsId}:trigger',
        http_method='POST',
        method_id='composer.projects.locations.environments.dags.trigger',
        ordered_params=['dag'],
        path_params=['dag'],
        query_params=[],
        relative_path='v1alpha2/{+dag}:trigger',
        request_field='triggerDagRequest',
        request_type_name='ComposerProjectsLocationsEnvironmentsDagsTriggerRequest',
        response_type_name='DagRun',
        supports_download=False,
    )

  class ProjectsLocationsEnvironmentsService(base_api.BaseApiService):
    """Service class for the projects_locations_environments resource."""

    _NAME = 'projects_locations_environments'

    def __init__(self, client):
      super(ComposerV1alpha2.ProjectsLocationsEnvironmentsService, self).__init__(client)
      self._upload_configs = {
          }

    def CheckUpgrade(self, request, global_params=None):
      r"""Check if an upgrade operation on the environment will succeed. In case of problems detailed info can be found in the returned Operation.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsCheckUpgradeRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Operation) The response message.
      """
      config = self.GetMethodConfig('CheckUpgrade')
      return self._RunMethod(
          config, request, global_params=global_params)

    CheckUpgrade.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}:checkUpgrade',
        http_method='POST',
        method_id='composer.projects.locations.environments.checkUpgrade',
        ordered_params=['environment'],
        path_params=['environment'],
        query_params=[],
        relative_path='v1alpha2/{+environment}:checkUpgrade',
        request_field='checkUpgradeRequest',
        request_type_name='ComposerProjectsLocationsEnvironmentsCheckUpgradeRequest',
        response_type_name='Operation',
        supports_download=False,
    )

    def Create(self, request, global_params=None):
      r"""Create a new environment.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsCreateRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Operation) The response message.
      """
      config = self.GetMethodConfig('Create')
      return self._RunMethod(
          config, request, global_params=global_params)

    Create.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments',
        http_method='POST',
        method_id='composer.projects.locations.environments.create',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=[],
        relative_path='v1alpha2/{+parent}/environments',
        request_field='environment',
        request_type_name='ComposerProjectsLocationsEnvironmentsCreateRequest',
        response_type_name='Operation',
        supports_download=False,
    )

    def Delete(self, request, global_params=None):
      r"""Delete an environment.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsDeleteRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Operation) The response message.
      """
      config = self.GetMethodConfig('Delete')
      return self._RunMethod(
          config, request, global_params=global_params)

    Delete.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}',
        http_method='DELETE',
        method_id='composer.projects.locations.environments.delete',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1alpha2/{+name}',
        request_field='',
        request_type_name='ComposerProjectsLocationsEnvironmentsDeleteRequest',
        response_type_name='Operation',
        supports_download=False,
    )

    def Get(self, request, global_params=None):
      r"""Get an existing environment.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsGetRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Environment) The response message.
      """
      config = self.GetMethodConfig('Get')
      return self._RunMethod(
          config, request, global_params=global_params)

    Get.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}',
        http_method='GET',
        method_id='composer.projects.locations.environments.get',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1alpha2/{+name}',
        request_field='',
        request_type_name='ComposerProjectsLocationsEnvironmentsGetRequest',
        response_type_name='Environment',
        supports_download=False,
    )

    def List(self, request, global_params=None):
      r"""List environments.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsListRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (ListEnvironmentsResponse) The response message.
      """
      config = self.GetMethodConfig('List')
      return self._RunMethod(
          config, request, global_params=global_params)

    List.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments',
        http_method='GET',
        method_id='composer.projects.locations.environments.list',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=['pageSize', 'pageToken'],
        relative_path='v1alpha2/{+parent}/environments',
        request_field='',
        request_type_name='ComposerProjectsLocationsEnvironmentsListRequest',
        response_type_name='ListEnvironmentsResponse',
        supports_download=False,
    )

    def LoadEnvironmentState(self, request, global_params=None):
      r"""Loads Cloud Composer environment state. As a result of this operation, a snapshot of environment's specified in LoadEnvironmentStateRequest is loaded into the environment.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsLoadEnvironmentStateRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Operation) The response message.
      """
      config = self.GetMethodConfig('LoadEnvironmentState')
      return self._RunMethod(
          config, request, global_params=global_params)

    LoadEnvironmentState.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}:loadEnvironmentState',
        http_method='POST',
        method_id='composer.projects.locations.environments.loadEnvironmentState',
        ordered_params=['environment'],
        path_params=['environment'],
        query_params=[],
        relative_path='v1alpha2/{+environment}:loadEnvironmentState',
        request_field='loadEnvironmentStateRequest',
        request_type_name='ComposerProjectsLocationsEnvironmentsLoadEnvironmentStateRequest',
        response_type_name='Operation',
        supports_download=False,
    )

    def Patch(self, request, global_params=None):
      r"""Update an environment.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsPatchRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Operation) The response message.
      """
      config = self.GetMethodConfig('Patch')
      return self._RunMethod(
          config, request, global_params=global_params)

    Patch.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}',
        http_method='PATCH',
        method_id='composer.projects.locations.environments.patch',
        ordered_params=['name'],
        path_params=['name'],
        query_params=['updateMask'],
        relative_path='v1alpha2/{+name}',
        request_field='environment',
        request_type_name='ComposerProjectsLocationsEnvironmentsPatchRequest',
        response_type_name='Operation',
        supports_download=False,
    )

    def RestartWebServer(self, request, global_params=None):
      r"""Restart Airflow web server.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsRestartWebServerRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Operation) The response message.
      """
      config = self.GetMethodConfig('RestartWebServer')
      return self._RunMethod(
          config, request, global_params=global_params)

    RestartWebServer.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}:restartWebServer',
        http_method='POST',
        method_id='composer.projects.locations.environments.restartWebServer',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1alpha2/{+name}:restartWebServer',
        request_field='restartWebServerRequest',
        request_type_name='ComposerProjectsLocationsEnvironmentsRestartWebServerRequest',
        response_type_name='Operation',
        supports_download=False,
    )

    def StoreEnvironmentState(self, request, global_params=None):
      r"""Stores Cloud Composer environment state. As a result of this operation, snapshot of environment's state is stored in a location specified in the StoreEnvironmentStateRequest.

      Args:
        request: (ComposerProjectsLocationsEnvironmentsStoreEnvironmentStateRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Operation) The response message.
      """
      config = self.GetMethodConfig('StoreEnvironmentState')
      return self._RunMethod(
          config, request, global_params=global_params)

    StoreEnvironmentState.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/environments/{environmentsId}:storeEnvironmentState',
        http_method='POST',
        method_id='composer.projects.locations.environments.storeEnvironmentState',
        ordered_params=['environment'],
        path_params=['environment'],
        query_params=[],
        relative_path='v1alpha2/{+environment}:storeEnvironmentState',
        request_field='storeEnvironmentStateRequest',
        request_type_name='ComposerProjectsLocationsEnvironmentsStoreEnvironmentStateRequest',
        response_type_name='Operation',
        supports_download=False,
    )

  class ProjectsLocationsImageVersionsService(base_api.BaseApiService):
    """Service class for the projects_locations_imageVersions resource."""

    _NAME = 'projects_locations_imageVersions'

    def __init__(self, client):
      super(ComposerV1alpha2.ProjectsLocationsImageVersionsService, self).__init__(client)
      self._upload_configs = {
          }

    def List(self, request, global_params=None):
      r"""List ImageVersions for provided location.

      Args:
        request: (ComposerProjectsLocationsImageVersionsListRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (ListImageVersionsResponse) The response message.
      """
      config = self.GetMethodConfig('List')
      return self._RunMethod(
          config, request, global_params=global_params)

    List.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/imageVersions',
        http_method='GET',
        method_id='composer.projects.locations.imageVersions.list',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=['includePastReleases', 'pageSize', 'pageToken'],
        relative_path='v1alpha2/{+parent}/imageVersions',
        request_field='',
        request_type_name='ComposerProjectsLocationsImageVersionsListRequest',
        response_type_name='ListImageVersionsResponse',
        supports_download=False,
    )

  class ProjectsLocationsOperationsService(base_api.BaseApiService):
    """Service class for the projects_locations_operations resource."""

    _NAME = 'projects_locations_operations'

    def __init__(self, client):
      super(ComposerV1alpha2.ProjectsLocationsOperationsService, self).__init__(client)
      self._upload_configs = {
          }

    def Cancel(self, request, global_params=None):
      r"""Starts asynchronous cancellation on a long-running operation. The server makes a best effort to cancel the operation, but success is not guaranteed. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`. Clients can use Operations.GetOperation or other methods to check whether the cancellation succeeded or whether the operation completed despite cancellation. On successful cancellation, the operation is not deleted; instead, it becomes an operation with an Operation.error value with a google.rpc.Status.code of 1, corresponding to `Code.CANCELLED`.

      Args:
        request: (ComposerProjectsLocationsOperationsCancelRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Empty) The response message.
      """
      config = self.GetMethodConfig('Cancel')
      return self._RunMethod(
          config, request, global_params=global_params)

    Cancel.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/operations/{operationsId}:cancel',
        http_method='POST',
        method_id='composer.projects.locations.operations.cancel',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1alpha2/{+name}:cancel',
        request_field='cancelOperationRequest',
        request_type_name='ComposerProjectsLocationsOperationsCancelRequest',
        response_type_name='Empty',
        supports_download=False,
    )

    def Delete(self, request, global_params=None):
      r"""Deletes a long-running operation. This method indicates that the client is no longer interested in the operation result. It does not cancel the operation. If the server doesn't support this method, it returns `google.rpc.Code.UNIMPLEMENTED`.

      Args:
        request: (ComposerProjectsLocationsOperationsDeleteRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Empty) The response message.
      """
      config = self.GetMethodConfig('Delete')
      return self._RunMethod(
          config, request, global_params=global_params)

    Delete.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/operations/{operationsId}',
        http_method='DELETE',
        method_id='composer.projects.locations.operations.delete',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1alpha2/{+name}',
        request_field='',
        request_type_name='ComposerProjectsLocationsOperationsDeleteRequest',
        response_type_name='Empty',
        supports_download=False,
    )

    def Get(self, request, global_params=None):
      r"""Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.

      Args:
        request: (ComposerProjectsLocationsOperationsGetRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Operation) The response message.
      """
      config = self.GetMethodConfig('Get')
      return self._RunMethod(
          config, request, global_params=global_params)

    Get.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/operations/{operationsId}',
        http_method='GET',
        method_id='composer.projects.locations.operations.get',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1alpha2/{+name}',
        request_field='',
        request_type_name='ComposerProjectsLocationsOperationsGetRequest',
        response_type_name='Operation',
        supports_download=False,
    )

    def List(self, request, global_params=None):
      r"""Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns `UNIMPLEMENTED`. NOTE: the `name` binding allows API services to override the binding to use different resource name schemes, such as `users/*/operations`. To override the binding, API services can add a binding such as `"/v1/{name=users/*}/operations"` to their service configuration. For backwards compatibility, the default name includes the operations collection id, however overriding users must ensure the name binding is the parent resource, without the operations collection id.

      Args:
        request: (ComposerProjectsLocationsOperationsListRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (ListOperationsResponse) The response message.
      """
      config = self.GetMethodConfig('List')
      return self._RunMethod(
          config, request, global_params=global_params)

    List.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1alpha2/projects/{projectsId}/locations/{locationsId}/operations',
        http_method='GET',
        method_id='composer.projects.locations.operations.list',
        ordered_params=['name'],
        path_params=['name'],
        query_params=['filter', 'pageSize', 'pageToken'],
        relative_path='v1alpha2/{+name}/operations',
        request_field='',
        request_type_name='ComposerProjectsLocationsOperationsListRequest',
        response_type_name='ListOperationsResponse',
        supports_download=False,
    )

  class ProjectsLocationsService(base_api.BaseApiService):
    """Service class for the projects_locations resource."""

    _NAME = 'projects_locations'

    def __init__(self, client):
      super(ComposerV1alpha2.ProjectsLocationsService, self).__init__(client)
      self._upload_configs = {
          }

  class ProjectsService(base_api.BaseApiService):
    """Service class for the projects resource."""

    _NAME = 'projects'

    def __init__(self, client):
      super(ComposerV1alpha2.ProjectsService, self).__init__(client)
      self._upload_configs = {
          }
