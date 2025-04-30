prompt --application/pages/page_00073
begin
--   Manifest
--     PAGE: 00073
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
 p_id=>73
,p_name=>'User Quick Look'
,p_alias=>'USER-QUICK-LOOK'
,p_page_mode=>'MODAL'
,p_step_title=>'&NOMENCLATURE_USER. Quick Look'
,p_warn_on_unsaved_changes=>'N'
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
'}'))
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'27'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(13102717677836650126)
,p_name=>'&NOMENCLATURE_USER. Details'
,p_template=>3371237801798025892
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tm.ID,',
'       tm.FIRST_NAME||'' ''||tm.LAST_NAME name,',
'       tm.EMAIL,',
'       replace(lower(tm.TAGS),'','','', '') tags,',
'       rtrim(replace(tm.competencies,'','','', '')) competencies,',
'       decode(tm.is_current_yn,''Y'',''Yes'',''N'',''No'',tm.is_current_yn) IS_CURRENT_YN,',
'       screen_name,',
'       tm.created,',
'       tm.updated',
'from SP_TEAM_MEMBERS tm',
'where id = :P73_TEAM_MEMBER_ID'))
,p_display_when_condition=>'P73_TEAM_MEMBER_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P73_TEAM_MEMBER_ID'
,p_lazy_loading=>false
,p_query_row_template=>2115772683903439354
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13102717761643650127)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13102717888091650128)
,p_query_column_id=>2
,p_column_alias=>'NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13102718169177650131)
,p_query_column_id=>3
,p_column_alias=>'EMAIL'
,p_column_display_sequence=>50
,p_column_heading=>'Email'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13102718401432650133)
,p_query_column_id=>4
,p_column_alias=>'TAGS'
,p_column_display_sequence=>110
,p_column_heading=>'Tags'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(25121404439056412436)
,p_query_column_id=>5
,p_column_alias=>'COMPETENCIES'
,p_column_display_sequence=>100
,p_column_heading=>'Competencies'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select 1 from sp_team_members where competencies is not null and id = :P73_TEAM_MEMBER_ID'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13102718582044650135)
,p_query_column_id=>6
,p_column_alias=>'IS_CURRENT_YN'
,p_column_display_sequence=>70
,p_column_heading=>'Current'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20044408252053129701)
,p_query_column_id=>7
,p_column_alias=>'SCREEN_NAME'
,p_column_display_sequence=>60
,p_column_heading=>'Screen Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(20138793112175491883)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15037239898844310738)
,p_query_column_id=>8
,p_column_alias=>'CREATED'
,p_column_display_sequence=>80
,p_column_heading=>'Created'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15037239988563310739)
,p_query_column_id=>9
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>90
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14331411164077820627)
,p_plug_name=>'Button Container'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P73_TEAM_MEMBER_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16100681870926685426)
,p_plug_name=>'Not a Team Member'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>1
,p_location=>null
,p_plug_source=>'Person selected is not a team member in this application.'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P73_TEAM_MEMBER_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(20004883922158462328)
,p_name=>'Associated Groups'
,p_template=>4072358936313175081
,p_display_sequence=>70
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select g.GROUP_NAME, gm.CREATED added_to_group, g.id group_id, ',
'       (select count(*) from SP_GROUP_MEMBERS x where x.group_id = gm.group_id) members,',
'       decode(nvl(full_time_yn,''N''),''Y'',''Yes'',''No'') full_time,',
'       decode(nvl(group_leader_yn,''N''),''Y'',''Yes'',''No'') group_leader',
'from   SP_GROUP_MEMBERS gm,',
'       SP_GROUPS g',
'where  TEAM_MEMBER_ID = :P73_TEAM_MEMBER_ID and',
'       g.id = gm.GROUP_ID',
'order by upper(g.group_name)'))
,p_display_when_condition=>'P73_TEAM_MEMBER_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20004883993229462329)
,p_query_column_id=>1
,p_column_alias=>'GROUP_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Group Name'
,p_column_link=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:RP,151:P151_GROUP_ID:#GROUP_ID#'
,p_column_linktext=>'#GROUP_NAME#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20004884044923462330)
,p_query_column_id=>2
,p_column_alias=>'ADDED_TO_GROUP'
,p_column_display_sequence=>80
,p_column_heading=>'Added'
,p_column_format=>'SINCE_SHORT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20004884235869462331)
,p_query_column_id=>3
,p_column_alias=>'GROUP_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20004884272264462332)
,p_query_column_id=>4
,p_column_alias=>'MEMBERS'
,p_column_display_sequence=>70
,p_column_heading=>'Group Members'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20277967059827266728)
,p_query_column_id=>5
,p_column_alias=>'FULL_TIME'
,p_column_display_sequence=>50
,p_column_heading=>'Full Time'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20277967143599266729)
,p_query_column_id=>6
,p_column_alias=>'GROUP_LEADER'
,p_column_display_sequence=>60
,p_column_heading=>'Group Leader'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(23716703604018903104)
,p_name=>'Open Reviews'
,p_template=>4072358936313175081
,p_display_sequence=>65
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tt.task_type review_type,',
'       p.PROJECT,',
'       (select FIRST_NAME ||'' ''||last_name from SP_TEAM_MEMBERS x where x.ID = p.OWNER_ID) the_owner,',
'       (select ''P''||PRIORITY from SP_PROJECT_PRIORITIES x where x.ID = p.PRIORITY_ID) priority,',
'       p.PCT_COMPLETE pct_complete,',
'       decode(p.release_id,',
'          null, decode(p.TARGET_COMPLETE,null,''No Target'',to_char(p.TARGET_COMPLETE,''DD-MON-YYYY'')),',
'          (select RELEASE_TRAIN||'' ''||release from SP_RELEASE_TRAINS r where r.id = p.RELEASE_ID)) release,',
'       p.PROJECT_SIZE,',
'       t.UPDATED,',
'       s.status,',
'       t.impact,',
'       t.target_complete review_date,',
'       null attributes',
'  from SP_PROJECTS p,',
'       sp_tasks t,',
'       sp_task_types tt,',
'       sp_task_statuses s',
' where nvl(p.ARCHIVED_YN,''N'') != ''Y''',
'   and p.DUPLICATE_OF_PROJECT_ID is null',
'   and p.id = t.project_id',
'   and t.owner_id = :P73_TEAM_MEMBER_ID',
'   and nvl(t.task_sub_type_id,t.task_type_id) = tt.id',
'   and t.status_id = s.id (+)',
'   and tt.static_id like ''REVIEW%''',
'   and instr(:COMPLETE_TASK_STATUS_IDS,'':''||t.status_id||'':'') = 0',
' order by t.updated desc'))
,p_display_when_condition=>'P73_TEAM_MEMBER_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P73_TEAM_MEMBER_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(13408792237973796442)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23716704574483903114)
,p_query_column_id=>1
,p_column_alias=>'REVIEW_TYPE'
,p_column_display_sequence=>30
,p_column_heading=>'Review Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23716703843288903107)
,p_query_column_id=>2
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>50
,p_column_heading=>'Project'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23716704004059903108)
,p_query_column_id=>3
,p_column_alias=>'THE_OWNER'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23716704078866903109)
,p_query_column_id=>4
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23716704207292903110)
,p_query_column_id=>5
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23716704340734903111)
,p_query_column_id=>6
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23716704372895903112)
,p_query_column_id=>7
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23716704494993903113)
,p_query_column_id=>8
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>140
,p_column_heading=>'Updated'
,p_column_format=>'SINCE_SHORT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11587036559849630835)
,p_query_column_id=>9
,p_column_alias=>'STATUS'
,p_column_display_sequence=>120
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11587036510033630834)
,p_query_column_id=>10
,p_column_alias=>'IMPACT'
,p_column_display_sequence=>130
,p_column_heading=>'Impact'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23716704709082903115)
,p_query_column_id=>11
,p_column_alias=>'REVIEW_DATE'
,p_column_display_sequence=>40
,p_column_heading=>'Review Date'
,p_column_format=>'DD-MON'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786566844024724326)
,p_query_column_id=>12
,p_column_alias=>'ATTRIBUTES'
,p_column_display_sequence=>110
,p_column_heading=>'Attributes'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="sp-tags-container">',
'    <span class="sp-tag">#PRIORITY#</span>',
'    <span class="sp-tag">#PROJECT_SIZE#</span>',
'    <span class="sp-tag">#PCT_COMPLETE#%</span>',
'    <span class="sp-tag">#RELEASE#</span>',
'</div>'))
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28334401398473762298)
,p_plug_name=>'Current and Future &NOMENCLATURE_PROJECT. Activities'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ap.id, ',
'       at.activity_type,',
'       decode(greatest(length(ap.comments),80),80,ap.comments,substr(ap.comments,1,80)||''...'') comments,',
'       ap.start_date,',
'       ap.end_date,',
'       to_char(ap.end_date,''Day DD-MON-YYYY'') end_date_formatted,',
'       to_char(ap.start_date,''Day DD-MON-YYYY'')||'' to ''||to_char(ap.end_date,''Day DD-MON-YYYY'') TIMELINE,',
'       --',
'       -- determine if activity is past, current, or future',
'       --',
'       decode(trunc(ap.end_date),trunc(sysdate),''Current'',',
'       decode(trunc(ap.start_date),trunc(sysdate),''Current'',',
'       decode(',
'           greatest(trunc(ap.start_date),trunc(sysdate)),',
'               trunc(ap.start_date),''Future'',',
'           decode(',
'               greatest(trunc(ap.end_date),trunc(sysdate)),',
'               trunc(sysdate),',
'               ''Past'',''Current'')',
'           ))) timeframe,',
'       --',
'       -- optional project detail',
'       --',
'       decode(ap.project_id,null,null,(',
'           select decode(greatest(length(p.project),80),80,p.PROJECT,substr(p.project,1,80)||''...'') project ',
'           from sp_projects p ',
'           where p.id = ap.project_id and ',
'                 p.DUPLICATE_OF_PROJECT_ID is null and',
'                 p.ARCHIVED_YN = ''N'')',
'           ) project,',
'       decode(ap.project_id,null,null,(',
'           select friendly_identifier ',
'           from sp_projects p ',
'           where p.id = ap.project_id and ',
'                 p.DUPLICATE_OF_PROJECT_ID is null and',
'                 p.ARCHIVED_YN = ''N'')',
'           ) friendly_identifier,',
'       decode(ap.project_id,null,null,(',
'           select PROJECT_URL_NAME ',
'           from sp_projects p ',
'           where p.id = ap.project_id and ',
'                 p.DUPLICATE_OF_PROJECT_ID is null and',
'                 p.ARCHIVED_YN = ''N'')',
'           ) PROJECT_URL_NAME,',
'       --',
'       --',
'       --',
'       ap.end_date - ap.start_date days,',
'       round(ap.end_date - sysdate) days_remaining,',
'       ap.url,',
'       apex_util.get_since(ap.updated) last_updated,',
'       --',
'       -- team member info',
'       --',
'       tm.first_name||'' ''||tm.last_name name,',
'       --',
'       -- badge status is red if past due and green if within begin and and dates',
'       --',
'',
'       decode (trunc(sysdate),trunc(ap.end_date),''success'',',
'       decode (trunc(sysdate),trunc(ap.start_date),''success'',',
'       decode(',
'           greatest(to_char(ap.end_date,''YYYY.MM.DD''),to_char(sysdate,''YYYY.MM.DD'')),',
'           to_char(sysdate,''YYYY.MM.DD''),',
'           ''danger'',',
'           decode(',
'               greatest(to_char(ap.start_date,''YYYY.MM.DD''),to_char(sysdate,''YYYY.MM.DD'')),',
'               to_char(sysdate,''YYYY.MM.DD''),',
'               ''success'',''info'')))) as badge_class,       ',
'       --',
'       -- pie chart icon in 10% chunks that show time percent complete',
'       --',
'       ''fa-pie-chart-''||sp_date_range_pct_comp(ap.start_date, ap.end_date) icon',
'from sp_activities ap,',
'     sp_activity_types at,',
'     sp_team_members tm',
'where ',
'      ap.activity_type_id = at.id and',
'      tm.id = :P73_TEAM_MEMBER_ID and',
'      ap.team_member_id = tm.id and',
'      --',
'      -- excludes completed in the past',
'      --',
'      trunc(ap.end_date) >= trunc(sysdate)'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_ajax_items_to_submit=>'P73_TEAM_MEMBER_ID'
,p_plug_query_num_rows=>30
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P73_TEAM_MEMBER_ID'
,p_required_patch=>wwv_flow_imp.id(24517378663928473922)
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'AVATAR_DESCRIPTION', 'Elapsed Time',
  'AVATAR_ICON', '&ICON.',
  'AVATAR_SHAPE', 't-Avatar--noShape',
  'AVATAR_SIZE', 't-Avatar--sm',
  'AVATAR_TYPE', 'icon',
  'BADGE_COL_WIDTH', 't-ContentRow-badge--sm',
  'BADGE_LABEL', '&NOMENCLATURE_PROJECTS.',
  'BADGE_LABEL_DISPLAY', 'N',
  'BADGE_STATE', 'BADGE_CLASS',
  'BADGE_VALUE', 'TIMEFRAME',
  'DESCRIPTION', '>&COMMENTS.',
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'Y',
  'HIDE_BORDERS', 'N',
  'MISC', '&LAST_UPDATED.',
  'OVERLINE', '<strong>&ACTIVITY_TYPE.</strong>: &TIMELINE.',
  'REMOVE_PADDING', 'N',
  'TITLE', '&PROJECT.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(13115943512275122105)
,p_name=>'TIMEFRAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIMEFRAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>340
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(14670287959481289319)
,p_name=>'BADGE_CLASS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BADGE_CLASS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>330
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28334401573779762299)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28334402966398762313)
,p_name=>'DAYS_REMAINING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DAYS_REMAINING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>150
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28334403118137762315)
,p_name=>'ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>170
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28334405062497762334)
,p_name=>'ACTIVITY_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVITY_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>190
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28334405177774762335)
,p_name=>'COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENTS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>200
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28334405278585762336)
,p_name=>'START_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'START_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>210
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28334405370325762337)
,p_name=>'END_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'END_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>220
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28355638062357313788)
,p_name=>'DAYS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DAYS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>230
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28355638099593313789)
,p_name=>'URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>240
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28355638253412313790)
,p_name=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>250
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28355638375942313791)
,p_name=>'PROJECT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>260
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28355638424667313792)
,p_name=>'FRIENDLY_IDENTIFIER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FRIENDLY_IDENTIFIER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>270
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28355638486480313793)
,p_name=>'TIMELINE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIMELINE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>280
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28355638633841313794)
,p_name=>'PROJECT_URL_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_URL_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>290
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28355638763746313795)
,p_name=>'LAST_UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>300
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(28355639536741313803)
,p_name=>'END_DATE_FORMATTED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'END_DATE_FORMATTED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>310
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(128163967973255925502)
,p_name=>'&NOMENCLATURE_PROJECT. Associations (Excludes Completed)'
,p_template=>4072358936313175081
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select x.*, ',
'       ltrim(case when x.is_owner = ''Yes'' then ''Owner'' end || ',
'             case when x.contrib > 0 then '', Contributor'' end ||',
'             case when x.milestone_owner > 0 then '', Milestone Owner'' end ||',
'             case when x.reviewer > 0 then '', Reviewer'' end ||',
'             case when x.task_owner > 0 then '', Task Owner'' end,'', '') Association',
'from (',
'select p.id, ',
'       p.PROJECT, ',
'       i.INITIATIVE, ',
'       f.area focus_area, ',
'       --',
'       -- project attributes',
'       --',
'       p.PCT_COMPLETE PCT_COMPLETE,',
'       (select max(''P''||PRIORITY) from sp_project_priorities pp where pp.id = p.priority_id) priority,',
'       case when p.RELEASE_DEPENDENT_YN = ''Y'' ',
'            then (select max(release_train||'' ''||release) from SP_RELEASE_TRAINS r where r.id = p.release_id)',
'            end release,',
'       p.tags,',
'       p.project_size,',
'       p.updated,',
'       p.created,',
'       --',
'       -- columns needed to link to project',
'       --',
'       p.FRIENDLY_IDENTIFIER,',
'       p.PROJECT_URL_NAME,',
'       --',
'       -- project owner',
'       --',
'       case when p.owner_id = :P73_TEAM_MEMBER_ID',
'            then ''Yes''',
'            else ''No''',
'            end as is_owner,',
'       --',
'       -- contrib',
'       --',
'       nvl((select min(1) from SP_PROJECT_CONTRIBUTORS c ',
'             where c.project_id = p.id',
'               and c.team_member_id = :P5_ID),0) contrib,',
'       --',
'       -- task owner',
'       --',
'       nvl((select min(1) from sp_tasks t, sp_task_types tt ',
'             where t.project_id = p.id',
'               and t.owner_id = :P5_ID',
'               and nvl(t.task_sub_type_id,t.task_type_id) = tt.id',
'               and tt.static_id not like ''REVIEW%''',
'               and tt.static_id not like ''MILESTONE%''),0) task_owner,',
'       --',
'       -- milestone owner',
'       --',
'       nvl((select min(1) from sp_tasks t, sp_task_types tt ',
'             where t.project_id = p.id',
'               and t.owner_id = :P5_ID',
'               and nvl(t.task_sub_type_id,t.task_type_id) = tt.id',
'               and tt.static_id like ''MILESTONE%''),0) milestone_owner,',
'       --',
'       -- reviewer role',
'       --',
'       nvl((select min(1) from sp_tasks t, sp_task_types tt ',
'             where t.project_id = p.id',
'               and t.owner_id = :P5_ID',
'               and nvl(t.task_sub_type_id,t.task_type_id) = tt.id',
'               and tt.static_id like ''REVIEW%''),0) reviewer',
'from SP_PROJECTS p,',
'     sp_initiatives i,',
'     sp_areas f',
'where (p.owner_id = :P73_TEAM_MEMBER_ID or ',
'         :P73_TEAM_MEMBER_ID in (select c.team_member_id ',
'                                   from SP_PROJECT_CONTRIBUTORS c ',
'                                  where c.project_id = p.id) or',
'         :P73_TEAM_MEMBER_ID in (select c.owner_id ',
'                                   from SP_TASKS c ',
'                                  where c.project_id = p.id) or',
'         :P73_TEAM_MEMBER_ID in (select a.TEAM_MEMBER_ID from SP_ACTIVITIES a where a.PROJECT_ID = p.id)',
'      ) and',
'      p.INITIATIVE_ID = i.id and',
'      i.area_id = f.id and',
'      p.ARCHIVED_YN = ''N'' and ',
'      p.DUPLICATE_OF_PROJECT_ID is null and',
'      p.pct_complete > 0 and ',
'      p.pct_complete < 100',
') x',
'order by updated desc',
'      ',
''))
,p_display_when_condition=>'P73_TEAM_MEMBER_ID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P73_TEAM_MEMBER_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115944054264122111)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115944184088122112)
,p_query_column_id=>2
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>20
,p_column_heading=>'Project'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#FRIENDLY_IDENTIFIER#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115944280113122113)
,p_query_column_id=>3
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115944351063122114)
,p_query_column_id=>4
,p_column_alias=>'FOCUS_AREA'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115945012808122120)
,p_query_column_id=>5
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>60
,p_column_heading=>'Complete'
,p_column_html_expression=>'#PCT_COMPLETE#%'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115945140554122121)
,p_query_column_id=>6
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115945161735122122)
,p_query_column_id=>7
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>80
,p_column_heading=>'Release'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115945248978122123)
,p_query_column_id=>8
,p_column_alias=>'TAGS'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115945411229122124)
,p_query_column_id=>9
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115945454188122125)
,p_query_column_id=>10
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>110
,p_column_heading=>'Updated'
,p_column_format=>'SINCE_SHORT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115945558521122126)
,p_query_column_id=>11
,p_column_alias=>'CREATED'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115945679641122127)
,p_query_column_id=>12
,p_column_alias=>'FRIENDLY_IDENTIFIER'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13115945800955122128)
,p_query_column_id=>13
,p_column_alias=>'PROJECT_URL_NAME'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439080333288817826)
,p_query_column_id=>14
,p_column_alias=>'IS_OWNER'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439080346383817827)
,p_query_column_id=>15
,p_column_alias=>'CONTRIB'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439080505152817828)
,p_query_column_id=>16
,p_column_alias=>'TASK_OWNER'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439080634936817829)
,p_query_column_id=>17
,p_column_alias=>'MILESTONE_OWNER'
,p_column_display_sequence=>180
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439080660454817830)
,p_query_column_id=>18
,p_column_alias=>'REVIEWER'
,p_column_display_sequence=>190
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439080822615817831)
,p_query_column_id=>19
,p_column_alias=>'ASSOCIATION'
,p_column_display_sequence=>30
,p_column_heading=>'Association'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14331411792885820633)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(14331411164077820627)
,p_button_name=>'manage_my_profile'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Manage My Profile'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP,20:P20_ID:&APP_USER_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from sp_team_members tm',
'where tm.id = :P73_TEAM_MEMBER_ID and',
'      tm.email = lower(:APP_USER)'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-user'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14701555605390360102)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(14331411164077820627)
,p_button_name=>'external_link'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'External Directory'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'javascript:window.open(''&P73_EXT_LINK.'',''_blank'');'
,p_button_condition=>'P73_EXT_LINK'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-external-link'
,p_button_cattributes=>'title="External Directory"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13102719748046650147)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(14331411164077820627)
,p_button_name=>'edit_user'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Edit (Admin)'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP,20:P20_ID:&P73_TEAM_MEMBER_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from sp_team_members tm',
'where tm.id = :P73_TEAM_MEMBER_ID and',
'      tm.email = lower(:APP_USER)'))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-edit'
,p_security_scheme=>wwv_flow_imp.id(149556930433130434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13115943999796122110)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(14331411164077820627)
,p_button_name=>'view_details'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'View Details'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_ID:&P73_TEAM_MEMBER_ID.'
,p_icon_css_classes=>'fa-glasses'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13102719664782650146)
,p_name=>'P73_TEAM_MEMBER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13102717677836650126)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14331411711003820632)
,p_name=>'P73_PHOTO_PLACEHOLDER'
,p_item_sequence=>20
,p_prompt=>'Photo'
,p_source=>'#APP_FILES#default-user-avatar.png'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from sp_team_members ',
'where id = :P73_TEAM_MEMBER_ID and ',
'      photo is not null'))
,p_display_when_type=>'NOT_EXISTS'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'URL')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14609713367137806616)
,p_name=>'P73_PHOTO'
,p_item_sequence=>10
,p_prompt=>'Photo'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from sp_team_members ',
'where id = :P73_TEAM_MEMBER_ID and ',
'photo is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'SQL',
  'sql_statement', 'select PHOTO from sp_team_members where id = :P73_TEAM_MEMBER_ID')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14701349365772001874)
,p_name=>'P73_EXT_LINK'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(13102717677836650126)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select replace(apex_app_setting.get_value(''EXTERNAL_PERSON_LINK''),''#EMAIL#'',lower(email)) ',
'  from sp_team_members',
' where id = :P73_TEAM_MEMBER_ID',
'   and email is not null',
'   and apex_app_setting.get_value(''EXTERNAL_PERSON_LINK_DOMAIN'') is not null',
'   and lower(email) like ''%@''||lower(apex_app_setting.get_value(''EXTERNAL_PERSON_LINK_DOMAIN''))'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(28334403393220762318)
,p_region_id=>wwv_flow_imp.id(28334401398473762298)
,p_position_id=>348722977165395441
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:&FRIENDLY_IDENTIFIER.,&PROJECT_URL_NAME.'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(28334403556915762319)
,p_region_id=>wwv_flow_imp.id(28334401398473762298)
,p_position_id=>362316004162771045
,p_display_sequence=>20
,p_template_id=>362317865359806322
,p_label=>'Actions'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(28334403619400762320)
,p_component_action_id=>wwv_flow_imp.id(28334403556915762319)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit Activity'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101:P101_ID:&ID.'
,p_icon_css_classes=>'fa-edit'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(28416516118255259389)
,p_component_action_id=>wwv_flow_imp.id(28334403556915762319)
,p_menu_entry_type=>'ENTRY'
,p_label=>'View &NOMENCLATURE_PROJECT.'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,:FI,PN:&FRIENDLY_IDENTIFIER.,&PROJECT_URL_NAME.'
,p_icon_css_classes=>'fa-glasses'
,p_authorization_scheme=>wwv_flow_imp.id(149556930485430434424)
);
wwv_flow_imp.component_end;
end;
/
