prompt --application/shared_components/navigation/search_config/project_search
begin
--   Manifest
--     SEARCH CONFIG: Project Search
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_shared.create_search_config(
 p_id=>wwv_flow_imp.id(10297682898496877888)
,p_label=>'Project Search'
,p_static_id=>'project_search'
,p_search_type=>'SIMPLE'
,p_location=>'LOCAL'
,p_query_type=>'SQL'
,p_query_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.ID,',
'       f.area,',
'       i.initiative||'' / ''||f.area area_initiative,',
'       p.PROJECT,',
'       p.TARGET_COMPLETE,',
'       p.PRIORITY_ID,',
'       decode(p.RELEASE_DEPENDENT_YN,''Y'',''Yes'',''N'',''No'',''No'') RELEASE_DEPENDENT_YN,',
'       decode(',
'           p.RELEASE_DEPENDENT_YN,',
'           ''Y'',',
'           (select release_train||'' ''||release from SP_RELEASE_TRAINS t where t.id = p.release_id),',
'           decode(',
'               to_char(p.target_complete,''DD-MON-YYYY''),',
'               null,',
'               ''Not Targeted'',',
'               to_char(p.target_complete,''MON-YYYY'')',
'               ))  release,',
'       p.updated,',
'       nvl((select ''P''||priority from sp_project_priorities pp where pp.id = p.priority_id),''Not Prioritized'')||'' - ''||',
'       (select first_name||'' ''||last_name from sp_team_members t where t.id = p.OWNER_ID)||'' - ''||',
'       P.PCT_COMPLETE||''%''||'' - ''||',
'       (select first_name||'' ''||last_name from sp_team_members t where t.id = p.OWNER_ID)||',
'       decode(p.tags, null, null, '' - ''||p.tags)',
'       details,',
'       ''PR'' initials,',
'       p.id project_id',
'  from SP_PROJECTS p, ',
'       SP_INITIATIVES i,',
'       SP_AREAS f',
'where (nvl(:P23_INITIATIVE_ID,0) = 0 or :P23_INITIATIVE_ID = p.INITIATIVE_ID ) and ',
'      (nvl(:P23_FOCUS_AREA_ID,0) = 0 or :P23_AREA_ID = f.ID ) and',
'      p.initiative_id = i.id and',
'      i.area_id = f.id'))
,p_searchable_columns=>'AREA_INITIATIVE:PROJECT:RELEASE:DETAILS:INITIALS'
,p_pk_column_name=>'ID'
,p_title_column_name=>'PROJECT'
,p_subtitle_column_name=>'AREA_INITIATIVE'
,p_description_column_name=>'DETAILS'
,p_last_modified_column_name=>'UPDATED'
,p_custom_01_column_name=>'RELEASE'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:RP,3:P3_PROJECT_ID:&ID.'
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_class_column_name=>'INITIALS'
,p_icon_css_classes=>'fa-package'
,p_version_scn=>41430204951859
);
wwv_flow_imp.component_end;
end;
/
