prompt --application/shared_components/logic/application_processes/set_app_home_url_if_null
begin
--   Manifest
--     APPLICATION PROCESS: set APP_HOME_URL (if null)
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(20984468235227060624)
,p_process_sequence=>1
,p_process_point=>'ON_NEW_INSTANCE'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set APP_HOME_URL (if null)'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if sp_strategic_proj_util.get_setting(p_static_id => ''APP_HOME_URL'') is null then',
'       sp_strategic_proj_util.set_setting (p_static_id     => ''APP_HOME_URL'',   ',
'                                           p_setting_value => APEX_UTIL.HOST_URL(''SCRIPT'')); ',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>41807666561042
);
wwv_flow_imp.component_end;
end;
/
