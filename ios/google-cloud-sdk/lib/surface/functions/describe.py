# -*- coding: utf-8 -*- #
# Copyright 2015 Google LLC. All Rights Reserved.
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

"""Displays details of a Google Cloud Function."""

from __future__ import absolute_import
from __future__ import division
from __future__ import unicode_literals

from googlecloudsdk.api_lib.functions.v1 import util
from googlecloudsdk.calliope import base
from googlecloudsdk.command_lib.functions import flags
from googlecloudsdk.command_lib.functions.v1.describe import command as command_v1
from googlecloudsdk.command_lib.functions.v2.describe import command as command_v2


@base.ReleaseTracks(base.ReleaseTrack.GA)
class Describe(base.DescribeCommand):
  """Display details of a Google Cloud Function."""

  @staticmethod
  def Args(parser):
    """Register flags for this command."""
    flags.AddFunctionResourceArg(parser, 'to describe')

  @util.CatchHTTPErrorRaiseHTTPException
  def Run(self, args):
    """This is what gets called when the user runs this command.

    Args:
      args: an argparse namespace. All the arguments that were provided to this
        command invocation.

    Returns:
      The specified function with its description and configured filter.
    """
    return command_v1.Run(args)


@base.ReleaseTracks(base.ReleaseTrack.BETA)
class DescribeBeta(base.DescribeCommand):
  """Display details of a Google Cloud Function."""

  @staticmethod
  def CommonArgs(parser, track):
    """Register flags for this command."""
    Describe.Args(parser)

    # Add additional flags for GCFv2
    flags.AddGen2Flag(parser, track)

  @staticmethod
  def Args(parser):
    DescribeBeta.CommonArgs(parser, base.ReleaseTrack.BETA)

  @util.CatchHTTPErrorRaiseHTTPException
  def Run(self, args):
    if flags.ShouldUseGen2():
      return command_v2.Run(args, self.ReleaseTrack())
    else:
      return command_v1.Run(args)


@base.ReleaseTracks(base.ReleaseTrack.ALPHA)
class DescribeAlpha(DescribeBeta):
  """Display details of a Google Cloud Function."""

  @staticmethod
  def Args(parser):
    """Register flags for this command."""
    DescribeBeta.CommonArgs(parser, base.ReleaseTrack.ALPHA)