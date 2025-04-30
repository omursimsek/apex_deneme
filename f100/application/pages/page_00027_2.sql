prompt --application/pages/page_00027
begin
--   Manifest
--     PAGE: 00027
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
 p_id=>27
,p_name=>'Release'
,p_alias=>'RELEASE'
,p_page_mode=>'MODAL'
,p_step_title=>'Release'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18408991141620412394)
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(149556930589415434424)
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(42149655687880449705)
,p_plug_name=>'Release'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SP_RELEASE_TRAINS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(42149662955527449738)
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
 p_id=>wwv_flow_imp.id(42149663352315449738)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(42149662955527449738)
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
 p_id=>wwv_flow_imp.id(42149665288002449744)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(42149662955527449738)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P27_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(42149665682246449745)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(42149662955527449738)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P27_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(14697777695029867048)
,p_branch_name=>'Go To Page 8'
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:27::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11652228690896405917)
,p_name=>'P27_RELEASE_MANAGEMENT_URL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_source_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_prompt=>'URL'
,p_source=>'RELEASE_MANAGEMENT_URL'
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
 p_id=>wwv_flow_imp.id(13138134092627609239)
,p_name=>'P27_RELEASE_OPEN_COMPLETED'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_source_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_default=>'N'
,p_prompt=>'Release Open Completed'
,p_source=>'RELEASE_OPEN_COMPLETED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13138134337783609241)
,p_name=>'P27_RELEASE_COMPLETED'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_source_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_default=>'N'
,p_prompt=>'Release Completed'
,p_source=>'RELEASE_COMPLETED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14306925736674272717)
,p_name=>'P27_PRODUCT_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>'select ''APEX'' d, ''APEX'' r from dual'
,p_cSize=>32
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26540070164842957801)
,p_name=>'P27_RELEASE_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_source_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_default=>'FULL'
,p_prompt=>'Release Type'
,p_source=>'RELEASE_TYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Full;FULL,Patch;PATCH'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31870178324063298332)
,p_name=>'P27_DESCRIPTION'
,p_source_data_type=>'CLOB'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_source_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_prompt=>'Description'
,p_source=>'DESCRIPTION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'N',
  'format', 'MARKDOWN',
  'min_height', '180')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42149656011443449707)
,p_name=>'P27_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_source_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42149656374454449721)
,p_name=>'P27_RELEASE_TRAIN'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_source_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_prompt=>'Release Train'
,p_source=>'RELEASE_TRAIN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>50
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42149656774940449722)
,p_name=>'P27_RELEASE_OWNER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_source_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_prompt=>'Owner'
,p_source=>'RELEASE_OWNER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_name||'', ''||first_name||'' (''||lower(email)||'')'' d, id r',
'  from SP_TEAM_MEMBERS',
' where is_current_yn = ''Y''',
'    or id = :P27_RELEASE_OWNER_ID',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- No Owner -'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42149657161479449725)
,p_name=>'P27_RELEASE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_source_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_prompt=>'Release'
,p_source=>'RELEASE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42149657605968449726)
,p_name=>'P27_RELEASE_TARGET_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_source_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_prompt=>'Release Target Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'RELEASE_TARGET_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42149658028413449726)
,p_name=>'P27_RELEASE_OPEN_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_item_source_plug_id=>wwv_flow_imp.id(42149655687880449705)
,p_prompt=>'Release Open Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'RELEASE_OPEN_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(21735767271108555326)
,p_validation_name=>'Cannot close if never opened'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(nvl(:P27_RELEASE_OPEN_COMPLETED,''N'') = ''N'' and',
' nvl(:P27_RELEASE_COMPLETED,''N'') = ''N'')',
'or',
'nvl(:P27_RELEASE_OPEN_COMPLETED,''N'') = ''Y'''))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Cannot mark as complete because never marked as opened.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(42149663500573449738)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(42149663352315449738)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42149664388866449743)
,p_event_id=>wwv_flow_imp.id(42149663500573449738)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(42149666492218449747)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(42149655687880449705)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Release'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed'
,p_internal_uid=>31915612151071945347
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(42149666914311449747)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>31915612573164945347
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(42149666093938449746)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(42149655687880449705)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Release'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>31915611752791945346
);
wwv_flow_imp.component_end;
end;
/
