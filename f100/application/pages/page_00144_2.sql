prompt --application/pages/page_00144
begin
--   Manifest
--     PAGE: 00144
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
 p_id=>144
,p_name=>'My Profile'
,p_alias=>'MY-PROFILE'
,p_page_mode=>'MODAL'
,p_step_title=>'My Profile'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>1661186590416509825
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14322946753605582059)
,p_plug_name=>'My Profile'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'SP_TEAM_MEMBERS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14322963847480582086)
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
 p_id=>wwv_flow_imp.id(14322964242317582087)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(14322963847480582086)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14322966119415582090)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(14322963847480582086)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P144_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14322966441702582090)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(14322963847480582086)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P144_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11615380600021228341)
,p_name=>'P144_LOCATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_prompt=>'Location'
,p_source=>'LOCATION'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>500
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
 p_id=>wwv_flow_imp.id(14025085938284589544)
,p_name=>'P144_NOTIFICATION_PREF'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_default=>'APP:EMAIL'
,p_prompt=>'Assignment Alerts'
,p_source=>'NOTIFICATION_PREF'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'EMAIL_ALERT_PREF'
,p_lov=>'.'||wwv_flow_imp.id(14308827217556491844)||'.'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'If no preference is set, assignment alerts will be shown within the application and sent via email.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '3')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14322864428245503114)
,p_name=>'P144_EMAIL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_prompt=>'Email'
,p_source=>'EMAIL'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>1609121967514267634
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
 p_id=>wwv_flow_imp.id(14322867113797503141)
,p_name=>'P144_PHOTO'
,p_source_data_type=>'BLOB'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_prompt=>'Profile Photo'
,p_source=>'PHOTO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_IMAGE_UPLOAD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_cropping', 'Y',
  'aspect_ratio', '1:1',
  'display_as', 'DROPZONE_INLINE',
  'display_download_link', 'Y',
  'max_height', '256',
  'max_width', '256',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14322947042011582060)
,p_name=>'P144_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
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
 p_id=>wwv_flow_imp.id(14322947454549582063)
,p_name=>'P144_FIRST_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_prompt=>'First Name'
,p_source=>'FIRST_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14322947936468582064)
,p_name=>'P144_LAST_NAME'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_prompt=>'Last Name'
,p_source=>'LAST_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14322948270045582065)
,p_name=>'P144_INITIALS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_prompt=>'Initials'
,p_source=>'INITIALS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>3
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14322949875380582068)
,p_name=>'P144_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_COMBOBOX'
,p_lov=>'select tag from SP_DEFAULT_PEOPLE_TAGS order by display_sequence, tag'
,p_cSize=>60
,p_cMaxlength=>4000
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'max_values_in_list', '15',
  'min_chars', '0',
  'multi_selection', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14322955901891582078)
,p_name=>'P144_COUNTRY_ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_prompt=>'Country'
,p_source=>'COUNTRY_ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select country_name||'' - ''||country_code d,',
'       id',
'from sp_countries',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'US_ONLY'
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
 p_id=>wwv_flow_imp.id(16885495545868600647)
,p_name=>'P144_SCREEN_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_prompt=>'Screen Name'
,p_source=>'SCREEN_NAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_restricted_characters=>'NO_SPECIAL_CHAR_NL'
,p_required_patch=>wwv_flow_imp.id(20138793112175491883)
,p_help_text=>'This attribute is used to reference another application user in a comment, for example @somename, where "someone" is the screen name.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'LOWER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20728620879677695620)
,p_name=>'P144_COMPETENCIES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_prompt=>'Competencies'
,p_source=>'COMPETENCIES'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select competency from SP_COMPETENCIES order by competency'
,p_lov_display_null=>'YES'
,p_cSize=>60
,p_cMaxlength=>4000
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28418378221198926034)
,p_name=>'P144_COMMENT_NOTIF_PREF'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_source_plug_id=>wwv_flow_imp.id(14322946753605582059)
,p_item_default=>'APP:EMAIL'
,p_prompt=>'Comment Alerts'
,p_source=>'COMMENT_NOTIF_PREF'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'EMAIL_ALERT_PREF'
,p_lov=>'.'||wwv_flow_imp.id(14308827217556491844)||'.'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'If no preference is set, comment alerts will be shown within the application and sent via email.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '3')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(14025086322077589548)
,p_computation_sequence=>10
,p_computation_item=>'P144_NOTIFICATION_PREF'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'APP:EMAIL'
,p_required_patch=>wwv_flow_imp.id(27063355719221060172)
,p_compute_when=>'P144_NOTIFICATION_PREF'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(28418378318620926035)
,p_computation_sequence=>20
,p_computation_item=>'P144_COMMENT_NOTIF_PREF'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'APP:EMAIL'
,p_required_patch=>wwv_flow_imp.id(27063355719221060172)
,p_compute_when=>'P144_COMMENT_NOTIF_PREF'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(19846518608447368223)
,p_validation_name=>'no dup screen names'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from sp_team_members',
' where id != :P144_ID',
'   and screen_name = lower(:P144_SCREEN_NAME)'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>'This screen name is already in use.'
,p_associated_item=>wwv_flow_imp.id(16885495545868600647)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(20138793112175491883)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(19846518697749368224)
,p_validation_name=>'screen name, no #,., @ or space'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'instr(:P144_SCREEN_NAME,''#'') = 0 and',
'instr(:P144_SCREEN_NAME,''@'') = 0 and',
'instr(:P144_SCREEN_NAME,''.'') = 0 and',
'instr(:P144_SCREEN_NAME,'' '') = 0'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Screen name cannot contain #, @ or space.'
,p_associated_item=>wwv_flow_imp.id(16885495545868600647)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(20138793112175491883)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14322964420078582087)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(14322964242317582087)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14322965232638582088)
,p_event_id=>wwv_flow_imp.id(14322964420078582087)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14025085989167589545)
,p_name=>'when notification pref set to none'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P144_NOTIFICATION_PREF'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v("P144_NOTIFICATION_PREF") == ''APP:NONE'' || ',
'$v("P144_NOTIFICATION_PREF") == ''APP:EMAIL:NONE'' ||',
'$v("P144_NOTIFICATION_PREF") == ''EMAIL:NONE'''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14025086127462589546)
,p_event_id=>wwv_flow_imp.id(14025085989167589545)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P144_NOTIFICATION_PREF'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'NONE'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28418378403178926036)
,p_name=>'when comment pref set to none'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P144_COMMENT_NOTIF_PREF'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$v("P144_COMMENT_NOTIF_PREF") == ''APP:NONE'' || ',
'$v("P144_COMMENT_NOTIF_PREF") == ''APP:EMAIL:NONE'' ||',
'$v("P144_COMMENT_NOTIF_PREF") == ''EMAIL:NONE'''))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28418378531158926037)
,p_event_id=>wwv_flow_imp.id(28418378403178926036)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P144_COMMENT_NOTIF_PREF'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'NONE'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(14322967321163582091)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(14322946753605582059)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form My Profile'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Changes saved.'
,p_internal_uid=>4088912980017077691
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(14322967708190582091)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>4088913367044077691
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(14322966863128582090)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(14322946753605582059)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form My Profile'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>4088912521982077690
);
wwv_flow_imp.component_end;
end;
/
