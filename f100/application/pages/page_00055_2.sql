prompt --application/pages/page_00055
begin
--   Manifest
--     PAGE: 00055
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
 p_id=>55
,p_name=>'Project Contributors'
,p_alias=>'PROJECT-CONTRIBUTORS'
,p_step_title=>'&NOMENCLATURE_PROJECT. Contributors'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.no-item-ui {',
'    --a-field-input-border-width: 0;',
'    --a-field-input-background-color: transparent;',
'}',
'.overline {',
'  color: var(--ut-region-text-color,var(--ut-component-text-default-color));',
'}',
'',
'.a-FS-facetsDashboard {--a-fs-chart-grid-gap: 0;',
'       --a-fs-chart-border-width: 0;',
'       --a-fs-chart-shadow: none;',
'}',
''))
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11452313819023818991)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11452314453028818993)
,p_name=>'Search Results'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select x.*, case when release_link is not null',
'                 then ''<a href="''||release_link||''">''||release||''</a>''',
'                 else release',
'                 end release_display',
'  from',
' (',
'select tm.first_name||'' ''||tm.last_name name, ',
'       r.resource_type, ',
'       p.project, ',
'       p.id project_id, ',
'       i.INITIATIVE,',
'       (select f.area from sp_areas f where f.id = i.area_id) area,',
'       p.INITIATIVE_ID,',
'       tm.id person_id,',
'       p.tags,',
'       p.RELEASE_ID,',
'       pc.id,',
'       p.updated,',
'       to_char(p.updated,''YYYY.MM'') updated_month,',
'       p.friendly_identifier friendly_identifier1,',
'       p.project_url_name,',
'       decode(',
'           p.RELEASE_DEPENDENT_YN,',
'           ''Y'',',
'           (select t.release_train||'' ''||t.release from SP_RELEASE_TRAINS t where t.id = p.release_id),',
'           decode(',
'               to_char(p.target_complete,''DD-MON-YYYY''),',
'               null,',
'               ''Not Targeted'',',
'               to_char(p.target_complete,''MON-YYYY'')',
'               ))  release,',
'       case when p.RELEASE_DEPENDENT_YN = ''Y''',
'            then APEX_PAGE.GET_URL (',
'                     p_page   => 117,',
'                     p_items  => ''P117_RELEASE_ID'',',
'                     p_values => p.release_id ) ',
'            end release_link,',
'       p.PROJECT_SIZE,',
'       ''P''||nvl(to_char(pp.PRIORITY),''X'') PRIORITY,',
'       decode(p.pct_complete,',
'           0,''Abandoned - 0%'',',
'           90,''Substantially Complete - 90%'',',
'           100,''Completed - 100%'',',
'           10,''Contemplating 10%-20%'',',
'           20,''Contemplating 10%-20%'',',
'           ''Actioning 30%-80%'') completed,',
'       decode(p.pct_complete,',
'           0,''Abandoned'',',
'           90,''Substantially Complete'',',
'           100,''Completed'',',
'           10,''Contemplating'',',
'           20,''Contemplating'',',
'           ''Actioning'') completed_label,',
'       to_char(p.PCT_COMPLETE)||''%'' PCT_COMPLETE',
'from SP_PROJECT_CONTRIBUTORS pc,',
'     SP_TEAM_MEMBERS tm,',
'     SP_PROJECTS p,',
'     SP_RESOURCE_TYPES r,',
'     SP_INITIATIVES i,',
'     SP_PROJECT_PRIORITIES pp',
'where pc.TEAM_MEMBER_ID = tm.id and',
'      pc.PROJECT_ID = p.id and',
'      p.INITIATIVE_ID = i.id and',
'      pc.RESPONSIBILITY_ID  = r.id and',
'      p.PRIORITY_ID = pp.id(+)',
' ) x',
' order by updated desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>100000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452320113349819002)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Contributor'
,p_column_link=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:73:P73_TEAM_MEMBER_ID:#PERSON_ID#'
,p_column_linktext=>'#NAME#<br /><small class="overline"><font color="#023020"></font>#RESOURCE_TYPE#</small>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452320447849819003)
,p_query_column_id=>2
,p_column_alias=>'RESOURCE_TYPE'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452320907477819003)
,p_query_column_id=>3
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>10
,p_column_heading=>'&NOMENCLATURE_PROJECT.'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:FI,PN:#FRIENDLY_IDENTIFIER1#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#<br /><small class="overline"><font color="#023020"></font>#AREA# / #INITIATIVE# </small>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452321251347819003)
,p_query_column_id=>4
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452321704584819004)
,p_query_column_id=>5
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452322084396819004)
,p_query_column_id=>6
,p_column_alias=>'AREA'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452322514334819004)
,p_query_column_id=>7
,p_column_alias=>'INITIATIVE_ID'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452322935506819005)
,p_query_column_id=>8
,p_column_alias=>'PERSON_ID'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452323317248819005)
,p_query_column_id=>9
,p_column_alias=>'TAGS'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452323674358819006)
,p_query_column_id=>10
,p_column_alias=>'RELEASE_ID'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452324073220819006)
,p_query_column_id=>11
,p_column_alias=>'ID'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452324538177819007)
,p_query_column_id=>12
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>50
,p_column_heading=>'Updated'
,p_column_format=>'SINCE_SHORT'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452324912733819007)
,p_query_column_id=>13
,p_column_alias=>'UPDATED_MONTH'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452325283453819007)
,p_query_column_id=>14
,p_column_alias=>'FRIENDLY_IDENTIFIER1'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452325697870819008)
,p_query_column_id=>15
,p_column_alias=>'PROJECT_URL_NAME'
,p_column_display_sequence=>180
,p_default_sort_column_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452326077440819008)
,p_query_column_id=>16
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439080849527817832)
,p_query_column_id=>17
,p_column_alias=>'RELEASE_LINK'
,p_column_display_sequence=>240
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452326498548819008)
,p_query_column_id=>18
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>190
,p_default_sort_column_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452326849092819008)
,p_query_column_id=>19
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>200
,p_default_sort_column_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452327287863819009)
,p_query_column_id=>20
,p_column_alias=>'COMPLETED'
,p_column_display_sequence=>210
,p_default_sort_column_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452327706298819009)
,p_query_column_id=>21
,p_column_alias=>'COMPLETED_LABEL'
,p_column_display_sequence=>220
,p_default_sort_column_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11452328061327819009)
,p_query_column_id=>22
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>230
,p_default_sort_column_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11439081098887817834)
,p_query_column_id=>23
,p_column_alias=>'RELEASE_DISPLAY'
,p_column_display_sequence=>30
,p_column_heading=>'Release'
,p_column_html_expression=>'#RELEASE_DISPLAY#<br /><small class="overline"><font color="#023020"></font>#PROJECT_SIZE# - #COMPLETED_LABEL# #PCT_COMPLETE# #PRIORITY#</small>'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11452314585045818993)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(11452314453028818993)
,p_landmark_label=>'Filters'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'current_facets_selector', '#active_facets',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'E',
  'show_total_row_count', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11452318960201818998)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>'<div id="active_facets"></div>'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11452319467683818999)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11452318960201818998)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:55:&APP_SESSION.::&DEBUG.:RR,55::'
,p_icon_css_classes=>'fa-undo'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11439080155174817825)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11452313819023818991)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11439080108214817824)
,p_name=>'P55_RELEASE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11452314585045818993)
,p_prompt=>'Release'
,p_source=>'RELEASE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11452315124152818995)
,p_name=>'P55_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11452314585045818993)
,p_prompt=>'Search'
,p_source=>'NAME,RESOURCE_TYPE,PROJECT,INITIATIVE,AREA,TAGS,UPDATED_MONTH,FRIENDLY_IDENTIFIER1,PROJECT_URL_NAME,RELEASE,PROJECT_SIZE,PRIORITY,COMPLETED,COMPLETED_LABEL,PCT_COMPLETE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'collapsed_search_field', 'N',
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_collapsible=>false
,p_fc_initial_collapsed=>false
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11452315514120818995)
,p_name=>'P55_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11452314585045818993)
,p_prompt=>'Contributor'
,p_source=>'NAME'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11452315923248818996)
,p_name=>'P55_RESOURCE_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11452314585045818993)
,p_prompt=>'Responsibility'
,p_source=>'RESOURCE_TYPE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11452316303749818996)
,p_name=>'P55_PROJECT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11452314585045818993)
,p_prompt=>'&NOMENCLATURE_PROJECT.'
,p_source=>'PROJECT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11452316730374818996)
,p_name=>'P55_INITIATIVE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11452314585045818993)
,p_prompt=>'&NOMENCLATURE_INITIATIVE.'
,p_source=>'INITIATIVE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11452317131430818997)
,p_name=>'P55_AREA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11452314585045818993)
,p_prompt=>'&NOMENCLATURE_AREA.'
,p_source=>'AREA'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11452317517581818997)
,p_name=>'P55_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11452314585045818993)
,p_prompt=>'&NOMENCLATURE_PROJECT. Tags'
,p_source=>'TAGS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
,p_multi_value_trim_space=>true
,p_fc_filter_combination=>'OR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11452317883719818997)
,p_name=>'P55_UPDATED_MONTH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11452314585045818993)
,p_prompt=>'Updated'
,p_source=>'UPDATED_MONTH'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11452318275036818998)
,p_name=>'P55_PRIORITY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(11452314585045818993)
,p_prompt=>'Priority'
,p_source=>'PRIORITY'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11452318719251818998)
,p_name=>'P55_COMPLETED'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11452314585045818993)
,p_prompt=>'Completed'
,p_source=>'COMPLETED'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp.component_end;
end;
/
