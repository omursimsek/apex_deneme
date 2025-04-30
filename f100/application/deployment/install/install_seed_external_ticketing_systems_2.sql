prompt --application/deployment/install/install_seed_external_ticketing_systems
begin
--   Manifest
--     INSTALL: INSTALL-seed external_ticketing_systems
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
 p_id=>wwv_flow_imp.id(25446751149989064716)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'seed external_ticketing_systems'
,p_sequence=>790
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into SP_EXTERNAL_TICKETING_SYSTEMS ',
'    ( ID, EVAULATION_SEQUENCE, EXTERNAL_SYSTEM_NAME, IS_ACTIVE_YN, LINK_PATTERN, description, TICKET_ID_REGEX) ',
'    values ',
'    (1, 10, ''Jira'', ''Y'', ''https://jira.myorg.com/jira/browse/#TICKET#'', ''Our Jira'', ''[Jj][Ii][Rr][Aa][-: ]\d{3,5}'');'))
);
wwv_flow_imp.component_end;
end;
/
