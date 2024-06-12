# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/appengine_v1alpha/proto/audit_data.proto

from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.cloud.appengine_v1alpha.proto import appengine_pb2 as google_dot_cloud_dot_appengine__v1alpha_dot_proto_dot_appengine__pb2
from google.api import annotations_pb2 as google_dot_api_dot_annotations__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='google/cloud/appengine_v1alpha/proto/audit_data.proto',
  package='google.appengine.v1alpha',
  syntax='proto3',
  serialized_options=b'\n\034com.google.appengine.v1alphaB\016AuditDataProtoP\001ZAgoogle.golang.org/genproto/googleapis/appengine/v1alpha;appengine',
  create_key=_descriptor._internal_create_key,
  serialized_pb=b'\n5google/cloud/appengine_v1alpha/proto/audit_data.proto\x12\x18google.appengine.v1alpha\x1a\x34google/cloud/appengine_v1alpha/proto/appengine.proto\x1a\x1cgoogle/api/annotations.proto\"\xa7\x01\n\tAuditData\x12G\n\x0eupdate_service\x18\x01 \x01(\x0b\x32-.google.appengine.v1alpha.UpdateServiceMethodH\x00\x12G\n\x0e\x63reate_version\x18\x02 \x01(\x0b\x32-.google.appengine.v1alpha.CreateVersionMethodH\x00\x42\x08\n\x06method\"V\n\x13UpdateServiceMethod\x12?\n\x07request\x18\x01 \x01(\x0b\x32..google.appengine.v1alpha.UpdateServiceRequest\"V\n\x13\x43reateVersionMethod\x12?\n\x07request\x18\x01 \x01(\x0b\x32..google.appengine.v1alpha.CreateVersionRequestBs\n\x1c\x63om.google.appengine.v1alphaB\x0e\x41uditDataProtoP\x01ZAgoogle.golang.org/genproto/googleapis/appengine/v1alpha;appengineb\x06proto3'
  ,
  dependencies=[google_dot_cloud_dot_appengine__v1alpha_dot_proto_dot_appengine__pb2.DESCRIPTOR,google_dot_api_dot_annotations__pb2.DESCRIPTOR,])




_AUDITDATA = _descriptor.Descriptor(
  name='AuditData',
  full_name='google.appengine.v1alpha.AuditData',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='update_service', full_name='google.appengine.v1alpha.AuditData.update_service', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
    _descriptor.FieldDescriptor(
      name='create_version', full_name='google.appengine.v1alpha.AuditData.create_version', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
    _descriptor.OneofDescriptor(
      name='method', full_name='google.appengine.v1alpha.AuditData.method',
      index=0, containing_type=None,
      create_key=_descriptor._internal_create_key,
    fields=[]),
  ],
  serialized_start=168,
  serialized_end=335,
)


_UPDATESERVICEMETHOD = _descriptor.Descriptor(
  name='UpdateServiceMethod',
  full_name='google.appengine.v1alpha.UpdateServiceMethod',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='request', full_name='google.appengine.v1alpha.UpdateServiceMethod.request', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=337,
  serialized_end=423,
)


_CREATEVERSIONMETHOD = _descriptor.Descriptor(
  name='CreateVersionMethod',
  full_name='google.appengine.v1alpha.CreateVersionMethod',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  create_key=_descriptor._internal_create_key,
  fields=[
    _descriptor.FieldDescriptor(
      name='request', full_name='google.appengine.v1alpha.CreateVersionMethod.request', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR,  create_key=_descriptor._internal_create_key),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=425,
  serialized_end=511,
)

_AUDITDATA.fields_by_name['update_service'].message_type = _UPDATESERVICEMETHOD
_AUDITDATA.fields_by_name['create_version'].message_type = _CREATEVERSIONMETHOD
_AUDITDATA.oneofs_by_name['method'].fields.append(
  _AUDITDATA.fields_by_name['update_service'])
_AUDITDATA.fields_by_name['update_service'].containing_oneof = _AUDITDATA.oneofs_by_name['method']
_AUDITDATA.oneofs_by_name['method'].fields.append(
  _AUDITDATA.fields_by_name['create_version'])
_AUDITDATA.fields_by_name['create_version'].containing_oneof = _AUDITDATA.oneofs_by_name['method']
_UPDATESERVICEMETHOD.fields_by_name['request'].message_type = google_dot_cloud_dot_appengine__v1alpha_dot_proto_dot_appengine__pb2._UPDATESERVICEREQUEST
_CREATEVERSIONMETHOD.fields_by_name['request'].message_type = google_dot_cloud_dot_appengine__v1alpha_dot_proto_dot_appengine__pb2._CREATEVERSIONREQUEST
DESCRIPTOR.message_types_by_name['AuditData'] = _AUDITDATA
DESCRIPTOR.message_types_by_name['UpdateServiceMethod'] = _UPDATESERVICEMETHOD
DESCRIPTOR.message_types_by_name['CreateVersionMethod'] = _CREATEVERSIONMETHOD
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

AuditData = _reflection.GeneratedProtocolMessageType('AuditData', (_message.Message,), {
  'DESCRIPTOR' : _AUDITDATA,
  '__module__' : 'google.cloud.appengine_v1alpha.proto.audit_data_pb2'
  ,
  '__doc__': """App Engine admin service audit log.
  
  Attributes:
      method:
          Detailed information about methods that require it. Does not
          include simple Get, List or Delete methods because all
          significant information (resource name, number of returned
          elements for List operations) is already included in parent
          audit log message.
      update_service:
          Detailed information about UpdateService call.
      create_version:
          Detailed information about CreateVersion call.
  """,
  # @@protoc_insertion_point(class_scope:google.appengine.v1alpha.AuditData)
  })
_sym_db.RegisterMessage(AuditData)

UpdateServiceMethod = _reflection.GeneratedProtocolMessageType('UpdateServiceMethod', (_message.Message,), {
  'DESCRIPTOR' : _UPDATESERVICEMETHOD,
  '__module__' : 'google.cloud.appengine_v1alpha.proto.audit_data_pb2'
  ,
  '__doc__': """Detailed information about UpdateService call.
  
  Attributes:
      request:
          Update service request.
  """,
  # @@protoc_insertion_point(class_scope:google.appengine.v1alpha.UpdateServiceMethod)
  })
_sym_db.RegisterMessage(UpdateServiceMethod)

CreateVersionMethod = _reflection.GeneratedProtocolMessageType('CreateVersionMethod', (_message.Message,), {
  'DESCRIPTOR' : _CREATEVERSIONMETHOD,
  '__module__' : 'google.cloud.appengine_v1alpha.proto.audit_data_pb2'
  ,
  '__doc__': """Detailed information about CreateVersion call.
  
  Attributes:
      request:
          Create version request.
  """,
  # @@protoc_insertion_point(class_scope:google.appengine.v1alpha.CreateVersionMethod)
  })
_sym_db.RegisterMessage(CreateVersionMethod)


DESCRIPTOR._options = None
# @@protoc_insertion_point(module_scope)