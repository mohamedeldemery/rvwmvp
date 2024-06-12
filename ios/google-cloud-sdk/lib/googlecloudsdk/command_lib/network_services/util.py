# -*- coding: utf-8 -*- #
# Copyright 2021 Google LLC. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""Utilities for networkservices commands."""
from __future__ import absolute_import
from __future__ import division
from __future__ import unicode_literals

from googlecloudsdk.command_lib.util.apis import arg_utils
from googlecloudsdk.core import properties


def ConstructServiceBindingServiceNameFromArgs(unused_ref, args, request):
  sd_service_name = ('projects/' + properties.VALUES.core.project.Get() +
                     '/locations/' + args.service_directory_region +
                     '/namespaces/' + args.service_directory_namespace +
                     '/services/' + args.service_directory_service)
  arg_utils.SetFieldInMessage(request, 'serviceBinding.service',
                              sd_service_name)
  return request
