prompt --application/pages/page_00022
begin
--   Manifest
--     PAGE: 00022
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
 p_id=>22
,p_name=>'Initiative'
,p_alias=>'INITIATIVE-EDIT'
,p_page_mode=>'MODAL'
,p_step_title=>'&NOMENCLATURE_INITIATIVE.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401340157312233831)
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(149556930589415434424)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15037236865156310708)
,p_plug_name=>'Advanced'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>30
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(13381496198165937014)
,p_name=>'Status Scale'
,p_parent_plug_id=>wwv_flow_imp.id(15037236865156310708)
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''0%'' pct_complete, pc0_label project_status, pc0_desc description, :P22_STATUS_SCALE selected_scale,',
'       0 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P22_STATUS_SCALE,''A'')',
'union all',
'select ''10%'' pct_complete, pc10_label, pc10_desc, :P22_STATUS_SCALE selected_scale,',
'       10 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P22_STATUS_SCALE,''A'')',
'union all',
'select ''20%'' pct_complete, pc20_label, pc20_desc, :P22_STATUS_SCALE selected_scale,',
'       20 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P22_STATUS_SCALE,''A'')',
'union all',
'select ''30%'' pct_complete, pc30_label, pc30_desc, :P22_STATUS_SCALE selected_scale,',
'       30 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P22_STATUS_SCALE,''A'')',
'union all',
'select ''40%'' pct_complete, pc40_label, pc40_desc, :P22_STATUS_SCALE selected_scale,',
'       40 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P22_STATUS_SCALE,''A'')',
'union all',
'select ''50%'' pct_complete, pc50_label, pc50_desc, :P22_STATUS_SCALE selected_scale,',
'       50 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P22_STATUS_SCALE,''A'')',
'union all',
'select ''60%'' pct_complete, pc60_label, pc60_desc, :P22_STATUS_SCALE selected_scale,',
'       60 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P22_STATUS_SCALE,''A'')',
'union all',
'select ''70%'' pct_complete, pc70_label, pc70_desc, :P22_STATUS_SCALE selected_scale,',
'       70 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P22_STATUS_SCALE,''A'')',
'union all',
'select ''80%'' pct_complete, pc80_label, pc80_desc, :P22_STATUS_SCALE selected_scale,',
'       80 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P22_STATUS_SCALE,''A'')',
'union all',
'select ''90%'' pct_complete, pc90_label, pc90_desc, :P22_STATUS_SCALE selected_scale,',
'       90 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P22_STATUS_SCALE,''A'')',
'union all',
'select ''100%'' pct_complete, pc100_label, pc100_desc, :P22_STATUS_SCALE selected_scale,',
'       100 r',
'  from SP_PROJECT_SCALES s',
' where scale_letter = nvl(:P22_STATUS_SCALE,''A'')',
'order by r'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P22_STATUS_SCALE'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13381496404257937016)
,p_query_column_id=>1
,p_column_alias=>'PCT_COMPLETE'
,p_column_display_sequence=>20
,p_column_heading=>'Completeness'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13381496675425937019)
,p_query_column_id=>2
,p_column_alias=>'PROJECT_STATUS'
,p_column_display_sequence=>50
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13381496794007937020)
,p_query_column_id=>3
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>60
,p_column_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13569610320518705716)
,p_query_column_id=>4
,p_column_alias=>'SELECTED_SCALE'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15710428835410752006)
,p_query_column_id=>5
,p_column_alias=>'R'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(149592567131285349881)
,p_plug_name=>'Initiative'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SP_INITIATIVES'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(149592574042681349900)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(149592574405537349900)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(149592574042681349900)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(149592575818142349904)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(149592574042681349900)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P22_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(149592576182393349905)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(149592574042681349900)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P22_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(149592576581641349905)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(149592574042681349900)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P22_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(27131733000384351623)
,p_branch_name=>'to main initiative page after delete'
,p_branch_action=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:22,94::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(149592575818142349904)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13381497795221937030)
,p_name=>'P22_STATUS_SCALE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15037236865156310708)
,p_item_source_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_item_default=>'A'
,p_prompt=>'Default Project Type'
,p_source=>'STATUS_SCALE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select scale_name, scale_letter',
'  from sp_project_scales',
' where is_active_yn = ''Y''',
' order by scale_letter'))
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '7',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15037237505908310714)
,p_name=>'P22_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_item_source_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_COMBOBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''research'' tag from dual union all',
'select ''devops'' tag from dual union all',
'select ''review'' tag from dual',
'order by 1'))
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'max_values_in_list', '7',
  'min_chars', '0',
  'multi_selection', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15037237962908310719)
,p_name=>'P22_HIDDEN_BY_DEFAULT_YN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_item_source_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_item_default=>'N'
,p_prompt=>'Hidden By Default'
,p_source=>'HIDDEN_BY_DEFAULT_YN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>'Use this flag to reduce clutter of abandoned &NOMENCLATURE_INITIATIVES..  If an &NOMENCLATURE_INITIATIVE. is no longer in use enable this hidden by default.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17959218513361272651)
,p_name=>'P22_IMAGE'
,p_source_data_type=>'BLOB'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_item_source_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_prompt=>'Drag and Drop Icon Image here'
,p_source=>'IMAGE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_IMAGE_UPLOAD'
,p_cSize=>60
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_cropping', 'Y',
  'aspect_ratio', '1:1',
  'blob_last_updated_column', 'IMAGE_LAST_UPDATED',
  'display_as', 'DROPZONE_ICON',
  'display_download_link', 'Y',
  'download_link_text', 'Download Icon',
  'filename_column', 'IMAGE_NAME',
  'max_height', '256',
  'max_width', '256',
  'mime_type_column', 'IMAGE_MIMETYPE',
  'preview_size', 'AUTO',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22614100772931099305)
,p_name=>'P22_PRIMARY_URL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(15037236865156310708)
,p_item_source_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_prompt=>'URL'
,p_source=>'PRIMARY_URL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149592567435556349882)
,p_name=>'P22_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_item_source_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149592567758004349887)
,p_name=>'P22_FOCUS_AREA_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_item_source_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_prompt=>'&NOMENCLATURE_AREA.'
,p_source=>'AREA_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SP_AREAS.AREA'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Choose &NOMENCLATURE_AREA. -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149592568468006349893)
,p_name=>'P22_INITIATIVE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_item_source_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_prompt=>'&NOMENCLATURE_INITIATIVE.'
,p_source=>'INITIATIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>4000
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149592568881314349894)
,p_name=>'P22_OBJECTIVE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_item_source_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_prompt=>'Objective'
,p_source=>'OBJECTIVE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'Y',
  'format', 'MARKDOWN',
  'min_height', '180')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(149592569256288349894)
,p_name=>'P22_SPONSOR_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_item_source_plug_id=>wwv_flow_imp.id(149592567131285349881)
,p_prompt=>'Owner'
,p_source=>'SPONSOR_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_name||'', ''||first_name||'' (''||lower(email)||'')'' d, id r',
'  from SP_TEAM_MEMBERS',
' where is_current_yn = ''Y''',
'    or id = :P22_SPONSOR_ID',
' order by 1'))
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(27131732829554351621)
,p_validation_name=>'Can''t delete if projects'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from sp_projects',
' where initiative_id = :P22_ID'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'You cannot delete an initiative that has projects.'
,p_when_button_pressed=>wwv_flow_imp.id(149592575818142349904)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(149592574519090349900)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(149592574405537349900)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(149592575250904349903)
,p_event_id=>wwv_flow_imp.id(149592574519090349900)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13381497925505937031)
,p_name=>'refresh status scale report'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P22_STATUS_SCALE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13381498025868937032)
,p_event_id=>wwv_flow_imp.id(13381497925505937031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P22_STATUS_SCALE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13381498126777937033)
,p_event_id=>wwv_flow_imp.id(13381497925505937031)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13381496198165937014)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(149592577394389349907)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(149592567131285349881)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Initiative'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed'
,p_internal_uid=>139358523053242845507
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(149592577767321349908)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>139358523426174845508
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(149592576999140349906)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(149592567131285349881)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Initiative'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>139358522657993845506
);
wwv_flow_imp.component_end;
end;
/
