prompt --application/shared_components/user_interface/lovs/sp_projects_project
begin
--   Manifest
--     SP_PROJECTS.PROJECT
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
 p_id=>wwv_flow_imp.id(125079313727734134790)
,p_lov_name=>'SP_PROJECTS.PROJECT'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SP_PROJECTS'
,p_return_column_name=>'ID'
,p_display_column_name=>'PROJECT'
,p_default_sort_column_name=>'PROJECT'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
