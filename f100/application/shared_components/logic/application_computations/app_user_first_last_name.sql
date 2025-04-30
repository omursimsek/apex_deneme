prompt --application/shared_components/logic/application_computations/app_user_first_last_name
begin
--   Manifest
--     APPLICATION COMPUTATION: APP_USER_FIRST_LAST_NAME
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
 p_id=>wwv_flow_imp.id(23549935144460579904)
,p_computation_sequence=>20
,p_computation_item=>'APP_USER_FIRST_LAST_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select first_name||'' ''||last_name ',
'  from sp_team_members ',
' where id = :APP_USER_ID'))
,p_compute_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':APP_USER_ID is not null and',
':APP_USER_FIRST_LAST_NAME is null'))
,p_compute_when_text=>'PLSQL'
,p_compute_when_type=>'EXPRESSION'
,p_version_scn=>44452752480931
);
wwv_flow_imp.component_end;
end;
/
