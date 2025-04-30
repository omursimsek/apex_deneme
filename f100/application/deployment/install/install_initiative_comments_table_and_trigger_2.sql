prompt --application/deployment/install/install_initiative_comments_table_and_trigger
begin
--   Manifest
--     INSTALL: INSTALL-initiative_comments table and trigger
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
 p_id=>wwv_flow_imp.id(14931294067125381605)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'initiative_comments table and trigger'
,p_sequence=>670
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table sp_initiative_comments (',
'    id                             number default on null to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') ',
'                                   constraint sp_initiative_comments_pk primary key,',
'    row_version                    integer',
'                                   default 1,',
'    initiative_id                  number',
'                                   constraint sp_initiative_commments_fk',
'                                   references sp_initiatives (id)',
'                                   on delete cascade,',
'    --',
'    body                           clob,',
'    body_html                      clob,',
'    author_id                      number,',
'    private_yn                     varchar2(1 char),',
'    --',
'    created                        date not null,',
'    created_by                     varchar2(255 char) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255 char) not null',
')',
';',
'',
'create index sp_initiative_comments_i1 on sp_initiative_comments (initiative_id);',
'create index sp_initiative_comments_i2 on sp_initiative_comments (author_id);',
'',
'create or replace trigger sp_initiative_comments_biu',
'    before insert or update',
'    on sp_initiative_comments',
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
'    --',
'    --',
'    --',
'    if :new.private_yn is null then ',
'        :new.private_yn := ''N'';',
'    end if;',
'    --',
'    -- set body_html',
'    --',
'    :new.body_html := apex_markdown.to_html(:new.body);',
'    --',
'    -- touch parent table',
'    --',
'    update sp_initiatives set updated = sysdate, updated_by = :new.updated_by where id = :new.initiative_id;',
'    -- history',
'    if inserting and :new.private_yn = ''N'' then',
'        insert into sp_initiative_history',
'            (initiative_id, attribute_column, change_type, new_value, new_value_clob, changed_on, changed_by)',
'        values',
'            (:new.initiative_id, ''COMMENT'', ''CREATE'', dbms_lob.substr(:new.body,500,1), :new.body, sysdate, lower(:new.created_by));',
'     elsif updating and :old.private_yn = ''N'' and :new.private_yn = ''N'' then',
'        if not sp_value_compare.is_equal(:old.body,:new.body) then',
'            insert into sp_initiative_history',
'                (initiative_id, attribute_column, change_type, old_value, new_value, old_value_clob, new_value_clob, changed_on, changed_by)',
'            values',
'                (:new.initiative_id, ''COMMENT'', ''UPDATE'', dbms_lob.substr(:old.body,500,1), dbms_lob.substr(:new.body,500,1), :old.body, :new.body, sysdate, lower(:new.updated_by));',
'        end if;',
'    end if;',
'end sp_initiative_comments_biu;',
'/',
'create or replace trigger sp_initiative_comments_bd',
'    before delete',
'    on sp_initiative_comments',
'    for each row',
'begin',
'    if :old.private_yn = ''N'' then',
'    --',
'    -- touch parent table',
'    --',
'    update sp_initiatives set updated = sysdate, updated_by = :old.updated_by where id = :old.initiative_id;',
'    --',
'    insert into sp_initiative_history',
'        (initiative_id, attribute_column, change_type, old_value, old_value_clob, changed_on, changed_by)',
'    values',
'        (:old.initiative_id, ''COMMENT'', ''DELETE'', dbms_lob.substr(:old.body,500,1), :old.body, sysdate, lower(coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user)));',
'    end if;',
'end sp_initiative_comments_bd;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
