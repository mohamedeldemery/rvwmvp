"""Generated client library for osconfig version v1beta."""
# NOTE: This file is autogenerated and should not be edited by hand.

from __future__ import absolute_import

from apitools.base.py import base_api
from googlecloudsdk.third_party.apis.osconfig.v1beta import osconfig_v1beta_messages as messages


class OsconfigV1beta(base_api.BaseApiClient):
  """Generated client library for service osconfig version v1beta."""

  MESSAGES_MODULE = messages
  BASE_URL = 'https://osconfig.googleapis.com/'
  MTLS_BASE_URL = 'https://osconfig.mtls.googleapis.com/'

  _PACKAGE = 'osconfig'
  _SCOPES = ['https://www.googleapis.com/auth/cloud-platform']
  _VERSION = 'v1beta'
  _CLIENT_ID = '1042881264118.apps.googleusercontent.com'
  _CLIENT_SECRET = 'x_Tw5K8nnjoRAqULM9PFAC2b'
  _USER_AGENT = 'google-cloud-sdk'
  _CLIENT_CLASS_NAME = 'OsconfigV1beta'
  _URL_VERSION = 'v1beta'
  _API_KEY = None

  def __init__(self, url='', credentials=None,
               get_credentials=True, http=None, model=None,
               log_request=False, log_response=False,
               credentials_args=None, default_global_params=None,
               additional_http_headers=None, response_encoding=None):
    """Create a new osconfig handle."""
    url = url or self.BASE_URL
    super(OsconfigV1beta, self).__init__(
        url, credentials=credentials,
        get_credentials=get_credentials, http=http, model=model,
        log_request=log_request, log_response=log_response,
        credentials_args=credentials_args,
        default_global_params=default_global_params,
        additional_http_headers=additional_http_headers,
        response_encoding=response_encoding)
    self.projects_guestPolicies = self.ProjectsGuestPoliciesService(self)
    self.projects_patchDeployments = self.ProjectsPatchDeploymentsService(self)
    self.projects_patchJobs_instanceDetails = self.ProjectsPatchJobsInstanceDetailsService(self)
    self.projects_patchJobs = self.ProjectsPatchJobsService(self)
    self.projects_zones_instances = self.ProjectsZonesInstancesService(self)
    self.projects_zones = self.ProjectsZonesService(self)
    self.projects = self.ProjectsService(self)

  class ProjectsGuestPoliciesService(base_api.BaseApiService):
    """Service class for the projects_guestPolicies resource."""

    _NAME = 'projects_guestPolicies'

    def __init__(self, client):
      super(OsconfigV1beta.ProjectsGuestPoliciesService, self).__init__(client)
      self._upload_configs = {
          }

    def Create(self, request, global_params=None):
      r"""Create an OS Config guest policy.

      Args:
        request: (OsconfigProjectsGuestPoliciesCreateRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (GuestPolicy) The response message.
      """
      config = self.GetMethodConfig('Create')
      return self._RunMethod(
          config, request, global_params=global_params)

    Create.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/guestPolicies',
        http_method='POST',
        method_id='osconfig.projects.guestPolicies.create',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=['guestPolicyId'],
        relative_path='v1beta/{+parent}/guestPolicies',
        request_field='guestPolicy',
        request_type_name='OsconfigProjectsGuestPoliciesCreateRequest',
        response_type_name='GuestPolicy',
        supports_download=False,
    )

    def Delete(self, request, global_params=None):
      r"""Delete an OS Config guest policy.

      Args:
        request: (OsconfigProjectsGuestPoliciesDeleteRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Empty) The response message.
      """
      config = self.GetMethodConfig('Delete')
      return self._RunMethod(
          config, request, global_params=global_params)

    Delete.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/guestPolicies/{guestPoliciesId}',
        http_method='DELETE',
        method_id='osconfig.projects.guestPolicies.delete',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1beta/{+name}',
        request_field='',
        request_type_name='OsconfigProjectsGuestPoliciesDeleteRequest',
        response_type_name='Empty',
        supports_download=False,
    )

    def Get(self, request, global_params=None):
      r"""Get an OS Config guest policy.

      Args:
        request: (OsconfigProjectsGuestPoliciesGetRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (GuestPolicy) The response message.
      """
      config = self.GetMethodConfig('Get')
      return self._RunMethod(
          config, request, global_params=global_params)

    Get.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/guestPolicies/{guestPoliciesId}',
        http_method='GET',
        method_id='osconfig.projects.guestPolicies.get',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1beta/{+name}',
        request_field='',
        request_type_name='OsconfigProjectsGuestPoliciesGetRequest',
        response_type_name='GuestPolicy',
        supports_download=False,
    )

    def List(self, request, global_params=None):
      r"""Get a page of OS Config guest policies.

      Args:
        request: (OsconfigProjectsGuestPoliciesListRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (ListGuestPoliciesResponse) The response message.
      """
      config = self.GetMethodConfig('List')
      return self._RunMethod(
          config, request, global_params=global_params)

    List.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/guestPolicies',
        http_method='GET',
        method_id='osconfig.projects.guestPolicies.list',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=['pageSize', 'pageToken'],
        relative_path='v1beta/{+parent}/guestPolicies',
        request_field='',
        request_type_name='OsconfigProjectsGuestPoliciesListRequest',
        response_type_name='ListGuestPoliciesResponse',
        supports_download=False,
    )

    def Patch(self, request, global_params=None):
      r"""Update an OS Config guest policy.

      Args:
        request: (OsconfigProjectsGuestPoliciesPatchRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (GuestPolicy) The response message.
      """
      config = self.GetMethodConfig('Patch')
      return self._RunMethod(
          config, request, global_params=global_params)

    Patch.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/guestPolicies/{guestPoliciesId}',
        http_method='PATCH',
        method_id='osconfig.projects.guestPolicies.patch',
        ordered_params=['name'],
        path_params=['name'],
        query_params=['updateMask'],
        relative_path='v1beta/{+name}',
        request_field='guestPolicy',
        request_type_name='OsconfigProjectsGuestPoliciesPatchRequest',
        response_type_name='GuestPolicy',
        supports_download=False,
    )

  class ProjectsPatchDeploymentsService(base_api.BaseApiService):
    """Service class for the projects_patchDeployments resource."""

    _NAME = 'projects_patchDeployments'

    def __init__(self, client):
      super(OsconfigV1beta.ProjectsPatchDeploymentsService, self).__init__(client)
      self._upload_configs = {
          }

    def Create(self, request, global_params=None):
      r"""Create an OS Config patch deployment.

      Args:
        request: (OsconfigProjectsPatchDeploymentsCreateRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (PatchDeployment) The response message.
      """
      config = self.GetMethodConfig('Create')
      return self._RunMethod(
          config, request, global_params=global_params)

    Create.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/patchDeployments',
        http_method='POST',
        method_id='osconfig.projects.patchDeployments.create',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=['patchDeploymentId'],
        relative_path='v1beta/{+parent}/patchDeployments',
        request_field='patchDeployment',
        request_type_name='OsconfigProjectsPatchDeploymentsCreateRequest',
        response_type_name='PatchDeployment',
        supports_download=False,
    )

    def Delete(self, request, global_params=None):
      r"""Delete an OS Config patch deployment.

      Args:
        request: (OsconfigProjectsPatchDeploymentsDeleteRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (Empty) The response message.
      """
      config = self.GetMethodConfig('Delete')
      return self._RunMethod(
          config, request, global_params=global_params)

    Delete.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/patchDeployments/{patchDeploymentsId}',
        http_method='DELETE',
        method_id='osconfig.projects.patchDeployments.delete',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1beta/{+name}',
        request_field='',
        request_type_name='OsconfigProjectsPatchDeploymentsDeleteRequest',
        response_type_name='Empty',
        supports_download=False,
    )

    def Get(self, request, global_params=None):
      r"""Get an OS Config patch deployment.

      Args:
        request: (OsconfigProjectsPatchDeploymentsGetRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (PatchDeployment) The response message.
      """
      config = self.GetMethodConfig('Get')
      return self._RunMethod(
          config, request, global_params=global_params)

    Get.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/patchDeployments/{patchDeploymentsId}',
        http_method='GET',
        method_id='osconfig.projects.patchDeployments.get',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1beta/{+name}',
        request_field='',
        request_type_name='OsconfigProjectsPatchDeploymentsGetRequest',
        response_type_name='PatchDeployment',
        supports_download=False,
    )

    def List(self, request, global_params=None):
      r"""Get a page of OS Config patch deployments.

      Args:
        request: (OsconfigProjectsPatchDeploymentsListRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (ListPatchDeploymentsResponse) The response message.
      """
      config = self.GetMethodConfig('List')
      return self._RunMethod(
          config, request, global_params=global_params)

    List.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/patchDeployments',
        http_method='GET',
        method_id='osconfig.projects.patchDeployments.list',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=['pageSize', 'pageToken'],
        relative_path='v1beta/{+parent}/patchDeployments',
        request_field='',
        request_type_name='OsconfigProjectsPatchDeploymentsListRequest',
        response_type_name='ListPatchDeploymentsResponse',
        supports_download=False,
    )

    def Patch(self, request, global_params=None):
      r"""Update an OS Config patch deployment.

      Args:
        request: (OsconfigProjectsPatchDeploymentsPatchRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (PatchDeployment) The response message.
      """
      config = self.GetMethodConfig('Patch')
      return self._RunMethod(
          config, request, global_params=global_params)

    Patch.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/patchDeployments/{patchDeploymentsId}',
        http_method='PATCH',
        method_id='osconfig.projects.patchDeployments.patch',
        ordered_params=['name'],
        path_params=['name'],
        query_params=['updateMask'],
        relative_path='v1beta/{+name}',
        request_field='patchDeployment',
        request_type_name='OsconfigProjectsPatchDeploymentsPatchRequest',
        response_type_name='PatchDeployment',
        supports_download=False,
    )

    def Pause(self, request, global_params=None):
      r"""Change state of patch deployment to "PAUSED". Patch deployment in paused state doesn't generate patch jobs.

      Args:
        request: (OsconfigProjectsPatchDeploymentsPauseRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (PatchDeployment) The response message.
      """
      config = self.GetMethodConfig('Pause')
      return self._RunMethod(
          config, request, global_params=global_params)

    Pause.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/patchDeployments/{patchDeploymentsId}:pause',
        http_method='POST',
        method_id='osconfig.projects.patchDeployments.pause',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1beta/{+name}:pause',
        request_field='pausePatchDeploymentRequest',
        request_type_name='OsconfigProjectsPatchDeploymentsPauseRequest',
        response_type_name='PatchDeployment',
        supports_download=False,
    )

    def Resume(self, request, global_params=None):
      r"""Change state of patch deployment back to "ACTIVE". Patch deployment in active state continues to generate patch jobs.

      Args:
        request: (OsconfigProjectsPatchDeploymentsResumeRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (PatchDeployment) The response message.
      """
      config = self.GetMethodConfig('Resume')
      return self._RunMethod(
          config, request, global_params=global_params)

    Resume.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/patchDeployments/{patchDeploymentsId}:resume',
        http_method='POST',
        method_id='osconfig.projects.patchDeployments.resume',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1beta/{+name}:resume',
        request_field='resumePatchDeploymentRequest',
        request_type_name='OsconfigProjectsPatchDeploymentsResumeRequest',
        response_type_name='PatchDeployment',
        supports_download=False,
    )

  class ProjectsPatchJobsInstanceDetailsService(base_api.BaseApiService):
    """Service class for the projects_patchJobs_instanceDetails resource."""

    _NAME = 'projects_patchJobs_instanceDetails'

    def __init__(self, client):
      super(OsconfigV1beta.ProjectsPatchJobsInstanceDetailsService, self).__init__(client)
      self._upload_configs = {
          }

    def List(self, request, global_params=None):
      r"""Get a list of instance details for a given patch job.

      Args:
        request: (OsconfigProjectsPatchJobsInstanceDetailsListRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (ListPatchJobInstanceDetailsResponse) The response message.
      """
      config = self.GetMethodConfig('List')
      return self._RunMethod(
          config, request, global_params=global_params)

    List.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/patchJobs/{patchJobsId}/instanceDetails',
        http_method='GET',
        method_id='osconfig.projects.patchJobs.instanceDetails.list',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=['filter', 'pageSize', 'pageToken'],
        relative_path='v1beta/{+parent}/instanceDetails',
        request_field='',
        request_type_name='OsconfigProjectsPatchJobsInstanceDetailsListRequest',
        response_type_name='ListPatchJobInstanceDetailsResponse',
        supports_download=False,
    )

  class ProjectsPatchJobsService(base_api.BaseApiService):
    """Service class for the projects_patchJobs resource."""

    _NAME = 'projects_patchJobs'

    def __init__(self, client):
      super(OsconfigV1beta.ProjectsPatchJobsService, self).__init__(client)
      self._upload_configs = {
          }

    def Cancel(self, request, global_params=None):
      r"""Cancel a patch job. The patch job must be active. Canceled patch jobs cannot be restarted.

      Args:
        request: (OsconfigProjectsPatchJobsCancelRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (PatchJob) The response message.
      """
      config = self.GetMethodConfig('Cancel')
      return self._RunMethod(
          config, request, global_params=global_params)

    Cancel.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/patchJobs/{patchJobsId}:cancel',
        http_method='POST',
        method_id='osconfig.projects.patchJobs.cancel',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1beta/{+name}:cancel',
        request_field='cancelPatchJobRequest',
        request_type_name='OsconfigProjectsPatchJobsCancelRequest',
        response_type_name='PatchJob',
        supports_download=False,
    )

    def Execute(self, request, global_params=None):
      r"""Patch VM instances by creating and running a patch job.

      Args:
        request: (OsconfigProjectsPatchJobsExecuteRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (PatchJob) The response message.
      """
      config = self.GetMethodConfig('Execute')
      return self._RunMethod(
          config, request, global_params=global_params)

    Execute.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/patchJobs:execute',
        http_method='POST',
        method_id='osconfig.projects.patchJobs.execute',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=[],
        relative_path='v1beta/{+parent}/patchJobs:execute',
        request_field='executePatchJobRequest',
        request_type_name='OsconfigProjectsPatchJobsExecuteRequest',
        response_type_name='PatchJob',
        supports_download=False,
    )

    def Get(self, request, global_params=None):
      r"""Get the patch job. This can be used to track the progress of an ongoing patch job or review the details of completed jobs.

      Args:
        request: (OsconfigProjectsPatchJobsGetRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (PatchJob) The response message.
      """
      config = self.GetMethodConfig('Get')
      return self._RunMethod(
          config, request, global_params=global_params)

    Get.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/patchJobs/{patchJobsId}',
        http_method='GET',
        method_id='osconfig.projects.patchJobs.get',
        ordered_params=['name'],
        path_params=['name'],
        query_params=[],
        relative_path='v1beta/{+name}',
        request_field='',
        request_type_name='OsconfigProjectsPatchJobsGetRequest',
        response_type_name='PatchJob',
        supports_download=False,
    )

    def List(self, request, global_params=None):
      r"""Get a list of patch jobs.

      Args:
        request: (OsconfigProjectsPatchJobsListRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (ListPatchJobsResponse) The response message.
      """
      config = self.GetMethodConfig('List')
      return self._RunMethod(
          config, request, global_params=global_params)

    List.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/patchJobs',
        http_method='GET',
        method_id='osconfig.projects.patchJobs.list',
        ordered_params=['parent'],
        path_params=['parent'],
        query_params=['filter', 'pageSize', 'pageToken'],
        relative_path='v1beta/{+parent}/patchJobs',
        request_field='',
        request_type_name='OsconfigProjectsPatchJobsListRequest',
        response_type_name='ListPatchJobsResponse',
        supports_download=False,
    )

  class ProjectsZonesInstancesService(base_api.BaseApiService):
    """Service class for the projects_zones_instances resource."""

    _NAME = 'projects_zones_instances'

    def __init__(self, client):
      super(OsconfigV1beta.ProjectsZonesInstancesService, self).__init__(client)
      self._upload_configs = {
          }

    def LookupEffectiveGuestPolicy(self, request, global_params=None):
      r"""Lookup the effective guest policy that applies to a VM instance. This lookup merges all policies that are assigned to the instance ancestry.

      Args:
        request: (OsconfigProjectsZonesInstancesLookupEffectiveGuestPolicyRequest) input message
        global_params: (StandardQueryParameters, default: None) global arguments
      Returns:
        (EffectiveGuestPolicy) The response message.
      """
      config = self.GetMethodConfig('LookupEffectiveGuestPolicy')
      return self._RunMethod(
          config, request, global_params=global_params)

    LookupEffectiveGuestPolicy.method_config = lambda: base_api.ApiMethodInfo(
        flat_path='v1beta/projects/{projectsId}/zones/{zonesId}/instances/{instancesId}:lookupEffectiveGuestPolicy',
        http_method='POST',
        method_id='osconfig.projects.zones.instances.lookupEffectiveGuestPolicy',
        ordered_params=['instance'],
        path_params=['instance'],
        query_params=[],
        relative_path='v1beta/{+instance}:lookupEffectiveGuestPolicy',
        request_field='lookupEffectiveGuestPolicyRequest',
        request_type_name='OsconfigProjectsZonesInstancesLookupEffectiveGuestPolicyRequest',
        response_type_name='EffectiveGuestPolicy',
        supports_download=False,
    )

  class ProjectsZonesService(base_api.BaseApiService):
    """Service class for the projects_zones resource."""

    _NAME = 'projects_zones'

    def __init__(self, client):
      super(OsconfigV1beta.ProjectsZonesService, self).__init__(client)
      self._upload_configs = {
          }

  class ProjectsService(base_api.BaseApiService):
    """Service class for the projects resource."""

    _NAME = 'projects'

    def __init__(self, client):
      super(OsconfigV1beta.ProjectsService, self).__init__(client)
      self._upload_configs = {
          }
