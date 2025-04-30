prompt --application/deployment/install/install_project_history
begin
--   Manifest
--     INSTALL: INSTALL-project_history
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
 p_id=>wwv_flow_imp.id(24115858321622650878)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'project_history'
,p_sequence=>250
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_project_history (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint sp_project_history_pk primary key,',
'    project_id                     number,',
'    --',
'    attribute_column               varchar2(255 char) not null, ',
'    change_type                    varchar2(30 char)  not null',
'                                   constraint sp_project_history_type_cc ',
'                                   check (change_type in (''CREATE'',''UPDATE'',''DELETE'')),',
'    old_value                      varchar2(4000 char),',
'    new_value                      varchar2(4000 char),',
'    old_value_clob                 clob,',
'    new_value_clob                 clob,',
'    --',
'    changed_on                     date  not null,',
'    changed_by                     varchar2(255 char)',
');',
'',
'create index sp_project_history_i1 on sp_project_history (project_id);',
'create index sp_project_history_i2 on sp_project_history (changed_by);'))
);
wwv_flow_imp.component_end;
end;
/
