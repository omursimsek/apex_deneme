prompt --application/deployment/install/install_sp_default_people_tags_trigger
begin
--   Manifest
--     INSTALL: INSTALL-SP_DEFAULT_PEOPLE_TAGS trigger
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
 p_id=>wwv_flow_imp.id(14325216424467864760)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'SP_DEFAULT_PEOPLE_TAGS trigger'
,p_sequence=>650
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger SP_DEFAULT_PEOPLE_TAGS_biu',
'    before insert or update',
'    on SP_DEFAULT_PEOPLE_TAGS',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    :new.tag := upper(:new.tag);',
'    :new.tag := replace(trim(:new.tag),'' '',''-'');',
'    :new.tag := replace(trim(:new.tag),''_'',''-'');',
'end SP_DEFAULT_PEOPLE_TAGS_biu;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
