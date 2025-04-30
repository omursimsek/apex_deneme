prompt --application/deployment/install/install_create_project_groups_table
begin
--   Manifest
--     INSTALL: INSTALL-create project groups table
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
 p_id=>wwv_flow_imp.id(11397732941874612824)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'create project groups table'
,p_sequence=>220
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_project_groups (',
'   id                 number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                      constraint sp_project_groups_pk primary key,',
'   group_name         varchar2(255   char) not null enable, ',
'   group_description  varchar2(4000  char),',
'   --',
'   is_active_yn       varchar2(1 char)',
'                      default on null ''Y''',
'                      constraint sp_project_groups_active_yn ',
'                      check (is_active_yn in (''Y'',''N'')),',
'   --',
'   created            date,',
'   created_by         varchar2(255 char), ',
'   updated            date, ',
'   updated_by         varchar2(255 char)',
'   )',
'/',
'',
'create unique index  sp_project_groups_i1 on  sp_project_groups (upper(group_name))',
'/',
'',
'',
'CREATE OR REPLACE EDITIONABLE TRIGGER  sp_project_groups_biu',
'   before insert or update on sp_project_groups ',
'   for each row ',
'begin ',
'   if inserting then ',
'       :new.created := localtimestamp; ',
'       :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'   end if; ',
'   if inserting or updating then ',
'       :new.updated := localtimestamp; ',
'       :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'   end if; ',
'end sp_project_groups_biu; ',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
