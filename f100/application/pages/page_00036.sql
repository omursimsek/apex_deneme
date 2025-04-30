prompt --application/pages/page_00036
begin
--   Manifest
--     PAGE: 00036
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_page.create_page(
 p_id=>36
,p_name=>'Project Detail'
,p_alias=>'PROJECT-DETAIL'
,p_page_mode=>'MODAL'
,p_step_title=>'&NOMENCLATURE_PROJECT.'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.sp-tag {',
'    padding: 2px 4px;',
'    display: inline-block;',
'    vertical-align: text-bottom;',
'    border-radius: 3px;',
'    background-color: rgba(0,0,0,.1);',
'    text-overflow: ellipsis;',
'    white-space: nowrap;',
'}',
'.sp-tags-container {',
'    display: flex;',
'    align-items: center;',
'    flex-wrap: wrap;',
'    gap: 4px;',
'    justify-content: flex-start;',
'}',
'',
'.resize-region {',
'  resize: vertical;',
'  overflow: auto;',
'}'))
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10949664486719474044)
,p_name=>'Milestones'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.ID,',
'       (select case when first_name is not null or last_name is not null',
'                    then first_name||'' ''||last_name',
'                    else email',
'                    end',
'               from sp_team_members t where t.id = r.owner_id) owner,',
'       t.task_type type,',
'       r.description,',
'       (select status from sp_task_statuses where id = r.status_id) status,',
'       to_char(r.start_date,''DD-MON'') || case when r.start_date is not null then '' - '' end ||',
'       nvl(to_char(r.target_complete,''DD-MON''),''?'') dates,',
'       t.display_seq ob',
'  from sp_tasks r,',
'       sp_task_types t',
' where project_id = :P36_ID',
'   and nvl(r.task_sub_type_id,r.task_type_id) = t.id',
'   and t.static_id like ''MILESTONE%''',
' order by t.display_seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P36_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No milestones found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10949664572317474045)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10949665025893474049)
,p_query_column_id=>2
,p_column_alias=>'OWNER'
,p_column_display_sequence=>50
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10949664738779474046)
,p_query_column_id=>3
,p_column_alias=>'TYPE'
,p_column_display_sequence=>20
,p_column_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10949664821863474047)
,p_query_column_id=>4
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>30
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10949664921425474048)
,p_query_column_id=>5
,p_column_alias=>'STATUS'
,p_column_display_sequence=>40
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11424697947448781401)
,p_query_column_id=>6
,p_column_alias=>'DATES'
,p_column_display_sequence=>70
,p_column_heading=>'Dates'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10949665094126474050)
,p_query_column_id=>7
,p_column_alias=>'OB'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11407077914212857912)
,p_name=>'Activity'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ap.id, ',
'       at.activity_type,',
'       ap.comments,',
'       to_char(ap.start_date,''DD-MON-YYYY'')||'' to ''||to_char(ap.end_date,''DD-MON'') TIMELINE,',
'       tm.first_name||'' ''||tm.last_name name,',
'       ap.updated',
'from sp_activities ap,',
'     sp_projects p,',
'     sp_activity_types at,',
'     sp_team_members tm',
'where ap.project_id = p.id and',
'      p.id = :P36_ID and',
'      ap.activity_type_id = at.id and',
'      ap.team_member_id = tm.id and',
'      --',
'      --',
'      --',
'      (  ',
'         sysdate between ap.start_date and ap.end_date ',
'      )',
'order by ap.start_date, ap.updated desc',
'',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P36_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Open Activity Found'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11407077985235857913)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11407079804963857930)
,p_query_column_id=>2
,p_column_alias=>'ACTIVITY_TYPE'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11407079918782857931)
,p_query_column_id=>3
,p_column_alias=>'COMMENTS'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11407080000785857932)
,p_query_column_id=>4
,p_column_alias=>'TIMELINE'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11407078961810857922)
,p_query_column_id=>5
,p_column_alias=>'NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_column_html_expression=>'#NAME#: #ACTIVITY_TYPE#: #COMMENTS# - #TIMELINE#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11754075294253819417)
,p_query_column_id=>6
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>60
,p_column_heading=>'Updated'
,p_column_format=>'since_short'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11407078438927857917)
,p_name=>'Related'
,p_template=>4072358936313175081
,p_display_sequence=>80
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct id, related_project, related_fi, related_pn',
'from (',
'select distinct r.ID,',
'       (select project from sp_projects p where p.id = r.RELATED_PROJECT_ID) related_project,',
'       (select p2.FRIENDLY_IDENTIFIER from sp_projects p2 where p2.id = r.RELATED_PROJECT_ID) related_fi,',
'       (select p2.PROJECT_URL_NAME from sp_projects p2 where p2.id = r.RELATED_PROJECT_ID) related_pn',
'  from SP_PROJECT_RELATED r,',
'       sp_projects p',
'where  r.PROJECT_ID = :P36_ID and ',
'       r.RELATED_PROJECT_ID = p.id ',
'union ',
'select distinct r.ID,',
'       (select project from sp_projects p where p.id = r.RELATED_PROJECT_ID) related_project,',
'       (select p2.FRIENDLY_IDENTIFIER from sp_projects p2 where p2.id = r.PROJECT_ID) related_fi,',
'       (select p2.PROJECT_URL_NAME from sp_projects p2 where p2.id = r.PROJECT_ID) related_pn',
'  from SP_PROJECT_RELATED r,',
'         sp_projects p',
'where  RELATED_PROJECT_ID = :P36_ID and',
'       r.RELATED_PROJECT_ID = p.id ',
') x',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'None Found'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11407078540899857918)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11407078678331857919)
,p_query_column_id=>2
,p_column_alias=>'RELATED_PROJECT'
,p_column_display_sequence=>20
,p_column_heading=>'Related Project'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#RELATED_FI#,#RELATED_PN#'
,p_column_linktext=>'#RELATED_PROJECT#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11407078801926857920)
,p_query_column_id=>3
,p_column_alias=>'RELATED_FI'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11407078879225857921)
,p_query_column_id=>4
,p_column_alias=>'RELATED_PN'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11407080090000857933)
,p_name=>'Tags'
,p_template=>4072358936313175081
,p_display_sequence=>70
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(lower(replace(p.TAGS,'','','', '')),''Not Found'') tags',
'  from SP_PROJECTS p',
'where ',
'      p.archived_yn = ''N'' and',
'      p.DUPLICATE_OF_PROJECT_ID is null and',
'      p.id = :P36_ID'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'None Found'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11729037269273054232)
,p_query_column_id=>1
,p_column_alias=>'TAGS'
,p_column_display_sequence=>20
,p_column_heading=>'Tags'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11424698108263781402)
,p_name=>'Reviews'
,p_template=>4072358936313175081
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.ID,',
'       (select case when first_name is not null or last_name is not null',
'                    then first_name||'' ''||last_name',
'                    else email',
'                    end',
'               from sp_team_members t where t.id = r.owner_id) owner,',
'       t.task_type type,',
'       r.description,',
'       (select status from sp_task_statuses where id = r.status_id) status,',
'       to_char(r.start_date,''DD-MON'') || case when r.start_date is not null then '' - '' end ||',
'       nvl(to_char(r.target_complete,''DD-MON''),''?'') dates,',
'       t.display_seq ob',
'  from sp_tasks r,',
'       sp_task_types t',
' where project_id = :P36_ID',
'   and nvl(r.task_sub_type_id,r.task_type_id) = t.id',
'   and t.static_id like ''REVIEW%''',
' order by r.target_complete nulls first, t.display_seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P36_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No review found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11424698240102781403)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11424698586086781407)
,p_query_column_id=>2
,p_column_alias=>'OWNER'
,p_column_display_sequence=>50
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11424698286923781404)
,p_query_column_id=>3
,p_column_alias=>'TYPE'
,p_column_display_sequence=>20
,p_column_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11424698399824781405)
,p_query_column_id=>4
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>30
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11424698512348781406)
,p_query_column_id=>5
,p_column_alias=>'STATUS'
,p_column_display_sequence=>40
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11424698776050781409)
,p_query_column_id=>6
,p_column_alias=>'DATES'
,p_column_display_sequence=>70
,p_column_heading=>'Dates'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11424698672309781408)
,p_query_column_id=>7
,p_column_alias=>'OB'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11729035263634054212)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>80
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(17085043682360512980)
,p_name=>'Attributes'
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.ID,',
'       f.area,',
'       i.initiative,',
'       nvl((select t.first_name||'' ''||t.last_name from sp_team_members t where t.id = p.OWNER_ID),''No Owner'') the_owner,',
'       p.owner_id,',
'       p.TARGET_COMPLETE,',
'       p.project,',
'       --',
'       -- project group',
'       --',
'       (select group_name from sp_project_groups pg where pg.id = p.project_group_id) project_group,',
'       p.project_group_id,',
'       --',
'       -- fav icon',
'       --',
'       nvl((select ''<span class="fa fa-heart u-danger-text" aria-hidden="true"></span>'' ',
'            from sp_favorites fav',
'            where fav.project_id = p.id and ',
'                  fav.team_member_id = :APP_USER_ID),',
'            ''<span class="fa fa-heart-o" aria-hidden="true"></span>'') favorite_icon,',
'       --',
'       -- attributes',
'       --',
'       p.PCT_COMPLETE||''%'' PCT_COMPLETE,',
'       nvl((select ''P''||priority from sp_project_priorities pp where pp.id = p.priority_id),''Not Prioritized'') priority,',
'       null attributes,',
'       nvl(decode(',
'           p.RELEASE_DEPENDENT_YN,',
'           ''Y'',',
'           (select t.release_train||'' ''||t.release from SP_RELEASE_TRAINS t where t.id = p.release_id),',
'           decode(',
'               to_char(p.target_complete,''DD-MON-YYYY''),',
'               null,',
'               ''Not Targeted'',',
'               to_char(p.target_complete,''MON-YYYY'')',
'               )),''Not Targeted'')  release,',
'       --',
'       --p.TAGS,',
'       --',
'       lower(p.CREATED_BY)||'' ''||apex_util.get_since(p.CREATED) created,',
'       lower(p.UPDATED_BY)||'' ''||apex_util.get_since(p.updated) updated,',
'       --',
'       p.PROJECT_SIZE,',
'       p.project_url_name,',
'       p.friendly_identifier friendly_identifier1,',
'       --',
'       -- external link:',
'       --',
'       p.external_system_link external_link,',
'       ''<button type="button" title="Copy Permalink" aria-label="Copy Permalink" data-clipboard-source="''||:P36_PERMALINK||''" class="t-Button t-Button--noLabel t-Button--icon t-Button--link padding-none">''||p.friendly_identifier||''</button>'' perma_li'
||'nk,',
'       :P36_PERMALINK permalink,',
'       --',
'       -- focus area',
'       --',
'       nvl((select focus_area from SP_INITIATIVE_FOCUS_AREAS fa where fa.id = p.FOCUS_AREA_ID),''Unallocated'') Focus_area',
'  from SP_PROJECTS p, ',
'       SP_INITIATIVES i,',
'       SP_AREAS f,',
'       SP_PROJECT_SIZES s',
'where ',
'      p.archived_yn = ''N'' and',
'      p.initiative_id = i.id and',
'      i.area_id = f.id and',
'      p.PROJECT_SIZE = s.project_size and',
'      p.DUPLICATE_OF_PROJECT_ID is null and',
'      p.id = :P36_ID'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P36_PERMALINK,P36_ID,APP_USER_ID'
,p_lazy_loading=>false
,p_query_row_template=>2100515439059797523
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11363384364586409321)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15710429964182752018)
,p_query_column_id=>2
,p_column_alias=>'AREA'
,p_column_display_sequence=>30
,p_column_heading=>'&NOMENCLATURE_AREA.'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15710430108450752019)
,p_query_column_id=>3
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>40
,p_column_heading=>'&NOMENCLATURE_INITIATIVE.'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11363385033299409327)
,p_query_column_id=>4
,p_column_alias=>'THE_OWNER'
,p_column_display_sequence=>60
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11363385118440409328)
,p_query_column_id=>5
,p_column_alias=>'OWNER_ID'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11363385166617409329)
,p_query_column_id=>6
,p_column_alias=>'TARGET_COMPLETE'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'NOT_EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from sp_projects',
'where id = :P36_ID and ',
'      RELEASE_DEPENDENT_YN = ''Y'' and',
'      RELEASE_ID is not null',
'      '))
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12557852168730646905)
,p_query_column_id=>7
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>20
,p_column_heading=>'Project'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:FI,PN:#FRIENDLY_IDENTIFIER1#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16885493680479600628)
,p_query_column_id=>8
,p_column_alias=>'PROJECT_GROUP'
,p_column_display_sequence=>100
,p_column_heading=>'Group'
,p_column_link=>'f?p=&APP_ID.:119:&SESSION.::&DEBUG.:RP,119:P119_PROJECT_GROUP_ID:#PROJECT_GROUP_ID#'
,p_column_linktext=>'#PROJECT_GROUP#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16885493764664600629)
,p_query_column_id=>9
,p_column_alias=>'PROJECT_GROUP_ID'
,p_column_display_sequence=>230
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12557852482105646908)
,p_query_column_id=>10
,p_column_alias=>'FAVORITE_ICON'
,p_column_display_sequence=>220
,p_column_heading=>'My Favorite'
,p_column_link=>'f?p=&APP_ID.:128:&SESSION.::&DEBUG.:RP,128:P128_PROJECT_ID:#ID#'
,p_column_linktext=>'#FAVORITE_ICON#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11958139093073354306)
,p_query_column_id=>11
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>210
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11363385694426409334)
,p_query_column_id=>12
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11958139002593354305)
,p_query_column_id=>13
,p_column_alias=>'ATTRIBUTES'
,p_column_display_sequence=>110
,p_column_heading=>'Attributes'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="sp-tags-container">',
'    <span class="sp-tag">#PRIORITY#</span>',
'    <span class="sp-tag">#PROJECT_SIZE#</span>',
'    <span class="sp-tag">#PCT_COMPLETE#</span>',
'    <span class="sp-tag">#RELEASE#</span>',
'</div>'))
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11363385919524409336)
,p_query_column_id=>14
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from sp_projects',
'where id = :P36_ID and ',
'      RELEASE_DEPENDENT_YN = ''Y'' and',
'      RELEASE_ID is not null'))
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11363386069664409338)
,p_query_column_id=>15
,p_column_alias=>'CREATED'
,p_column_display_sequence=>190
,p_column_heading=>'Created'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11363386328101409340)
,p_query_column_id=>16
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>200
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11363386474633409342)
,p_query_column_id=>17
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11363386734048409344)
,p_query_column_id=>18
,p_column_alias=>'PROJECT_URL_NAME'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11363386836444409345)
,p_query_column_id=>19
,p_column_alias=>'FRIENDLY_IDENTIFIER1'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15832357702853183310)
,p_query_column_id=>20
,p_column_alias=>'EXTERNAL_LINK'
,p_column_display_sequence=>180
,p_column_heading=>'External Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28418375663064926009)
,p_query_column_id=>21
,p_column_alias=>'PERMA_LINK'
,p_column_display_sequence=>160
,p_column_heading=>'Permalink'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15832358017334183313)
,p_query_column_id=>22
,p_column_alias=>'PERMALINK'
,p_column_display_sequence=>170
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19575127316154374234)
,p_query_column_id=>23
,p_column_alias=>'FOCUS_AREA'
,p_column_display_sequence=>50
,p_column_heading=>'Focus Area'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(45684211951176560879)
,p_name=>'Tasks'
,p_template=>4072358936313175081
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.ID,',
'       (select case when first_name is not null or last_name is not null',
'                    then first_name||'' ''||last_name',
'                    else email',
'                    end',
'               from sp_team_members t where t.id = r.owner_id) owner,',
'       (select task_type from sp_task_types rt where rt.id = task_type_id)||',
'           case when task_sub_type_id is not null then '': '' end ||',
'           (select task_type from sp_task_types rt where rt.id = r.task_sub_type_id) type,',
'       r.description,',
'       (select status from sp_task_statuses where id = r.status_id) status,',
'       to_char(r.start_date,''DD-MON'') || case when r.start_date is not null then '' - '' end ||',
'       nvl(to_char(r.target_complete,''DD-MON''),''?'') dates,',
'       t.display_seq ob',
'  from sp_tasks r,',
'       sp_task_types t',
' where project_id = :P36_ID',
'   and nvl(r.task_sub_type_id,r.task_type_id) = t.id',
'   and t.static_id not like ''MILESTONE%''',
'   and t.static_id not like ''REVIEW%''',
' order by r.target_complete nulls first, t.display_seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P36_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No tasks found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28512075581778784440)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28512075691307784441)
,p_query_column_id=>2
,p_column_alias=>'OWNER'
,p_column_display_sequence=>60
,p_column_heading=>'Owner'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28512075841117784442)
,p_query_column_id=>3
,p_column_alias=>'TYPE'
,p_column_display_sequence=>30
,p_column_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28512075880458784443)
,p_query_column_id=>4
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>40
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28512075991483784444)
,p_query_column_id=>5
,p_column_alias=>'STATUS'
,p_column_display_sequence=>50
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786564461612724302)
,p_query_column_id=>6
,p_column_alias=>'DATES'
,p_column_display_sequence=>140
,p_column_heading=>'Dates'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786564388300724301)
,p_query_column_id=>7
,p_column_alias=>'OB'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(127101335292353137630)
,p_name=>'Links'
,p_template=>4072358936313175081
,p_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select l.id, ',
'       l.link_url, ',
'       l.created, ',
'       l.updated, ',
'       decode(',
'           greatest(length(l.link_url),80),',
'           length(l.link_url),',
'           substr(l.link_url,1,37)||''...''||substr(l.link_url,length(l.link_url)-40),',
'           l.link_url',
'           ) link_url_display',
'from SP_PROJECT_LINKS l ',
'where project_id = :P36_ID',
'order by created desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P36_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No links Found'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12557856671539646950)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12600780468212093302)
,p_query_column_id=>2
,p_column_alias=>'LINK_URL'
,p_column_display_sequence=>30
,p_column_heading=>'URL'
,p_column_html_expression=>'<a href="#LINK_URL#" target="_blank">#LINK_URL_DISPLAY#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12600780706270093304)
,p_query_column_id=>3
,p_column_alias=>'CREATED'
,p_column_display_sequence=>50
,p_column_heading=>'Created'
,p_column_format=>'SINCE_SHORT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12600780782811093305)
,p_query_column_id=>4
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12600781049488093308)
,p_query_column_id=>5
,p_column_alias=>'LINK_URL_DISPLAY'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11729035556820054215)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11729035263634054212)
,p_button_name=>'Close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Close'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11424698934135781410)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11424698108263781402)
,p_button_name=>'add_review'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Add Review'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:509:&SESSION.::&DEBUG.:509:P509_PROJECT_ID:&P36_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11424698945808781411)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10949664486719474044)
,p_button_name=>'add_milestone'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Add Milestone'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:508:&SESSION.::&DEBUG.:508:P508_PROJECT_ID:&P36_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11754074326878819407)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11407080090000857933)
,p_button_name=>'view_change_history'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'View Change History'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:82:&SESSION.::&DEBUG.:RP,82:P82_ID:&P36_ID.'
,p_icon_css_classes=>'fa-clock-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11958139821954354313)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(17085043682360512980)
,p_button_name=>'project_history'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'History'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:124:&SESSION.::&DEBUG.::P124_ID:&P36_ID.'
,p_icon_css_classes=>'fa-clock-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12600781333429093310)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(127101335292353137630)
,p_button_name=>'add_link'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Add Link'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP,6:P6_PROJECT_ID:&P36_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12600781876641093316)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11407077914212857912)
,p_button_name=>'view_activity'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'View Activity'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:RP,130:P130_PROJECT_ID:&P36_ID.'
,p_icon_css_classes=>'fa-edit'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28786537193118713662)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(45684211951176560879)
,p_button_name=>'add_task'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Add Task'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:501:&SESSION.::&DEBUG.:501:P501_PROJECT_ID:&P36_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11729035495618054214)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(17085043682360512980)
,p_button_name=>'Edit'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Edit'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24:P24_ID:&P36_ID.'
,p_icon_css_classes=>'fa-edit'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11754075228823819416)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11407077914212857912)
,p_button_name=>'add_activity'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Add Activity'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101:P101_PROJECT_ID:&P36_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11754077981632819444)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11407080090000857933)
,p_button_name=>'edit_tags'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Edit'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:RP,88:P88_PROJECT_ID:&P36_ID.'
,p_icon_css_classes=>'fa-edit'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11729036233803054221)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11729035263634054212)
,p_button_name=>'Description'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Description'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:136:&SESSION.::&DEBUG.:RP,136:P136_ID:&P36_ID.'
,p_icon_css_classes=>'fa-file-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12557852699280646910)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11729035263634054212)
,p_button_name=>'Documents'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Documents'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:141:&SESSION.::&DEBUG.:RP,141:P141_ID:&P36_ID.'
,p_icon_css_classes=>'fa-image'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11764078185020878306)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11729035263634054212)
,p_button_name=>'Comments'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Comments'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:RP,100:P100_PROJECT_ID:&P36_ID.'
,p_icon_css_classes=>'fa-comment-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11407077600242857909)
,p_name=>'P36_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17085043682360512980)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11471432391577770347)
,p_name=>'P36_LOG'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(17085043682360512980)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11729036686389054226)
,p_name=>'P36_PROJECT_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(17085043682360512980)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15832357856673183312)
,p_name=>'P36_PERMALINK'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(17085043682360512980)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(11471432303800770346)
,p_computation_sequence=>10
,p_computation_item=>'P36_LOG'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>'return sp_log.log_and_summarize(:P36_ID);'
,p_computation_error_message=>'Unable to log view #SQLERRM#'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(11729036780974054227)
,p_computation_sequence=>20
,p_computation_item=>'P36_PROJECT_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project',
'from SP_PROJECTS p',
'where p.id = :P36_ID'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11729035652926054216)
,p_name=>'close dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11729035556820054215)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11729035832619054217)
,p_event_id=>wwv_flow_imp.id(11729035652926054216)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15832357749896183311)
,p_process_sequence=>2
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Determine Permalink'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in (',
'    select friendly_identifier, project_url_name',
'      from sp_projects',
'     where id = :P36_ID',
') loop',
'    :P36_PERMALINK := APEX_UTIL.HOST_URL(''SCRIPT'') || ',
'                      ''project-details?fi=''||c1.friendly_identifier||''&pn=''||c1.project_url_name;',
'end loop;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>5598303408749678911
);
wwv_flow_imp.component_end;
end;
/
