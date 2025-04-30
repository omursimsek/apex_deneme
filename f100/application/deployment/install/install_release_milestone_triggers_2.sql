prompt --application/deployment/install/install_release_milestone_triggers
begin
--   Manifest
--     INSTALL: INSTALL-release milestone triggers
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
 p_id=>wwv_flow_imp.id(18392866478942073684)
,p_install_id=>wwv_flow_imp.id(149557269712237859365)
,p_name=>'release milestone triggers'
,p_sequence=>530
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger sp_release_milestones_biu',
'    before insert or update',
'    on sp_release_milestones',
'    for each row',
'declare',
'    l_changed_by  varchar2(255)  := null;',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'        if :new.original_milestone_date is null then',
'            :new.original_milestone_date := :new.milestone_date;',
'        end if;',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    :new.upper_milestone_name := upper(:new.milestone_name);',
'',
'    --',
'    -- touch parent table',
'    --',
'    update sp_release_trains set updated = sysdate, updated_by = :new.updated_by where id = :new.release_id;',
'',
'    --',
'    -- change history tracking',
'    --',
'    if inserting then',
'        insert into sp_release_history',
'            (release_id, attribute_column, change_type, new_value, changed_on, changed_by)',
'        values',
'            (:new.release_id, ''RELEASE_MILESTONE'', ''CREATE'', :new.milestone_name, sysdate, lower(:new.created_by));',
'    elsif updating then',
'        l_changed_by := lower(:new.updated_by);',
'        --',
'        if not sp_value_compare.is_equal(:old.milestone_name,:new.milestone_name) then',
'           insert into sp_release_history',
'               (release_id, attribute_column, change_type, old_value, new_value, changed_on, changed_by)',
'           values',
'               (:new.release_id, ''RELEASE_MILESTONE'', ''UPDATE'', :old.milestone_name, :new.milestone_name, sysdate, l_changed_by);',
'        end if;',
'        --',
'        if not sp_value_compare.is_equal(:old.milestone_start_date,:new.milestone_start_date) then',
'           insert into sp_release_history',
'               (release_id, attribute_column, change_type, old_value, new_value, changed_on, changed_by)',
'           values',
'               (:new.release_id, ''RELEASE_MILESTONE_''||substr(:new.milestone_name,1,200)||''_START'', ''UPDATE'', to_char(:old.milestone_start_date,''DD-MON-YYYY''), to_char(:new.milestone_start_date,''DD-MON-YYYY''), sysdate, l_changed_by);',
'        end if;',
'        --',
'        if not sp_value_compare.is_equal(:old.milestone_date,:new.milestone_date) then',
'           insert into sp_release_history',
'               (release_id, attribute_column, change_type, old_value, new_value, changed_on, changed_by)',
'           values',
'               (:new.release_id, ''RELEASE_MILESTONE_''||substr(:new.milestone_name,1,235), ''UPDATE'', to_char(:old.milestone_date,''DD-MON-YYYY''), to_char(:new.milestone_date,''DD-MON-YYYY''), sysdate, l_changed_by);',
'        end if;',
'            --',
'        if not sp_value_compare.is_equal(:old.MILESTONE_COMPLETED_YN,:new.MILESTONE_COMPLETED_YN) then',
'           insert into sp_release_history',
'               (release_id, attribute_column, change_type, old_value, new_value, changed_on, changed_by)',
'           values',
'               (:new.release_id, ''RELEASE_MILESTONE_''||substr(:new.milestone_name,1,225)||''_COMPLETED'', ''UPDATE'', :old.MILESTONE_COMPLETED_YN, :new.MILESTONE_COMPLETED_YN, sysdate, l_changed_by);',
'        end if;',
'    end if;',
'end sp_release_milestones_biu;',
'/',
'',
'create or replace trigger sp_release_milestones_bd',
'    before delete',
'    on sp_release_milestones',
'    for each row',
'begin',
'    insert into sp_release_history',
'        (release_id, attribute_column, change_type, old_value, changed_on, changed_by)',
'    values',
'        (:old.release_id, ''RELEASE_MILESTONE'', ''DELETE'', :old.milestone_name, sysdate, lower(coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user)));',
'end sp_release_milestones_bd;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
