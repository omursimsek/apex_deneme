prompt --application/pages/page_00135
begin
--   Manifest
--     PAGE: 00135
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
 p_id=>135
,p_name=>'Activity Quick Look'
,p_alias=>'ACTIVITY-QUICK-LOOK-2'
,p_page_mode=>'MODAL'
,p_step_title=>'Activity'
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
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13119774495790848732)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(13155078106986924723)
,p_name=>'&NOMENCLATURE_PROJECT. Activity (current)'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       tm.first_name||'' ''||tm.last_name person,',
'       tm.id team_member_id,',
'       decode(greatest(length(ap.comments),80),80,ap.comments,substr(ap.comments,1,80)||''...'') comments,',
'       to_char(ap.start_date,''DD-MON-YYYY'')||'' - ''||to_char(ap.end_date,''DD-MON-YYYY'') dates,',
'       --',
'       -- project attributes',
'       --',
'       decode(greatest(length(p.project),80),80,p.project,substr(p.project,1,80)||''...'') project,',
'       p.project_size,',
'       P.pct_complete,',
'       pp.priority,',
'       p.FRIENDLY_IDENTIFIER,',
'       p.PROJECT_URL_NAME,',
'       null attributes,',
'       --',
'       -- release',
'       --',
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
'       p.owner_id,',
'       --',
'       -- icon percent complete',
'       --',
'       ''<span class="fa fa-pie-chart-''||sp_date_range_pct_comp(ap.start_date, ap.end_date)||'' aria-hidden="true"</span>'' icon',
'from sp_activities ap,',
'     sp_projects p,',
'     sp_activity_types at,',
'     sp_team_members tm,',
'     sp_project_priorities pp',
'where ap.project_id = p.id and',
'      ap.activity_type_id = at.id and',
'      p.priority_id = pp.id and',
'      ap.team_member_id = tm.id and',
'      p.DUPLICATE_OF_PROJECT_ID is null and',
'      p.ARCHIVED_YN = ''N'' and',
'      trunc(sysdate) between ap.start_date and ap.end_date',
'order by ap.end_date, tm.first_name||'' ''||tm.last_name',
'',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No &NOMENCLATURE_PROJECT. Related Activities Found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155078171761924724)
,p_query_column_id=>1
,p_column_alias=>'PERSON'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155078264098924725)
,p_query_column_id=>2
,p_column_alias=>'TEAM_MEMBER_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155079534116924737)
,p_query_column_id=>3
,p_column_alias=>'COMMENTS'
,p_column_display_sequence=>40
,p_column_heading=>'Activity'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_ID:#TEAM_MEMBER_ID#'
,p_column_linktext=>'<strong>#PERSON#</strong>: #COMMENTS#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155079570563924738)
,p_query_column_id=>4
,p_column_alias=>'DATES'
,p_column_display_sequence=>50
,p_column_heading=>'Dates'
,p_column_html_expression=>'<nobr>#ICON# #DATES#</nobr>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155078624177924728)
,p_query_column_id=>5
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>60
,p_column_heading=>'&NOMENCLATURE_PROJECT.'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#FRIENDLY_IDENTIFIER#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155078687664924729)
,p_query_column_id=>6
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155078986710924732)
,p_query_column_id=>7
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155079111325924733)
,p_query_column_id=>8
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155079243426924735)
,p_query_column_id=>9
,p_column_alias=>'FRIENDLY_IDENTIFIER'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155079396487924736)
,p_query_column_id=>10
,p_column_alias=>'PROJECT_URL_NAME'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155079186757924734)
,p_query_column_id=>11
,p_column_alias=>'ATTRIBUTES'
,p_column_display_sequence=>110
,p_column_heading=>'&NOMENCLATURE_PROJECT. Attributes'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<div class="sp-tags-container">',
'    <span class="sp-tag">P#PRIORITY#</span>',
'    <span class="sp-tag">#PROJECT_SIZE#</span>',
'    <span class="sp-tag">#PCT_COMPLETE#%</span>',
'    <span class="sp-tag">#RELEASE#</span>',
'</div>'))
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155078800661924730)
,p_query_column_id=>12
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155078885164924731)
,p_query_column_id=>13
,p_column_alias=>'OWNER_ID'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13381495149004937004)
,p_query_column_id=>14
,p_column_alias=>'ICON'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(13155079681073924739)
,p_name=>'Other Activity'
,p_template=>4072358936313175081
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       tm.first_name||'' ''||tm.last_name person,',
'       tm.id team_member_id,',
'       decode(greatest(length(ap.comments),180),180,ap.comments,substr(ap.comments,1,180)||''...'') comments,',
'       to_char(ap.start_date,''DD-MON-YYYY'')||'' - ''||to_char(ap.end_date,''DD-MON-YYYY'') dates,',
'       at.ACTIVITY_TYPE,',
'       --',
'       -- icon percent complete',
'       --',
'       ''<span class="fa fa-pie-chart-''||sp_date_range_pct_comp(ap.start_date, ap.end_date)||'' aria-hidden="true"</span>'' icon',
'from sp_activities ap,',
'     sp_activity_types at,',
'     sp_team_members tm',
'where ',
'      ap.activity_type_id = at.id and',
'      ap.team_member_id = tm.id and',
'      trunc(sysdate) between ap.start_date and ap.end_date and',
'      ap.project_id is null and',
'      ap.initiative_id is null',
'',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Non &NOMENCLATURE_PROJECT. Related Activities Found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155079994938924742)
,p_query_column_id=>1
,p_column_alias=>'PERSON'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155079822550924740)
,p_query_column_id=>2
,p_column_alias=>'TEAM_MEMBER_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155080058131924743)
,p_query_column_id=>3
,p_column_alias=>'COMMENTS'
,p_column_display_sequence=>40
,p_column_heading=>'Activity'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_ID:#TEAM_MEMBER_ID#'
,p_column_linktext=>'<strong>#PERSON#</strong> - #COMMENTS#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155080167757924744)
,p_query_column_id=>4
,p_column_alias=>'DATES'
,p_column_display_sequence=>50
,p_column_heading=>'Dates'
,p_column_html_expression=>'<nobr>#ICON# #DATES#</nobr>'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13381495080412937003)
,p_query_column_id=>5
,p_column_alias=>'ACTIVITY_TYPE'
,p_column_display_sequence=>60
,p_column_heading=>'Activity Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13398446168519841113)
,p_query_column_id=>6
,p_column_alias=>'ICON'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(13732074027351739608)
,p_name=>'Current Activity Metrics by Type'
,p_template=>4072358936313175081
,p_display_sequence=>15
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select at.ACTIVITY_TYPE,',
'       count(distinct ap.project_id) projects,',
'       count(distinct tm.id) team_members,',
'       count(*) activities',
'from sp_activities ap,',
'     sp_activity_types at,',
'     sp_team_members tm',
'where ',
'      ap.activity_type_id = at.id and',
'      ap.team_member_id = tm.id and',
'      trunc(sysdate) between ap.start_date and ap.end_date',
'group by at.ACTIVITY_TYPE',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>150
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No activities found'
,p_report_total_text_format=>'&nbsp;'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13732074438172739612)
,p_query_column_id=>1
,p_column_alias=>'ACTIVITY_TYPE'
,p_column_display_sequence=>10
,p_column_heading=>'Activity Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13732074094755739609)
,p_query_column_id=>2
,p_column_alias=>'PROJECTS'
,p_column_display_sequence=>20
,p_column_heading=>'&NOMENCLATURE_PROJECTS.'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13732074209008739610)
,p_query_column_id=>3
,p_column_alias=>'TEAM_MEMBERS'
,p_column_display_sequence=>30
,p_column_heading=>'Team Members'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13732074326343739611)
,p_query_column_id=>4
,p_column_alias=>'ACTIVITIES'
,p_column_display_sequence=>40
,p_column_heading=>'Activities'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15702850152683490549)
,p_name=>'&NOMENCLATURE_INITIATIVE. Activity (current)'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       tm.first_name||'' ''||tm.last_name person,',
'       tm.id team_member_id,',
'       decode(greatest(length(ap.comments),80),80,ap.comments,substr(ap.comments,1,80)||''...'') comments,',
'       to_char(ap.start_date,''DD-MON-YYYY'')||'' - ''||to_char(ap.end_date,''DD-MON-YYYY'') dates,',
'       --',
'       -- project attributes',
'       --',
'       decode(greatest(length(i.initiative),80),80,i.initiative,substr(i.initiative,1,80)||''...'') initiative,',
'       --',
'       -- icon percent complete',
'       --',
'       ''<span class="fa fa-pie-chart-''||sp_date_range_pct_comp(ap.start_date, ap.end_date)||'' aria-hidden="true"</span>'' icon',
'from sp_activities ap,',
'     sp_activity_types at,',
'     sp_team_members tm,',
'     sp_initiatives i',
'where ap.initiative_id = i.id and',
'      ap.activity_type_id = at.id and',
'      ap.team_member_id = tm.id and',
'      trunc(sysdate) between ap.start_date and ap.end_date',
'order by ap.end_date, tm.first_name||'' ''||tm.last_name',
'',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No &NOMENCLATURE_PROJECT. Related Activities Found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15722313995912383802)
,p_query_column_id=>1
,p_column_alias=>'PERSON'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15702850336042490550)
,p_query_column_id=>2
,p_column_alias=>'TEAM_MEMBER_ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15722314126415383803)
,p_query_column_id=>3
,p_column_alias=>'COMMENTS'
,p_column_display_sequence=>40
,p_column_heading=>'Activity'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_ID:#TEAM_MEMBER_ID#'
,p_column_linktext=>'<strong>#PERSON#</strong>: #COMMENTS#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15722314202483383804)
,p_query_column_id=>4
,p_column_alias=>'DATES'
,p_column_display_sequence=>50
,p_column_heading=>'Dates'
,p_column_html_expression=>'<nobr>#ICON# #DATES#</nobr>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15722315234316383814)
,p_query_column_id=>5
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>150
,p_column_heading=>'Initiative'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15722315099810383813)
,p_query_column_id=>6
,p_column_alias=>'ICON'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16018938854448266459)
,p_plug_name=>'Current Activities Count by Owner - Top 50'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(13137046150804648720)
,p_region_id=>wwv_flow_imp.id(16018938854448266459)
,p_chart_type=>'bar'
,p_height=>'200'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(13137047921169648722)
,p_chart_id=>wwv_flow_imp.id(13137046150804648720)
,p_seq=>10
,p_name=>'top current activity'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       tm.first_name||'' ''||tm.last_name person,',
'       tm.id team_member_id,',
'       count(*) activities',
'from sp_activities ap,',
'     sp_activity_types at,',
'     sp_team_members tm',
'where ',
'      ap.activity_type_id = at.id and',
'      ap.team_member_id = tm.id and',
'      trunc(sysdate) between ap.start_date and ap.end_date',
'group by tm.first_name, tm.last_name, tm.id',
'order by count(*) desc',
'fetch first 50 rows only'))
,p_items_value_column_name=>'ACTIVITIES'
,p_items_label_column_name=>'PERSON'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_ID:&TEAM_MEMBER_ID.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(13137047307496648721)
,p_chart_id=>wwv_flow_imp.id(13137046150804648720)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(13137046725323648721)
,p_chart_id=>wwv_flow_imp.id(13137046150804648720)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13137048473011648723)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(13119774495790848732)
,p_button_name=>'activity_detail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Activity Detail'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:75:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp.component_end;
end;
/
