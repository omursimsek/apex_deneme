prompt --application/shared_components/user_interface/lovs/sp_initiatives_initiative
begin
--   Manifest
--     SP_INITIATIVES.INITIATIVE
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
 p_id=>wwv_flow_imp.id(125079313451982134789)
,p_lov_name=>'SP_INITIATIVES.INITIATIVE'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SP_INITIATIVES'
,p_return_column_name=>'ID'
,p_display_column_name=>'INITIATIVE'
,p_default_sort_column_name=>'INITIATIVE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
