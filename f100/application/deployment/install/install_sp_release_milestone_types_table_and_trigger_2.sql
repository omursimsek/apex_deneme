prompt --application/deployment/install/install_sp_release_milestone_types_table_and_trigger
begin
--   Manifest
--     INSTALL: INSTALL-sp_release_milestone_types table and trigger
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
 p_id=>wwv_flow_imp.id(16420966652785449334)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'sp_release_milestone_types table and trigger'
,p_sequence=>295
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_release_milestone_types (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint sp_release_milestone_types_pk primary key,',
'    --',
'    milestone_type                 varchar2(60 char) not null,',
'    include_yn                     varchar2(1 char) default on null ''Y'',',
'    display_seq                    number,',
'    --',
'    created                        date not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
');',
'alter table sp_release_milestone_types add constraint sp_release_milestone_types_uk',
'    unique (milestone_type);',
'alter table sp_release_milestone_types add constraint sp_release_milestone_types_include_cc',
'    check (include_yn in (''Y'',''N''));',
'',
'create or replace trigger sp_release_milestone_types_biu',
'    before insert or update',
'    on sp_release_milestone_types',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end sp_release_milestone_types_biu;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
