prompt --application/deployment/install/install_sp_competencies_trigger
begin
--   Manifest
--     INSTALL: INSTALL-sp_competencies trigger
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
 p_id=>wwv_flow_imp.id(21269754884426898798)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'sp_competencies trigger'
,p_sequence=>420
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger sp_competencies_biu',
'    before insert or update',
'    on sp_competencies',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end sp_competencies_biu;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
