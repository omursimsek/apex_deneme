prompt --application/pages/page_00501
begin
--   Manifest
--     PAGE: 00501
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
 p_id=>501
,p_name=>'Task'
,p_alias=>'TASK'
,p_page_mode=>'MODAL'
,p_step_title=>'Task'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401344032431234424)
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(149556930589415434424)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(143387710584912337570)
,p_plug_name=>'Task'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>40
,p_query_type=>'TABLE'
,p_query_table=>'SP_TASKS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(143387719948628337576)
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
 p_id=>wwv_flow_imp.id(28345543609930599884)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(143387719948628337576)
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
 p_id=>wwv_flow_imp.id(28345543960050599885)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(143387719948628337576)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P501_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28345542796323599883)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(143387719948628337576)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P501_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28345543164767599884)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(143387719948628337576)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'NEXT'
,p_button_condition=>'P501_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11439081998186817843)
,p_name=>'P501_CHILD_COUNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20235788215032330542)
,p_name=>'P501_TASK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_prompt=>'Task'
,p_source=>'TASK'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(27131734549809351639)
,p_name=>'P501_DESCRIPTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_prompt=>'Details'
,p_source=>'DESCRIPTION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>2
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27131734705403351640)
,p_name=>'P501_TASK_TYPE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_prompt=>'Type'
,p_source=>'TASK_TYPE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select task_type d, id r',
'  from sp_task_types',
' where parent_type_id is null',
'   and (include_yn = ''Y'' or id = :P501_TASK_TYPE_ID)',
'   and static_id not like ''MILESTONE%''',
'   and static_id not like ''REVIEW%''',
' order by display_seq'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27131734809101351641)
,p_name=>'P501_TASK_SUB_TYPE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_prompt=>'Task'
,p_source=>'TASK_SUB_TYPE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select task_type d, id r',
'  from sp_task_types',
' where parent_type_id = :P501_TASK_TYPE_ID',
'   and (include_yn = ''Y'' or id = :P501_TASK_SUB_TYPE_ID)',
' order by display_seq'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P501_TASK_TYPE_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27131734867224351642)
,p_name=>'P501_OWNER_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_prompt=>'Assigned To'
,p_source=>'OWNER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_name||'', ''||first_name||'' (''||lower(email)||'')'' d, id r',
'  from SP_TEAM_MEMBERS',
' where is_current_yn = ''Y''',
'    or id = :P01_OWNER_ID',
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27131735014229351643)
,p_name=>'P501_START_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_prompt=>'Start Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'START_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(27131735139725351644)
,p_name=>'P501_TARGET_COMPLETE'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_prompt=>'Target Complete'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'TARGET_COMPLETE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'ITEM',
  'min_item', 'P501_START_DATE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27131735189240351645)
,p_name=>'P501_STATUS_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_prompt=>'Status'
,p_source=>'STATUS_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select status || case when include_yn = ''N'' ',
'                      then '' (no longer used)'' ',
'                      end d, ',
'       id r',
'  from SP_TASK_STATUSES',
' where (include_yn = ''Y'' or :P501_STATUS_ID = id)',
'   and task_type_id = :P501_TASK_TYPE_ID',
'  order by is_default_yn desc, display_seq'))
,p_lov_cascade_parent_items=>'P501_TASK_TYPE_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27131735284473351646)
,p_name=>'P501_STATUS_LAST_CHANGED_ON'
,p_source_data_type=>'DATE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_source=>'STATUS_LAST_CHANGED_ON'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27131735523050351648)
,p_name=>'P501_CREATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_source=>'CREATED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27131735574380351649)
,p_name=>'P501_CREATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_source=>'CREATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27131735649924351650)
,p_name=>'P501_UPDATED'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_source=>'UPDATED'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28345380706462316301)
,p_name=>'P501_UPDATED_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_source=>'UPDATED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(40251293433871347486)
,p_name=>'P501_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
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
 p_id=>wwv_flow_imp.id(143387711478405337583)
,p_name=>'P501_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(143387712268449337585)
,p_name=>'P501_PROJECT_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_item_source_plug_id=>wwv_flow_imp.id(143387710584912337570)
,p_prompt=>'&NOMENCLATURE_PROJECT.'
,p_source=>'PROJECT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'SP_PROJECTS.PROJECT'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(28512074731033784431)
,p_validation_name=>'when task complete, must provide date'
,p_validation_sequence=>10
,p_validation=>'P501_TARGET_COMPLETE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'When task is completed, must provide date.'
,p_validation_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from sp_task_statuses',
' where id = :P501_STATUS_ID',
'   and static_id = ''COMPLETED'''))
,p_validation_condition_type=>'EXISTS'
,p_associated_item=>wwv_flow_imp.id(27131735139725351644)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20235788246149330543)
,p_validation_name=>'if task name is required'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P501_TASK is null then',
'    for c1 in (',
'        select 1 from sp_task_types',
'         where nvl(:P501_TASK_SUB_TYPE_ID,:P501_TASK_TYPE_ID) = id',
'           and task_name_req_yn = ''Y'' )',
'    loop',
'        return FALSE;',
'    end loop;',
'end if;',
'',
'return TRUE;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Must provide a Task Name for tasks of this type.'
,p_associated_item=>wwv_flow_imp.id(20235788215032330542)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28345544977724599892)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(28345543609930599884)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28345545470001599893)
,p_event_id=>wwv_flow_imp.id(28345544977724599892)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11439081342746817837)
,p_name=>'hide sub-type when no children'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_TASK_TYPE_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11439081926542817842)
,p_event_id=>wwv_flow_imp.id(11439081342746817837)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_CHILD_COUNT'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'  from sp_task_types',
' where parent_type_id = :P501_TASK_TYPE_ID'))
,p_attribute_07=>'P501_TASK_TYPE_ID'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11439081512938817838)
,p_event_id=>wwv_flow_imp.id(11439081342746817837)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_TASK_SUB_TYPE_ID'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P501_CHILD_COUNT'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11439081578738817839)
,p_event_id=>wwv_flow_imp.id(11439081342746817837)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_TASK_SUB_TYPE_ID'
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P501_CHILD_COUNT'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14306928540112272745)
,p_name=>'hide/show status (hide if no parent task type)'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P501_TASK_TYPE_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14306928602577272746)
,p_event_id=>wwv_flow_imp.id(14306928540112272745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_STATUS_ID'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P501_TASK_TYPE_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14306928656946272747)
,p_event_id=>wwv_flow_imp.id(14306928540112272745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P501_STATUS_ID'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P501_TASK_TYPE_ID'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11039771904718106608)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'remove dependent data (to avoid project_history table trigger mutation)'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from sp_task_comments',
' where task_id = :P501_ID;',
'',
'delete from sp_task_documents',
' where task_id = :P501_ID;',
'',
'delete from sp_task_links',
' where task_id = :P501_ID;',
'',
'delete from sp_tasks',
' where id = :P501_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(28345543960050599885)
,p_process_success_message=>'Task deleted.'
,p_internal_uid=>805717563571602208
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28345542131939599882)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(143387710584912337570)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE, SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>18111487790793095482
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(14126611051546351980)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'send notification'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_project_link   varchar2(4000);',
'begin',
'',
'for c1 in (',
'    select p.project, p.friendly_identifier fi,',
'           tt.task_type, (select task_type from sp_task_types t2',
'                           where t.task_sub_type_id = t2.id) sub_task,',
'           t.target_complete, t.description,',
'           lower(substr(tt.task_type,1,1)) first_letter,',
'           (select first_name',
'              from sp_team_members',
'             where id = :P501_OWNER_ID) first_name',
'      from sp_projects p,',
'           sp_tasks t,',
'           sp_task_types tt',
'     where t.id = :P501_ID',
'       and t.project_id = p.id',
'       and t.task_type_id = tt.id',
') loop',
'    l_project_link := sp_strategic_proj_util.get_setting(p_static_id => ''APP_PREFIX_URL'')||',
'                      apex_page.get_url (',
'                          p_application    => :APP_ID,',
'                          p_page           => ''project-details'',',
'                          p_session        => null,',
'                          p_items          => ''fi'',',
'                          p_values         => c1.fi,',
'                          p_plain_url      => TRUE );',
'',
'    sp_strategic_proj_util.assignment_notification (',
'        p_team_member_id => :P501_OWNER_ID,',
'        p_app_name       => :NOMENCLATURE_STRATEGIC_PLANNER,',
'        p_app_id         => :APP_ID,',
'        p_title          => ''You have been assigned ''||case when c1.first_letter in (''a'',''o'',''i'')',
'                                                            then ''an ''',
'                                                            else ''a ''',
'                                                            end ||',
'                             c1.task_type || '' task for ''||c1.project,',
'        p_project_id     => :P501_PROJECT_ID,',
'        p_project_link   => l_project_link,',
'        p_email_contents => ''Hi ''||c1.first_name||''<br/><br/>''||',
'                            ''You have been assigned a ''||c1.task_type||'' task for the following ''||:NOMENCLATURE_PROJECT||'':<br/><br/>''||',
'                            :NOMENCLATURE_PROJECT||'': <a  style="font-weight:bold" href="''||l_project_link||''">''||c1.project||''</a><br/>''||',
'                            case when c1.task_type is not null ',
'                                 then ''Task Type: <strong>''||c1.task_type ||',
'                                                             case when c1.sub_task is not null',
'                                                                  then '': ''||c1.sub_task',
'                                                             end ||''</strong><br/>''',
'                                 end ||',
'                            case when c1.description is not null ',
'                                 then ''Description: ''||c1.description||''<br/>''',
'                                 end ||',
'                            case when c1.target_complete is not null ',
'                                 then ''Target Complete: ''||to_char(c1.target_complete,''DD-MON-YYYY'')||''<br/>''',
'                                 end ||',
'                            ''Assigned by: ''||lower(:APP_USER)||''<br/>''||',
'                            ''Assigned on: ''||to_char(sysdate,''DD-MON-YYYY'')',
'                            );',
'end loop;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from dual',
' where (:P501_ID is null and :P501_OWNER_ID is not null and :P501_OWNER_ID != :APP_USER_ID) ',
'    or (:P501_OWNER_ID is not null and :P501_OWNER_ID != :APP_USER_ID and not exists (select 1 from sp_tasks',
'                                                                                       where id = :P501_ID',
'                                                                                         and nvl(owner_id,-1) != :P501_OWNER_ID) )'))
,p_process_when_type=>'EXISTS'
,p_internal_uid=>3892556710399847580
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28345544590054599892)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>18111490248908095492
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(28345541684440599882)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(143387710584912337570)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form'
,p_internal_uid=>18111487343294095482
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11587033531610630804)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'log'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_log.log_interaction(',
'    p_project_id => :P501_PROJECT_ID);'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1352979190464126404
);
wwv_flow_imp.component_end;
end;
/
