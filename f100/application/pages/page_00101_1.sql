prompt --application/pages/page_00101
begin
--   Manifest
--     PAGE: 00101
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
 p_id=>101
,p_name=>'Activity'
,p_alias=>'ACTIVITY'
,p_page_mode=>'MODAL'
,p_step_title=>'Activity'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(11645820339639305861)
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_required_role=>wwv_flow_imp.id(149556930589415434424)
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24517536713698873467)
,p_plug_name=>'Activity'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SP_ACTIVITIES'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24517546422837873502)
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
 p_id=>wwv_flow_imp.id(24517546788635873503)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(24517546422837873502)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24517548146667873507)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(24517546422837873502)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P101_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24517548598430873507)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(24517546422837873502)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P101_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24517548974501873507)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(24517546422837873502)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Activity'
,p_button_position=>'NEXT'
,p_button_condition=>'P101_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12140330363210875318)
,p_name=>'P101_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_source_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_COMBOBOX'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''research'' tag from dual',
'union select ''development'' tag from dual',
'union select ''integration'' tag from dual',
'union select ''collaboration'' tag from dual'))
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_help_text=>'Enter comma separated tags.  Note any spaces will be replaced with a dash "-".'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'max_values_in_list', '7',
  'min_chars', '0',
  'multi_selection', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
,p_item_comment=>'Enter comma delimited tags'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13155077684750924719)
,p_name=>'P101_URL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_source_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_prompt=>'URL'
,p_source=>'URL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>500
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
 p_id=>wwv_flow_imp.id(15702845612357490503)
,p_name=>'P101_INITIATIVE_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_source_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_prompt=>'Optional &NOMENCLATURE_INITIATIVE.'
,p_source=>'INITIATIVE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'SP_INITIATIVES.INITIATIVE'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18259856749223635929)
,p_name=>'P101_END_DATE_SAME_DAY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18259856903363635930)
,p_name=>'P101_END_DATE_ONE_WEEK'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18259857172673635933)
,p_name=>'P101_END_DATE_TWO_WEEKS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24517272592398439233)
,p_name=>'P101_USER_TEAM_MEMBER_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24517272694332439234)
,p_name=>'P101_USER_TEAM_MEMBER_NAME'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24517537016340873468)
,p_name=>'P101_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_source_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24517537427973873477)
,p_name=>'P101_ACTIVITY_TYPE_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_source_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select max(id) from SP_ACTIVITY_TYPES ',
'where is_default_yn = ''Y'''))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Activity Type'
,p_source=>'ACTIVITY_TYPE_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.ACTIVITY_TYPE,',
'       t.id',
'from SP_ACTIVITY_TYPES t',
'where t.IS_ACTIVE_YN = ''Y'' or ',
'      t.id in (select a.ACTIVITY_TYPE_ID from sp_activities a where a.id = :P101_ID)',
'order by t.DISPLAY_SEQUENCE'))
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_help_text=>'Identifies the type of activity to be performed.  The list of activities is configurable by the application administrator.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '4',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24517538101172873483)
,p_name=>'P101_PROJECT_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_source_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_prompt=>'Optional &NOMENCLATURE_PROJECT.'
,p_source=>'PROJECT_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'PROJECTS DETAIL'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'     p.id, ',
'     decode(rt.release,null,p.project,rt.release_train||'' ''||rt.release||'': ''||project)|| '' - ''||pct_complete||''%'' display',
'from SP_PROJECTS p,',
'     SP_RELEASE_TRAINS rt',
'where p.release_id = rt.id(+) and',
'      p.ARCHIVED_YN = ''N'' and',
'      p.DUPLICATE_OF_PROJECT_ID is null',
'order by p.project'))
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24517538460557873484)
,p_name=>'P101_TEAM_MEMBER_ID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_source_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_default=>'P101_USER_TEAM_MEMBER_ID'
,p_item_default_type=>'ITEM'
,p_prompt=>'Owner'
,p_source=>'TEAM_MEMBER_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_name||'', ''||first_name||'' (''||lower(email)||'')'' d, id r',
'  from SP_TEAM_MEMBERS',
' where is_current_yn = ''Y''',
'    or id = :P101_TEAM_MEMBER_ID',
' order by 1'))
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24517538843240873485)
,p_name=>'P101_START_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_source_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_default=>'select sysdate + 0 from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Start Date'
,p_format_mask=>'FMDay DD-MON-YYYY'
,p_source=>'START_DATE'
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
 p_id=>wwv_flow_imp.id(24517539287561873487)
,p_name=>'P101_END_DATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_source_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_default=>'select sysdate + 14 from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'End Date'
,p_format_mask=>'FMDay DD-MON-YYYY'
,p_source=>'END_DATE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
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
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'Same Day'
,p_quick_pick_value_01=>'SAMEDAY'
,p_quick_pick_label_02=>'One Week'
,p_quick_pick_value_02=>'+1W'
,p_quick_pick_label_03=>'Two Weeks'
,p_quick_pick_value_03=>'+2W'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24517539654245873488)
,p_name=>'P101_COMMENTS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_item_source_plug_id=>wwv_flow_imp.id(24517536713698873467)
,p_prompt=>'Activity'
,p_placeholder=>'Briefly describe your activity in 280 characters or less'
,p_source=>'COMMENTS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>280
,p_cHeight=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(24517272769710439235)
,p_computation_sequence=>10
,p_computation_item=>'P101_USER_TEAM_MEMBER_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select id from sp_team_members where email = lower(:APP_USER)'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(24517272909511439236)
,p_computation_sequence=>20
,p_computation_item=>'P101_USER_TEAM_MEMBER_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select first_name||'' ''||last_name||'' (''||email||'')'' x ',
'from sp_team_members where id = :P101_USER_TEAM_MEMBER_ID'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18259857135567635932)
,p_computation_sequence=>40
,p_computation_item=>'P101_END_DATE_ONE_WEEK'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(sysdate + 7,''FMDay DD-MON-YYYY'')',
'  from dual',
' where :P101_ID is null',
'union all',
'select to_char(start_date + 7,''FMDay DD-MON-YYYY'')',
'  from sp_activities',
' where id = :P101_ID',
'   and :P101_ID is not null'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18259857245982635934)
,p_computation_sequence=>50
,p_computation_item=>'P101_END_DATE_TWO_WEEKS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(sysdate + 14,''FMDay DD-MON-YYYY'')',
'  from dual',
' where :P101_ID is null',
'union all',
'select to_char(start_date + 14,''FMDay DD-MON-YYYY'')',
'  from sp_activities',
' where id = :P101_ID',
'   and :P101_ID is not null'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24517546909342873503)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(24517546788635873503)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24517547681745873506)
,p_event_id=>wwv_flow_imp.id(24517546909342873503)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18259857341936635935)
,p_name=>'recalc end quick picks'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P101_START_DATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18259857480094635936)
,p_event_id=>wwv_flow_imp.id(18259857341936635935)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'update end_date_same_day quick pick'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P101_END_DATE_SAME_DAY'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(:P101_START_DATE,to_char(sysdate,''FMDay DD-MON-YYYY''))',
'  from dual'))
,p_attribute_07=>'P101_START_DATE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18259857953716635941)
,p_event_id=>wwv_flow_imp.id(18259857341936635935)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'update end_date_one_week quick pick'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P101_END_DATE_ONE_WEEK'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(nvl(to_date(:P101_START_DATE,''FMDay DD-MON-YYYY''),sysdate) + 7,''FMDay DD-MON-YYYY'')',
'  from dual'))
,p_attribute_07=>'P101_START_DATE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18259858113761635942)
,p_event_id=>wwv_flow_imp.id(18259857341936635935)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_name=>'update end_date_two_weeks quick pick'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P101_END_DATE_TWO_WEEKS'
,p_attribute_01=>'SQL_STATEMENT'
,p_attribute_03=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(nvl(to_date(:P101_START_DATE,''FMDay DD-MON-YYYY''),sysdate) + 14,''FMDay DD-MON-YYYY'')',
'  from dual'))
,p_attribute_07=>'P101_START_DATE'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18259857746350635939)
,p_name=>'Update after quick pick'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P101_END_DATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18259857854609635940)
,p_event_id=>wwv_flow_imp.id(18259857746350635939)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'set end for same day'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P101_END_DATE'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$v(''P101_END_DATE_SAME_DAY'')'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P101_END_DATE'
,p_client_condition_expression=>'SAMEDAY'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18259858190057635943)
,p_event_id=>wwv_flow_imp.id(18259857746350635939)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'set end for one week'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P101_END_DATE'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$v(''P101_END_DATE_ONE_WEEK'')'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P101_END_DATE'
,p_client_condition_expression=>'+1W'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18259858276365635944)
,p_event_id=>wwv_flow_imp.id(18259857746350635939)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set end for two weeks'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P101_END_DATE'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$v(''P101_END_DATE_TWO_WEEKS'')'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P101_END_DATE'
,p_client_condition_expression=>'+2W'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24517549782886873510)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(24517536713698873467)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Activity'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_process_error_message=>'Error'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed'
,p_internal_uid=>14283495441740369110
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24517550151952873510)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>14283495810806369110
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(24517549419525873508)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(24517536713698873467)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Activity'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>14283495078379369108
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11670445949119404310)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'log'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_log.log_interaction(',
'    p_project_id => :P101_PROJECT_ID);'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1436391607972899910
);
wwv_flow_imp.component_end;
end;
/
