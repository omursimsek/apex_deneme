prompt --application/deployment/install/install_release_trains_table
begin
--   Manifest
--     INSTALL: INSTALL-release trains table
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
 p_id=>wwv_flow_imp.id(12002667881648315865)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'release trains table'
,p_sequence=>150
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_release_trains (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint sp_release_trains_id_pk primary key,',
'    release_train                  varchar2(50 char) not null,',
'    release_owner_id               number',
'                                   constraint sp_release_trains_owner_fk',
'                                   references sp_team_members,',
'    release                        varchar2(30 char) not null,',
'    release_target_date            date,',
'    release_open_date              date,',
'    --',
'    release_distribution_url       varchar2(4000 char),',
'    release_management_url         varchar2(4000 char),',
'    description                    clob,',
'    --',
'    release_open_completed         varchar2(1 char)  default on null ''N''',
'                                   constraint sp_release_trains_open_ck',
'                                   check (release_open_completed in (''Y'',''N'')),',
'    release_completed              varchar2(1 char)  default on null ''N''',
'                                   constraint sp_release_trains_completed_ck',
'                                   check (release_completed in (''Y'',''N'')),',
'    --',
'    release_type                   varchar2(50 char)',
'                                   constraint sp_valid_release_type',
'                                   check (release_type in (''FULL'',''PATCH'')),',
'    --',
'    created                        date not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
')',
';',
'',
'create index sp_release_trains_u1 on sp_release_trains (release_owner_id);'))
);
wwv_flow_imp.component_end;
end;
/
