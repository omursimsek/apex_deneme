prompt --application/deployment/install/install_project_comments_triggers
begin
--   Manifest
--     INSTALL: INSTALL-project comments triggers
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
 p_id=>wwv_flow_imp.id(11560129674171248144)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'project comments triggers'
,p_sequence=>460
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger sp_project_comments_biu',
'    before insert or update',
'    on sp_project_comments',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'        if :new.row_version is null then :new.row_version := 1; end if;',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    if updating then',
'       :new.row_version := :new.row_version + 1;',
'    end if;',
'',
'    --',
'    -- private',
'    --',
'    if :new.private_yn is null then ',
'       :new.private_yn := ''N'';',
'    end if;',
'',
'    --',
'    -- set body_html',
'    --',
'    :new.body_html := apex_markdown.to_html(:new.body);',
'',
'    --',
'    -- touch parent table',
'    --',
'    update sp_projects set updated = sysdate, updated_by = :new.updated_by where id = :new.project_id;',
'    --',
'    -- history',
'    --',
'    if inserting and :new.private_yn = ''N'' then',
'        insert into sp_project_history',
'            (project_id, attribute_column, change_type, new_value, new_value_clob, changed_on, changed_by)',
'        values',
'            (:new.project_id, ''COMMENT'', ''CREATE'', dbms_lob.substr(:new.body,500,1), :new.body, sysdate, lower(:new.created_by));',
'    elsif updating and :old.private_yn = ''N'' and :new.private_yn = ''N'' then',
'        if not sp_value_compare.is_equal(:old.body,:new.body) then',
'            insert into sp_project_history',
'                (project_id, attribute_column, change_type, old_value, new_value, old_value_clob, new_value_clob, changed_on, changed_by)',
'            values',
'                (:new.project_id, ''COMMENT'', ''UPDATE'', dbms_lob.substr(:old.body,500,1), dbms_lob.substr(:new.body,500,1), :old.body, :new.body, sysdate, lower(:new.updated_by));',
'        end if;',
'    end if;',
'end sp_project_comments_biu;',
'/',
'',
'create or replace trigger sp_project_comments_bd',
'    before delete',
'    on sp_project_comments',
'    for each row',
'begin',
'    if :old.private_yn = ''N'' then',
'    --',
'    -- touch parent table',
'    --',
'    update sp_projects set updated = sysdate, updated_by = :old.updated_by where id = :old.project_id;',
'    --',
'    -- history',
'    --',
'    insert into sp_project_history',
'        (project_id, attribute_column, change_type, old_value, old_value_clob, changed_on, changed_by)',
'    values',
'        (:old.project_id, ''COMMENT'', ''DELETE'', dbms_lob.substr(:old.body,500,1), :old.body, sysdate, lower(coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user)));',
'    end if;',
'end sp_project_comments_bd;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
