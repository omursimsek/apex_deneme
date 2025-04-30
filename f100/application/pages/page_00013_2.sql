prompt --application/pages/page_00013
begin
--   Manifest
--     PAGE: 00013
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
 p_id=>13
,p_name=>'Initiative Document'
,p_alias=>'INITIATIVE-DOCUMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Initiative Document'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401344032431234424)
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(149556930589415434424)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(141310241227351557402)
,p_plug_name=>'Document'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SP_INITIATIVE_DOCUMENTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(141310250591067557408)
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
 p_id=>wwv_flow_imp.id(26268074983517819701)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(141310250591067557408)
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
 p_id=>wwv_flow_imp.id(26268075399367819701)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(141310250591067557408)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P13_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(26268074180743819700)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(141310250591067557408)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P13_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(26268074634132819701)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(141310250591067557408)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Document'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P13_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25160228093145885931)
,p_name=>'P13_ROW_VERSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_source=>'ROW_VERSION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25160228206629885932)
,p_name=>'P13_INITIATIVE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_source=>'INITIATIVE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25160228396082885934)
,p_name=>'P13_IMPORTANT_YN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_default=>'N'
,p_prompt=>'Important'
,p_source=>'IMPORTANT_YN'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25160228521509885935)
,p_name=>'P13_CREATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_source=>'CREATED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25160228544859885936)
,p_name=>'P13_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_source=>'CREATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25160228735211885937)
,p_name=>'P13_UPDATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_source=>'UPDATED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(25160228788537885938)
,p_name=>'P13_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_source=>'UPDATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(38173824114256567308)
,p_name=>'P13_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(58942343795714611518)
,p_name=>'P13_DOC_DESCRIPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_prompt=>'Description'
,p_source=>'DOC_DESCRIPTION'
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
 p_id=>wwv_flow_imp.id(141310242158790557405)
,p_name=>'P13_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(141310243342880557407)
,p_name=>'P13_DOCUMENT_BLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_prompt=>'Document'
,p_source=>'DOCUMENT_BLOB'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>60
,p_cMaxlength=>255
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'blob_last_updated_column', 'DOCUMENT_LASTUPD',
  'character_set_column', 'DOCUMENT_CHARSET',
  'content_disposition', 'attachment',
  'display_as', 'DROPZONE_INLINE',
  'display_download_link', 'Y',
  'filename_column', 'DOCUMENT_FILENAME',
  'mime_type_column', 'DOCUMENT_MIMETYPE',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(141310243722911557407)
,p_name=>'P13_DOCUMENT_FILENAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_source=>'DOCUMENT_FILENAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(141310244181607557407)
,p_name=>'P13_DOCUMENT_MIMETYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_source=>'DOCUMENT_MIMETYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(141310244523295557408)
,p_name=>'P13_DOCUMENT_CHARSET'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_source=>'DOCUMENT_CHARSET'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(141310244928992557408)
,p_name=>'P13_DOCUMENT_LASTUPD'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_item_source_plug_id=>wwv_flow_imp.id(141310241227351557402)
,p_source=>'DOCUMENT_LASTUPD'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(26268076766922819702)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(26268074983517819701)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26268077269767819703)
,p_event_id=>wwv_flow_imp.id(26268076766922819702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26268073531863819700)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(141310241227351557402)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Document'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>16034019190717315300
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26268076368124819702)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>16034022026978315302
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26268073095001819699)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(141310241227351557402)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Document'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>16034018753855315299
);
wwv_flow_imp.component_end;
end;
/
