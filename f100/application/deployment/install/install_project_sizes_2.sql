prompt --application/deployment/install/install_project_sizes
begin
--   Manifest
--     INSTALL: INSTALL-Project Sizes
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
 p_id=>wwv_flow_imp.id(19138278027878097471)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'Project Sizes'
,p_sequence=>210
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'create table sp_project_sizes (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint sp_project_size_id_pk primary key,',
'    --',
'    project_size                   varchar2(30 char) not null,',
'    size_description               varchar2(100 char) not null,',
'    effort_days                    number not null,',
'    include_yn                     varchar2(1 char) not null,',
'    --',
'    created                        date not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
')',
';',
'',
'create unique index sp_project_sizes_u1 on sp_project_sizes (project_size);',
'create unique index sp_project_sizes_u2 on sp_project_sizes(EFFORT_DAYS);',
''))
);
wwv_flow_imp.component_end;
end;
/
