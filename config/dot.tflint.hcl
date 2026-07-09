# -*- mode: terraform -*-

plugin "google" {
  enabled = true
  version = "0.30.0"
  source  = "github.com/terraform-linters/tflint-ruleset-google"
}

plugin "sort" {
  enabled = true
  version = "0.0.7"
  source  = "github.com/thespags/tflint-ruleset-sort"

  resource "random_id" {
    key_attributes = []
  }

  # Google resources/data sources sorted lexicographically.

  resource "google_access_approval_folder_service_account" {
    key_attributes = []
  }

  resource "google_access_approval_organization_service_account" {
    key_attributes = []
  }

  resource "google_access_approval_project_service_account" {
    key_attributes = []
  }

  resource "google_access_context_manager_access_level" {
    key_attributes = []
  }

  resource "google_access_context_manager_access_level_condition" {
    key_attributes = []
  }

  resource "google_access_context_manager_access_levels" {
    key_attributes = []
  }

  resource "google_access_context_manager_access_policy" {
    key_attributes = []
  }

  resource "google_access_context_manager_access_policy_iam" {
    key_attributes = []
  }

  resource "google_access_context_manager_access_policy_iam_policy" {
    key_attributes = []
  }

  resource "google_access_context_manager_authorized_orgs_desc" {
    key_attributes = []
  }

  resource "google_access_context_manager_egress_policy" {
    key_attributes = []
  }

  resource "google_access_context_manager_gcp_user_access_binding" {
    key_attributes = []
  }

  resource "google_access_context_manager_ingress_policy" {
    key_attributes = []
  }

  resource "google_access_context_manager_service_perimeter" {
    key_attributes = []
  }

  resource "google_access_context_manager_service_perimeter_dry_run_egress_policy" {
    key_attributes = []
  }

  resource "google_access_context_manager_service_perimeter_dry_run_ingress_policy" {
    key_attributes = []
  }

  resource "google_access_context_manager_service_perimeter_dry_run_resource" {
    key_attributes = []
  }

  resource "google_access_context_manager_service_perimeter_egress_policy" {
    key_attributes = []
  }

  resource "google_access_context_manager_service_perimeter_ingress_policy" {
    key_attributes = []
  }

  resource "google_access_context_manager_service_perimeter_resource" {
    key_attributes = []
  }

  resource "google_access_context_manager_service_perimeters" {
    key_attributes = []
  }

  resource "google_access_context_manager_supported_service" {
    key_attributes = []
  }

  resource "google_access_context_manager_supported_services" {
    key_attributes = []
  }

  resource "google_active_directory_domain" {
    key_attributes = []
  }

  resource "google_active_directory_domain_trust" {
    key_attributes = []
  }

  resource "google_active_directory_peering" {
    key_attributes = []
  }

  resource "google_active_folder" {
    key_attributes = []
  }

  resource "google_agent_registry_agent" {
    key_attributes = []
  }

  resource "google_agent_registry_binding" {
    key_attributes = []
  }

  resource "google_agent_registry_endpoint" {
    key_attributes = []
  }

  resource "google_agent_registry_mcp_server" {
    key_attributes = []
  }

  resource "google_agent_registry_service" {
    key_attributes = []
  }

  resource "google_alloydb_backup" {
    key_attributes = []
  }

  resource "google_alloydb_cluster" {
    key_attributes = []
  }

  resource "google_alloydb_instance" {
    key_attributes = []
  }

  resource "google_alloydb_locations" {
    key_attributes = []
  }

  resource "google_alloydb_supported_database_flags" {
    key_attributes = []
  }

  resource "google_alloydb_user" {
    key_attributes = []
  }

  resource "google_api_gateway_api" {
    key_attributes = []
  }

  resource "google_api_gateway_api_config" {
    key_attributes = []
  }

  resource "google_api_gateway_api_config_iam" {
    key_attributes = []
  }

  resource "google_api_gateway_api_config_iam_policy" {
    key_attributes = []
  }

  resource "google_api_gateway_api_iam" {
    key_attributes = []
  }

  resource "google_api_gateway_api_iam_policy" {
    key_attributes = []
  }

  resource "google_api_gateway_gateway" {
    key_attributes = []
  }

  resource "google_api_gateway_gateway_iam" {
    key_attributes = []
  }

  resource "google_api_gateway_gateway_iam_policy" {
    key_attributes = []
  }

  resource "google_apigee_addons_config" {
    key_attributes = []
  }

  resource "google_apigee_api" {
    key_attributes = []
  }

  resource "google_apigee_api_deployment" {
    key_attributes = []
  }

  resource "google_apigee_api_product" {
    key_attributes = []
  }

  resource "google_apigee_app_group" {
    key_attributes = []
  }

  resource "google_apigee_control_plane_access" {
    key_attributes = []
  }

  resource "google_apigee_data_collector" {
    key_attributes = []
  }

  resource "google_apigee_datastore" {
    key_attributes = []
  }

  resource "google_apigee_developer" {
    key_attributes = []
  }

  resource "google_apigee_developer_app" {
    key_attributes = []
  }

  resource "google_apigee_dns_zone" {
    key_attributes = []
  }

  resource "google_apigee_endpoint_attachment" {
    key_attributes = []
  }

  resource "google_apigee_env_keystore" {
    key_attributes = []
  }

  resource "google_apigee_env_references" {
    key_attributes = []
  }

  resource "google_apigee_envgroup" {
    key_attributes = []
  }

  resource "google_apigee_envgroup_attachment" {
    key_attributes = []
  }

  resource "google_apigee_environment" {
    key_attributes = []
  }

  resource "google_apigee_environment_addons_config" {
    key_attributes = []
  }

  resource "google_apigee_environment_api_revision_deployment" {
    key_attributes = []
  }

  resource "google_apigee_environment_debugmask" {
    key_attributes = []
  }

  resource "google_apigee_environment_iam" {
    key_attributes = []
  }

  resource "google_apigee_environment_iam_policy" {
    key_attributes = []
  }

  resource "google_apigee_environment_keyvaluemaps" {
    key_attributes = []
  }

  resource "google_apigee_environment_keyvaluemaps_entries" {
    key_attributes = []
  }

  resource "google_apigee_flowhook" {
    key_attributes = []
  }

  resource "google_apigee_instance" {
    key_attributes = []
  }

  resource "google_apigee_instance_attachment" {
    key_attributes = []
  }

  resource "google_apigee_keystores_aliases_key_cert_file" {
    key_attributes = []
  }

  resource "google_apigee_keystores_aliases_pkcs12" {
    key_attributes = []
  }

  resource "google_apigee_keystores_aliases_self_signed_cert" {
    key_attributes = []
  }

  resource "google_apigee_nat_address" {
    key_attributes = []
  }

  resource "google_apigee_organization" {
    key_attributes = []
  }

  resource "google_apigee_security_action" {
    key_attributes = []
  }

  resource "google_apigee_security_feedback" {
    key_attributes = []
  }

  resource "google_apigee_security_monitoring_condition" {
    key_attributes = []
  }

  resource "google_apigee_security_profile_v2" {
    key_attributes = []
  }

  resource "google_apigee_sharedflow" {
    key_attributes = []
  }

  resource "google_apigee_sharedflow_deployment" {
    key_attributes = []
  }

  resource "google_apigee_space" {
    key_attributes = []
  }

  resource "google_apigee_sync_authorization" {
    key_attributes = []
  }

  resource "google_apigee_target_server" {
    key_attributes = []
  }

  resource "google_apihub_api_hub_instance" {
    key_attributes = []
  }

  resource "google_apihub_curation" {
    key_attributes = []
  }

  resource "google_apihub_host_project_registration" {
    key_attributes = []
  }

  resource "google_apihub_plugin" {
    key_attributes = []
  }

  resource "google_apihub_plugin_instance" {
    key_attributes = []
  }

  resource "google_apikeys_key" {
    key_attributes = []
  }

  resource "google_app_engine_application" {
    key_attributes = []
  }

  resource "google_app_engine_application_url_dispatch_rules" {
    key_attributes = []
  }

  resource "google_app_engine_default_service_account" {
    key_attributes = []
  }

  resource "google_app_engine_domain_mapping" {
    key_attributes = []
  }

  resource "google_app_engine_firewall_rule" {
    key_attributes = []
  }

  resource "google_app_engine_flexible_app_version" {
    key_attributes = []
  }

  resource "google_app_engine_service_network_settings" {
    key_attributes = []
  }

  resource "google_app_engine_service_split_traffic" {
    key_attributes = []
  }

  resource "google_app_engine_standard_app_version" {
    key_attributes = []
  }

  resource "google_apphub_application" {
    key_attributes = []
  }

  resource "google_apphub_boundary" {
    key_attributes = []
  }

  resource "google_apphub_discovered_service" {
    key_attributes = []
  }

  resource "google_apphub_discovered_workload" {
    key_attributes = []
  }

  resource "google_apphub_service" {
    key_attributes = []
  }

  resource "google_apphub_service_project_attachment" {
    key_attributes = []
  }

  resource "google_apphub_workload" {
    key_attributes = []
  }

  resource "google_artifact_registry_docker_image" {
    key_attributes = []
  }

  resource "google_artifact_registry_docker_images" {
    key_attributes = []
  }

  resource "google_artifact_registry_file" {
    key_attributes = []
  }

  resource "google_artifact_registry_locations" {
    key_attributes = []
  }

  resource "google_artifact_registry_maven_artifact" {
    key_attributes = []
  }

  resource "google_artifact_registry_maven_artifacts" {
    key_attributes = []
  }

  resource "google_artifact_registry_npm_package" {
    key_attributes = []
  }

  resource "google_artifact_registry_npm_packages" {
    key_attributes = []
  }

  resource "google_artifact_registry_package" {
    key_attributes = []
  }

  resource "google_artifact_registry_packages" {
    key_attributes = []
  }

  resource "google_artifact_registry_project_config" {
    key_attributes = []
  }

  resource "google_artifact_registry_python_package" {
    key_attributes = []
  }

  resource "google_artifact_registry_python_packages" {
    key_attributes = []
  }

  resource "google_artifact_registry_repository" {
    key_attributes = []
  }

  resource "google_artifact_registry_repository_iam" {
    key_attributes = []
  }

  resource "google_artifact_registry_repository_iam_policy" {
    key_attributes = []
  }

  resource "google_artifact_registry_rule" {
    key_attributes = []
  }

  resource "google_artifact_registry_tag" {
    key_attributes = []
  }

  resource "google_artifact_registry_tags" {
    key_attributes = []
  }

  resource "google_artifact_registry_version" {
    key_attributes = []
  }

  resource "google_artifact_registry_versions" {
    key_attributes = []
  }

  resource "google_artifact_registry_vpcsc_config" {
    key_attributes = []
  }

  resource "google_assured_workloads_workload" {
    key_attributes = []
  }

  resource "google_backup_dr_backup" {
    key_attributes = []
  }

  resource "google_backup_dr_backup_plan" {
    key_attributes = []
  }

  resource "google_backup_dr_backup_plan_association" {
    key_attributes = []
  }

  resource "google_backup_dr_backup_plan_associations" {
    key_attributes = []
  }

  resource "google_backup_dr_backup_vault" {
    key_attributes = []
  }

  resource "google_backup_dr_data_source" {
    key_attributes = []
  }

  resource "google_backup_dr_data_source_reference" {
    key_attributes = []
  }

  resource "google_backup_dr_data_source_references" {
    key_attributes = []
  }

  resource "google_backup_dr_data_sources" {
    key_attributes = []
  }

  resource "google_backup_dr_management_server" {
    key_attributes = []
  }

  resource "google_backup_dr_restore_workload" {
    key_attributes = []
  }

  resource "google_backup_dr_service_config" {
    key_attributes = []
  }

  resource "google_beyondcorp_app_connection" {
    key_attributes = []
  }

  resource "google_beyondcorp_app_connector" {
    key_attributes = []
  }

  resource "google_beyondcorp_app_gateway" {
    key_attributes = []
  }

  resource "google_beyondcorp_security_gateway" {
    key_attributes = []
  }

  resource "google_beyondcorp_security_gateway_application" {
    key_attributes = []
  }

  resource "google_beyondcorp_security_gateway_application_iam" {
    key_attributes = []
  }

  resource "google_beyondcorp_security_gateway_application_iam_policy" {
    key_attributes = []
  }

  resource "google_beyondcorp_security_gateway_iam" {
    key_attributes = []
  }

  resource "google_beyondcorp_security_gateway_iam_policy" {
    key_attributes = []
  }

  resource "google_biglake_catalog" {
    key_attributes = []
  }

  resource "google_biglake_database" {
    key_attributes = []
  }

  resource "google_biglake_hive_catalog" {
    key_attributes = []
  }

  resource "google_biglake_hive_catalog_iam" {
    key_attributes = []
  }

  resource "google_biglake_hive_catalog_iam_policy" {
    key_attributes = []
  }

  resource "google_biglake_hive_database" {
    key_attributes = []
  }

  resource "google_biglake_hive_database_iam" {
    key_attributes = []
  }

  resource "google_biglake_hive_database_iam_policy" {
    key_attributes = []
  }

  resource "google_biglake_iceberg_catalog" {
    key_attributes = []
  }

  resource "google_biglake_iceberg_catalog_iam" {
    key_attributes = []
  }

  resource "google_biglake_iceberg_catalog_iam_policy" {
    key_attributes = []
  }

  resource "google_biglake_iceberg_namespace" {
    key_attributes = []
  }

  resource "google_biglake_iceberg_namespace_iam" {
    key_attributes = []
  }

  resource "google_biglake_iceberg_namespace_iam_policy" {
    key_attributes = []
  }

  resource "google_biglake_iceberg_table" {
    key_attributes = []
  }

  resource "google_biglake_iceberg_table_iam" {
    key_attributes = []
  }

  resource "google_biglake_iceberg_table_iam_policy" {
    key_attributes = []
  }

  resource "google_biglake_table" {
    key_attributes = []
  }

  resource "google_bigquery_analytics_hub_data_exchange" {
    key_attributes = []
  }

  resource "google_bigquery_analytics_hub_data_exchange_iam" {
    key_attributes = []
  }

  resource "google_bigquery_analytics_hub_data_exchange_iam_policy" {
    key_attributes = []
  }

  resource "google_bigquery_analytics_hub_data_exchange_subscription" {
    key_attributes = []
  }

  resource "google_bigquery_analytics_hub_listing" {
    key_attributes = []
  }

  resource "google_bigquery_analytics_hub_listing_iam" {
    key_attributes = []
  }

  resource "google_bigquery_analytics_hub_listing_iam_policy" {
    key_attributes = []
  }

  resource "google_bigquery_analytics_hub_listing_subscription" {
    key_attributes = []
  }

  resource "google_bigquery_bi_reservation" {
    key_attributes = []
  }

  resource "google_bigquery_capacity_commitment" {
    key_attributes = []
  }

  resource "google_bigquery_connection" {
    key_attributes = []
  }

  resource "google_bigquery_connection_iam" {
    key_attributes = []
  }

  resource "google_bigquery_connection_iam_policy" {
    key_attributes = []
  }

  resource "google_bigquery_data_transfer_config" {
    key_attributes = []
  }

  resource "google_bigquery_datapolicy_data_policy" {
    key_attributes = []
  }

  resource "google_bigquery_datapolicy_data_policy_iam" {
    key_attributes = []
  }

  resource "google_bigquery_datapolicy_data_policy_iam_policy" {
    key_attributes = []
  }

  resource "google_bigquery_datapolicyv2_data_policy" {
    key_attributes = []
  }

  resource "google_bigquery_datapolicyv2_data_policy_iam" {
    key_attributes = []
  }

  resource "google_bigquery_datapolicyv2_data_policy_iam_policy" {
    key_attributes = []
  }

  resource "google_bigquery_dataset" {
    key_attributes = []
  }

  resource "google_bigquery_dataset_access" {
    key_attributes = []
  }

  resource "google_bigquery_dataset_iam" {
    key_attributes = []
  }

  resource "google_bigquery_dataset_iam_policy" {
    key_attributes = []
  }

  resource "google_bigquery_datasets" {
    key_attributes = []
  }

  resource "google_bigquery_default_service_account" {
    key_attributes = []
  }

  resource "google_bigquery_job" {
    key_attributes = []
  }

  resource "google_bigquery_reservation" {
    key_attributes = []
  }

  resource "google_bigquery_reservation_assignment" {
    key_attributes = []
  }

  resource "google_bigquery_reservation_group" {
    key_attributes = []
  }

  resource "google_bigquery_routine" {
    key_attributes = []
  }

  resource "google_bigquery_routine_iam" {
    key_attributes = []
  }

  resource "google_bigquery_routine_iam_policy" {
    key_attributes = []
  }

  resource "google_bigquery_row_access_policy" {
    key_attributes = []
  }

  resource "google_bigquery_table" {
    key_attributes = []
  }

  resource "google_bigquery_table_iam" {
    key_attributes = []
  }

  resource "google_bigquery_table_iam_policy" {
    key_attributes = []
  }

  resource "google_bigquery_tables" {
    key_attributes = []
  }

  resource "google_bigtable_app_profile" {
    key_attributes = []
  }

  resource "google_bigtable_authorized_view" {
    key_attributes = []
  }

  resource "google_bigtable_gc_policy" {
    key_attributes = []
  }

  resource "google_bigtable_instance" {
    key_attributes = []
  }

  resource "google_bigtable_instance_iam" {
    key_attributes = []
  }

  resource "google_bigtable_instance_iam_policy" {
    key_attributes = []
  }

  resource "google_bigtable_logical_view" {
    key_attributes = []
  }

  resource "google_bigtable_materialized_view" {
    key_attributes = []
  }

  resource "google_bigtable_schema_bundle" {
    key_attributes = []
  }

  resource "google_bigtable_table" {
    key_attributes = []
  }

  resource "google_bigtable_table_iam" {
    key_attributes = []
  }

  resource "google_bigtable_table_iam_policy" {
    key_attributes = []
  }

  resource "google_billing_account" {
    key_attributes = []
  }

  resource "google_billing_account_iam" {
    key_attributes = []
  }

  resource "google_billing_account_iam_policy" {
    key_attributes = []
  }

  resource "google_billing_budget" {
    key_attributes = []
  }

  resource "google_billing_project_info" {
    key_attributes = []
  }

  resource "google_binary_authorization_attestor" {
    key_attributes = []
  }

  resource "google_binary_authorization_attestor_iam" {
    key_attributes = []
  }

  resource "google_binary_authorization_attestor_iam_policy" {
    key_attributes = []
  }

  resource "google_binary_authorization_policy" {
    key_attributes = []
  }

  resource "google_blockchain_node_engine_blockchain_nodes" {
    key_attributes = []
  }

  resource "google_certificate_manager_certificate" {
    key_attributes = []
  }

  resource "google_certificate_manager_certificate_issuance_config" {
    key_attributes = []
  }

  resource "google_certificate_manager_certificate_map" {
    key_attributes = []
  }

  resource "google_certificate_manager_certificate_map_entry" {
    key_attributes = []
  }

  resource "google_certificate_manager_certificates" {
    key_attributes = []
  }

  resource "google_certificate_manager_dns_authorization" {
    key_attributes = []
  }

  resource "google_certificate_manager_trust_config" {
    key_attributes = []
  }

  resource "google_ces_agent" {
    key_attributes = []
  }

  resource "google_ces_app" {
    key_attributes = []
  }

  resource "google_ces_app_root_agent_association" {
    key_attributes = []
  }

  resource "google_ces_app_version" {
    key_attributes = []
  }

  resource "google_ces_deployment" {
    key_attributes = []
  }

  resource "google_ces_evaluation" {
    key_attributes = []
  }

  resource "google_ces_example" {
    key_attributes = []
  }

  resource "google_ces_guardrail" {
    key_attributes = []
  }

  resource "google_ces_security_settings" {
    key_attributes = []
  }

  resource "google_ces_tool" {
    key_attributes = []
  }

  resource "google_ces_toolset" {
    key_attributes = []
  }

  resource "google_chronicle_custom_list" {
    key_attributes = []
  }

  resource "google_chronicle_dashboard_chart" {
    key_attributes = []
  }

  resource "google_chronicle_data_access_label" {
    key_attributes = []
  }

  resource "google_chronicle_data_access_scope" {
    key_attributes = []
  }

  resource "google_chronicle_data_export" {
    key_attributes = []
  }

  resource "google_chronicle_data_table" {
    key_attributes = []
  }

  resource "google_chronicle_data_table_row" {
    key_attributes = []
  }

  resource "google_chronicle_environment" {
    key_attributes = []
  }

  resource "google_chronicle_environment_group" {
    key_attributes = []
  }

  resource "google_chronicle_feed" {
    key_attributes = []
  }

  resource "google_chronicle_findings_refinement" {
    key_attributes = []
  }

  resource "google_chronicle_findings_refinement_deployment" {
    key_attributes = []
  }

  resource "google_chronicle_native_dashboard" {
    key_attributes = []
  }

  resource "google_chronicle_parser" {
    key_attributes = []
  }

  resource "google_chronicle_parser_extension" {
    key_attributes = []
  }

  resource "google_chronicle_reference_list" {
    key_attributes = []
  }

  resource "google_chronicle_retrohunt" {
    key_attributes = []
  }

  resource "google_chronicle_rule" {
    key_attributes = []
  }

  resource "google_chronicle_rule_deployment" {
    key_attributes = []
  }

  resource "google_chronicle_soar_domain" {
    key_attributes = []
  }

  resource "google_chronicle_soar_network" {
    key_attributes = []
  }

  resource "google_chronicle_watchlist" {
    key_attributes = []
  }

  resource "google_client_config" {
    key_attributes = []
  }

  resource "google_client_openid_userinfo" {
    key_attributes = []
  }

  resource "google_cloud_asset_folder_feed" {
    key_attributes = []
  }

  resource "google_cloud_asset_organization_feed" {
    key_attributes = []
  }

  resource "google_cloud_asset_project_feed" {
    key_attributes = []
  }

  resource "google_cloud_identity_group" {
    key_attributes = []
  }

  resource "google_cloud_identity_group_lookup" {
    key_attributes = []
  }

  resource "google_cloud_identity_group_membership" {
    key_attributes = []
  }

  resource "google_cloud_identity_group_memberships" {
    key_attributes = []
  }

  resource "google_cloud_identity_group_transitive_memberships" {
    key_attributes = []
  }

  resource "google_cloud_identity_groups" {
    key_attributes = []
  }

  resource "google_cloud_identity_policies" {
    key_attributes = []
  }

  resource "google_cloud_identity_policy" {
    key_attributes = []
  }

  resource "google_cloud_ids_endpoint" {
    key_attributes = []
  }

  resource "google_cloud_quotas_quota_adjuster_settings" {
    key_attributes = []
  }

  resource "google_cloud_quotas_quota_info" {
    key_attributes = []
  }

  resource "google_cloud_quotas_quota_infos" {
    key_attributes = []
  }

  resource "google_cloud_quotas_quota_preference" {
    key_attributes = []
  }

  resource "google_cloud_run_domain_mapping" {
    key_attributes = []
  }

  resource "google_cloud_run_locations" {
    key_attributes = []
  }

  resource "google_cloud_run_service_iam" {
    key_attributes = []
  }

  resource "google_cloud_run_v2_job" {
    key_attributes = []
  }

  resource "google_cloud_run_v2_job_iam" {
    key_attributes = []
  }

  resource "google_cloud_run_v2_job_iam_policy" {
    key_attributes = []
  }

  resource "google_cloud_run_v2_service" {
    key_attributes = []
  }

  resource "google_cloud_run_v2_service_iam" {
    key_attributes = []
  }

  resource "google_cloud_run_v2_service_iam_policy" {
    key_attributes = []
  }

  resource "google_cloud_run_v2_worker_pool" {
    key_attributes = []
  }

  resource "google_cloud_run_v2_worker_pool_iam" {
    key_attributes = []
  }

  resource "google_cloud_run_v2_worker_pool_iam_policy" {
    key_attributes = []
  }

  resource "google_cloud_security_compliance_cloud_control" {
    key_attributes = []
  }

  resource "google_cloud_security_compliance_framework" {
    key_attributes = []
  }

  resource "google_cloud_security_compliance_framework_deployment" {
    key_attributes = []
  }

  resource "google_cloud_tasks_queue" {
    key_attributes = []
  }

  resource "google_cloud_tasks_queue_iam" {
    key_attributes = []
  }

  resource "google_cloud_tasks_queue_iam_policy" {
    key_attributes = []
  }

  resource "google_cloudbuild_bitbucket_server_config" {
    key_attributes = []
  }

  resource "google_cloudbuild_worker_pool" {
    key_attributes = []
  }

  resource "google_cloudbuildv2_connection" {
    key_attributes = []
  }

  resource "google_cloudbuildv2_connection_iam" {
    key_attributes = []
  }

  resource "google_cloudbuildv2_connection_iam_policy" {
    key_attributes = []
  }

  resource "google_cloudbuildv2_repository" {
    key_attributes = []
  }

  resource "google_clouddeploy_automation" {
    key_attributes = []
  }

  resource "google_clouddeploy_custom_target_type" {
    key_attributes = []
  }

  resource "google_clouddeploy_custom_target_type_iam" {
    key_attributes = []
  }

  resource "google_clouddeploy_custom_target_type_iam_policy" {
    key_attributes = []
  }

  resource "google_clouddeploy_delivery_pipeline" {
    key_attributes = []
  }

  resource "google_clouddeploy_delivery_pipeline_iam" {
    key_attributes = []
  }

  resource "google_clouddeploy_delivery_pipeline_iam_policy" {
    key_attributes = []
  }

  resource "google_clouddeploy_deploy_policy" {
    key_attributes = []
  }

  resource "google_clouddeploy_target" {
    key_attributes = []
  }

  resource "google_clouddeploy_target_iam" {
    key_attributes = []
  }

  resource "google_clouddeploy_target_iam_policy" {
    key_attributes = []
  }

  resource "google_clouddomains_registration" {
    key_attributes = []
  }

  resource "google_cloudfunctions_function" {
    key_attributes = []
  }

  resource "google_cloudfunctions_function_iam" {
    key_attributes = []
  }

  resource "google_cloudfunctions_function_iam_policy" {
    key_attributes = []
  }

  resource "google_cloudfunctions2_function_iam" {
    key_attributes = []
  }

  resource "google_cloudfunctions2_function_iam_policy" {
    key_attributes = []
  }

  resource "google_colab_notebook_execution" {
    key_attributes = []
  }

  resource "google_colab_runtime" {
    key_attributes = []
  }

  resource "google_colab_runtime_template" {
    key_attributes = []
  }

  resource "google_colab_runtime_template_iam" {
    key_attributes = []
  }

  resource "google_colab_runtime_template_iam_policy" {
    key_attributes = []
  }

  resource "google_colab_schedule" {
    key_attributes = []
  }

  resource "google_composer_environment" {
    key_attributes = []
  }

  resource "google_composer_image_versions" {
    key_attributes = []
  }

  resource "google_composer_user_workloads_config_map" {
    key_attributes = []
  }

  resource "google_composer_user_workloads_secret" {
    key_attributes = []
  }

  resource "google_compute_addresses" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_attached_disk" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_autoscaler" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_backend_bucket" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_backend_bucket_iam" {
    key_attributes = []
  }

  resource "google_compute_backend_bucket_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_backend_bucket_signed_url_key" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_backend_service_iam" {
    key_attributes = []
  }

  resource "google_compute_backend_service_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_backend_service_signed_url_key" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_bulk_per_instance_config" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_cross_site_network" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_default_service_account" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_disk" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_disk_async_replication" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_disk_iam" {
    key_attributes = []
  }

  resource "google_compute_disk_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_disk_resource_policy_attachment" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_external_vpn_gateway" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_firewall_policy" {
    key_attributes = []
  }

  resource "google_compute_firewall_policy_association" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_firewall_policy_iam" {
    key_attributes = []
  }

  resource "google_compute_firewall_policy_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_firewall_policy_rule" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_firewall_policy_with_rules" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_forwarding_rules" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_future_reservation" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_global_network_endpoint" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_global_network_endpoint_group" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_ha_vpn_gateway" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_http_health_check" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_https_health_check" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_image" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_image_iam" {
    key_attributes = []
  }

  resource "google_compute_image_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_images" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_instance_from_machine_image" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_instance_from_template" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_instance_group" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_instance_group_membership" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_instance_group_named_port" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_instance_groups" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_instance_guest_attributes" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_instance_iam" {
    key_attributes = []
  }

  resource "google_compute_instance_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_instance_serial_port" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_instance_settings" {
    key_attributes = []
  }

  resource "google_compute_instance_template_iam" {
    key_attributes = []
  }

  resource "google_compute_instance_template_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_instant_snapshot" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_instant_snapshot_iam" {
    key_attributes = []
  }

  resource "google_compute_instant_snapshot_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_interconnect" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_interconnect_attachment" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_interconnect_attachment_group" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_interconnect_group" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_interconnect_location" {
    key_attributes = []
  }

  resource "google_compute_interconnect_locations" {
    key_attributes = []
  }

  resource "google_compute_lb_ip_ranges" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_machine_image" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_machine_image_iam" {
    key_attributes = []
  }

  resource "google_compute_machine_image_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_machine_types" {
    key_attributes = []
  }

  resource "google_compute_network_attachment" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_network_edge_security_service" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_network_endpoint" {
    key_attributes = ["project", "zone", "network_endpoint_group"]
  }

  resource "google_compute_network_endpoint_groups" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_network_endpoints" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_network_firewall_policy" {
    key_attributes = []
  }

  resource "google_compute_network_firewall_policy_association" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_network_firewall_policy_iam" {
    key_attributes = []
  }

  resource "google_compute_network_firewall_policy_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_network_firewall_policy_packet_mirroring_rule" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_network_firewall_policy_rule" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_network_firewall_policy_with_rules" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_network_peering" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_network_peering_routes_config" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_networks" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_node_group" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_node_template" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_node_types" {
    key_attributes = []
  }

  resource "google_compute_organization_security_policy" {
    key_attributes = []
  }

  resource "google_compute_organization_security_policy_association" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_organization_security_policy_rule" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_packet_mirroring" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_per_instance_config" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_preview_feature" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_project_cloud_armor_tier" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_project_default_network_tier" {
    key_attributes = []
  }

  resource "google_compute_project_metadata" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_project_metadata_item" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_public_advertised_prefix" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_public_delegated_prefix" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_region_autoscaler" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_backend_bucket" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_backend_bucket_iam" {
    key_attributes = []
  }

  resource "google_compute_region_backend_bucket_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_region_backend_service" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_backend_service_iam" {
    key_attributes = []
  }

  resource "google_compute_region_backend_service_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_region_commitment" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_composite_health_check" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_disk" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_disk_iam" {
    key_attributes = []
  }

  resource "google_compute_region_disk_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_region_disk_resource_policy_attachment" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_health_aggregation_policy" {
    key_attributes = []
  }

  resource "google_compute_region_health_check" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_health_source" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_instance_group" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_instance_template" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_instant_snapshot" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_instant_snapshot_iam" {
    key_attributes = []
  }

  resource "google_compute_region_instant_snapshot_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_region_network_endpoint" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_network_firewall_policy" {
    key_attributes = []
  }

  resource "google_compute_region_network_firewall_policy_association" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_network_firewall_policy_iam" {
    key_attributes = []
  }

  resource "google_compute_region_network_firewall_policy_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_region_network_firewall_policy_rule" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_network_firewall_policy_with_rules" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_network_policy" {
    key_attributes = []
  }

  resource "google_compute_region_per_instance_config" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_resize_request" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_security_policy" {
    key_attributes = []
  }

  resource "google_compute_region_security_policy_rule" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_ssl_certificate" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_ssl_policy" {
    key_attributes = []
  }

  resource "google_compute_region_target_http_proxy" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_target_https_proxy" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_target_tcp_proxy" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_region_url_map" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_regions" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_reservation" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_reservation_block" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_reservation_sub_block" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_resize_request" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_resource_policy" {
    key_attributes = []
  }

  resource "google_compute_resource_policy_attachment" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_rollout_plan" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_router_interface" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_router_named_set" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_router_nat_address" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_router_peer" {
    key_attributes = ["project", "region", "name"]
  }

  resource "google_compute_router_route_policy" {
    key_attributes = []
  }

  resource "google_compute_router_status" {
    key_attributes = []
  }

  resource "google_compute_routers" {
    key_attributes = ["project", "name"]
  }

  resource "google_compute_security_policy" {
    key_attributes = []
  }

  resource "google_compute_security_policy_rule" {
    key_attributes = []
  }

  resource "google_compute_service_attachment" {
    key_attributes = []
  }

  resource "google_compute_shared_vpc_host_project" {
    key_attributes = []
  }

  resource "google_compute_shared_vpc_service_project" {
    key_attributes = []
  }

  resource "google_compute_snapshot" {
    key_attributes = []
  }

  resource "google_compute_snapshot_iam" {
    key_attributes = []
  }

  resource "google_compute_snapshot_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_snapshot_settings" {
    key_attributes = []
  }

  resource "google_compute_ssl_certificate" {
    key_attributes = []
  }

  resource "google_compute_storage_pool" {
    key_attributes = []
  }

  resource "google_compute_storage_pool_iam" {
    key_attributes = []
  }

  resource "google_compute_storage_pool_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_storage_pool_type" {
    key_attributes = []
  }

  resource "google_compute_subnetwork_iam" {
    key_attributes = []
  }

  resource "google_compute_subnetwork_iam_policy" {
    key_attributes = []
  }

  resource "google_compute_subnetworks" {
    key_attributes = []
  }

  resource "google_compute_target_grpc_proxy" {
    key_attributes = []
  }

  resource "google_compute_target_instance" {
    key_attributes = []
  }

  resource "google_compute_target_pool" {
    key_attributes = []
  }

  resource "google_compute_target_ssl_proxy" {
    key_attributes = []
  }

  resource "google_compute_target_tcp_proxy" {
    key_attributes = []
  }

  resource "google_compute_wire_group" {
    key_attributes = []
  }

  resource "google_compute_zone_vm_extension_policy" {
    key_attributes = []
  }

  resource "google_compute_zones" {
    key_attributes = []
  }

  resource "google_config_deployment" {
    key_attributes = []
  }

  resource "google_contact_center_insights_analysis_rule" {
    key_attributes = []
  }

  resource "google_contact_center_insights_assessment_rule" {
    key_attributes = []
  }

  resource "google_contact_center_insights_auto_labeling_rule" {
    key_attributes = []
  }

  resource "google_contact_center_insights_encryption_spec" {
    key_attributes = []
  }

  resource "google_contact_center_insights_qa_question" {
    key_attributes = []
  }

  resource "google_contact_center_insights_qa_scorecard" {
    key_attributes = []
  }

  resource "google_contact_center_insights_qa_scorecard_revision" {
    key_attributes = []
  }

  resource "google_contact_center_insights_view" {
    key_attributes = []
  }

  resource "google_container_analysis_note" {
    key_attributes = []
  }

  resource "google_container_analysis_note_iam" {
    key_attributes = []
  }

  resource "google_container_analysis_note_iam_policy" {
    key_attributes = []
  }

  resource "google_container_analysis_occurrence" {
    key_attributes = []
  }

  resource "google_container_attached_cluster" {
    key_attributes = []
  }

  resource "google_container_attached_install_manifest" {
    key_attributes = []
  }

  resource "google_container_attached_versions" {
    key_attributes = []
  }

  resource "google_container_aws_cluster" {
    key_attributes = []
  }

  resource "google_container_aws_node_pool" {
    key_attributes = []
  }

  resource "google_container_aws_versions" {
    key_attributes = []
  }

  resource "google_container_azure_client" {
    key_attributes = []
  }

  resource "google_container_azure_cluster" {
    key_attributes = []
  }

  resource "google_container_azure_node_pool" {
    key_attributes = []
  }

  resource "google_container_azure_versions" {
    key_attributes = []
  }

  resource "google_container_engine_versions" {
    key_attributes = []
  }

  resource "google_container_registry_image" {
    key_attributes = []
  }

  resource "google_container_registry_repository" {
    key_attributes = []
  }

  resource "google_data_catalog_entry" {
    key_attributes = []
  }

  resource "google_data_catalog_entry_group" {
    key_attributes = []
  }

  resource "google_data_catalog_entry_group_iam" {
    key_attributes = []
  }

  resource "google_data_catalog_entry_group_iam_policy" {
    key_attributes = []
  }

  resource "google_data_catalog_policy_tag" {
    key_attributes = []
  }

  resource "google_data_catalog_policy_tag_iam" {
    key_attributes = []
  }

  resource "google_data_catalog_policy_tag_iam_policy" {
    key_attributes = []
  }

  resource "google_data_catalog_tag" {
    key_attributes = []
  }

  resource "google_data_catalog_tag_template" {
    key_attributes = []
  }

  resource "google_data_catalog_tag_template_iam" {
    key_attributes = []
  }

  resource "google_data_catalog_tag_template_iam_policy" {
    key_attributes = []
  }

  resource "google_data_catalog_taxonomy" {
    key_attributes = []
  }

  resource "google_data_catalog_taxonomy_iam" {
    key_attributes = []
  }

  resource "google_data_catalog_taxonomy_iam_policy" {
    key_attributes = []
  }

  resource "google_data_fusion_instance" {
    key_attributes = []
  }

  resource "google_data_fusion_instance_iam" {
    key_attributes = []
  }

  resource "google_data_fusion_instance_iam_policy" {
    key_attributes = []
  }

  resource "google_data_lineage_config" {
    key_attributes = []
  }

  resource "google_data_loss_prevention_deidentify_template" {
    key_attributes = []
  }

  resource "google_data_loss_prevention_discovery_config" {
    key_attributes = []
  }

  resource "google_data_loss_prevention_inspect_template" {
    key_attributes = []
  }

  resource "google_data_loss_prevention_job_trigger" {
    key_attributes = []
  }

  resource "google_data_loss_prevention_stored_info_type" {
    key_attributes = []
  }

  resource "google_data_pipeline_pipeline" {
    key_attributes = []
  }

  resource "google_database_migration_service_connection_profile" {
    key_attributes = []
  }

  resource "google_database_migration_service_migration_job" {
    key_attributes = []
  }

  resource "google_database_migration_service_private_connection" {
    key_attributes = []
  }

  resource "google_dataflow_flex_template_job" {
    key_attributes = []
  }

  resource "google_dataflow_job" {
    key_attributes = []
  }

  resource "google_dataform_config" {
    key_attributes = []
  }

  resource "google_dataform_folder" {
    key_attributes = []
  }

  resource "google_dataform_repository" {
    key_attributes = []
  }

  resource "google_dataform_repository_iam" {
    key_attributes = []
  }

  resource "google_dataform_repository_iam_policy" {
    key_attributes = []
  }

  resource "google_dataform_repository_release_config" {
    key_attributes = []
  }

  resource "google_dataform_repository_workflow_config" {
    key_attributes = []
  }

  resource "google_dataform_team_folder" {
    key_attributes = []
  }

  resource "google_dataplex_aspect_type" {
    key_attributes = []
  }

  resource "google_dataplex_aspect_type_iam" {
    key_attributes = []
  }

  resource "google_dataplex_aspect_type_iam_policy" {
    key_attributes = []
  }

  resource "google_dataplex_asset" {
    key_attributes = []
  }

  resource "google_dataplex_asset_iam" {
    key_attributes = []
  }

  resource "google_dataplex_asset_iam_policy" {
    key_attributes = []
  }

  resource "google_dataplex_data_asset" {
    key_attributes = []
  }

  resource "google_dataplex_data_product" {
    key_attributes = []
  }

  resource "google_dataplex_data_product_data_asset" {
    key_attributes = []
  }

  resource "google_dataplex_data_product_iam" {
    key_attributes = []
  }

  resource "google_dataplex_data_product_iam_policy" {
    key_attributes = []
  }

  resource "google_dataplex_data_quality_rules" {
    key_attributes = []
  }

  resource "google_dataplex_datascan" {
    key_attributes = []
  }

  resource "google_dataplex_datascan_iam" {
    key_attributes = []
  }

  resource "google_dataplex_datascan_iam_policy" {
    key_attributes = []
  }

  resource "google_dataplex_entry" {
    key_attributes = []
  }

  resource "google_dataplex_entry_group" {
    key_attributes = []
  }

  resource "google_dataplex_entry_group_iam" {
    key_attributes = []
  }

  resource "google_dataplex_entry_group_iam_policy" {
    key_attributes = []
  }

  resource "google_dataplex_entry_link" {
    key_attributes = []
  }

  resource "google_dataplex_entry_type" {
    key_attributes = []
  }

  resource "google_dataplex_entry_type_iam" {
    key_attributes = []
  }

  resource "google_dataplex_entry_type_iam_policy" {
    key_attributes = []
  }

  resource "google_dataplex_glossary" {
    key_attributes = []
  }

  resource "google_dataplex_glossary_category" {
    key_attributes = []
  }

  resource "google_dataplex_glossary_iam" {
    key_attributes = []
  }

  resource "google_dataplex_glossary_iam_policy" {
    key_attributes = []
  }

  resource "google_dataplex_glossary_term" {
    key_attributes = []
  }

  resource "google_dataplex_lake" {
    key_attributes = []
  }

  resource "google_dataplex_lake_iam" {
    key_attributes = []
  }

  resource "google_dataplex_lake_iam_policy" {
    key_attributes = []
  }

  resource "google_dataplex_metadata_feed" {
    key_attributes = []
  }

  resource "google_dataplex_task" {
    key_attributes = []
  }

  resource "google_dataplex_task_iam" {
    key_attributes = []
  }

  resource "google_dataplex_task_iam_policy" {
    key_attributes = []
  }

  resource "google_dataplex_zone" {
    key_attributes = []
  }

  resource "google_dataplex_zone_iam" {
    key_attributes = []
  }

  resource "google_dataplex_zone_iam_policy" {
    key_attributes = []
  }

  resource "google_dataproc_autoscaling_policy" {
    key_attributes = []
  }

  resource "google_dataproc_autoscaling_policy_iam" {
    key_attributes = []
  }

  resource "google_dataproc_autoscaling_policy_iam_policy" {
    key_attributes = []
  }

  resource "google_dataproc_batch" {
    key_attributes = []
  }

  resource "google_dataproc_cluster" {
    key_attributes = []
  }

  resource "google_dataproc_cluster_iam" {
    key_attributes = []
  }

  resource "google_dataproc_cluster_iam_policy" {
    key_attributes = []
  }

  resource "google_dataproc_gdc_application_environment" {
    key_attributes = []
  }

  resource "google_dataproc_gdc_service_instance" {
    key_attributes = []
  }

  resource "google_dataproc_gdc_spark_application" {
    key_attributes = []
  }

  resource "google_dataproc_job" {
    key_attributes = []
  }

  resource "google_dataproc_job_iam" {
    key_attributes = []
  }

  resource "google_dataproc_job_iam_policy" {
    key_attributes = []
  }

  resource "google_dataproc_metastore_database_iam" {
    key_attributes = []
  }

  resource "google_dataproc_metastore_database_iam_policy" {
    key_attributes = []
  }

  resource "google_dataproc_metastore_federation" {
    key_attributes = []
  }

  resource "google_dataproc_metastore_federation_iam" {
    key_attributes = []
  }

  resource "google_dataproc_metastore_federation_iam_policy" {
    key_attributes = []
  }

  resource "google_dataproc_metastore_service" {
    key_attributes = []
  }

  resource "google_dataproc_metastore_service_iam" {
    key_attributes = []
  }

  resource "google_dataproc_metastore_service_iam_policy" {
    key_attributes = []
  }

  resource "google_dataproc_metastore_table_iam" {
    key_attributes = []
  }

  resource "google_dataproc_metastore_table_iam_policy" {
    key_attributes = []
  }

  resource "google_dataproc_session_template" {
    key_attributes = []
  }

  resource "google_dataproc_workflow_template" {
    key_attributes = []
  }

  resource "google_datastream_connection_profile" {
    key_attributes = []
  }

  resource "google_datastream_private_connection" {
    key_attributes = []
  }

  resource "google_datastream_stream" {
    key_attributes = []
  }

  resource "google_deployment_manager_deployment" {
    key_attributes = []
  }

  resource "google_developer_connect_account_connector" {
    key_attributes = []
  }

  resource "google_developer_connect_connection" {
    key_attributes = []
  }

  resource "google_developer_connect_git_repository_link" {
    key_attributes = []
  }

  resource "google_developer_connect_insights_config" {
    key_attributes = []
  }

  resource "google_dialogflow_agent" {
    key_attributes = []
  }

  resource "google_dialogflow_conversation_profile" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_agent" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_entity_type" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_environment" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_flow" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_generative_settings" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_generator" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_intent" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_page" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_playbook" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_security_settings" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_test_case" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_tool" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_tool_version" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_version" {
    key_attributes = []
  }

  resource "google_dialogflow_cx_webhook" {
    key_attributes = []
  }

  resource "google_dialogflow_encryption_spec" {
    key_attributes = []
  }

  resource "google_dialogflow_entity_type" {
    key_attributes = []
  }

  resource "google_dialogflow_environment" {
    key_attributes = []
  }

  resource "google_dialogflow_fulfillment" {
    key_attributes = []
  }

  resource "google_dialogflow_generator" {
    key_attributes = []
  }

  resource "google_dialogflow_intent" {
    key_attributes = []
  }

  resource "google_dialogflow_sip_trunk" {
    key_attributes = []
  }

  resource "google_dialogflow_version" {
    key_attributes = []
  }

  resource "google_discovery_engine_acl_config" {
    key_attributes = []
  }

  resource "google_discovery_engine_assistant" {
    key_attributes = []
  }

  resource "google_discovery_engine_chat_engine" {
    key_attributes = []
  }

  resource "google_discovery_engine_cmek_config" {
    key_attributes = []
  }

  resource "google_discovery_engine_control" {
    key_attributes = []
  }

  resource "google_discovery_engine_data_connector" {
    key_attributes = []
  }

  resource "google_discovery_engine_data_store" {
    key_attributes = []
  }

  resource "google_discovery_engine_data_stores" {
    key_attributes = []
  }

  resource "google_discovery_engine_license_config" {
    key_attributes = []
  }

  resource "google_discovery_engine_recommendation_engine" {
    key_attributes = []
  }

  resource "google_discovery_engine_schema" {
    key_attributes = []
  }

  resource "google_discovery_engine_search_engine" {
    key_attributes = []
  }

  resource "google_discovery_engine_search_engine_iam" {
    key_attributes = []
  }

  resource "google_discovery_engine_search_engine_iam_policy" {
    key_attributes = []
  }

  resource "google_discovery_engine_serving_config" {
    key_attributes = []
  }

  resource "google_discovery_engine_sitemap" {
    key_attributes = []
  }

  resource "google_discovery_engine_target_site" {
    key_attributes = []
  }

  resource "google_discovery_engine_user_store" {
    key_attributes = []
  }

  resource "google_discovery_engine_widget_config" {
    key_attributes = []
  }

  resource "google_dns_keys" {
    key_attributes = []
  }

  resource "google_dns_managed_zone_iam" {
    key_attributes = []
  }

  resource "google_dns_managed_zone_iam_policy" {
    key_attributes = []
  }

  resource "google_dns_managed_zones" {
    key_attributes = []
  }

  resource "google_dns_policy" {
    key_attributes = []
  }

  resource "google_dns_response_policy" {
    key_attributes = []
  }

  resource "google_dns_response_policy_rule" {
    key_attributes = []
  }

  resource "google_document_ai_processor" {
    key_attributes = []
  }

  resource "google_document_ai_processor_default_version" {
    key_attributes = []
  }

  resource "google_document_ai_schema" {
    key_attributes = []
  }

  resource "google_document_ai_warehouse_document_schema" {
    key_attributes = []
  }

  resource "google_document_ai_warehouse_location" {
    key_attributes = []
  }

  resource "google_edgecontainer_cluster" {
    key_attributes = []
  }

  resource "google_edgecontainer_node_pool" {
    key_attributes = []
  }

  resource "google_edgecontainer_vpn_connection" {
    key_attributes = []
  }

  resource "google_edgenetwork_interconnect_attachment" {
    key_attributes = []
  }

  resource "google_edgenetwork_network" {
    key_attributes = []
  }

  resource "google_edgenetwork_subnet" {
    key_attributes = []
  }

  resource "google_endpoints_service" {
    key_attributes = []
  }

  resource "google_endpoints_service_consumers_iam" {
    key_attributes = []
  }

  resource "google_endpoints_service_consumers_iam_policy" {
    key_attributes = []
  }

  resource "google_endpoints_service_iam" {
    key_attributes = []
  }

  resource "google_endpoints_service_iam_policy" {
    key_attributes = []
  }

  resource "google_essential_contacts_contact" {
    key_attributes = []
  }

  resource "google_eventarc_channel" {
    key_attributes = []
  }

  resource "google_eventarc_enrollment" {
    key_attributes = []
  }

  resource "google_eventarc_google_api_source" {
    key_attributes = []
  }

  resource "google_eventarc_google_channel_config" {
    key_attributes = []
  }

  resource "google_eventarc_message_bus" {
    key_attributes = []
  }

  resource "google_eventarc_pipeline" {
    key_attributes = []
  }

  resource "google_filestore_backup" {
    key_attributes = []
  }

  resource "google_filestore_instance" {
    key_attributes = []
  }

  resource "google_filestore_snapshot" {
    key_attributes = []
  }

  resource "google_firebase_admin_sdk_config" {
    key_attributes = []
  }

  resource "google_firebase_ai_logic_config" {
    key_attributes = []
  }

  resource "google_firebase_ai_logic_prompt_template" {
    key_attributes = []
  }

  resource "google_firebase_ai_logic_prompt_template_lock" {
    key_attributes = []
  }

  resource "google_firebase_android_app" {
    key_attributes = []
  }

  resource "google_firebase_android_app_config" {
    key_attributes = []
  }

  resource "google_firebase_app_check_app_attest_config" {
    key_attributes = []
  }

  resource "google_firebase_app_check_debug_token" {
    key_attributes = []
  }

  resource "google_firebase_app_check_device_check_config" {
    key_attributes = []
  }

  resource "google_firebase_app_check_play_integrity_config" {
    key_attributes = []
  }

  resource "google_firebase_app_check_recaptcha_enterprise_config" {
    key_attributes = []
  }

  resource "google_firebase_app_check_recaptcha_v3_config" {
    key_attributes = []
  }

  resource "google_firebase_app_check_resource_policy" {
    key_attributes = []
  }

  resource "google_firebase_app_check_service_config" {
    key_attributes = []
  }

  resource "google_firebase_app_hosting_backend" {
    key_attributes = []
  }

  resource "google_firebase_app_hosting_build" {
    key_attributes = []
  }

  resource "google_firebase_app_hosting_default_domain" {
    key_attributes = []
  }

  resource "google_firebase_app_hosting_domain" {
    key_attributes = []
  }

  resource "google_firebase_app_hosting_traffic" {
    key_attributes = []
  }

  resource "google_firebase_apple_app" {
    key_attributes = []
  }

  resource "google_firebase_apple_app_config" {
    key_attributes = []
  }

  resource "google_firebase_data_connect_service" {
    key_attributes = []
  }

  resource "google_firebase_database_instance" {
    key_attributes = []
  }

  resource "google_firebase_extensions_instance" {
    key_attributes = []
  }

  resource "google_firebase_hosting_channel" {
    key_attributes = []
  }

  resource "google_firebase_hosting_custom_domain" {
    key_attributes = []
  }

  resource "google_firebase_hosting_release" {
    key_attributes = []
  }

  resource "google_firebase_hosting_site" {
    key_attributes = []
  }

  resource "google_firebase_hosting_version" {
    key_attributes = []
  }

  resource "google_firebase_project" {
    key_attributes = []
  }

  resource "google_firebase_remote_config_remote_config" {
    key_attributes = []
  }

  resource "google_firebase_storage_bucket" {
    key_attributes = []
  }

  resource "google_firebase_storage_default_bucket" {
    key_attributes = []
  }

  resource "google_firebase_web_app" {
    key_attributes = []
  }

  resource "google_firebase_web_app_config" {
    key_attributes = []
  }

  resource "google_firebaserules_release" {
    key_attributes = []
  }

  resource "google_firebaserules_ruleset" {
    key_attributes = []
  }

  resource "google_firestore_backup_schedule" {
    key_attributes = []
  }

  resource "google_firestore_database" {
    key_attributes = []
  }

  resource "google_firestore_document" {
    key_attributes = []
  }

  resource "google_firestore_field" {
    key_attributes = []
  }

  resource "google_firestore_index" {
    key_attributes = []
  }

  resource "google_firestore_user_creds" {
    key_attributes = []
  }

  resource "google_folder" {
    key_attributes = []
  }

  resource "google_folder_access_approval_settings" {
    key_attributes = []
  }

  resource "google_folder_iam_policy" {
    key_attributes = []
  }

  resource "google_folder_organization_policy" {
    key_attributes = []
  }

  resource "google_folder_service_identity" {
    key_attributes = []
  }

  resource "google_folders" {
    key_attributes = []
  }

  resource "google_gemini_code_repository_index" {
    key_attributes = []
  }

  resource "google_gemini_code_tools_setting" {
    key_attributes = []
  }

  resource "google_gemini_code_tools_setting_binding" {
    key_attributes = []
  }

  resource "google_gemini_data_sharing_with_google_setting" {
    key_attributes = []
  }

  resource "google_gemini_data_sharing_with_google_setting_binding" {
    key_attributes = []
  }

  resource "google_gemini_gemini_gcp_enablement_setting" {
    key_attributes = []
  }

  resource "google_gemini_gemini_gcp_enablement_setting_binding" {
    key_attributes = []
  }

  resource "google_gemini_logging_setting" {
    key_attributes = []
  }

  resource "google_gemini_logging_setting_binding" {
    key_attributes = []
  }

  resource "google_gemini_release_channel_setting" {
    key_attributes = []
  }

  resource "google_gemini_release_channel_setting_binding" {
    key_attributes = []
  }

  resource "google_gemini_repository_group" {
    key_attributes = []
  }

  resource "google_gemini_repository_group_iam" {
    key_attributes = []
  }

  resource "google_gemini_repository_group_iam_policy" {
    key_attributes = []
  }

  resource "google_gke_backup_backup_channel" {
    key_attributes = []
  }

  resource "google_gke_backup_backup_plan" {
    key_attributes = []
  }

  resource "google_gke_backup_backup_plan_iam" {
    key_attributes = []
  }

  resource "google_gke_backup_backup_plan_iam_policy" {
    key_attributes = []
  }

  resource "google_gke_backup_restore_channel" {
    key_attributes = []
  }

  resource "google_gke_backup_restore_plan" {
    key_attributes = []
  }

  resource "google_gke_backup_restore_plan_iam" {
    key_attributes = []
  }

  resource "google_gke_backup_restore_plan_iam_policy" {
    key_attributes = []
  }

  resource "google_gke_hub_feature" {
    key_attributes = []
  }

  resource "google_gke_hub_feature_iam" {
    key_attributes = []
  }

  resource "google_gke_hub_feature_iam_policy" {
    key_attributes = []
  }

  resource "google_gke_hub_feature_membership" {
    key_attributes = []
  }

  resource "google_gke_hub_fleet" {
    key_attributes = []
  }

  resource "google_gke_hub_membership" {
    key_attributes = []
  }

  resource "google_gke_hub_membership_binding" {
    key_attributes = []
  }

  resource "google_gke_hub_membership_iam" {
    key_attributes = []
  }

  resource "google_gke_hub_membership_iam_policy" {
    key_attributes = []
  }

  resource "google_gke_hub_membership_rbac_role_binding" {
    key_attributes = []
  }

  resource "google_gke_hub_namespace" {
    key_attributes = []
  }

  resource "google_gke_hub_rollout_sequence" {
    key_attributes = []
  }

  resource "google_gke_hub_scope" {
    key_attributes = []
  }

  resource "google_gke_hub_scope_iam" {
    key_attributes = []
  }

  resource "google_gke_hub_scope_iam_policy" {
    key_attributes = []
  }

  resource "google_gke_hub_scope_rbac_role_binding" {
    key_attributes = []
  }

  resource "google_gkeonprem_bare_metal_admin_cluster" {
    key_attributes = []
  }

  resource "google_gkeonprem_bare_metal_cluster" {
    key_attributes = []
  }

  resource "google_gkeonprem_bare_metal_node_pool" {
    key_attributes = []
  }

  resource "google_gkeonprem_vmware_admin_cluster" {
    key_attributes = []
  }

  resource "google_gkeonprem_vmware_cluster" {
    key_attributes = []
  }

  resource "google_gkeonprem_vmware_node_pool" {
    key_attributes = []
  }

  resource "google_google_billing_subaccount" {
    key_attributes = []
  }

  resource "google_google_dns_record_sets" {
    key_attributes = []
  }

  resource "google_google_folder" {
    key_attributes = []
  }

  resource "google_google_folder_iam" {
    key_attributes = []
  }

  resource "google_google_folder_organization_policy" {
    key_attributes = []
  }

  resource "google_google_kms_crypto_key_iam" {
    key_attributes = []
  }

  resource "google_google_kms_key_ring_iam" {
    key_attributes = []
  }

  resource "google_google_organization_iam" {
    key_attributes = []
  }

  resource "google_google_organization_iam_custom_role" {
    key_attributes = []
  }

  resource "google_google_organization_policy" {
    key_attributes = []
  }

  resource "google_google_project" {
    key_attributes = []
  }

  resource "google_google_project_default_service_accounts" {
    key_attributes = []
  }

  resource "google_google_project_iam" {
    key_attributes = []
  }

  resource "google_google_project_iam_custom_role" {
    key_attributes = []
  }

  resource "google_google_project_iam_member_remove" {
    key_attributes = []
  }

  resource "google_google_project_organization_policy" {
    key_attributes = []
  }

  resource "google_google_project_service" {
    key_attributes = []
  }

  resource "google_google_service_account" {
    key_attributes = []
  }

  resource "google_google_service_account_iam" {
    key_attributes = []
  }

  resource "google_google_service_account_key" {
    key_attributes = []
  }

  resource "google_google_service_networking_peered_dns_domain" {
    key_attributes = []
  }

  resource "google_google_tags_location_tag_binding" {
    key_attributes = []
  }

  resource "google_google_vertex_ai_index" {
    key_attributes = []
  }

  resource "google_google_vertex_ai_reasoning_engine_query" {
    key_attributes = []
  }

  resource "google_healthcare_consent_store" {
    key_attributes = []
  }

  resource "google_healthcare_consent_store_iam" {
    key_attributes = []
  }

  resource "google_healthcare_consent_store_iam_policy" {
    key_attributes = []
  }

  resource "google_healthcare_dataset" {
    key_attributes = []
  }

  resource "google_healthcare_dataset_iam" {
    key_attributes = []
  }

  resource "google_healthcare_dataset_iam_policy" {
    key_attributes = []
  }

  resource "google_healthcare_dicom_store" {
    key_attributes = []
  }

  resource "google_healthcare_dicom_store_iam" {
    key_attributes = []
  }

  resource "google_healthcare_dicom_store_iam_policy" {
    key_attributes = []
  }

  resource "google_healthcare_fhir_store" {
    key_attributes = []
  }

  resource "google_healthcare_fhir_store_iam" {
    key_attributes = []
  }

  resource "google_healthcare_fhir_store_iam_policy" {
    key_attributes = []
  }

  resource "google_healthcare_hl7_v2_store" {
    key_attributes = []
  }

  resource "google_healthcare_hl7_v2_store_iam" {
    key_attributes = []
  }

  resource "google_healthcare_hl7_v2_store_iam_policy" {
    key_attributes = []
  }

  resource "google_healthcare_pipeline_job" {
    key_attributes = []
  }

  resource "google_healthcare_workspace" {
    key_attributes = []
  }

  resource "google_hypercomputecluster_cluster" {
    key_attributes = []
  }

  resource "google_iam_access_boundary_policy" {
    key_attributes = []
  }

  resource "google_iam_deny_policy" {
    key_attributes = []
  }

  resource "google_iam_folder_access_policy" {
    key_attributes = []
  }

  resource "google_iam_folders_policy_binding" {
    key_attributes = []
  }

  resource "google_iam_oauth_client" {
    key_attributes = []
  }

  resource "google_iam_oauth_client_credential" {
    key_attributes = []
  }

  resource "google_iam_organization_access_policy" {
    key_attributes = []
  }

  resource "google_iam_organizations_policy_binding" {
    key_attributes = []
  }

  resource "google_iam_principal_access_boundary_policy" {
    key_attributes = []
  }

  resource "google_iam_project_access_policy" {
    key_attributes = []
  }

  resource "google_iam_projects_policy_binding" {
    key_attributes = []
  }

  resource "google_iam_role" {
    key_attributes = []
  }

  resource "google_iam_testable_permissions" {
    key_attributes = []
  }

  resource "google_iam_workforce_pool" {
    key_attributes = []
  }

  resource "google_iam_workforce_pool_iam" {
    key_attributes = []
  }

  resource "google_iam_workforce_pool_iam_policy" {
    key_attributes = []
  }

  resource "google_iam_workforce_pool_provider" {
    key_attributes = []
  }

  resource "google_iam_workforce_pool_provider_key" {
    key_attributes = []
  }

  resource "google_iam_workforce_pool_provider_scim_tenant" {
    key_attributes = []
  }

  resource "google_iam_workforce_pool_provider_scim_token" {
    key_attributes = []
  }

  resource "google_iam_workload_identity_pool" {
    key_attributes = []
  }

  resource "google_iam_workload_identity_pool_iam" {
    key_attributes = []
  }

  resource "google_iam_workload_identity_pool_iam_policy" {
    key_attributes = []
  }

  resource "google_iam_workload_identity_pool_managed_identity" {
    key_attributes = []
  }

  resource "google_iam_workload_identity_pool_namespace" {
    key_attributes = []
  }

  resource "google_iam_workload_identity_pool_provider" {
    key_attributes = []
  }

  resource "google_iap_agent_registry_agent_iam" {
    key_attributes = []
  }

  resource "google_iap_agent_registry_agent_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_agent_registry_endpoint_iam" {
    key_attributes = []
  }

  resource "google_iap_agent_registry_endpoint_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_agent_registry_iam" {
    key_attributes = []
  }

  resource "google_iap_agent_registry_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_agent_registry_mcp_server_iam" {
    key_attributes = []
  }

  resource "google_iap_agent_registry_mcp_server_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_app_engine_service_iam" {
    key_attributes = []
  }

  resource "google_iap_app_engine_service_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_app_engine_version_iam" {
    key_attributes = []
  }

  resource "google_iap_app_engine_version_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_location_web_iam" {
    key_attributes = []
  }

  resource "google_iap_location_web_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_settings" {
    key_attributes = []
  }

  resource "google_iap_tunnel_dest_group" {
    key_attributes = []
  }

  resource "google_iap_tunnel_dest_group_iam" {
    key_attributes = []
  }

  resource "google_iap_tunnel_dest_group_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_tunnel_iam" {
    key_attributes = []
  }

  resource "google_iap_tunnel_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_tunnel_instance_iam" {
    key_attributes = []
  }

  resource "google_iap_tunnel_instance_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_web_backend_service_iam" {
    key_attributes = []
  }

  resource "google_iap_web_cloud_run_service_iam" {
    key_attributes = []
  }

  resource "google_iap_web_cloud_run_service_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_web_forwarding_rule_service_iam" {
    key_attributes = []
  }

  resource "google_iap_web_forwarding_rule_service_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_web_iam" {
    key_attributes = []
  }

  resource "google_iap_web_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_web_region_backend_service_iam" {
    key_attributes = []
  }

  resource "google_iap_web_region_backend_service_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_web_region_forwarding_rule_service_iam" {
    key_attributes = []
  }

  resource "google_iap_web_region_forwarding_rule_service_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_web_type_app_engine_iam" {
    key_attributes = []
  }

  resource "google_iap_web_type_app_engine_iam_policy" {
    key_attributes = []
  }

  resource "google_iap_web_type_compute_iam" {
    key_attributes = []
  }

  resource "google_iap_web_type_compute_iam_policy" {
    key_attributes = []
  }

  resource "google_identity_platform_config" {
    key_attributes = []
  }

  resource "google_identity_platform_default_supported_idp_config" {
    key_attributes = []
  }

  resource "google_identity_platform_inbound_saml_config" {
    key_attributes = []
  }

  resource "google_identity_platform_oauth_idp_config" {
    key_attributes = []
  }

  resource "google_identity_platform_tenant" {
    key_attributes = []
  }

  resource "google_identity_platform_tenant_default_supported_idp_config" {
    key_attributes = []
  }

  resource "google_identity_platform_tenant_inbound_saml_config" {
    key_attributes = []
  }

  resource "google_identity_platform_tenant_oauth_idp_config" {
    key_attributes = []
  }

  resource "google_integration_connectors_connection" {
    key_attributes = []
  }

  resource "google_integration_connectors_endpoint_attachment" {
    key_attributes = []
  }

  resource "google_integration_connectors_managed_zone" {
    key_attributes = []
  }

  resource "google_integrations_auth_config" {
    key_attributes = []
  }

  resource "google_integrations_client" {
    key_attributes = []
  }

  resource "google_kms_autokey_config" {
    key_attributes = []
  }

  resource "google_kms_crypto_key_iam_policy" {
    key_attributes = []
  }

  resource "google_kms_crypto_key_latest_version" {
    key_attributes = []
  }

  resource "google_kms_crypto_key_version" {
    key_attributes = []
  }

  resource "google_kms_crypto_key_versions" {
    key_attributes = []
  }

  resource "google_kms_crypto_keys" {
    key_attributes = []
  }

  resource "google_kms_ekm_connection" {
    key_attributes = []
  }

  resource "google_kms_ekm_connection_iam" {
    key_attributes = []
  }

  resource "google_kms_ekm_connection_iam_policy" {
    key_attributes = []
  }

  resource "google_kms_folder_kaj_policy_config" {
    key_attributes = []
  }

  resource "google_kms_key_handle" {
    key_attributes = []
  }

  resource "google_kms_key_handles" {
    key_attributes = []
  }

  resource "google_kms_key_rings" {
    key_attributes = []
  }

  resource "google_kms_organization_kaj_policy_config" {
    key_attributes = []
  }

  resource "google_kms_project_autokey_config" {
    key_attributes = []
  }

  resource "google_kms_project_kaj_policy_config" {
    key_attributes = []
  }

  resource "google_kms_secret" {
    key_attributes = []
  }

  resource "google_kms_secret_asymmetric" {
    key_attributes = []
  }

  resource "google_kms_secret_ciphertext" {
    key_attributes = []
  }

  resource "google_license_manager_configuration" {
    key_attributes = []
  }

  resource "google_logging_billing_account_bucket_config" {
    key_attributes = []
  }

  resource "google_logging_billing_account_exclusion" {
    key_attributes = []
  }

  resource "google_logging_billing_account_sink" {
    key_attributes = []
  }

  resource "google_logging_folder_bucket_config" {
    key_attributes = []
  }

  resource "google_logging_folder_exclusion" {
    key_attributes = []
  }

  resource "google_logging_folder_settings" {
    key_attributes = []
  }

  resource "google_logging_folder_sink" {
    key_attributes = []
  }

  resource "google_logging_linked_dataset" {
    key_attributes = []
  }

  resource "google_logging_log_scope" {
    key_attributes = []
  }

  resource "google_logging_log_view" {
    key_attributes = []
  }

  resource "google_logging_log_view_iam" {
    key_attributes = []
  }

  resource "google_logging_log_view_iam_policy" {
    key_attributes = []
  }

  resource "google_logging_metric" {
    key_attributes = []
  }

  resource "google_logging_organization_bucket_config" {
    key_attributes = []
  }

  resource "google_logging_organization_exclusion" {
    key_attributes = []
  }

  resource "google_logging_organization_settings" {
    key_attributes = []
  }

  resource "google_logging_organization_sink" {
    key_attributes = []
  }

  resource "google_logging_project_bucket_config" {
    key_attributes = []
  }

  resource "google_logging_project_cmek_settings" {
    key_attributes = []
  }

  resource "google_logging_project_exclusion" {
    key_attributes = []
  }

  resource "google_logging_project_settings" {
    key_attributes = []
  }

  resource "google_logging_saved_query" {
    key_attributes = []
  }

  resource "google_logging_sink" {
    key_attributes = []
  }

  resource "google_looker_instance" {
    key_attributes = []
  }

  resource "google_lustre_instance" {
    key_attributes = []
  }

  resource "google_managed_kafka_acl" {
    key_attributes = []
  }

  resource "google_managed_kafka_cluster" {
    key_attributes = []
  }

  resource "google_managed_kafka_connect_cluster" {
    key_attributes = []
  }

  resource "google_managed_kafka_connector" {
    key_attributes = []
  }

  resource "google_managed_kafka_topic" {
    key_attributes = []
  }

  resource "google_memcache_instance" {
    key_attributes = []
  }

  resource "google_memorystore_instance" {
    key_attributes = []
  }

  resource "google_memorystore_instance_desired_user_created_endpoints" {
    key_attributes = []
  }

  resource "google_migration_center_assets_export_job" {
    key_attributes = []
  }

  resource "google_migration_center_discovery_client" {
    key_attributes = []
  }

  resource "google_migration_center_group" {
    key_attributes = []
  }

  resource "google_migration_center_import_data_file" {
    key_attributes = []
  }

  resource "google_migration_center_import_job" {
    key_attributes = []
  }

  resource "google_migration_center_preference_set" {
    key_attributes = []
  }

  resource "google_migration_center_report" {
    key_attributes = []
  }

  resource "google_migration_center_report_config" {
    key_attributes = []
  }

  resource "google_migration_center_settings" {
    key_attributes = []
  }

  resource "google_migration_center_source" {
    key_attributes = []
  }

  resource "google_ml_engine_model" {
    key_attributes = []
  }

  resource "google_model_armor_floorsetting" {
    key_attributes = []
  }

  resource "google_model_armor_template" {
    key_attributes = []
  }

  resource "google_monitoring_alert_policy" {
    key_attributes = []
  }

  resource "google_monitoring_app_engine_service" {
    key_attributes = []
  }

  resource "google_monitoring_cluster_istio_service" {
    key_attributes = []
  }

  resource "google_monitoring_custom_service" {
    key_attributes = []
  }

  resource "google_monitoring_dashboard" {
    key_attributes = []
  }

  resource "google_monitoring_group" {
    key_attributes = []
  }

  resource "google_monitoring_istio_canonical_service" {
    key_attributes = []
  }

  resource "google_monitoring_mesh_istio_service" {
    key_attributes = []
  }

  resource "google_monitoring_metric_descriptor" {
    key_attributes = []
  }

  resource "google_monitoring_monitored_project" {
    key_attributes = []
  }

  resource "google_monitoring_notification_channel" {
    key_attributes = []
  }

  resource "google_monitoring_service" {
    key_attributes = []
  }

  resource "google_monitoring_slo" {
    key_attributes = []
  }

  resource "google_monitoring_uptime_check_config" {
    key_attributes = []
  }

  resource "google_monitoring_uptime_check_ips" {
    key_attributes = []
  }

  resource "google_netapp_active_directory" {
    key_attributes = []
  }

  resource "google_netapp_backup" {
    key_attributes = []
  }

  resource "google_netapp_backup_policy" {
    key_attributes = []
  }

  resource "google_netapp_backup_vault" {
    key_attributes = []
  }

  resource "google_netapp_host_group" {
    key_attributes = []
  }

  resource "google_netapp_kmsconfig" {
    key_attributes = []
  }

  resource "google_netapp_storage_pool" {
    key_attributes = []
  }

  resource "google_netapp_volume" {
    key_attributes = []
  }

  resource "google_netapp_volume_quota_rule" {
    key_attributes = []
  }

  resource "google_netapp_volume_replication" {
    key_attributes = []
  }

  resource "google_netapp_volume_snapshot" {
    key_attributes = []
  }

  resource "google_netblock_ip_ranges" {
    key_attributes = []
  }

  resource "google_network_connectivity_custom_hardware_instance" {
    key_attributes = []
  }

  resource "google_network_connectivity_destination" {
    key_attributes = []
  }

  resource "google_network_connectivity_gateway_advertised_route" {
    key_attributes = []
  }

  resource "google_network_connectivity_group" {
    key_attributes = []
  }

  resource "google_network_connectivity_hub" {
    key_attributes = []
  }

  resource "google_network_connectivity_hub_iam" {
    key_attributes = []
  }

  resource "google_network_connectivity_hub_iam_policy" {
    key_attributes = []
  }

  resource "google_network_connectivity_internal_range" {
    key_attributes = []
  }

  resource "google_network_connectivity_multicloud_data_transfer_config" {
    key_attributes = []
  }

  resource "google_network_connectivity_policy_based_route" {
    key_attributes = []
  }

  resource "google_network_connectivity_regional_endpoint" {
    key_attributes = []
  }

  resource "google_network_connectivity_service_connection_policy" {
    key_attributes = []
  }

  resource "google_network_connectivity_spoke" {
    key_attributes = []
  }

  resource "google_network_connectivity_transport" {
    key_attributes = []
  }

  resource "google_network_management_connectivity_test" {
    key_attributes = []
  }

  resource "google_network_management_connectivity_test_run" {
    key_attributes = []
  }

  resource "google_network_management_connectivity_tests" {
    key_attributes = []
  }

  resource "google_network_management_organization_vpc_flow_logs_config" {
    key_attributes = []
  }

  resource "google_network_management_vpc_flow_logs_config" {
    key_attributes = []
  }

  resource "google_network_security_address_group" {
    key_attributes = []
  }

  resource "google_network_security_address_group_iam" {
    key_attributes = []
  }

  resource "google_network_security_address_group_iam_policy" {
    key_attributes = []
  }

  resource "google_network_security_address_groups" {
    key_attributes = []
  }

  resource "google_network_security_authorization_policy" {
    key_attributes = []
  }

  resource "google_network_security_authz_policy" {
    key_attributes = []
  }

  resource "google_network_security_backend_authentication_config" {
    key_attributes = []
  }

  resource "google_network_security_client_tls_policy" {
    key_attributes = []
  }

  resource "google_network_security_dns_threat_detector" {
    key_attributes = []
  }

  resource "google_network_security_firewall_endpoint" {
    key_attributes = []
  }

  resource "google_network_security_firewall_endpoint_association" {
    key_attributes = []
  }

  resource "google_network_security_gateway_security_policy" {
    key_attributes = []
  }

  resource "google_network_security_gateway_security_policy_rule" {
    key_attributes = []
  }

  resource "google_network_security_intercept_deployment" {
    key_attributes = []
  }

  resource "google_network_security_intercept_deployment_group" {
    key_attributes = []
  }

  resource "google_network_security_intercept_endpoint_group" {
    key_attributes = []
  }

  resource "google_network_security_intercept_endpoint_group_association" {
    key_attributes = []
  }

  resource "google_network_security_mirroring_deployment" {
    key_attributes = []
  }

  resource "google_network_security_mirroring_deployment_group" {
    key_attributes = []
  }

  resource "google_network_security_mirroring_endpoint" {
    key_attributes = []
  }

  resource "google_network_security_mirroring_endpoint_group" {
    key_attributes = []
  }

  resource "google_network_security_mirroring_endpoint_group_association" {
    key_attributes = []
  }

  resource "google_network_security_sac_attachment" {
    key_attributes = []
  }

  resource "google_network_security_sac_realm" {
    key_attributes = []
  }

  resource "google_network_security_security_profile" {
    key_attributes = []
  }

  resource "google_network_security_security_profile_group" {
    key_attributes = []
  }

  resource "google_network_security_server_tls_policy" {
    key_attributes = []
  }

  resource "google_network_security_tls_inspection_policy" {
    key_attributes = []
  }

  resource "google_network_security_ull_mirroring_collector" {
    key_attributes = []
  }

  resource "google_network_security_ull_mirroring_collector_rule" {
    key_attributes = []
  }

  resource "google_network_security_ull_mirroring_engine" {
    key_attributes = []
  }

  resource "google_network_security_url_lists" {
    key_attributes = []
  }

  resource "google_network_services_agent_gateway" {
    key_attributes = []
  }

  resource "google_network_services_authz_extension" {
    key_attributes = []
  }

  resource "google_network_services_edge_cache_keyset" {
    key_attributes = []
  }

  resource "google_network_services_edge_cache_origin" {
    key_attributes = []
  }

  resource "google_network_services_edge_cache_service" {
    key_attributes = []
  }

  resource "google_network_services_endpoint_policy" {
    key_attributes = []
  }

  resource "google_network_services_gateway" {
    key_attributes = []
  }

  resource "google_network_services_grpc_route" {
    key_attributes = []
  }

  resource "google_network_services_http_route" {
    key_attributes = []
  }

  resource "google_network_services_lb_edge_extension" {
    key_attributes = []
  }

  resource "google_network_services_lb_route_extension" {
    key_attributes = []
  }

  resource "google_network_services_lb_traffic_extension" {
    key_attributes = []
  }

  resource "google_network_services_mesh" {
    key_attributes = []
  }

  resource "google_network_services_multicast_consumer_association" {
    key_attributes = []
  }

  resource "google_network_services_multicast_domain" {
    key_attributes = []
  }

  resource "google_network_services_multicast_domain_activation" {
    key_attributes = []
  }

  resource "google_network_services_multicast_domain_group" {
    key_attributes = []
  }

  resource "google_network_services_multicast_group_consumer_activation" {
    key_attributes = []
  }

  resource "google_network_services_multicast_group_producer_activation" {
    key_attributes = []
  }

  resource "google_network_services_multicast_group_range" {
    key_attributes = []
  }

  resource "google_network_services_multicast_group_range_activation" {
    key_attributes = []
  }

  resource "google_network_services_multicast_producer_association" {
    key_attributes = []
  }

  resource "google_network_services_service_binding" {
    key_attributes = []
  }

  resource "google_network_services_service_lb_policies" {
    key_attributes = []
  }

  resource "google_network_services_tcp_route" {
    key_attributes = []
  }

  resource "google_network_services_tls_route" {
    key_attributes = []
  }

  resource "google_network_services_wasm_plugin" {
    key_attributes = []
  }

  resource "google_notebooks_environment" {
    key_attributes = []
  }

  resource "google_notebooks_instance" {
    key_attributes = []
  }

  resource "google_notebooks_instance_iam" {
    key_attributes = []
  }

  resource "google_notebooks_instance_iam_policy" {
    key_attributes = []
  }

  resource "google_notebooks_runtime" {
    key_attributes = []
  }

  resource "google_notebooks_runtime_iam" {
    key_attributes = []
  }

  resource "google_notebooks_runtime_iam_policy" {
    key_attributes = []
  }

  resource "google_observability_folder_settings" {
    key_attributes = []
  }

  resource "google_observability_organization_settings" {
    key_attributes = []
  }

  resource "google_observability_project_settings" {
    key_attributes = []
  }

  resource "google_observability_trace_scope" {
    key_attributes = []
  }

  resource "google_oracle_database_autonomous_database" {
    key_attributes = []
  }

  resource "google_oracle_database_autonomous_databases" {
    key_attributes = []
  }

  resource "google_oracle_database_cloud_exadata_infrastructure" {
    key_attributes = []
  }

  resource "google_oracle_database_cloud_exadata_infrastructure_exascale_config" {
    key_attributes = []
  }

  resource "google_oracle_database_cloud_exadata_infrastructures" {
    key_attributes = []
  }

  resource "google_oracle_database_cloud_vm_cluster" {
    key_attributes = []
  }

  resource "google_oracle_database_cloud_vm_clusters" {
    key_attributes = []
  }

  resource "google_oracle_database_db_nodes" {
    key_attributes = []
  }

  resource "google_oracle_database_db_servers" {
    key_attributes = []
  }

  resource "google_oracle_database_db_system" {
    key_attributes = []
  }

  resource "google_oracle_database_exadb_vm_cluster" {
    key_attributes = []
  }

  resource "google_oracle_database_exascale_db_storage_vault" {
    key_attributes = []
  }

  resource "google_oracle_database_goldengate_connection" {
    key_attributes = []
  }

  resource "google_oracle_database_goldengate_connection_assignment" {
    key_attributes = []
  }

  resource "google_oracle_database_goldengate_connection_types" {
    key_attributes = []
  }

  resource "google_oracle_database_goldengate_deployment" {
    key_attributes = []
  }

  resource "google_oracle_database_goldengate_deployment_environments" {
    key_attributes = []
  }

  resource "google_oracle_database_goldengate_deployment_types" {
    key_attributes = []
  }

  resource "google_oracle_database_goldengate_deployment_versions" {
    key_attributes = []
  }

  resource "google_oracle_database_odb_network" {
    key_attributes = []
  }

  resource "google_oracle_database_odb_subnet" {
    key_attributes = []
  }

  resource "google_org_policy_custom_constraint" {
    key_attributes = []
  }

  resource "google_org_policy_policy" {
    key_attributes = []
  }

  resource "google_organization" {
    key_attributes = []
  }

  resource "google_organization_access_approval_settings" {
    key_attributes = []
  }

  resource "google_organization_iam_custom_role" {
    key_attributes = []
  }

  resource "google_organization_iam_custom_roles" {
    key_attributes = []
  }

  resource "google_organization_iam_policy" {
    key_attributes = []
  }

  resource "google_organization_service_identity" {
    key_attributes = []
  }

  resource "google_organizations" {
    key_attributes = []
  }

  resource "google_os_config_guest_policies" {
    key_attributes = []
  }

  resource "google_os_config_os_policy_assignment" {
    key_attributes = []
  }

  resource "google_os_config_patch_deployment" {
    key_attributes = []
  }

  resource "google_os_config_v2_policy_orchestrator" {
    key_attributes = []
  }

  resource "google_os_config_v2_policy_orchestrator_for_folder" {
    key_attributes = []
  }

  resource "google_os_config_v2_policy_orchestrator_for_organization" {
    key_attributes = []
  }

  resource "google_os_login_ssh_public_key" {
    key_attributes = []
  }

  resource "google_parallelstore_instance" {
    key_attributes = []
  }

  resource "google_parameter_manager_parameter" {
    key_attributes = []
  }

  resource "google_parameter_manager_parameter_version" {
    key_attributes = []
  }

  resource "google_parameter_manager_parameter_version_render" {
    key_attributes = []
  }

  resource "google_parameter_manager_parameters" {
    key_attributes = []
  }

  resource "google_parameter_manager_regional_parameter" {
    key_attributes = []
  }

  resource "google_parameter_manager_regional_parameter_version" {
    key_attributes = []
  }

  resource "google_parameter_manager_regional_parameter_version_render" {
    key_attributes = []
  }

  resource "google_parameter_manager_regional_parameters" {
    key_attributes = []
  }

  resource "google_privateca_ca_pool" {
    key_attributes = []
  }

  resource "google_privateca_ca_pool_iam" {
    key_attributes = []
  }

  resource "google_privateca_ca_pool_iam_policy" {
    key_attributes = []
  }

  resource "google_privateca_certificate" {
    key_attributes = []
  }

  resource "google_privateca_certificate_authority" {
    key_attributes = []
  }

  resource "google_privateca_certificate_template" {
    key_attributes = []
  }

  resource "google_privateca_certificate_template_iam" {
    key_attributes = []
  }

  resource "google_privateca_certificate_template_iam_policy" {
    key_attributes = []
  }

  resource "google_privileged_access_manager_entitlement" {
    key_attributes = []
  }

  resource "google_privileged_access_manager_settings" {
    key_attributes = []
  }

  resource "google_project_access_approval_settings" {
    key_attributes = []
  }

  resource "google_project_ancestry" {
    key_attributes = []
  }

  resource "google_project_iam_custom_roles" {
    key_attributes = []
  }

  resource "google_project_iam_policy" {
    key_attributes = []
  }

  resource "google_project_organization_policy" {
    key_attributes = []
  }

  resource "google_project_usage_export_bucket" {
    key_attributes = []
  }

  resource "google_projects" {
    key_attributes = []
  }

  resource "google_public_ca_external_account_key" {
    key_attributes = []
  }

  resource "google_pubsub_lite_reservation" {
    key_attributes = []
  }

  resource "google_pubsub_lite_subscription" {
    key_attributes = []
  }

  resource "google_pubsub_lite_topic" {
    key_attributes = []
  }

  resource "google_pubsub_schema" {
    key_attributes = []
  }

  resource "google_pubsub_schema_iam" {
    key_attributes = []
  }

  resource "google_pubsub_schema_iam_policy" {
    key_attributes = []
  }

  resource "google_pubsub_subscription_iam" {
    key_attributes = []
  }

  resource "google_pubsub_subscription_iam_policy" {
    key_attributes = []
  }

  resource "google_pubsub_topic_iam" {
    key_attributes = []
  }

  resource "google_pubsub_topic_iam_policy" {
    key_attributes = []
  }

  resource "google_recaptcha_enterprise_key" {
    key_attributes = []
  }

  resource "google_redis_cluster" {
    key_attributes = []
  }

  resource "google_redis_cluster_user_created_connections" {
    key_attributes = []
  }

  resource "google_redis_instance" {
    key_attributes = []
  }

  resource "google_resource_manager_capability" {
    key_attributes = []
  }

  resource "google_resource_manager_lien" {
    key_attributes = []
  }

  resource "google_runtimeconfig_config" {
    key_attributes = []
  }

  resource "google_runtimeconfig_config_iam" {
    key_attributes = []
  }

  resource "google_runtimeconfig_config_iam_policy" {
    key_attributes = []
  }

  resource "google_runtimeconfig_variable" {
    key_attributes = []
  }

  resource "google_saas_runtime_release" {
    key_attributes = []
  }

  resource "google_saas_runtime_rollout_kind" {
    key_attributes = []
  }

  resource "google_saas_runtime_saas" {
    key_attributes = []
  }

  resource "google_saas_runtime_tenant" {
    key_attributes = []
  }

  resource "google_saas_runtime_unit" {
    key_attributes = []
  }

  resource "google_saas_runtime_unit_kind" {
    key_attributes = []
  }

  resource "google_saas_runtime_unit_operation" {
    key_attributes = []
  }

  resource "google_scc_event_threat_detection_custom_module" {
    key_attributes = []
  }

  resource "google_scc_folder_custom_module" {
    key_attributes = []
  }

  resource "google_scc_folder_notification_config" {
    key_attributes = []
  }

  resource "google_scc_folder_scc_big_query_export" {
    key_attributes = []
  }

  resource "google_scc_management_folder_security_health_analytics_custom_module" {
    key_attributes = []
  }

  resource "google_scc_management_organization_event_threat_detection_custom_module" {
    key_attributes = []
  }

  resource "google_scc_management_organization_security_health_analytics_custom_module" {
    key_attributes = []
  }

  resource "google_scc_management_project_security_health_analytics_custom_module" {
    key_attributes = []
  }

  resource "google_scc_mute_config" {
    key_attributes = []
  }

  resource "google_scc_notification_config" {
    key_attributes = []
  }

  resource "google_scc_organization_custom_module" {
    key_attributes = []
  }

  resource "google_scc_organization_scc_big_query_export" {
    key_attributes = []
  }

  resource "google_scc_project_custom_module" {
    key_attributes = []
  }

  resource "google_scc_project_notification_config" {
    key_attributes = []
  }

  resource "google_scc_project_scc_big_query_export" {
    key_attributes = []
  }

  resource "google_scc_source" {
    key_attributes = []
  }

  resource "google_scc_source_iam" {
    key_attributes = []
  }

  resource "google_scc_source_iam_policy" {
    key_attributes = []
  }

  resource "google_scc_v2_folder_mute_config" {
    key_attributes = []
  }

  resource "google_scc_v2_folder_notification_config" {
    key_attributes = []
  }

  resource "google_scc_v2_folder_scc_big_query_export" {
    key_attributes = []
  }

  resource "google_scc_v2_organization_mute_config" {
    key_attributes = []
  }

  resource "google_scc_v2_organization_notification_config" {
    key_attributes = []
  }

  resource "google_scc_v2_organization_scc_big_query_export" {
    key_attributes = []
  }

  resource "google_scc_v2_organization_scc_big_query_exports" {
    key_attributes = []
  }

  resource "google_scc_v2_organization_source" {
    key_attributes = []
  }

  resource "google_scc_v2_organization_source_iam" {
    key_attributes = []
  }

  resource "google_scc_v2_organization_source_iam_policy" {
    key_attributes = []
  }

  resource "google_scc_v2_project_mute_config" {
    key_attributes = []
  }

  resource "google_scc_v2_project_notification_config" {
    key_attributes = []
  }

  resource "google_scc_v2_project_scc_big_query_export" {
    key_attributes = []
  }

  resource "google_secret_manager_regional_secret" {
    key_attributes = []
  }

  resource "google_secret_manager_regional_secret_iam" {
    key_attributes = []
  }

  resource "google_secret_manager_regional_secret_iam_policy" {
    key_attributes = []
  }

  resource "google_secret_manager_regional_secret_version" {
    key_attributes = []
  }

  resource "google_secret_manager_regional_secret_version_access" {
    key_attributes = []
  }

  resource "google_secret_manager_regional_secrets" {
    key_attributes = []
  }

  resource "google_secret_manager_secret_iam" {
    key_attributes = []
  }

  resource "google_secret_manager_secret_version_access" {
    key_attributes = []
  }

  resource "google_secret_manager_secrets" {
    key_attributes = []
  }

  resource "google_secure_source_manager_branch_rule" {
    key_attributes = []
  }

  resource "google_secure_source_manager_hook" {
    key_attributes = []
  }

  resource "google_secure_source_manager_instance" {
    key_attributes = []
  }

  resource "google_secure_source_manager_instance_iam" {
    key_attributes = []
  }

  resource "google_secure_source_manager_instance_iam_policy" {
    key_attributes = []
  }

  resource "google_secure_source_manager_repository" {
    key_attributes = []
  }

  resource "google_secure_source_manager_repository_iam" {
    key_attributes = []
  }

  resource "google_secure_source_manager_repository_iam_policy" {
    key_attributes = []
  }

  resource "google_security_scanner_scan_config" {
    key_attributes = []
  }

  resource "google_securityposture_posture" {
    key_attributes = []
  }

  resource "google_securityposture_posture_deployment" {
    key_attributes = []
  }

  resource "google_service_account_id_token" {
    key_attributes = []
  }

  resource "google_service_account_jwt" {
    key_attributes = []
  }

  resource "google_service_accounts" {
    key_attributes = []
  }

  resource "google_service_directory_endpoint" {
    key_attributes = []
  }

  resource "google_service_directory_namespace" {
    key_attributes = []
  }

  resource "google_service_directory_namespace_iam" {
    key_attributes = []
  }

  resource "google_service_directory_namespace_iam_policy" {
    key_attributes = []
  }

  resource "google_service_directory_service" {
    key_attributes = []
  }

  resource "google_service_directory_service_iam" {
    key_attributes = []
  }

  resource "google_service_directory_service_iam_policy" {
    key_attributes = []
  }

  resource "google_service_networking_vpc_service_controls" {
    key_attributes = []
  }

  resource "google_service_usage_consumer_quota_override" {
    key_attributes = []
  }

  resource "google_site_verification_owner" {
    key_attributes = []
  }

  resource "google_site_verification_token" {
    key_attributes = []
  }

  resource "google_site_verification_web_resource" {
    key_attributes = []
  }

  resource "google_sourcerepo_repository" {
    key_attributes = []
  }

  resource "google_sourcerepo_repository_iam" {
    key_attributes = []
  }

  resource "google_sourcerepo_repository_iam_policy" {
    key_attributes = []
  }

  resource "google_spanner_backup_schedule" {
    key_attributes = []
  }

  resource "google_spanner_database" {
    key_attributes = []
  }

  resource "google_spanner_database_iam" {
    key_attributes = []
  }

  resource "google_spanner_database_iam_policy" {
    key_attributes = []
  }

  resource "google_spanner_instance" {
    key_attributes = []
  }

  resource "google_spanner_instance_config" {
    key_attributes = []
  }

  resource "google_spanner_instance_iam" {
    key_attributes = []
  }

  resource "google_spanner_instance_iam_policy" {
    key_attributes = []
  }

  resource "google_spanner_instance_partition" {
    key_attributes = []
  }

  resource "google_sql_backup_run" {
    key_attributes = []
  }

  resource "google_sql_database" {
    key_attributes = []
  }

  resource "google_sql_database_instance_latest_recovery_time" {
    key_attributes = []
  }

  resource "google_sql_database_instances" {
    key_attributes = []
  }

  resource "google_sql_databases" {
    key_attributes = []
  }

  resource "google_sql_provision_script" {
    key_attributes = []
  }

  resource "google_sql_source_representation_instance" {
    key_attributes = []
  }

  resource "google_sql_tiers" {
    key_attributes = []
  }

  resource "google_storage_anywhere_cache" {
    key_attributes = []
  }

  resource "google_storage_batch_operations_job" {
    key_attributes = []
  }

  resource "google_storage_bucket_access_control" {
    key_attributes = []
  }

  resource "google_storage_bucket_acl" {
    key_attributes = []
  }

  resource "google_storage_bucket_iam" {
    key_attributes = []
  }

  resource "google_storage_bucket_object_content" {
    key_attributes = []
  }

  resource "google_storage_bucket_object_contents" {
    key_attributes = []
  }

  resource "google_storage_bucket_objects" {
    key_attributes = []
  }

  resource "google_storage_buckets" {
    key_attributes = []
  }

  resource "google_storage_control_folder_intelligence_config" {
    key_attributes = []
  }

  resource "google_storage_control_folder_intelligence_findings_summary" {
    key_attributes = []
  }

  resource "google_storage_control_organization_intelligence_config" {
    key_attributes = []
  }

  resource "google_storage_control_organization_intelligence_findings_summary" {
    key_attributes = []
  }

  resource "google_storage_control_project_intelligence_config" {
    key_attributes = []
  }

  resource "google_storage_control_project_intelligence_finding" {
    key_attributes = []
  }

  resource "google_storage_control_project_intelligence_finding_revision" {
    key_attributes = []
  }

  resource "google_storage_control_project_intelligence_finding_revisions" {
    key_attributes = []
  }

  resource "google_storage_control_project_intelligence_findings" {
    key_attributes = []
  }

  resource "google_storage_control_project_intelligence_findings_summary" {
    key_attributes = []
  }

  resource "google_storage_default_object_access_control" {
    key_attributes = []
  }

  resource "google_storage_default_object_acl" {
    key_attributes = []
  }

  resource "google_storage_folder" {
    key_attributes = []
  }

  resource "google_storage_hmac_key" {
    key_attributes = []
  }

  resource "google_storage_insights_dataset_config" {
    key_attributes = []
  }

  resource "google_storage_insights_report_config" {
    key_attributes = []
  }

  resource "google_storage_managed_folder" {
    key_attributes = []
  }

  resource "google_storage_managed_folder_iam" {
    key_attributes = []
  }

  resource "google_storage_object_access_control" {
    key_attributes = []
  }

  resource "google_storage_object_acl" {
    key_attributes = []
  }

  resource "google_storage_object_signed_url" {
    key_attributes = []
  }

  resource "google_storage_transfer_agent_pool" {
    key_attributes = []
  }

  resource "google_storage_transfer_job" {
    key_attributes = []
  }

  resource "google_storage_transfer_project_service_account" {
    key_attributes = []
  }

  resource "google_tags_tag_binding" {
    key_attributes = []
  }

  resource "google_tags_tag_key" {
    key_attributes = []
  }

  resource "google_tags_tag_key_iam" {
    key_attributes = []
  }

  resource "google_tags_tag_key_iam_policy" {
    key_attributes = []
  }

  resource "google_tags_tag_keys" {
    key_attributes = []
  }

  resource "google_tags_tag_value" {
    key_attributes = []
  }

  resource "google_tags_tag_value_iam" {
    key_attributes = []
  }

  resource "google_tags_tag_value_iam_policy" {
    key_attributes = []
  }

  resource "google_tags_tag_values" {
    key_attributes = []
  }

  resource "google_tpu_tensorflow_versions" {
    key_attributes = []
  }

  resource "google_tpu_v2_accelerator_types" {
    key_attributes = []
  }

  resource "google_tpu_v2_queued_resource" {
    key_attributes = []
  }

  resource "google_tpu_v2_runtime_versions" {
    key_attributes = []
  }

  resource "google_tpu_v2_vm" {
    key_attributes = []
  }

  resource "google_transcoder_job" {
    key_attributes = []
  }

  resource "google_transcoder_job_template" {
    key_attributes = []
  }

  resource "google_vector_search_collection" {
    key_attributes = []
  }

  resource "google_vector_search_index" {
    key_attributes = []
  }

  resource "google_vertex_ai_cache_config" {
    key_attributes = []
  }

  resource "google_vertex_ai_dataset" {
    key_attributes = []
  }

  resource "google_vertex_ai_deployment_resource_pool" {
    key_attributes = []
  }

  resource "google_vertex_ai_endpoint" {
    key_attributes = []
  }

  resource "google_vertex_ai_endpoint_iam" {
    key_attributes = []
  }

  resource "google_vertex_ai_endpoint_iam_policy" {
    key_attributes = []
  }

  resource "google_vertex_ai_endpoint_with_model_garden_deployment" {
    key_attributes = []
  }

  resource "google_vertex_ai_feature_group" {
    key_attributes = []
  }

  resource "google_vertex_ai_feature_group_feature" {
    key_attributes = []
  }

  resource "google_vertex_ai_feature_group_iam" {
    key_attributes = []
  }

  resource "google_vertex_ai_feature_group_iam_policy" {
    key_attributes = []
  }

  resource "google_vertex_ai_feature_online_store" {
    key_attributes = []
  }

  resource "google_vertex_ai_feature_online_store_featureview" {
    key_attributes = []
  }

  resource "google_vertex_ai_feature_online_store_featureview_iam" {
    key_attributes = []
  }

  resource "google_vertex_ai_feature_online_store_featureview_iam_policy" {
    key_attributes = []
  }

  resource "google_vertex_ai_feature_online_store_iam" {
    key_attributes = []
  }

  resource "google_vertex_ai_feature_online_store_iam_policy" {
    key_attributes = []
  }

  resource "google_vertex_ai_featurestore" {
    key_attributes = []
  }

  resource "google_vertex_ai_featurestore_entitytype" {
    key_attributes = []
  }

  resource "google_vertex_ai_featurestore_entitytype_feature" {
    key_attributes = []
  }

  resource "google_vertex_ai_featurestore_entitytype_iam" {
    key_attributes = []
  }

  resource "google_vertex_ai_featurestore_entitytype_iam_policy" {
    key_attributes = []
  }

  resource "google_vertex_ai_featurestore_iam" {
    key_attributes = []
  }

  resource "google_vertex_ai_featurestore_iam_policy" {
    key_attributes = []
  }

  resource "google_vertex_ai_index" {
    key_attributes = []
  }

  resource "google_vertex_ai_index_endpoint" {
    key_attributes = []
  }

  resource "google_vertex_ai_index_endpoint_deployed_index" {
    key_attributes = []
  }

  resource "google_vertex_ai_metadata_store" {
    key_attributes = []
  }

  resource "google_vertex_ai_model_garden_enable_model" {
    key_attributes = []
  }

  resource "google_vertex_ai_rag_engine_config" {
    key_attributes = []
  }

  resource "google_vertex_ai_reasoning_engine" {
    key_attributes = []
  }

  resource "google_vertex_ai_reasoning_engine_iam" {
    key_attributes = []
  }

  resource "google_vertex_ai_reasoning_engine_iam_policy" {
    key_attributes = []
  }

  resource "google_vertex_ai_schedule" {
    key_attributes = []
  }

  resource "google_vertex_ai_semantic_governance_policy_engine" {
    key_attributes = []
  }

  resource "google_vertex_ai_tensorboard" {
    key_attributes = []
  }

  resource "google_vertex_ai_tensorboard_experiment" {
    key_attributes = []
  }

  resource "google_vertex_ai_tensorboard_run" {
    key_attributes = []
  }

  resource "google_vmwareengine_announcements" {
    key_attributes = []
  }

  resource "google_vmwareengine_cluster" {
    key_attributes = []
  }

  resource "google_vmwareengine_datastore" {
    key_attributes = []
  }

  resource "google_vmwareengine_external_access_rule" {
    key_attributes = []
  }

  resource "google_vmwareengine_external_address" {
    key_attributes = []
  }

  resource "google_vmwareengine_network" {
    key_attributes = []
  }

  resource "google_vmwareengine_network_peering" {
    key_attributes = []
  }

  resource "google_vmwareengine_network_policy" {
    key_attributes = []
  }

  resource "google_vmwareengine_nsx_credentials" {
    key_attributes = []
  }

  resource "google_vmwareengine_private_cloud" {
    key_attributes = []
  }

  resource "google_vmwareengine_subnet" {
    key_attributes = []
  }

  resource "google_vmwareengine_upgrades" {
    key_attributes = []
  }

  resource "google_vmwareengine_vcenter_credentials" {
    key_attributes = []
  }

  resource "google_workbench_instance" {
    key_attributes = []
  }

  resource "google_workbench_instance_iam" {
    key_attributes = []
  }

  resource "google_workbench_instance_iam_policy" {
    key_attributes = []
  }

  resource "google_workflows_workflow" {
    key_attributes = []
  }

  resource "google_workload_identity_service_agent" {
    key_attributes = []
  }

  resource "google_workstations_workstation" {
    key_attributes = []
  }

  resource "google_workstations_workstation_cluster" {
    key_attributes = []
  }

  resource "google_workstations_workstation_config" {
    key_attributes = []
  }

  resource "google_workstations_workstation_config_iam" {
    key_attributes = []
  }

  resource "google_workstations_workstation_config_iam_policy" {
    key_attributes = []
  }

  resource "google_workstations_workstation_iam" {
    key_attributes = []
  }

  resource "google_workstations_workstation_iam_policy" {
    key_attributes = []
  }
}

plugin "terraform" {
  enabled = true
  version = "0.14.1"
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
  preset  = "all"
}

# ------------------------------------------------------------------------------

rule "sort_sorting" {
  enabled = false # issues with multilines
}

rule "sort_spacing" {
  enabled = false # prefer source and version together, issues with multilines
}

rule "sort_unknown_resource" {
  enabled = false # not all resources are covered by the plugin's built-in defaults
}
