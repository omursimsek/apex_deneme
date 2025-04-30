prompt --application/pages/page_11310
begin
--   Manifest
--     PAGE: 11310
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
 p_id=>11310
,p_name=>'Archived project'
,p_alias=>'ARCHIVED-PROJECT'
,p_page_mode=>'MODAL'
,p_step_title=>'Archived &NOMENCLATURE_PROJECT.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(21590763575045163414)
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(149556930433130434424)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22051747752845949801)
,p_plug_name=>'Archived &NOMENCLATURE_PROJECT.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SP_PROJECTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22051767670174949839)
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
 p_id=>wwv_flow_imp.id(22051768097995949839)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22051767670174949839)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22051769502516949844)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22051767670174949839)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P11310_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22051748091520949802)
,p_name=>'P11310_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22051747752845949801)
,p_item_source_plug_id=>wwv_flow_imp.id(22051747752845949801)
,p_prompt=>'ID'
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22051748859501949814)
,p_name=>'P11310_PROJECT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(22051747752845949801)
,p_item_source_plug_id=>wwv_flow_imp.id(22051747752845949801)
,p_prompt=>'Project'
,p_source=>'PROJECT'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22051755723040949825)
,p_name=>'P11310_CREATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(22051747752845949801)
,p_item_source_plug_id=>wwv_flow_imp.id(22051747752845949801)
,p_prompt=>'Created'
,p_source=>'CREATED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22051756128235949825)
,p_name=>'P11310_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(22051747752845949801)
,p_item_source_plug_id=>wwv_flow_imp.id(22051747752845949801)
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22051756450046949826)
,p_name=>'P11310_UPDATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(22051747752845949801)
,p_item_source_plug_id=>wwv_flow_imp.id(22051747752845949801)
,p_prompt=>'Updated'
,p_source=>'UPDATED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22051756914371949827)
,p_name=>'P11310_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(22051747752845949801)
,p_item_source_plug_id=>wwv_flow_imp.id(22051747752845949801)
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(22051768152185949839)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(22051768097995949839)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(22051769004647949842)
,p_event_id=>wwv_flow_imp.id(22051768152185949839)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(23828520297099297737)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'remove log rows'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from SP_PROJ_INTERACTIONS_LOG',
' where project_id = :P11310_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(22051769502516949844)
,p_internal_uid=>13594465955952793337
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25160227166490885922)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'remove dependent data (to avoid project_history table trigger mutation)'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in (',
'    select id',
'      from sp_tasks',
'     where project_id = :P11310_ID',
') loop',
'    delete from sp_task_comments',
'     where task_id = c1.id;',
'',
'    delete from sp_task_documents',
'     where task_id = c1.id;',
'',
'    delete from sp_task_links',
'     where task_id = c1.id;',
'',
'    delete from sp_task_history',
'     where task_id = c1.id;',
'end loop;',
'',
'delete from SP_TASKS',
' where project_id = :P11310_ID;',
'',
'delete from sp_project_comments',
' where project_id = :P11310_ID;',
'',
'delete from SP_PROJECT_DOCUMENTS',
' where project_id = :P11310_ID;',
'',
'delete from SP_PROJECT_LINKS',
' where project_id = :P11310_ID;',
'',
'delete from SP_PROJECT_RELATED',
' where project_id = :P11310_ID',
'    or related_project_id = :P11310_ID;',
'',
'delete from SP_PROJECT_HISTORY',
' where project_id = :P11310_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(22051769502516949844)
,p_internal_uid=>14926172825344381522
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22051771084752949846)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(22051747752845949801)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form &NOMENCLATURE_PROJECT.'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed'
,p_internal_uid=>11817716743606445446
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22051771457632949847)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>11817717116486445447
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(22051770738630949845)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(22051747752845949801)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form &NOMENCLATURE_PROJECT.'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>11817716397484445445
);
wwv_flow_imp.component_end;
end;
/
