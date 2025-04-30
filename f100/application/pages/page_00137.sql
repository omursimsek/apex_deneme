prompt --application/pages/page_00137
begin
--   Manifest
--     PAGE: 00137
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
 p_id=>137
,p_name=>'App Recent Activity'
,p_alias=>'APP-RECENT-ACTIVITY'
,p_page_mode=>'MODAL'
,p_step_title=>'App Recent Activity'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13732073317964739601)
,p_plug_name=>'Filter'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>2
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15519286114957089700)
,p_name=>'App Recent Activity (24 hours)'
,p_template=>4501440665235496320
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--horizontalBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    USERID_LC username,',
'    count(distinct l.step_id) ditinct_pages_viewed,',
'    min(elap)            min_elapsed,',
'    max(elap)            max_elapsed,',
'    median(elap)         median_elapsed,',
'    count(*)             events,',
'    min(time_stamp)      first_event,',
'    max(time_stamp)      most_recent_event',
'from apex_activity_log l',
'where flow_id = :app_id',
'    and userid is not null',
'    and time_stamp > sysdate - nvl(:P137_DAYS,1) and',
'    userid_lc != ''nobody''',
'group by USERID_LC'))
,p_header=>'<p>Application activity in the last 24 hours.</p>'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13137057989160663170)
,p_query_column_id=>1
,p_column_alias=>'USERNAME'
,p_column_display_sequence=>10
,p_column_heading=>'Username'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13137055607979663166)
,p_query_column_id=>2
,p_column_alias=>'DITINCT_PAGES_VIEWED'
,p_column_display_sequence=>30
,p_column_heading=>'Ditinct Pages Viewed'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13137055967319663167)
,p_query_column_id=>3
,p_column_alias=>'MIN_ELAPSED'
,p_column_display_sequence=>50
,p_column_heading=>'Min Elapsed'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13137056355244663167)
,p_query_column_id=>4
,p_column_alias=>'MAX_ELAPSED'
,p_column_display_sequence=>60
,p_column_heading=>'Max Elapsed'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13137058428305663170)
,p_query_column_id=>5
,p_column_alias=>'MEDIAN_ELAPSED'
,p_column_display_sequence=>40
,p_column_heading=>'Median Elapsed'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13137056801674663168)
,p_query_column_id=>6
,p_column_alias=>'EVENTS'
,p_column_display_sequence=>20
,p_column_heading=>'Events'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13137057192432663168)
,p_query_column_id=>7
,p_column_alias=>'FIRST_EVENT'
,p_column_display_sequence=>70
,p_column_heading=>'First Event'
,p_column_format=>'SINCE_SHORT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13137057611056663169)
,p_query_column_id=>8
,p_column_alias=>'MOST_RECENT_EVENT'
,p_column_display_sequence=>80
,p_column_heading=>'Most Recent Event'
,p_column_format=>'SINCE_SHORT'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_default_sort_dir=>'desc'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13732073394230739602)
,p_name=>'P137_DAYS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13732073317964739601)
,p_prompt=>'Days'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:1 day;1,2 days;2,3 days;3,7 days;7,2 weeks;14,4 weeks;28'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(13732073517724739603)
,p_computation_sequence=>10
,p_computation_item=>'P137_DAYS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'1'
,p_compute_when=>'P137_DAYS'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13732073623596739604)
,p_name=>'on change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P137_DAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13732073735817739605)
,p_event_id=>wwv_flow_imp.id(13732073623596739604)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P137_DAYS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13732073786066739606)
,p_event_id=>wwv_flow_imp.id(13732073623596739604)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(15519286114957089700)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
