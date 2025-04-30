prompt --application/deployment/install/install_project_link_tables
begin
--   Manifest
--     INSTALL: INSTALL-project link tables
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
 p_id=>wwv_flow_imp.id(12002754221126334647)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'project link tables'
,p_sequence=>260
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_project_links (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint sp_project_links_pk primary key,',
'    row_version                    integer',
'                                   default 1,',
'    project_id                     number',
'                                   constraint sp_project_links_proj_fk',
'                                   references sp_projects on delete cascade,',
'    --',
'    link_name                      varchar2(255 char)   not null,',
'    link_url                       varchar2(4000 char) not null,',
'    important_yn                   varchar2(1 char) default on null ''N''',
'                                   constraint sp_project_links_imp_ck',
'                                   check (important_yn in (''Y'',''N'')),',
'    --',
'    created                        date not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
')',
';',
'',
'create index sp_project_links_i1 on sp_project_links (project_id);',
'create index sp_project_links_i2 on sp_project_links (updated);'))
);
wwv_flow_imp.component_end;
end;
/
