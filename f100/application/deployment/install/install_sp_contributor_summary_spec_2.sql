prompt --application/deployment/install/install_sp_contributor_summary_spec
begin
--   Manifest
--     INSTALL: INSTALL-sp_contributor_summary spec
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
 p_id=>wwv_flow_imp.id(14258223952865894256)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'sp_contributor_summary spec'
,p_sequence=>40
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package sp_contributor_summary',
'as',
'',
'function generate (',
'    p_team_member_id     in number,',
'    p_show_activities    in varchar2 default ''Y'',',
'    p_show_projects      in varchar2 default ''Y'',',
'    p_links              in varchar2 default ''NONE'',',
'    p_apex_session       in varchar2 default null )',
'    return clob;',
'',
'function project_exceptions (',
'    p_team_member_id     in number,',
'    p_links              in varchar2 default ''NONE'',',
'    p_apex_session       in varchar2 default null )',
'    return clob;',
'',
'procedure project_changes (',
'    p_team_member_id     in number,',
'    p_frequency          in varchar2, -- WEEKLY, WEEKDAYS',
'    p_links              in varchar2 default ''NONE'',',
'    p_apex_session       in varchar2 default null,',
'    p_exclude_user_yn    in varchar2 default ''N'',',
'    p_changes_yn         out  varchar2,  -- if N changes, no email',
'    p_change_summary     out  clob );',
'',
'end sp_contributor_summary;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
