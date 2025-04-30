prompt --application/shared_components/logic/application_computations/last_project_view
begin
--   Manifest
--     APPLICATION COMPUTATION: LAST_PROJECT_VIEW
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(14383063135677098369)
,p_computation_sequence=>10
,p_computation_item=>'LAST_PROJECT_VIEW'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'23'
,p_compute_when=>'LAST_PROJECT_VIEW'
,p_compute_when_type=>'ITEM_IS_NULL'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
