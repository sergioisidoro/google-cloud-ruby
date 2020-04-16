# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/cloud/talent/v4beta1/job_service_pb"
require "google/cloud/talent/v4beta1/job_service_services_pb"
require "google/cloud/talent/v4beta1/job_service"

class Google::Cloud::Talent::V4beta1::JobService::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_create_job
    # Create GRPC objects.
    grpc_response = Google::Cloud::Talent::V4beta1::Job.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    job = {}

    create_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_job, name
      assert_kind_of Google::Cloud::Talent::V4beta1::CreateJobRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Talent::V4beta1::Job), request.job
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_job_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::JobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_job({ parent: parent, job: job }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_job parent: parent, job: job do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_job Google::Cloud::Talent::V4beta1::CreateJobRequest.new(parent: parent, job: job) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_job({ parent: parent, job: job }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_job Google::Cloud::Talent::V4beta1::CreateJobRequest.new(parent: parent, job: job), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_job_client_stub.call_rpc_count
    end
  end

  def test_batch_create_jobs
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    jobs = [{}]

    batch_create_jobs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :batch_create_jobs, name
      assert_kind_of Google::Cloud::Talent::V4beta1::BatchCreateJobsRequest, request
      assert_equal "hello world", request.parent
      assert_kind_of Google::Cloud::Talent::V4beta1::Job, request.jobs.first
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, batch_create_jobs_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::JobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.batch_create_jobs({ parent: parent, jobs: jobs }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.batch_create_jobs parent: parent, jobs: jobs do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.batch_create_jobs Google::Cloud::Talent::V4beta1::BatchCreateJobsRequest.new(parent: parent, jobs: jobs) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.batch_create_jobs({ parent: parent, jobs: jobs }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.batch_create_jobs Google::Cloud::Talent::V4beta1::BatchCreateJobsRequest.new(parent: parent, jobs: jobs), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, batch_create_jobs_client_stub.call_rpc_count
    end
  end

  def test_get_job
    # Create GRPC objects.
    grpc_response = Google::Cloud::Talent::V4beta1::Job.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_job, name
      assert_kind_of Google::Cloud::Talent::V4beta1::GetJobRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_job_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::JobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_job({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_job name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_job Google::Cloud::Talent::V4beta1::GetJobRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_job({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_job Google::Cloud::Talent::V4beta1::GetJobRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_job_client_stub.call_rpc_count
    end
  end

  def test_update_job
    # Create GRPC objects.
    grpc_response = Google::Cloud::Talent::V4beta1::Job.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    job = {}
    update_mask = {}

    update_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_job, name
      assert_kind_of Google::Cloud::Talent::V4beta1::UpdateJobRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Talent::V4beta1::Job), request.job
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_job_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::JobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_job({ job: job, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_job job: job, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_job Google::Cloud::Talent::V4beta1::UpdateJobRequest.new(job: job, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_job({ job: job, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_job Google::Cloud::Talent::V4beta1::UpdateJobRequest.new(job: job, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_job_client_stub.call_rpc_count
    end
  end

  def test_batch_update_jobs
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    jobs = [{}]
    update_mask = {}

    batch_update_jobs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :batch_update_jobs, name
      assert_kind_of Google::Cloud::Talent::V4beta1::BatchUpdateJobsRequest, request
      assert_equal "hello world", request.parent
      assert_kind_of Google::Cloud::Talent::V4beta1::Job, request.jobs.first
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, batch_update_jobs_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::JobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.batch_update_jobs({ parent: parent, jobs: jobs, update_mask: update_mask }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.batch_update_jobs parent: parent, jobs: jobs, update_mask: update_mask do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.batch_update_jobs Google::Cloud::Talent::V4beta1::BatchUpdateJobsRequest.new(parent: parent, jobs: jobs, update_mask: update_mask) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.batch_update_jobs({ parent: parent, jobs: jobs, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.batch_update_jobs Google::Cloud::Talent::V4beta1::BatchUpdateJobsRequest.new(parent: parent, jobs: jobs, update_mask: update_mask), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, batch_update_jobs_client_stub.call_rpc_count
    end
  end

  def test_delete_job
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_job, name
      assert_kind_of Google::Cloud::Talent::V4beta1::DeleteJobRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_job_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::JobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_job({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_job name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_job Google::Cloud::Talent::V4beta1::DeleteJobRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_job({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_job Google::Cloud::Talent::V4beta1::DeleteJobRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_job_client_stub.call_rpc_count
    end
  end

  def test_batch_delete_jobs
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    filter = "hello world"

    batch_delete_jobs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :batch_delete_jobs, name
      assert_kind_of Google::Cloud::Talent::V4beta1::BatchDeleteJobsRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.filter
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, batch_delete_jobs_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::JobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.batch_delete_jobs({ parent: parent, filter: filter }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.batch_delete_jobs parent: parent, filter: filter do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.batch_delete_jobs Google::Cloud::Talent::V4beta1::BatchDeleteJobsRequest.new(parent: parent, filter: filter) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.batch_delete_jobs({ parent: parent, filter: filter }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.batch_delete_jobs Google::Cloud::Talent::V4beta1::BatchDeleteJobsRequest.new(parent: parent, filter: filter), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, batch_delete_jobs_client_stub.call_rpc_count
    end
  end

  def test_list_jobs
    # Create GRPC objects.
    grpc_response = Google::Cloud::Talent::V4beta1::ListJobsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    filter = "hello world"
    page_token = "hello world"
    page_size = 42
    job_view = :JOB_VIEW_UNSPECIFIED

    list_jobs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_jobs, name
      assert_kind_of Google::Cloud::Talent::V4beta1::ListJobsRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.filter
      assert_equal "hello world", request.page_token
      assert_equal 42, request.page_size
      assert_equal :JOB_VIEW_UNSPECIFIED, request.job_view
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_jobs_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::JobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_jobs({ parent: parent, filter: filter, page_token: page_token, page_size: page_size, job_view: job_view }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_jobs parent: parent, filter: filter, page_token: page_token, page_size: page_size, job_view: job_view do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_jobs Google::Cloud::Talent::V4beta1::ListJobsRequest.new(parent: parent, filter: filter, page_token: page_token, page_size: page_size, job_view: job_view) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_jobs({ parent: parent, filter: filter, page_token: page_token, page_size: page_size, job_view: job_view }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_jobs Google::Cloud::Talent::V4beta1::ListJobsRequest.new(parent: parent, filter: filter, page_token: page_token, page_size: page_size, job_view: job_view), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_jobs_client_stub.call_rpc_count
    end
  end

  def test_search_jobs
    # Create GRPC objects.
    grpc_response = Google::Cloud::Talent::V4beta1::SearchJobsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    search_mode = :SEARCH_MODE_UNSPECIFIED
    request_metadata = {}
    job_query = {}
    enable_broadening = true
    require_precise_result_size = true
    histogram_queries = [{}]
    job_view = :JOB_VIEW_UNSPECIFIED
    offset = 42
    page_size = 42
    page_token = "hello world"
    order_by = "hello world"
    diversification_level = :DIVERSIFICATION_LEVEL_UNSPECIFIED
    custom_ranking_info = {}
    disable_keyword_match = true

    search_jobs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :search_jobs, name
      assert_kind_of Google::Cloud::Talent::V4beta1::SearchJobsRequest, request
      assert_equal "hello world", request.parent
      assert_equal :SEARCH_MODE_UNSPECIFIED, request.search_mode
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Talent::V4beta1::RequestMetadata), request.request_metadata
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Talent::V4beta1::JobQuery), request.job_query
      assert_equal true, request.enable_broadening
      assert_equal true, request.require_precise_result_size
      assert_kind_of Google::Cloud::Talent::V4beta1::HistogramQuery, request.histogram_queries.first
      assert_equal :JOB_VIEW_UNSPECIFIED, request.job_view
      assert_equal 42, request.offset
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      assert_equal "hello world", request.order_by
      assert_equal :DIVERSIFICATION_LEVEL_UNSPECIFIED, request.diversification_level
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Talent::V4beta1::SearchJobsRequest::CustomRankingInfo), request.custom_ranking_info
      assert_equal true, request.disable_keyword_match
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, search_jobs_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::JobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.search_jobs({ parent: parent, search_mode: search_mode, request_metadata: request_metadata, job_query: job_query, enable_broadening: enable_broadening, require_precise_result_size: require_precise_result_size, histogram_queries: histogram_queries, job_view: job_view, offset: offset, page_size: page_size, page_token: page_token, order_by: order_by, diversification_level: diversification_level, custom_ranking_info: custom_ranking_info, disable_keyword_match: disable_keyword_match }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.search_jobs parent: parent, search_mode: search_mode, request_metadata: request_metadata, job_query: job_query, enable_broadening: enable_broadening, require_precise_result_size: require_precise_result_size, histogram_queries: histogram_queries, job_view: job_view, offset: offset, page_size: page_size, page_token: page_token, order_by: order_by, diversification_level: diversification_level, custom_ranking_info: custom_ranking_info, disable_keyword_match: disable_keyword_match do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.search_jobs Google::Cloud::Talent::V4beta1::SearchJobsRequest.new(parent: parent, search_mode: search_mode, request_metadata: request_metadata, job_query: job_query, enable_broadening: enable_broadening, require_precise_result_size: require_precise_result_size, histogram_queries: histogram_queries, job_view: job_view, offset: offset, page_size: page_size, page_token: page_token, order_by: order_by, diversification_level: diversification_level, custom_ranking_info: custom_ranking_info, disable_keyword_match: disable_keyword_match) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.search_jobs({ parent: parent, search_mode: search_mode, request_metadata: request_metadata, job_query: job_query, enable_broadening: enable_broadening, require_precise_result_size: require_precise_result_size, histogram_queries: histogram_queries, job_view: job_view, offset: offset, page_size: page_size, page_token: page_token, order_by: order_by, diversification_level: diversification_level, custom_ranking_info: custom_ranking_info, disable_keyword_match: disable_keyword_match }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.search_jobs Google::Cloud::Talent::V4beta1::SearchJobsRequest.new(parent: parent, search_mode: search_mode, request_metadata: request_metadata, job_query: job_query, enable_broadening: enable_broadening, require_precise_result_size: require_precise_result_size, histogram_queries: histogram_queries, job_view: job_view, offset: offset, page_size: page_size, page_token: page_token, order_by: order_by, diversification_level: diversification_level, custom_ranking_info: custom_ranking_info, disable_keyword_match: disable_keyword_match), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, search_jobs_client_stub.call_rpc_count
    end
  end

  def test_search_jobs_for_alert
    # Create GRPC objects.
    grpc_response = Google::Cloud::Talent::V4beta1::SearchJobsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    search_mode = :SEARCH_MODE_UNSPECIFIED
    request_metadata = {}
    job_query = {}
    enable_broadening = true
    require_precise_result_size = true
    histogram_queries = [{}]
    job_view = :JOB_VIEW_UNSPECIFIED
    offset = 42
    page_size = 42
    page_token = "hello world"
    order_by = "hello world"
    diversification_level = :DIVERSIFICATION_LEVEL_UNSPECIFIED
    custom_ranking_info = {}
    disable_keyword_match = true

    search_jobs_for_alert_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :search_jobs_for_alert, name
      assert_kind_of Google::Cloud::Talent::V4beta1::SearchJobsRequest, request
      assert_equal "hello world", request.parent
      assert_equal :SEARCH_MODE_UNSPECIFIED, request.search_mode
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Talent::V4beta1::RequestMetadata), request.request_metadata
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Talent::V4beta1::JobQuery), request.job_query
      assert_equal true, request.enable_broadening
      assert_equal true, request.require_precise_result_size
      assert_kind_of Google::Cloud::Talent::V4beta1::HistogramQuery, request.histogram_queries.first
      assert_equal :JOB_VIEW_UNSPECIFIED, request.job_view
      assert_equal 42, request.offset
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      assert_equal "hello world", request.order_by
      assert_equal :DIVERSIFICATION_LEVEL_UNSPECIFIED, request.diversification_level
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Talent::V4beta1::SearchJobsRequest::CustomRankingInfo), request.custom_ranking_info
      assert_equal true, request.disable_keyword_match
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, search_jobs_for_alert_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::JobService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.search_jobs_for_alert({ parent: parent, search_mode: search_mode, request_metadata: request_metadata, job_query: job_query, enable_broadening: enable_broadening, require_precise_result_size: require_precise_result_size, histogram_queries: histogram_queries, job_view: job_view, offset: offset, page_size: page_size, page_token: page_token, order_by: order_by, diversification_level: diversification_level, custom_ranking_info: custom_ranking_info, disable_keyword_match: disable_keyword_match }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.search_jobs_for_alert parent: parent, search_mode: search_mode, request_metadata: request_metadata, job_query: job_query, enable_broadening: enable_broadening, require_precise_result_size: require_precise_result_size, histogram_queries: histogram_queries, job_view: job_view, offset: offset, page_size: page_size, page_token: page_token, order_by: order_by, diversification_level: diversification_level, custom_ranking_info: custom_ranking_info, disable_keyword_match: disable_keyword_match do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.search_jobs_for_alert Google::Cloud::Talent::V4beta1::SearchJobsRequest.new(parent: parent, search_mode: search_mode, request_metadata: request_metadata, job_query: job_query, enable_broadening: enable_broadening, require_precise_result_size: require_precise_result_size, histogram_queries: histogram_queries, job_view: job_view, offset: offset, page_size: page_size, page_token: page_token, order_by: order_by, diversification_level: diversification_level, custom_ranking_info: custom_ranking_info, disable_keyword_match: disable_keyword_match) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.search_jobs_for_alert({ parent: parent, search_mode: search_mode, request_metadata: request_metadata, job_query: job_query, enable_broadening: enable_broadening, require_precise_result_size: require_precise_result_size, histogram_queries: histogram_queries, job_view: job_view, offset: offset, page_size: page_size, page_token: page_token, order_by: order_by, diversification_level: diversification_level, custom_ranking_info: custom_ranking_info, disable_keyword_match: disable_keyword_match }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.search_jobs_for_alert Google::Cloud::Talent::V4beta1::SearchJobsRequest.new(parent: parent, search_mode: search_mode, request_metadata: request_metadata, job_query: job_query, enable_broadening: enable_broadening, require_precise_result_size: require_precise_result_size, histogram_queries: histogram_queries, job_view: job_view, offset: offset, page_size: page_size, page_token: page_token, order_by: order_by, diversification_level: diversification_level, custom_ranking_info: custom_ranking_info, disable_keyword_match: disable_keyword_match), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, search_jobs_for_alert_client_stub.call_rpc_count
    end
  end
end
