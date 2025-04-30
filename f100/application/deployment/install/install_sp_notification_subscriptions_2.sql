prompt --application/deployment/install/install_sp_notification_subscriptions
begin
--   Manifest
--     INSTALL: INSTALL-sp_notification_subscriptions
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
 p_id=>wwv_flow_imp.id(14320790169862146512)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'sp_notification_subscriptions'
,p_sequence=>370
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_notification_subscriptions (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint sp_notification_subscriptions_pk primary key,',
'',
'    team_member_id                 number not null',
'                                   constraint sp_notification_sub_tm_fk',
'                                   references sp_team_members (id)',
'                                   on delete cascade,',
'    notification_id                number not null',
'                                   constraint sp_notification_sub_notif_fk',
'                                   references sp_notifications (id)',
'                                   on delete cascade,',
'    release_id                     number',
'                                   constraint sp_notification_sub_release_fk',
'                                   references sp_release_trains (id)',
'                                   on delete cascade,',
'    --',
'    opted_in_yn                    varchar2(1)    not null',
'                                      constraint sp_notification_sub_opt_in_cc',
'                                      check (opted_in_yn in (''Y'',''N'')),',
'    frequency                      varchar2(30)   not null',
'                                      constraint sp_notification_sub_freq_cc',
'                                      check (frequency in (''WEEKDAYS'',''WEEKLY'')),',
'    last_sent                      date,',
'    --',
'    created                        date not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
');',
'',
'create unique index sp_notification_subscriptions_u1 on sp_notification_subscriptions (team_member_id, notification_id, nullif(release_id,1));',
'create index sp_notification_subscriptions_i1 on sp_notification_subscriptions (notification_id);',
'create index sp_notification_subscriptions_i2 on sp_notification_subscriptions (release_id);',
'',
'create or replace trigger sp_notification_subscriptions_biu',
'    before insert or update',
'    on sp_notification_subscriptions',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end sp_notification_subscriptions_biu;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
