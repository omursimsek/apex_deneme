prompt --application/shared_components/user_interface/lovs/sp_team_members_first_name
begin
--   Manifest
--     SP_TEAM_MEMBERS.FIRST_NAME
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
 p_id=>wwv_flow_imp.id(11439490188371142502)
,p_lov_name=>'SP_TEAM_MEMBERS.FIRST_NAME'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'SP_TEAM_MEMBERS'
,p_return_column_name=>'ID'
,p_display_column_name=>'FIRST_NAME'
,p_default_sort_column_name=>'FIRST_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>41378026954546
);
wwv_flow_imp.component_end;
end;
/
