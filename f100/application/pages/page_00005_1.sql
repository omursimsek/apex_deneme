prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
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
 p_id=>5
,p_name=>'UserDetail'
,p_alias=>'USERDETAIL'
,p_step_title=>'&P5_FIRST_NAME. &P5_LAST_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401355622061234923)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.sp-tag {',
'  padding: .125rem .25rem;',
'  display: inline-block;',
'  vertical-align: text-bottom;',
'  border-radius: .1875rem;',
'  background-color: rgba(0, 0, 0, .1);',
'  text-overflow: ellipsis;',
'  white-space: nowrap;',
'}',
'',
'.sp-tags-container {',
'  display: flex;',
'  align-items: center;',
'  flex-wrap: wrap;',
'  gap: .25rem;',
'  justify-content: flex-start;',
'}',
'',
'h3:first-of-type {',
'  margin-block-start: 0;',
'}'))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'27'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11151025837131677033)
,p_plug_name=>'RDS'
,p_region_css_classes=>'project-rds-region'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11439078433197817807)
,p_name=>'Reviews'
,p_template=>4072358936313175081
,p_display_sequence=>72
,p_include_in_reg_disp_sel_yn=>'Y'
,p_icon_css_classes=>' '
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id project_id,',
'       p.friendly_identifier,',
'       t.id task_id,',
'       tt.task_type review_type,',
'       p.PROJECT,',
'       p.project_url_name,',
'       (select FIRST_NAME ||'' ''||last_name from SP_TEAM_MEMBERS x where x.ID = p.OWNER_ID) the_owner,',
'       (select ''P''||PRIORITY from SP_PROJECT_PRIORITIES x where x.ID = p.PRIORITY_ID) priority,',
'       p.PCT_COMPLETE pct_complete,',
'       decode(p.release_id,',
'          null, decode(p.TARGET_COMPLETE,null,''No Target'',to_char(p.TARGET_COMPLETE,''DD-MON-YYYY'')),',
'          (select RELEASE_TRAIN||'' ''||release from SP_RELEASE_TRAINS r where r.id = p.RELEASE_ID)) release,',
'       p.PROJECT_SIZE,',
'       t.UPDATED,',
'       t.target_complete review_date,',
'       s.status,',
'       t.impact,',
'       nvl((select first_name||'' ''||last_name from SP_TEAM_MEMBERS tm where tm.email = lower(t.updated_by)),lower(t.updated_by)) updated_by,',
'       null attributes',
'  from SP_PROJECTS p,',
'       sp_tasks t,',
'       sp_task_types tt,',
'       sp_task_statuses s',
' where nvl(p.ARCHIVED_YN,''N'') != ''Y''',
'   and p.DUPLICATE_OF_PROJECT_ID is null',
'   and p.id = t.project_id',
'   and t.owner_id = :P5_ID',
'   and nvl(t.task_sub_type_id,t.task_type_id) = tt.id',
'   and tt.static_id like ''REVIEW%''',
'   and s.indicates_complete_yn = ''N''',
'   and t.status_id = s.id',
' order by t.target_complete asc nulls first'))
,p_header=>'&nbsp;Open Reviews'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P5_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No open reviews found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(13408792237973796442)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439079869706817822)
,p_query_column_id=>1
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439079470416817818)
,p_query_column_id=>2
,p_column_alias=>'FRIENDLY_IDENTIFIER'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439079950578817823)
,p_query_column_id=>3
,p_column_alias=>'TASK_ID'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439078499022817808)
,p_query_column_id=>4
,p_column_alias=>'REVIEW_TYPE'
,p_column_display_sequence=>10
,p_column_heading=>'Type'
,p_column_link=>'f?p=&APP_ID.:502:&SESSION.::&DEBUG.:502:P502_TASK_ID,P502_PREV_PAGE:#TASK_ID#,5'
,p_column_linktext=>'#REVIEW_TYPE#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439078784050817811)
,p_query_column_id=>5
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>50
,p_column_heading=>'&NOMENCLATURE_PROJECT.'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#FRIENDLY_IDENTIFIER#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439079592341817819)
,p_query_column_id=>6
,p_column_alias=>'PROJECT_URL_NAME'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439079414369817817)
,p_query_column_id=>7
,p_column_alias=>'THE_OWNER'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439078982565817813)
,p_query_column_id=>8
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439079660820817820)
,p_query_column_id=>9
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439079799600817821)
,p_query_column_id=>10
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439078867390817812)
,p_query_column_id=>11
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439079187482817815)
,p_query_column_id=>12
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>90
,p_column_heading=>'Updated'
,p_column_format=>'SINCE_SHORT'
,p_column_html_expression=>'#UPDATED# - #UPDATED_BY#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439078632606817809)
,p_query_column_id=>13
,p_column_alias=>'REVIEW_DATE'
,p_column_display_sequence=>20
,p_column_heading=>'Date'
,p_column_format=>'DD-MON'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439078709981817810)
,p_query_column_id=>14
,p_column_alias=>'STATUS'
,p_column_display_sequence=>30
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11587036295719630832)
,p_query_column_id=>15
,p_column_alias=>'IMPACT'
,p_column_display_sequence=>40
,p_column_heading=>'Impact'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439079244809817816)
,p_query_column_id=>16
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439079096700817814)
,p_query_column_id=>17
,p_column_alias=>'ATTRIBUTES'
,p_column_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(14241837618148515204)
,p_plug_name=>'Weekly Summary'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>92
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22349827259222897810)
,p_plug_name=>'buttons'
,p_parent_plug_id=>wwv_flow_imp.id(14241837618148515204)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(27063355719221060172)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22349827418352897811)
,p_plug_name=>'Weekly Summary content'
,p_title=>'Weekly Summary'
,p_parent_plug_id=>wwv_flow_imp.id(14241837618148515204)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>81
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return sp_contributor_summary.generate (',
'           p_team_member_id => :P5_ID,',
'           p_links          => ''APP'',',
'           p_apex_session   => :APP_SESSION );'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_ajax_items_to_submit=>'P5_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19134212194993694352)
,p_plug_name=>'Breadcrumb'
,p_region_sub_css_classes=>'has-header-actions'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>7
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19998555550026709170)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(19134212194993694352)
,p_region_sub_css_classes=>'header-actions'
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>'select 1 as actions from dual'
,p_template_component_type=>'PARTIAL'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'AVATAR_ICON', 'fa-user',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_TYPE', 'icon',
  'BADGE_COL_WIDTH', 't-ContentRow-badge--md',
  'BADGE_LABEL_DISPLAY', 'N',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'REMOVE_PADDING', 'N')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(19998556783532709182)
,p_name=>'ACTIONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIONS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20277964450487266702)
,p_plug_name=>'Groups'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>122
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select gm.id, g.GROUP_NAME, gm.CREATED added_to_group, g.id group_id, ',
'       (select count(*) from SP_GROUP_MEMBERS x where x.group_id = gm.group_id) members,',
'       decode(nvl(full_time_yn,''N''),''Y'',''Yes'',''N'',''No'') full_time,',
'       decode(nvl(group_leader_yn,''N''),''Y'',''Yes'',''N'',''No'') leader',
'from   SP_GROUP_MEMBERS gm,',
'       SP_GROUPS g',
'where  TEAM_MEMBER_ID = :P5_ID and',
'       g.id = gm.GROUP_ID',
'order by upper(g.group_name)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P5_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Groups'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(20277964554044266703)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:61:P61_ID:#ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_condition_type=>'EXISTS'
,p_detail_link_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from sp_team_members',
' where email = lower(:APP_USER)',
'   and id = :P5_ID',
'union all',
'select 1',
'  from dual',
' where :IS_ADMIN = ''Y'''))
,p_owner=>'MIKE'
,p_internal_uid=>10043910212897762303
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20277966387080266721)
,p_db_column_name=>'GROUP_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Group Name'
,p_column_link=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:RP,151:P151_GROUP_ID:#GROUP_ID#'
,p_column_linktext=>'#GROUP_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20277966511480266722)
,p_db_column_name=>'ADDED_TO_GROUP'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Added To Group'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20277966577800266723)
,p_db_column_name=>'GROUP_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Group Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20277966695531266724)
,p_db_column_name=>'MEMBERS'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Members'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20277967325860266730)
,p_db_column_name=>'FULL_TIME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Full Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20277967412990266731)
,p_db_column_name=>'LEADER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Leader'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28418375182120926004)
,p_db_column_name=>'ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(20278167232068840987)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'100441129'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'GROUP_NAME:FULL_TIME:LEADER:MEMBERS:ADDED_TO_GROUP:'
,p_sort_column_1=>'ADDED_TO_GROUP'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21735769009668555343)
,p_plug_name=>'&NOMENCLATURE_PROJECT. Exceptions'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>102
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22349827079738897808)
,p_plug_name=>'buttons'
,p_parent_plug_id=>wwv_flow_imp.id(21735769009668555343)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(27063355719221060172)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22349827154702897809)
,p_plug_name=>'Project Exceptions content'
,p_parent_plug_id=>wwv_flow_imp.id(21735769009668555343)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>25
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return sp_contributor_summary.project_exceptions (',
'           p_team_member_id  => :P5_ID,',
'           p_links           => ''APP'',',
'           p_apex_session    => :APP_SESSION );'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_ajax_items_to_submit=>'P5_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22582864117839320638)
,p_plug_name=>'&NOMENCLATURE_PROJECT. Changes'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>112
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P5_ID'
,p_plug_display_when_cond2=>'&APP_USER_ID.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22582864157536320639)
,p_plug_name=>'Project Change content'
,p_title=>'Project Changes'
,p_parent_plug_id=>wwv_flow_imp.id(22582864117839320638)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_changes_yn      varchar2(1);',
'    l_change_summary  clob;',
'begin',
'',
'    sp_contributor_summary.project_changes (',
'        p_team_member_id => :P5_ID,',
'        p_frequency      => ''WEEKLY'',',
'        p_links          => ''APP'',',
'        p_apex_session   => :APP_SESSION,',
'        p_exclude_user_yn => nvl(:P5_PROJ_CHANGE_EXCLUDE_USER_YN,''N''),',
'        p_changes_yn     => l_changes_yn,',
'        p_change_summary => l_change_summary );',
'',
'    if l_changes_yn = ''Y'' then',
'        return l_change_summary;',
'    else',
'        return ''No changes found for projects you own or have favorited.'';',
'    end if;',
'',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_ajax_items_to_submit=>'P5_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35260470173661134922)
,p_plug_name=>'buttons'
,p_region_name=>'proj-changes'
,p_parent_plug_id=>wwv_flow_imp.id(22582864117839320638)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>2010
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(27063355719221060172)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(25452405845709548522)
,p_plug_name=>'Activity'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>61
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ap.id, ',
'       at.activity_type,',
'       ap.comments,',
'       ap.start_date,',
'       ap.end_date,',
'       to_char(ap.end_date,''Day DD-MON-YYYY'') end_date_formatted,',
'       to_char(ap.start_date,''Day DD-MON-YYYY'')||'' to ''||to_char(ap.end_date,''Day DD-MON-YYYY'') TIMELINE,',
'       ap.end_date - ap.start_date days,',
'       round(ap.end_date - sysdate) days_remaining,',
'       ap.url,',
'       apex_util.get_since(ap.updated) last_updated,',
'       --',
'       -- team member info',
'       --',
'       tm.first_name||'' ''||tm.last_name name,',
'       --',
'       -- project info',
'       --',
'       p.project,',
'       p.friendly_identifier,',
'       p.PROJECT_URL_NAME,',
'       --',
'       -- badge status is red if past due and green if within begin and and dates',
'       --',
'       decode(trunc(ap.start_date),trunc(sysdate),''success'',',
'       decode(trunc(ap.end_date),trunc(sysdate),''success'',',
'       decode(',
'           greatest(to_char(ap.end_date,''YYYY.MM.DD''),to_char(sysdate,''YYYY.MM.DD'')),',
'           to_char(sysdate,''YYYY.MM.DD''),',
'           ''danger'',',
'           ''success''))) as badge_class,',
'       --',
'       -- pie chart icon in 10% chunks that show time percent complete',
'       --',
'       ''fa-pie-chart-''||sp_date_range_pct_comp(ap.start_date, ap.end_date) icon',
'from sp_activities ap,',
'     sp_projects p,',
'     sp_activity_types at,',
'     sp_team_members tm',
'where ap.project_id = p.id(+) and',
'      ap.activity_type_id = at.id and',
'      tm.email = lower(:P5_EMAIL) and',
'      ap.team_member_id = tm.id and',
'      (p.id is null or p.DUPLICATE_OF_PROJECT_ID is null) and',
'      (p.id is null or p.ARCHIVED_YN = ''N'') and',
'      --',
'      (',
'         (nvl(:P5_INCLUDE_FUTURE,''N'') = ''Y'' and ap.start_date > trunc(sysdate)) or ',
'         (nvl(:P5_INCLUDE_PAST,''N'') = ''Y'' and ap.end_date < sysdate) or ',
'         trunc(sysdate) between trunc(ap.start_date) and ap.end_date ',
'      )'))
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'start_date desc'
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_ajax_items_to_submit=>'P5_EMAIL,P5_INCLUDE_FUTURE,P5_INCLUDE_PAST'
,p_plug_query_num_rows=>30
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_required_patch=>wwv_flow_imp.id(24517378663928473922)
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'AVATAR_ICON', '&ICON.',
  'AVATAR_SHAPE', 't-Avatar--noShape',
  'AVATAR_SIZE', 't-Avatar--md',
  'AVATAR_TYPE', 'icon',
  'BADGE_COL_WIDTH', 't-ContentRow-badge--lg',
  'BADGE_LABEL', '&NOMENCLATURE_PROJECTS.',
  'BADGE_LABEL_DISPLAY', 'N',
  'BADGE_VALUE', 'ACTIVITY_TYPE',
  'DESCRIPTION', '&COMMENTS.',
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'Y',
  'HIDE_BORDERS', 'N',
  'MISC', '&LAST_UPDATED.',
  'OVERLINE', '&TIMELINE.',
  'REMOVE_PADDING', 'N',
  'TITLE', '&PROJECT.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11788292406717075543)
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
 p_id=>wwv_flow_imp.id(25452406021015548523)
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
 p_id=>wwv_flow_imp.id(25452407413634548537)
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
 p_id=>wwv_flow_imp.id(25452407565373548539)
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
 p_id=>wwv_flow_imp.id(25452409509733548558)
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
 p_id=>wwv_flow_imp.id(25452409625010548559)
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
 p_id=>wwv_flow_imp.id(25452409725821548560)
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
 p_id=>wwv_flow_imp.id(25452409817561548561)
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
 p_id=>wwv_flow_imp.id(25473642509593100012)
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
 p_id=>wwv_flow_imp.id(25473642546829100013)
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
 p_id=>wwv_flow_imp.id(25473642700648100014)
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
 p_id=>wwv_flow_imp.id(25473642823178100015)
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
 p_id=>wwv_flow_imp.id(25473642871903100016)
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
 p_id=>wwv_flow_imp.id(25473642933716100017)
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
 p_id=>wwv_flow_imp.id(25473643081077100018)
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
 p_id=>wwv_flow_imp.id(25473643210982100019)
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
 p_id=>wwv_flow_imp.id(25473643983977100027)
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
 p_id=>wwv_flow_imp.id(27499291081556143793)
,p_name=>'Milestones'
,p_template=>4072358936313175081
,p_display_sequence=>62
,p_include_in_reg_disp_sel_yn=>'Y'
,p_icon_css_classes=>' '
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id project_id,',
'       p.friendly_identifier,',
'       t.id task_id,',
'       tt.task_type review_type,',
'       p.PROJECT,',
'       p.project_url_name,',
'       (select FIRST_NAME ||'' ''||last_name from SP_TEAM_MEMBERS x where x.ID = p.OWNER_ID) the_owner,',
'       (select ''P''||PRIORITY from SP_PROJECT_PRIORITIES x where x.ID = p.PRIORITY_ID) priority,',
'       p.PCT_COMPLETE pct_complete,',
'       decode(p.release_id,',
'          null, decode(p.TARGET_COMPLETE,null,''No Target'',to_char(p.TARGET_COMPLETE,''DD-MON-YYYY'')),',
'          (select RELEASE_TRAIN||'' ''||release from SP_RELEASE_TRAINS r where r.id = p.RELEASE_ID)) release,',
'       p.PROJECT_SIZE,',
'       t.UPDATED,',
'       t.target_complete review_date,',
'       s.status,',
'       nvl((select first_name||'' ''||last_name from SP_TEAM_MEMBERS tm where tm.email = lower(t.updated_by)),lower(t.updated_by)) updated_by,',
'       null attributes',
'  from SP_PROJECTS p,',
'       sp_tasks t,',
'       sp_task_types tt,',
'       sp_task_statuses s',
' where nvl(p.ARCHIVED_YN,''N'') != ''Y''',
'   and p.DUPLICATE_OF_PROJECT_ID is null',
'   and p.id = t.project_id',
'   and t.owner_id = :P5_ID',
'   and nvl(t.task_sub_type_id,t.task_type_id) = tt.id',
'   and tt.static_id like ''MILESTONE%''',
'   and s.indicates_complete_yn = ''N''',
'   and t.status_id = s.id',
' order by t.target_complete asc nulls first'))
,p_header=>'&nbsp;Open Milestones'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P5_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No open milestones found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23664880859120389206)
,p_query_column_id=>1
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23891870769948824593)
,p_query_column_id=>2
,p_column_alias=>'FRIENDLY_IDENTIFIER'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786566968359724327)
,p_query_column_id=>3
,p_column_alias=>'TASK_ID'
,p_column_display_sequence=>180
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23664880651686389204)
,p_query_column_id=>4
,p_column_alias=>'REVIEW_TYPE'
,p_column_display_sequence=>20
,p_column_heading=>'Type'
,p_column_link=>'f?p=&APP_ID.:502:&SESSION.::&DEBUG.:502:P502_TASK_ID,P502_PREV_PAGE:#TASK_ID#,5'
,p_column_linktext=>'#REVIEW_TYPE#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23891872809652824595)
,p_query_column_id=>5
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>50
,p_column_heading=>'&NOMENCLATURE_PROJECT.'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#FRIENDLY_IDENTIFIER#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23891871168417824593)
,p_query_column_id=>6
,p_column_alias=>'PROJECT_URL_NAME'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23891873182951824595)
,p_query_column_id=>7
,p_column_alias=>'THE_OWNER'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23891873553846824596)
,p_query_column_id=>8
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23891873974040824596)
,p_query_column_id=>9
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23891874770651824597)
,p_query_column_id=>10
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23891875216952824597)
,p_query_column_id=>11
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23891875556205824597)
,p_query_column_id=>12
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>90
,p_column_heading=>'Updated'
,p_column_format=>'SINCE_SHORT'
,p_column_html_expression=>'#UPDATED# - #UPDATED_BY#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23664880834816389205)
,p_query_column_id=>13
,p_column_alias=>'REVIEW_DATE'
,p_column_display_sequence=>30
,p_column_heading=>'Date'
,p_column_format=>'DD-MON'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23664884107568389238)
,p_query_column_id=>14
,p_column_alias=>'STATUS'
,p_column_display_sequence=>40
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23891872013978824594)
,p_query_column_id=>15
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(23891875942316824598)
,p_query_column_id=>16
,p_column_alias=>'ATTRIBUTES'
,p_column_display_sequence=>80
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(28786567262116724330)
,p_name=>'Tasks'
,p_template=>4072358936313175081
,p_display_sequence=>82
,p_include_in_reg_disp_sel_yn=>'Y'
,p_icon_css_classes=>' '
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id project_id,',
'       p.friendly_identifier,',
'       t.id task_id,',
'       tt.task_type review_type,',
'       p.PROJECT,',
'       p.project_url_name,',
'       (select FIRST_NAME ||'' ''||last_name from SP_TEAM_MEMBERS x where x.ID = p.OWNER_ID) the_owner,',
'       (select ''P''||PRIORITY from SP_PROJECT_PRIORITIES x where x.ID = p.PRIORITY_ID) priority,',
'       p.PCT_COMPLETE pct_complete,',
'       decode(p.release_id,',
'          null, decode(p.TARGET_COMPLETE,null,''No Target'',to_char(p.TARGET_COMPLETE,''DD-MON-YYYY'')),',
'          (select RELEASE_TRAIN||'' ''||release from SP_RELEASE_TRAINS r where r.id = p.RELEASE_ID)) release,',
'       p.PROJECT_SIZE,',
'       t.UPDATED,',
'       case when t.start_date is not null then to_char(t.start_date,''DD-MON-YYYY'') ||'' - '' end || ',
'           to_char(t.target_complete,''DD-MON-YYYY'') review_date,',
'       s.status,',
'       nvl((select first_name||'' ''||last_name from SP_TEAM_MEMBERS tm where tm.email = lower(t.updated_by)),lower(t.updated_by)) updated_by,',
'       null attributes',
'  from SP_PROJECTS p,',
'       sp_tasks t,',
'       sp_task_types tt,',
'       sp_task_statuses s',
' where nvl(p.ARCHIVED_YN,''N'') != ''Y''',
'   and p.DUPLICATE_OF_PROJECT_ID is null',
'   and p.id = t.project_id',
'   and t.owner_id = :P5_ID',
'   and nvl(t.task_sub_type_id,t.task_type_id) = tt.id',
'   and tt.static_id not like ''REVIEW%''',
'   and tt.static_id not like ''MILESTONE%''',
'   and s.indicates_complete_yn = ''N''',
'   and t.status_id = s.id',
' order by t.target_complete asc nulls first'))
,p_header=>'&nbsp;Open Tasks'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P5_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No open tasks found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786568767389724345)
,p_query_column_id=>1
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786568421023724341)
,p_query_column_id=>2
,p_column_alias=>'FRIENDLY_IDENTIFIER'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786568928101724346)
,p_query_column_id=>3
,p_column_alias=>'TASK_ID'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786567363719724331)
,p_query_column_id=>4
,p_column_alias=>'REVIEW_TYPE'
,p_column_display_sequence=>10
,p_column_heading=>'Type'
,p_column_link=>'f?p=&APP_ID.:502:&SESSION.::&DEBUG.:502:P502_TASK_ID,P502_PREV_PAGE:#TASK_ID#,5'
,p_column_linktext=>'#REVIEW_TYPE#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786567675321724334)
,p_query_column_id=>5
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>40
,p_column_heading=>'&NOMENCLATURE_PROJECT.'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#FRIENDLY_IDENTIFIER#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786568453198724342)
,p_query_column_id=>6
,p_column_alias=>'PROJECT_URL_NAME'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786568277064724340)
,p_query_column_id=>7
,p_column_alias=>'THE_OWNER'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786567848616724336)
,p_query_column_id=>8
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786568557355724343)
,p_query_column_id=>9
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786568677517724344)
,p_query_column_id=>10
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786567822505724335)
,p_query_column_id=>11
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786568116263724338)
,p_query_column_id=>12
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>80
,p_column_heading=>'Updated'
,p_column_format=>'SINCE_SHORT'
,p_column_html_expression=>'#UPDATED# - #UPDATED_BY#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786567474383724332)
,p_query_column_id=>13
,p_column_alias=>'REVIEW_DATE'
,p_column_display_sequence=>20
,p_column_heading=>'Date'
,p_column_format=>'DD-MON'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786567542855724333)
,p_query_column_id=>14
,p_column_alias=>'STATUS'
,p_column_display_sequence=>30
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786568227714724339)
,p_query_column_id=>15
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28786567967288724337)
,p_query_column_id=>16
,p_column_alias=>'ATTRIBUTES'
,p_column_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(125281103916518144388)
,p_plug_name=>'&NOMENCLATURE_PROJECTS.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select x.*,',
'       ltrim(case when x.is_owner = ''Yes'' then ''Owner'' end || ',
'             case when x.other_assoc > 0 then '', Contributor'' end ||',
'             case when x.milestone_owner > 0 then '', Milestone Owner'' end ||',
'             case when x.reviewer > 0 then '', Reviewer'' end ||',
'             case when x.task_owner > 0 then '', Task Owner'' end,'', '') Association',
'from (',
'select p.id, ',
'       p.PROJECT, ',
'       i.INITIATIVE, ',
'       f.area focus_area, ',
'       --',
'       -- other association',
'       --',
'       nvl((select min(1) from SP_PROJECT_CONTRIBUTORS c ',
'                    where c.project_id = p.id',
'                      and c.team_member_id = :P5_ID),0) other_assoc,',
'       --',
'       -- task owner',
'       --',
'       nvl((select min(1) from sp_tasks t, sp_task_types tt ',
'                 where t.project_id = p.id',
'                   and t.owner_id = :P5_ID',
'                   and nvl(t.task_sub_type_id,t.task_type_id) = tt.id',
'                   and tt.static_id not like ''REVIEW%''',
'                   and tt.static_id not like ''MILESTONE%''),0) task_owner,',
'       --',
'       -- milestone owner',
'       --',
'       nvl((select min(1) from sp_tasks t, sp_task_types tt ',
'                 where t.project_id = p.id',
'                   and t.owner_id = :P5_ID',
'                   and nvl(t.task_sub_type_id,t.task_type_id) = tt.id',
'                   and tt.static_id like ''MILESTONE%''),0) milestone_owner,',
'       --',
'       -- reviewer',
'       --',
'       nvl((select min(1) from sp_tasks t, sp_task_types tt ',
'                 where t.project_id = p.id',
'                   and t.owner_id = :P5_ID',
'                   and nvl(t.task_sub_type_id,t.task_type_id) = tt.id',
'                   and tt.static_id like ''REVIEW%''),0) reviewer,',
'       --',
'       -- project owner',
'       --',
'       case when p.OWNER_ID = :P5_ID',
'            then ''Yes''',
'            else ''No'' end is_owner,',
'       --',
'       -- project activity',
'       --',
'       (select ''Current '' from dual where exists (',
'           select 1 ',
'           from SP_ACTIVITIES a ',
'           where a.TEAM_MEMBER_ID = :P5_ID and ',
'                 a.project_id = p.id and ',
'                 trunc(sysdate) between trunc(a.start_date) and trunc(a.end_date)',
'           )',
'           )||',
'        (select ''Future '' from dual where exists (',
'           select 1 ',
'           from SP_ACTIVITIES a ',
'           where a.TEAM_MEMBER_ID = :P5_ID and ',
'                 a.project_id = p.id and ',
'                 trunc(sysdate) < trunc(a.start_date)',
'           )',
'           )||          ',
'        (select ''Past '' from dual where exists (',
'           select 1 ',
'           from SP_ACTIVITIES a ',
'           where a.TEAM_MEMBER_ID = :P5_ID and ',
'                 a.project_id = p.id and ',
'                 trunc(sysdate) > trunc(a.end_date)',
'           )',
'           )           ',
'            Activity,',
'       --',
'       -- project attributes',
'       --',
'       p.PCT_COMPLETE PCT_COMPLETE,',
'       (select max(''P''||PRIORITY) from sp_project_priorities pp where pp.id = p.priority_id) priority,',
'       (select max(release_train||'' ''||release) from SP_RELEASE_TRAINS r where r.id = p.release_id) release,',
'       p.tags,',
'       p.project_size,',
'       p.updated,',
'       p.created,',
'       --',
'       -- columns needed to link to project',
'       --',
'       p.FRIENDLY_IDENTIFIER,',
'       p.PROJECT_URL_NAME',
'from SP_PROJECTS p,',
'     sp_initiatives i,',
'     sp_areas f',
'where (p.owner_id = :P5_ID or ',
'        :P5_ID in (select c.team_member_id ',
'                     from SP_PROJECT_CONTRIBUTORS c ',
'                    where c.project_id = p.id) or',
'        :P5_ID in (select t.owner_id from SP_TASKS t where t.project_id = p.id) or',
'        :P5_ID in (select a.TEAM_MEMBER_ID from SP_ACTIVITIES a where a.project_id = p.id) )',
'  and p.INITIATIVE_ID = i.id',
'  and i.area_id = f.id',
'  and p.ARCHIVED_YN = ''N''',
'  and p.DUPLICATE_OF_PROJECT_ID is null',
') x'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P5_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'&NOMENCLATURE_PROJECTS.'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11151023954701677015)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>916969613555172615
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151024059793677016)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151024180080677017)
,p_db_column_name=>'PROJECT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'&NOMENCLATURE_PROJECT.'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#FRIENDLY_IDENTIFIER#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151024266117677018)
,p_db_column_name=>'INITIATIVE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'&NOMENCLATURE_INITIATIVE.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151024434682677019)
,p_db_column_name=>'FOCUS_AREA'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'&NOMENCLATURE_AREA.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151024607662677021)
,p_db_column_name=>'PRIORITY'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151024681140677022)
,p_db_column_name=>'UPDATED'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151024744262677023)
,p_db_column_name=>'CREATED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151026128502677036)
,p_db_column_name=>'IS_OWNER'
,p_display_order=>90
,p_column_identifier=>'P'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13102717010325650119)
,p_db_column_name=>'ACTIVITY'
,p_display_order=>100
,p_column_identifier=>'R'
,p_column_label=>'Activity'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151025110284677026)
,p_db_column_name=>'RELEASE'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>'Release'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151025185467677027)
,p_db_column_name=>'TAGS'
,p_display_order=>140
,p_column_identifier=>'L'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151025292866677028)
,p_db_column_name=>'PROJECT_SIZE'
,p_display_order=>150
,p_column_identifier=>'M'
,p_column_label=>'Size'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151025348932677029)
,p_db_column_name=>'FRIENDLY_IDENTIFIER'
,p_display_order=>160
,p_column_identifier=>'N'
,p_column_label=>'Friendly Identifier'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151025528912677030)
,p_db_column_name=>'PROJECT_URL_NAME'
,p_display_order=>170
,p_column_identifier=>'O'
,p_column_label=>'Project Url Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11151026152895677037)
,p_db_column_name=>'PCT_COMPLETE'
,p_display_order=>180
,p_column_identifier=>'Q'
,p_column_label=>'Complete'
,p_column_html_expression=>'#PCT_COMPLETE#%'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22582864915751320646)
,p_db_column_name=>'ASSOCIATION'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Association'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11439077977643817803)
,p_db_column_name=>'OTHER_ASSOC'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Other Assoc'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11439078117270817804)
,p_db_column_name=>'TASK_OWNER'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Task Owner'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11439078148186817805)
,p_db_column_name=>'MILESTONE_OWNER'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Milestone Owner'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11439078280316817806)
,p_db_column_name=>'REVIEWER'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Reviewer'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11188983844869667071)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'9549296'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT:INITIATIVE:ASSOCIATION:RELEASE:PCT_COMPLETE:PRIORITY:UPDATED'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(23238239219357894214)
,p_report_id=>wwv_flow_imp.id(11188983844869667071)
,p_name=>'Active Projects'
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_expr_type=>'ROW'
,p_expr=>'Q not in (0,100)'
,p_condition_sql=>'"PCT_COMPLETE" NOT IN ( 0 , 100 )'
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14697774272392867014)
,p_plug_name=>'Note on Report'
,p_parent_plug_id=>wwv_flow_imp.id(125281103916518144388)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_count_0    number;',
'    l_count_100  number;',
'    l_owner      varchar2(4000);',
'    l_link       varchar2(4000);',
'    l_return     clob;',
'begin',
'    select count(*)',
'      into l_count_0',
'      from sp_projects p',
'     where pct_complete = 0',
'       and owner_id = :P5_ID',
'       and archived_yn = ''N'';',
'',
'    select count(*)',
'      into l_count_100',
'      from sp_projects p',
'     where pct_complete = 100',
'       and owner_id = :P5_ID',
'       and archived_yn = ''N'';',
'',
'    if l_count_0 > 0 or l_count_100 > 0 then',
'       select first_name||'' ''||last_name',
'         into l_owner',
'         from sp_team_members ',
'        where id = :P5_ID;',
'    end if;',
'',
'    if l_count_0 > 0 or l_count_100 > 0 then',
'       l_link := ''<a href="''||apex_page.get_url(',
'                                   p_application => :APP_ID,',
'                                   p_page        => 23,',
'                                   p_session     => :APP_SESSION,',
'                                   p_items       => ''P23_THE_OWNER'',',
'                                   p_values      => l_owner,',
'                                   p_plain_url   => TRUE )||''">view all</a>'';',
'    end if;',
'',
'    if l_count_0 > 0 and l_count_100 > 0 then',
'       l_return := ''Report excludes ''|| l_count_0 ||'' and ''||',
'                    l_count_100 || '' '' ||',
'                    :NOMENCLATURE_PROJECTS ||'' owned by this user (''||l_link||'').'';',
'    elsif l_count_0 > 0 then',
'       l_return := ''Report excludes ''||l_count_0 || '' ''||',
'                    case when l_count_0 = 1 then :NOMENCLATURE_PROJECT else :NOMENCLATURE_PROJECTS end ||''  owned by this user (''||l_link||'').'';',
'    elsif l_count_100 > 0 then',
'       l_return := ''Report excludes ''||l_count_100 || '' ''||',
'                    case when l_count_100 = 1 then :NOMENCLATURE_PROJECT else :NOMENCLATURE_PROJECTS end ||''  owned by this user (''||l_link||'').'';',
'    end if;',
'',
'    return ''<br/>''||l_return;',
' end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_ajax_items_to_submit=>'P5_ID'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1',
'      from sp_projects p',
'     where pct_complete in (0,100)',
'       and owner_id = :P5_ID',
'       and archived_yn = ''N'''))
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22349826649690897804)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(22349827079738897808)
,p_button_name=>'SUBSCRIBE_ME_EXCEPT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Subscribe me'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from sp_notifications n',
' where static_id = ''PROJECT_EXCEPTIONS''',
'   and is_active_yn = ''Y''',
'   and not exists (select 1 from sp_notification_subscriptions',
'                    where notification_id = n.id',
'                      and team_member_id = :APP_USER_ID',
'                      and opted_in_yn = ''Y'')',
'   and :APP_USER_ID is not null',
'   and :P5_ID = :APP_USER_ID'))
,p_button_condition_type=>'EXISTS'
,p_required_patch=>wwv_flow_imp.id(21356200367810334522)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(23144698080935741518)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(35260470173661134922)
,p_button_name=>'SUBSCRIBE_ME_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Subscribe me'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from sp_notifications n',
' where static_id = ''PROJECT_CHANGES''',
'   and is_active_yn = ''Y''',
'   and not exists (select 1 from sp_notification_subscriptions',
'                    where notification_id = n.id',
'                      and team_member_id = :APP_USER_ID',
'                      and opted_in_yn = ''Y'')',
'   and :APP_USER_ID is not null',
'   and :P5_ID = :APP_USER_ID'))
,p_button_condition_type=>'EXISTS'
,p_required_patch=>wwv_flow_imp.id(21356200367810334522)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22349828818627897825)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(22349827079738897808)
,p_button_name=>'UNSUBSCRIBE_ME_EXCEPT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Unsubscribe'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from sp_notifications n',
' where static_id = ''PROJECT_EXCEPTIONS''',
'   and is_active_yn = ''Y''',
'   and exists (select 1 from sp_notification_subscriptions',
'                where notification_id = n.id',
'                  and team_member_id = :APP_USER_ID',
'                  and opted_in_yn = ''Y'')',
'   and :P5_ID = :APP_USER_ID'))
,p_button_condition_type=>'EXISTS'
,p_required_patch=>wwv_flow_imp.id(21356200367810334522)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(23144698531484741518)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(35260470173661134922)
,p_button_name=>'UNSUBSCRIBE_ME_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Unsubscribe'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from sp_notifications n',
' where static_id = ''PROJECT_CHANGES''',
'   and is_active_yn = ''Y''',
'   and exists (select 1 from sp_notification_subscriptions',
'                where notification_id = n.id',
'                  and team_member_id = :APP_USER_ID',
'                  and opted_in_yn = ''Y'')',
'   and :P5_ID = :APP_USER_ID'))
,p_button_condition_type=>'EXISTS'
,p_required_patch=>wwv_flow_imp.id(21356200367810334522)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21735765407590555307)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(22349827259222897810)
,p_button_name=>'SUBSCRIBE_ME_SUMMARY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Subscribe me'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from sp_notifications n',
' where static_id = ''WEEKLY_SUMMARY''',
'   and is_active_yn = ''Y''',
'   and not exists (select 1 from sp_notification_subscriptions',
'                    where notification_id = n.id',
'                      and team_member_id = :APP_USER_ID',
'                      and opted_in_yn = ''Y'')',
'   and :APP_USER_ID is not null',
'   and :P5_ID = :APP_USER_ID'))
,p_button_condition_type=>'EXISTS'
,p_required_patch=>wwv_flow_imp.id(21356200367810334522)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22349826605443897803)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(22349827079738897808)
,p_button_name=>'EMAIL_ME_EXCEPT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Email to me'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(23144697730220741517)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(35260470173661134922)
,p_button_name=>'EMAIL_ME_CHANGES'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Email to me'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22349828673148897824)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(22349827259222897810)
,p_button_name=>'UNSUBSCRIBE_ME_SUMMARY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--link'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Unsubscribe'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from sp_notifications n',
' where static_id = ''WEEKLY_SUMMARY''',
'   and is_active_yn = ''Y''',
'   and exists (select 1 from sp_notification_subscriptions',
'                where notification_id = n.id',
'                  and team_member_id = :APP_USER_ID',
'                  and opted_in_yn = ''Y'')',
'   and :P5_ID = :APP_USER_ID'))
,p_button_condition_type=>'EXISTS'
,p_required_patch=>wwv_flow_imp.id(21356200367810334522)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21429434183265636218)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(22349827259222897810)
,p_button_name=>'EMAIL_ME_SUMMARY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Email to me'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27267756982555923749)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(20277964450487266702)
,p_button_name=>'Add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Add'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:61:P61_TEAM_MEMBER_ID:&P5_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from sp_team_members',
' where email = lower(:APP_USER)',
'   and id = :P5_ID',
'union all',
'select 1',
'  from dual',
' where :IS_ADMIN = ''Y'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13106075345103561529)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19134212194993694352)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13102716236300650111)
,p_name=>'P5_INCLUDE_FUTURE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(25452405845709548522)
,p_item_default=>'N'
,p_prompt=>'Include Future'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:margin-left-md'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13102717092804650120)
,p_name=>'P5_INCLUDE_PAST'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(25452405845709548522)
,p_item_default=>'N'
,p_prompt=>'Include Past'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:margin-left-md'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17021977473439113643)
,p_name=>'P5_EMAIL'
,p_item_sequence=>91
,p_item_plug_id=>wwv_flow_imp.id(125281103916518144388)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17021977662669113645)
,p_name=>'P5_FIRST_NAME'
,p_item_sequence=>101
,p_item_plug_id=>wwv_flow_imp.id(125281103916518144388)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17021977788496113646)
,p_name=>'P5_LAST_NAME'
,p_item_sequence=>111
,p_item_plug_id=>wwv_flow_imp.id(125281103916518144388)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17407957046994141405)
,p_name=>'P5_PROJ_CHANGE_EXCLUDE_USER_YN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35260470173661134922)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return nvl(apex_util.get_preference (',
'              p_preference => ''P5_PROJ_CHANGE_EXCLUDE_USER_YN'',',
'              p_user       => :APP_USER ),''N'');'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Exclude Your Changes?'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'off_value', 'N',
  'on_value', 'Y',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(125281102182243144371)
,p_name=>'P5_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(125281103916518144388)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(17021976032976113628)
,p_computation_sequence=>50
,p_computation_item=>'LAST_PROJECT_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'5'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(11151025951982677035)
,p_computation_sequence=>60
,p_computation_item=>'P5_EMAIL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select email from sp_team_members t where id = :P5_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13102716254384650112)
,p_name=>'on include future change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_INCLUDE_FUTURE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13102716347028650113)
,p_event_id=>wwv_flow_imp.id(13102716254384650112)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P5_INCLUDE_FUTURE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13102716522601650114)
,p_event_id=>wwv_flow_imp.id(13102716254384650112)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(25452405845709548522)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13102717225197650121)
,p_name=>'on change of include past'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_INCLUDE_PAST'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13102717256378650122)
,p_event_id=>wwv_flow_imp.id(13102717225197650121)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P5_INCLUDE_PAST'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13102717418929650123)
,p_event_id=>wwv_flow_imp.id(13102717225197650121)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(25452405845709548522)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11615378513965228320)
,p_name=>'refresh on modal close'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(19998555550026709170)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(23664881090398389208)
,p_name=>'refresh reviews'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(27499291081556143793)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(23664881162418389209)
,p_event_id=>wwv_flow_imp.id(23664881090398389208)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(27499291081556143793)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17407957160612141406)
,p_name=>'when Project Change Exclude User'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P5_PROJ_CHANGE_EXCLUDE_USER_YN'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17407957413441141408)
,p_event_id=>wwv_flow_imp.id(17407957160612141406)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P5_PROJ_CHANGE_EXCLUDE_USER_YN'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17407957450769141409)
,p_event_id=>wwv_flow_imp.id(17407957160612141406)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.set_preference (',
'    p_preference => ''P5_PROJ_CHANGE_EXCLUDE_USER_YN'',',
'    p_value      => :P5_PROJ_CHANGE_EXCLUDE_USER_YN,',
'    p_user       => :APP_USER );'))
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17407957327695141407)
,p_event_id=>wwv_flow_imp.id(17407957160612141406)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(22582864157536320639)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28418375006764926002)
,p_name=>'after group change'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(20277964450487266702)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28418375060745926003)
,p_event_id=>wwv_flow_imp.id(28418375006764926002)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(20277964450487266702)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(21429497019842201022)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Email summary'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_summary      clob;',
'begin',
'',
'    l_summary := sp_contributor_summary.generate (',
'                     p_team_member_id    => :P5_ID,',
'                     p_show_activities   => ''Y'',',
'                     p_show_projects     => ''Y'',',
'                     p_links             => ''EMAIL''',
'                     );',
'',
'    apex_mail.send ( ',
'            p_to                 => :APP_USER,   ',
'            p_from               => :APP_USER,  ',
'            p_application_id     => :APP_ID,  ',
'            p_template_static_id => ''EMAIL_ME'',  ',
'            p_placeholders       => ''{'' || ''"APPLICATION_LINK": "'' || sp_strategic_proj_util.get_setting(p_static_id => ''APP_HOME_URL'') ||''", ''|| ',
'                                           ''"APP_NAME": ''   || apex_json.stringify( :NOMENCLATURE_STRATEGIC_PLANNER ) ||'', ''||',
'                                           ''"SUBJECT": ''    || apex_json.stringify( :NOMENCLATURE_STRATEGIC_PLANNER ||'' Weekly Summary'') ||'', ''||',
'                                           ''"SUMMARY": ''    || apex_json.stringify( l_summary ) ||',
'                                     ''}'' ); ',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(21429434183265636218)
,p_process_success_message=>'Weekly Summary email sent.'
,p_internal_uid=>11195442678695696622
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22349826803339897805)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Email exceptions'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_summary      clob;',
'begin',
'',
'    l_summary := sp_contributor_summary.project_exceptions (',
'                     p_team_member_id  => :P5_ID,',
'                     p_links           => ''EMAIL''',
'                     );',
'',
'    apex_mail.send ( ',
'            p_to                 => :APP_USER,   ',
'            p_from               => :APP_USER,  ',
'            p_application_id     => :APP_ID,  ',
'            p_template_static_id => ''EMAIL_ME'',  ',
'            p_placeholders       => ''{'' || ''"APPLICATION_LINK": "'' || sp_strategic_proj_util.get_setting(p_static_id => ''APP_HOME_URL'') ||''", ''|| ',
'                                           ''"APP_NAME": ''   || apex_json.stringify( :NOMENCLATURE_STRATEGIC_PLANNER ) ||'', ''||',
'                                           ''"SUBJECT": ''    || apex_json.stringify( :NOMENCLATURE_STRATEGIC_PLANNER ||'' ''||:NOMENCLATURE_PROJECT ||'' Exceptions'') ||'', ''||',
'                                           ''"SUMMARY": ''    || apex_json.stringify( l_summary ) ||',
'                                     ''}'' ); ',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(22349826605443897803)
,p_process_success_message=>'Project Exceptions email sent.'
,p_internal_uid=>12115772462193393405
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22582864244742320640)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Email changes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_changes_yn  varchar2(1);',
'    l_summary     clob;',
'begin',
'',
'    sp_contributor_summary.project_changes (',
'        p_team_member_id  => :APP_USER_ID,',
'        p_frequency       => ''WEEKLY'',',
'        p_links           => ''EMAIL'',',
'        p_exclude_user_yn => :P5_PROJ_CHANGE_EXCLUDE_USER_YN,',
'        p_changes_yn      => l_changes_yn,',
'        p_change_summary  => l_summary );',
'',
'    if l_changes_yn = ''Y'' then',
'',
'        apex_mail.send ( ',
'                p_to                 => :APP_USER,   ',
'                p_from               => :APP_USER,  ',
'                p_application_id     => :APP_ID,  ',
'                p_template_static_id => ''EMAIL_ME'',  ',
'                p_placeholders       => ''{'' || ''"APPLICATION_LINK": "'' || sp_strategic_proj_util.get_setting(p_static_id => ''APP_HOME_URL'') ||''", ''|| ',
'                                               ''"APP_NAME": ''   || apex_json.stringify( :NOMENCLATURE_STRATEGIC_PLANNER ) ||'', ''||',
'                                               ''"SUBJECT": ''    || apex_json.stringify( :NOMENCLATURE_STRATEGIC_PLANNER ||'' ''||:NOMENCLATURE_PROJECT ||'' Changes'') ||'', ''||',
'                                               ''"SUMMARY": ''    || apex_json.stringify( l_summary ) ||',
'                                         ''}'' ); ',
'',
'    end if;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(23144697730220741517)
,p_process_success_message=>'Project changes email sent.'
,p_internal_uid=>12348809903595816240
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(21735765537023555308)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Subscribe summary'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_strategic_proj_util.notification_opt_in (',
'    p_team_member_id  => :APP_USER_ID,',
'    p_notification_id => sp_strategic_proj_util.get_notification_id(''WEEKLY_SUMMARY'') );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(21735765407590555307)
,p_process_success_message=>'Subscribed to Weekly Summary.'
,p_internal_uid=>11501711195877050908
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22349828911332897826)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Unsubscribe summary'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_strategic_proj_util.notification_opt_out (',
'    p_team_member_id  => :APP_USER_ID,',
'    p_notification_id => sp_strategic_proj_util.get_notification_id(''WEEKLY_SUMMARY'') );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(22349828673148897824)
,p_process_success_message=>'Unsubscribed from Weekly Summary.'
,p_internal_uid=>12115774570186393426
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22349826921826897806)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Subscribe exceptions'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_strategic_proj_util.notification_opt_in (',
'    p_team_member_id  => :APP_USER_ID,',
'    p_notification_id => sp_strategic_proj_util.get_notification_id(''PROJECT_EXCEPTIONS'') );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(22349826649690897804)
,p_process_success_message=>'Subscribed to Project Exceptions.'
,p_internal_uid=>12115772580680393406
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22349828989617897827)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Unsubscribe exceptions'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_strategic_proj_util.notification_opt_out (',
'    p_team_member_id  => :APP_USER_ID,',
'    p_notification_id => sp_strategic_proj_util.get_notification_id(''PROJECT_EXCEPTIONS'') );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(22349828818627897825)
,p_process_success_message=>'Unsubscribed from Project Exceptions.'
,p_internal_uid=>12115774648471393427
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22582864533060320642)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Subscribe changes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_strategic_proj_util.notification_opt_in (',
'    p_team_member_id  => :APP_USER_ID,',
'    p_notification_id => sp_strategic_proj_util.get_notification_id(''PROJECT_CHANGES'') );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(23144698080935741518)
,p_process_success_message=>'Subscribed to Project Changes.'
,p_internal_uid=>12348810191913816242
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22582864609134320643)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Unsubscribe changes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_strategic_proj_util.notification_opt_out (',
'    p_team_member_id  => :APP_USER_ID,',
'    p_notification_id => sp_strategic_proj_util.get_notification_id(''PROJECT_CHANGES'') );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(23144698531484741518)
,p_process_success_message=>'Unsubscribed from Project Changes.'
,p_internal_uid=>12348810267987816243
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20563623946072787117)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sync roles'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_strategic_proj_util.sync_team_member_app_role (',
'    p_app_id => :APP_ID,',
'    p_email  => :P5_EMAIL);'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>10329569604926282717
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(17021977603193113644)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set first and last name session state'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in (select first_name, last_name',
'from sp_team_members tm',
'where tm.id = :P5_ID) loop',
'    :P5_FIRST_NAME := c1.first_name;',
'    :P5_LAST_NAME  := c1.last_Name;',
'end loop;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>6787923262046609244
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(14711151437086402921)
,p_region_id=>wwv_flow_imp.id(19998555550026709170)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362316605839802174
,p_label=>'Edit My Profile'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:144:&SESSION.::&DEBUG.:RP,144:P144_ID:&P5_ID.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-edit'
,p_is_hot=>true
,p_show_as_disabled=>false
,p_condition_type=>'EXISTS'
,p_condition_expr1=>'select 1 from sp_team_members where email = lower(:APP_USER) and id = :P5_ID'
,p_exec_cond_for_each_row=>true
,p_authorization_scheme=>wwv_flow_imp.id(149556930485430434424)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(19998555850605709173)
,p_region_id=>wwv_flow_imp.id(19998555550026709170)
,p_position_id=>362316004162771045
,p_display_sequence=>20
,p_template_id=>362317865359806322
,p_label=>'Actions'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(25452407840456548542)
,p_region_id=>wwv_flow_imp.id(25452405845709548522)
,p_position_id=>348722977165395441
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:&FRIENDLY_IDENTIFIER.,&PROJECT_URL_NAME.'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(25452408004151548543)
,p_region_id=>wwv_flow_imp.id(25452405845709548522)
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
 p_id=>wwv_flow_imp.id(13102716541467650115)
,p_component_action_id=>wwv_flow_imp.id(19998555850605709173)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Manage User Access'
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:10012:&SESSION.:FROMPERSON:&DEBUG.:RP,10012:P10012_USER_NAME:&P5_EMAIL.'
,p_icon_css_classes=>'fa-lock'
,p_authorization_scheme=>wwv_flow_imp.id(149556930433130434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(13102716699594650116)
,p_component_action_id=>wwv_flow_imp.id(19998555850605709173)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit (Admin)'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP,20:P20_ID:&P5_ID.'
,p_icon_css_classes=>'fa-edit'
,p_authorization_scheme=>wwv_flow_imp.id(149556930433130434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(15214049399472774726)
,p_component_action_id=>wwv_flow_imp.id(19998555850605709173)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>50
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(15856450869817749238)
,p_component_action_id=>wwv_flow_imp.id(19998555850605709173)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>60
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_ID:&P5_ID.'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(19998556556512709180)
,p_component_action_id=>wwv_flow_imp.id(19998555850605709173)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>70
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(24929236730929914204)
,p_component_action_id=>wwv_flow_imp.id(19998555850605709173)
,p_menu_entry_type=>'ENTRY'
,p_label=>'My Quick Look'
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_TEAM_MEMBER_ID:&APP_USER_ID.'
,p_icon_css_classes=>'fa-user'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(25452408066636548544)
,p_component_action_id=>wwv_flow_imp.id(25452408004151548543)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit Activity'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101:P101_ID:&ID.'
,p_icon_css_classes=>'fa-edit'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(25534520565491045613)
,p_component_action_id=>wwv_flow_imp.id(25452408004151548543)
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
