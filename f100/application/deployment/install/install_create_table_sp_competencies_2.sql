prompt --application/deployment/install/install_create_table_sp_competencies
begin
--   Manifest
--     INSTALL: INSTALL-create table sp_competencies
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
 p_id=>wwv_flow_imp.id(21269706340904880904)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'create table sp_competencies'
,p_sequence=>110
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_competencies (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint sp_competencies_pk primary key,',
'    --',
'    competency                     varchar2(100  char) not null,',
'    description                    varchar2(4000 char),',
'    --',
'    created                        date not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
')',
';',
'',
'create unique index sp_competencies_i1 on sp_competencies (competency);'))
);
wwv_flow_imp.component_end;
end;
/
