prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Release Gantt'
,p_alias=>'RELEASE_GANTT'
,p_step_title=>'Release Gantt'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18408991141620412394)
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'04'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(42078640477577024833)
,p_plug_name=>'Release_train'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(73983450407935722346)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(76599630951892319935)
,p_plug_name=>'Releases'
,p_region_name=>'gantt'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(42132340525954477884)
,p_region_id=>wwv_flow_imp.id(76599630951892319935)
,p_chart_type=>'gantt'
,p_height=>'600'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>false
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>false
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'visible'
,p_vertical_grid=>'visible'
,p_row_axis_rendered=>'on'
,p_gantt_axis_position=>'top'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'',
'    var event = new Date();',
'    // Define Reference Object line on the chart',
'    var constantLine = [ { value: event.toISOString() } ];',
'    ',
'    // Set the referenceObjects option as part of the chart initialization',
'    options.referenceObjects = constantLine;',
'    ',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(42132342184230477885)
,p_chart_id=>wwv_flow_imp.id(42132340525954477884)
,p_seq=>10
,p_name=>'Tasks'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select release_train || '' '' ||release    task_name,',
'       id                                task_id,',
'       RELEASE_OPEN_DATE                 task_start_date,',
'       RELEASE_TARGET_DATE               task_end_date,',
'       decode(release,''22.1'',1,''22.2'',.9,''21.1'',.1,0)  status, -- percent complete',
'       (select min(RELEASE_OPEN_DATE) -5 from SP_RELEASE_TRAINS where release_train = :P16_RELEASE_TRAIN ) gantt_start_date,',
'       (select max(RELEASE_TARGET_DATE) from SP_RELEASE_TRAINS where release_train = :P16_RELEASE_TRAIN)  gantt_end_date',
'  from SP_RELEASE_TRAINS',
'where release_train = :P16_RELEASE_TRAIN',
'order by id asc'))
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_gantt_start_date_source=>'DB_COLUMN'
,p_gantt_start_date_column=>'GANTT_START_DATE'
,p_gantt_end_date_source=>'DB_COLUMN'
,p_gantt_end_date_column=>'GANTT_END_DATE'
,p_gantt_row_name=>'TASK_NAME'
,p_gantt_task_id=>'TASK_ID'
,p_gantt_task_name=>'TASK_NAME'
,p_gantt_task_start_date=>'TASK_START_DATE'
,p_gantt_task_end_date=>'TASK_END_DATE'
,p_gantt_progress_column=>'STATUS'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(42132341036283477884)
,p_chart_id=>wwv_flow_imp.id(42132340525954477884)
,p_static_id=>'release_gaant'
,p_axis=>'major'
,p_is_rendered=>'on'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_axis_scale=>'years'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>true
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(42132341587150477884)
,p_chart_id=>wwv_flow_imp.id(42132340525954477884)
,p_axis=>'minor'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_axis_scale=>'quarters'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>true
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(42078640123013024829)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(73983450407935722346)
,p_button_name=>'edit_releases'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Release Details'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RR,8::'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14817151036146211500)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(73983450407935722346)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42078640554798024834)
,p_name=>'P16_RELEASE_TRAIN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(42078640477577024833)
,p_prompt=>'Release Train'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct release_train d, release_train r',
'from SP_RELEASE_TRAINS',
'order by 1'))
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(42078641010893024838)
,p_computation_sequence=>10
,p_computation_item=>'P16_RELEASE_TRAIN'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select min(release_train) rt ',
'    from SP_RELEASE_TRAINS'))
,p_compute_when=>'P16_RELEASE_TRAIN'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(42078640652439024835)
,p_name=>'rt change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16_RELEASE_TRAIN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42078640770171024836)
,p_event_id=>wwv_flow_imp.id(42078640652439024835)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
);
wwv_flow_imp.component_end;
end;
/
