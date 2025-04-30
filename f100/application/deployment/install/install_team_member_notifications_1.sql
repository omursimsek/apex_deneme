prompt --application/deployment/install/install_team_member_notifications
begin
--   Manifest
--     INSTALL: INSTALL-team_member_notifications
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
 p_id=>wwv_flow_imp.id(14046660176615967447)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'team_member_notifications'
,p_sequence=>730
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_team_member_notifications (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint sp_team_member_notifications_pk primary key,',
'    --',
'    team_member_id                 number  not null',
'                                   constraint sp_team_member_notifications_tm_fk',
'                                   references sp_team_members on delete cascade,',
'    notification_pref              varchar2(255),',
'    title                          varchar2(255)  not null,',
'    email_contents                 varchar2(4000 char),',
'    project_id                     number',
'                                   constraint sp_team_member_notifications_project_fk',
'                                   references sp_projects on delete cascade,',
'    dismissed_yn                   varchar2(1 char)  default on null ''N''',
'                                   constraint sp_team_member_notifications_dismissed_cc',
'                                   check (dismissed_yn in (''Y'',''N'')),',
'    --',
'    created                        date  not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
');',
'create index sp_team_member_notifications_i1 on sp_team_member_notifications (team_member_id);',
'create index sp_team_member_notifications_i2 on sp_team_member_notifications (project_id);',
'',
'create or replace trigger sp_team_member_notifications_biu',
'    before insert or update',
'    on sp_team_member_notifications',
'    for each row',
'declare ',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end sp_team_member_notifications_biu;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
