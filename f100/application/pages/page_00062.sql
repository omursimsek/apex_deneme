prompt --application/pages/page_00062
begin
--   Manifest
--     PAGE: 00062
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
 p_id=>62
,p_name=>'Initiative Images'
,p_alias=>'INITIATIVE-IMAGES'
,p_step_title=>'&P62_INITIATIVE_NAME. - Images'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401340157312233831)
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29009451840239182353)
,p_plug_name=>'Images'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select :NOMENCLATURE_INITIATIVE belongs_to,',
'       apex_util.prepare_url(''f?p=''||:APP_ID||'':53:''||:APP_SESSION||''::NO:53:P53_PREV_PAGE,P53_ID:62,''||d.id) details_link,',
'       null focus_area,',
'       d.ID,',
'       d.DOCUMENT_FILENAME,',
'       d.document_mimetype,',
'       d.document_lastupd,',
'       UPDATED,',
'       d.created,',
'       d.tags,',
'       case when length(d.doc_description) > 200',
'            then substr(d.doc_description,1,200)||''...''',
'            else d.doc_description',
'            end doc_description,',
'       d.DOCUMENT_BLOB,',
'       lower(created_by) author,',
'       dbms_lob.getlength(d.DOCUMENT_BLOB) doc_size,',
'       apex_util.get_since(created) created_since,',
'       d.created date_created,',
'       lower(substr(DOCUMENT_FILENAME,instr(DOCUMENT_FILENAME,''.'',-1)+1,length(DOCUMENT_FILENAME)-instr(DOCUMENT_FILENAME,''.'',-1))) file_extension,',
'       to_char(d.created,''YYYY.MM'') month_created',
'  from SP_INITIATIVE_DOCUMENTS d',
' where initiative_id = :P62_INITIATIVE_ID and ',
'       (',
'           lower(DOCUMENT_FILENAME) like ''%.png'' or ',
'           lower(DOCUMENT_FILENAME) like ''%.jpg'' or ',
'           lower(DOCUMENT_FILENAME) like ''%.jpeg'' or ',
'           lower(DOCUMENT_FILENAME) like ''%.gif'' or ',
'           lower(DOCUMENT_FILENAME) like ''%.tiff'' or ',
'           lower(DOCUMENT_FILENAME) like ''%.avif'' or ',
'           lower(DOCUMENT_FILENAME) like ''%.ai'' ',
'       )',
'union all',
'select ''Focus Area'' belongs_to,',
'       apex_util.prepare_url(''f?p=''||:APP_ID||'':59:''||:APP_SESSION||''::NO:59:P59_PREV_PAGE,P59_ID:62,''||d.id) details_link,',
'       ''Focus Area: ''|| t.focus_area focus_area,',
'       d.ID,',
'       d.DOCUMENT_FILENAME,',
'       d.document_mimetype,',
'       d.document_lastupd,',
'       d.UPDATED,',
'       d.created,',
'       d.tags,',
'       case when length(d.doc_description) > 200',
'            then substr(d.doc_description,1,200)||''...''',
'            else d.doc_description',
'            end doc_description,',
'       d.DOCUMENT_BLOB,',
'       lower(d.created_by) author,',
'       dbms_lob.getlength(d.DOCUMENT_BLOB) doc_size,',
'       apex_util.get_since(d.created) created_since,',
'       d.created date_created,',
'       lower(substr(d.DOCUMENT_FILENAME,instr(d.DOCUMENT_FILENAME,''.'',-1)+1,length(d.DOCUMENT_FILENAME)-instr(d.DOCUMENT_FILENAME,''.'',-1))) file_extension,',
'       to_char(d.created,''YYYY.MM'') month_created',
'  from SP_INIT_FOCUS_AREA_DOCUMENTS d,',
'       SP_INITIATIVE_FOCUS_AREAS t',
' where d.init_focus_area_id = t.id',
'   and t.initiative_id = :P62_INITIATIVE_ID and ',
'       (',
'           lower(d.DOCUMENT_FILENAME) like ''%.png'' or ',
'           lower(d.DOCUMENT_FILENAME) like ''%.jpg'' or ',
'           lower(d.DOCUMENT_FILENAME) like ''%.jpeg'' or ',
'           lower(d.DOCUMENT_FILENAME) like ''%.gif'' or ',
'           lower(d.DOCUMENT_FILENAME) like ''%.tiff'' or ',
'           lower(d.DOCUMENT_FILENAME) like ''%.ai'' ',
'       )',
'order by created desc',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P62_INITIATIVE_ID'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(27763381060670983556)
,p_region_id=>wwv_flow_imp.id(29009451840239182353)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'DOCUMENT_FILENAME'
,p_sub_title_adv_formatting=>true
,p_sub_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if FOCUS_AREA/}&FOCUS_AREA.<br/>{endif/}',
'&AUTHOR. - &CREATED_SINCE.'))
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>'&DOC_DESCRIPTION.'
,p_media_adv_formatting=>false
,p_media_source_type=>'BLOB'
,p_media_blob_column_name=>'DOCUMENT_BLOB'
,p_media_display_position=>'BODY'
,p_media_sizing=>'FIT'
,p_pk1_column_name=>'ID'
,p_mime_type_column_name=>'DOCUMENT_MIMETYPE'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(27763381574633983557)
,p_card_id=>wwv_flow_imp.id(27763381060670983556)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_URL'
,p_link_target=>'&DETAILS_LINK.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29009452481928182359)
,p_plug_name=>'Facets'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(29009451840239182353)
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29876404168508623118)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(63907524646461583897)
,p_name=>'details'
,p_template=>4501440665235496320
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked:t-Report--hideNoPagination'
,p_display_point=>'REGION_POSITION_01'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select f.area focus_area, ',
'       i.initiative, ',
'       --',
'       -- owner',
'       --',
'       (select first_name||'' ''||last_name ',
'        from sp_team_members tm ',
'        where tm.id = i.SPONSOR_ID) the_owner,',
'       --',
'       i.sponsor_id owner_id,',
'       --',
'       i.updated,',
'       --',
'       i.id,',
'       dbms_lob.getlength(i.image) as image,',
'       i.image_name,',
'       i.image_mimetype,',
'       i.image_last_updated',
'',
'  from SP_INITIATIVES i,',
'       SP_AREAS f',
'where i.area_id = f.id and',
'      i.id = :P62_INITIATIVE_ID',
'',
'     '))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P62_INITIATIVE_ID'
,p_lazy_loading=>false
,p_query_row_template=>2115772683903439354
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27763834027479053020)
,p_query_column_id=>1
,p_column_alias=>'FOCUS_AREA'
,p_column_display_sequence=>20
,p_column_heading=>'&NOMENCLATURE_AREA.'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_FOCUS_AREA:#FOCUS_AREA#'
,p_column_linktext=>'#FOCUS_AREA#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27763834343939053020)
,p_query_column_id=>2
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>30
,p_column_heading=>'&NOMENCLATURE_INITIATIVE.'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27763835548714053021)
,p_query_column_id=>3
,p_column_alias=>'THE_OWNER'
,p_column_display_sequence=>90
,p_column_heading=>'Owner'
,p_column_link=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_TEAM_MEMBER_ID:#OWNER_ID#'
,p_column_linktext=>'#THE_OWNER#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27763835994469053022)
,p_query_column_id=>4
,p_column_alias=>'OWNER_ID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27763837141267053023)
,p_query_column_id=>5
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>100
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27763837583330053023)
,p_query_column_id=>6
,p_column_alias=>'ID'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27763838036919053024)
,p_query_column_id=>7
,p_column_alias=>'IMAGE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27763838376192053024)
,p_query_column_id=>8
,p_column_alias=>'IMAGE_NAME'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27763838811683053024)
,p_query_column_id=>9
,p_column_alias=>'IMAGE_MIMETYPE'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27763839227923053025)
,p_query_column_id=>10
,p_column_alias=>'IMAGE_LAST_UPDATED'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27763379665837983553)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(29876404168508623118)
,p_button_name=>'add_document'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Add Document'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RR,13:P13_INITIATIVE_ID:&P62_INITIATIVE_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27763379318690983552)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(29876404168508623118)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:94:P94_INITIATIVE_ID:&P62_INITIATIVE_ID.'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29009455728854182366)
,p_name=>'P62_INITIATIVE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(29009451840239182353)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29009455928333182368)
,p_name=>'P62_INITIATIVE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(29009451840239182353)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29009457257602182374)
,p_name=>'P62_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(29009452481928182359)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29009457404606182375)
,p_name=>'P62_FILE_EXTENSION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(29009452481928182359)
,p_prompt=>'File Extension'
,p_source=>'FILE_EXTENSION'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29009457480009182376)
,p_name=>'P62_AUTHOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(29009452481928182359)
,p_prompt=>'Contributor'
,p_source=>'AUTHOR'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(29009457624081182377)
,p_name=>'P62_MONTH_CREATED'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(29009452481928182359)
,p_prompt=>'Month Created'
,p_source=>'MONTH_CREATED'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(39669140960446731177)
,p_name=>'P62_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(29009452481928182359)
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
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
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
,p_multi_value_trim_space=>true
,p_fc_filter_combination=>'OR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(44797084152633402893)
,p_name=>'P62_BELONGS_TO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(29009452481928182359)
,p_prompt=>'Belongs To'
,p_source=>'BELONGS_TO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'D'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(27763393979092983574)
,p_computation_sequence=>10
,p_computation_item=>'P62_INITIATIVE_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select initiative from sp_initiatives where id = :P62_INITIATIVE_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27763395211546983575)
,p_name=>'DC'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(29876404168508623118)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27763395696296983576)
,p_event_id=>wwv_flow_imp.id(27763395211546983575)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(29009451840239182353)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
