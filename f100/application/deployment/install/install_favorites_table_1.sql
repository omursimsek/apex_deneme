prompt --application/deployment/install/install_favorites_table
begin
--   Manifest
--     INSTALL: INSTALL-favorites table
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
 p_id=>wwv_flow_imp.id(12074683013599271212)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'favorites table'
,p_sequence=>610
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_favorites (',
'    id                  number default on null to_number(sys_guid(), ''xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'') not null, ',
'    --',
'    project_id          number ',
'                        constraint sp_fav_to_proj_fk',
'                        references sp_projects(id)',
'                        on delete cascade,',
'    team_member_id      number ',
'                        constraint sp_fav_to_user_fk',
'                        references sp_team_members(id)',
'                        on delete cascade,',
'    created             date not null, ',
'    created_by          varchar2(255 char) not null, ',
'    updated             date not null, ',
'    updated_by          varchar2(255 char) not null',
'    ) ;',
'',
'create unique index sp_favorites_i1 on sp_favorites (project_id, team_member_id);',
'',
'CREATE OR REPLACE TRIGGER sp_favorites_biu',
'    before insert or update',
'    on sp_favorites',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end sp_favorites_biu;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
