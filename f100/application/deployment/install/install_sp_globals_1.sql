prompt --application/deployment/install/install_sp_globals
begin
--   Manifest
--     INSTALL: INSTALL-sp_globals
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(17406723153191715479)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'sp_globals'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package sp_globals',
'as',
'    g_audit_this  boolean := TRUE;',
'end sp_globals;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
