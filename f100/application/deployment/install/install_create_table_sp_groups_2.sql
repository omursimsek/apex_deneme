prompt --application/deployment/install/install_create_table_sp_groups
begin
--   Manifest
--     INSTALL: INSTALL-create table SP_GROUPS
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
 p_id=>wwv_flow_imp.id(19141314920903479126)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'create table SP_GROUPS'
,p_sequence=>120
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table SP_GROUPS (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint SP_GROUPS_pk primary key,',
'    --',
'    group_name                     varchar2(100  char) not null,',
'    group_name_upper               varchar2(100  char) not null,',
'    description                    varchar2(4000 char),',
'    group_tag                      varchar2(100 char),',
'    --',
'    created                        date not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
')',
';',
'',
'create unique index SP_GROUPS_i1 on SP_GROUPS (group_name_upper);'))
);
wwv_flow_imp.component_end;
end;
/
