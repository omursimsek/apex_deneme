prompt --application/deployment/install/install_sp_group_members
begin
--   Manifest
--     INSTALL: INSTALL-SP_GROUP_MEMBERS
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
 p_id=>wwv_flow_imp.id(19222661812030321264)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'SP_GROUP_MEMBERS'
,p_sequence=>140
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table SP_GROUP_MEMBERS (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint SP_GROUP_MEMBERS_pk primary key,',
'    --',
'    group_id                       number not null',
'                                   constraint SP_GROUPS_FK',
'                                   references SP_GROUPS (id),',
'    team_member_id                 number not null',
'                                   constraint sp_team_group_members_tmfk',
'                                   references sp_team_members(id),',
'    assignment                     varchar2(255 char),',
'    full_time_yn                   varchar2(1 char),',
'    group_leader_yn                varchar2(1 char),',
'    --',
'    created                        date not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
')',
';',
'',
'create index SP_GROUP_MEMBERS_i1 on SP_GROUP_MEMBERS (group_id);',
'create unique index SP_GROUP_MEMBERS_u1 on SP_GROUP_MEMBERS (team_member_id, group_id);'))
);
wwv_flow_imp.component_end;
end;
/
