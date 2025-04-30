prompt --application/shared_components/user_interface/lovs/unified_task_list_lov_priority
begin
--   Manifest
--     UNIFIED_TASK_LIST.LOV.PRIORITY
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(19520168586903173105)
,p_lov_name=>'UNIFIED_TASK_LIST.LOV.PRIORITY'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'       val',
'  from table ( apex_human_task.get_lov_priority )',
' order by insert_order'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'VAL'
,p_display_column_name=>'DISP'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>44425368134881
);
wwv_flow_imp.component_end;
end;
/
