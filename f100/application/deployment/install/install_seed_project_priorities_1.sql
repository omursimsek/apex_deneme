prompt --application/deployment/install/install_seed_project_priorities
begin
--   Manifest
--     INSTALL: INSTALL-seed project priorities
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
 p_id=>wwv_flow_imp.id(122181092137760074021)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'seed project priorities'
,p_sequence=>830
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into sp_project_priorities (id, priority, description, IS_DEFAULT_YN) values (1,1, ''P1 - Highest'',''N'');',
'insert into sp_project_priorities (id, priority, description, IS_DEFAULT_YN) values (2,2, ''P2 - High (Critical)'',''N'');',
'insert into sp_project_priorities (id, priority, description, IS_DEFAULT_YN) values (3,3, ''P3 - Medium'',''N'');',
'insert into sp_project_priorities (id, priority, description, IS_DEFAULT_YN) values (4,4, ''P4 - Low'',''N'');',
'insert into sp_project_priorities (id, priority, description, IS_DEFAULT_YN) values (5,5, ''P5 - Not Prioritized'',''Y'');',
'',
'',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
