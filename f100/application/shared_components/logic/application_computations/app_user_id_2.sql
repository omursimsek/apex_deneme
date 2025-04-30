prompt --application/shared_components/logic/application_computations/app_user_id
begin
--   Manifest
--     APPLICATION COMPUTATION: APP_USER_ID
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
 p_id=>wwv_flow_imp.id(22100384585140565231)
,p_computation_sequence=>10
,p_computation_item=>'APP_USER_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select id from sp_team_members t where t.email = lower(:APP_USER)'
,p_compute_when=>'APP_USER_ID'
,p_compute_when_type=>'ITEM_IS_NULL'
,p_version_scn=>41300683562718
);
wwv_flow_imp.component_end;
end;
/
