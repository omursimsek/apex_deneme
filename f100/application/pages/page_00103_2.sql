prompt --application/pages/page_00103
begin
--   Manifest
--     PAGE: 00103
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
 p_id=>103
,p_name=>'Groups'
,p_alias=>'GROUPS'
,p_step_title=>'Groups'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(20452810691500035245)
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(20442394029406870290)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19221556314761843102)
,p_plug_name=>'Groups'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select g.ID,',
'       g.GROUP_NAME,',
'       g.DESCRIPTION,',
'       g.group_tag,',
'       --',
'       -- tracking columns',
'       --',
'       g.CREATED,',
'       g.CREATED_BY,',
'       g.UPDATED,',
'       g.UPDATED_BY,',
'       --',
'       -- members',
'       --',
'       (select count(*) ',
'       from SP_GROUP_MEMBERS gm, ',
'            SP_TEAM_MEMBERS tm ',
'       where tm.id = gm.TEAM_MEMBER_ID and ',
'             gm.group_id = g.id and ',
'             nvl(tm.IS_CURRENT_YN,''Y'') = ''Y'') group_members,',
'       --',
'       -- full time',
'       --',
'       (select count(*) ',
'        from SP_GROUP_MEMBERS gm, ',
'             SP_TEAM_MEMBERS tm ',
'        where tm.id = TEAM_MEMBER_ID and ',
'              gm.group_id = g.id and ',
'              gm.full_time_yn = ''Y'' and ',
'              tm.IS_CURRENT_YN = ''Y'') full_time,',
'       --',
'       -- laeders',
'       --',
'       (select count(*) ',
'        from SP_GROUP_MEMBERS gm, ',
'             SP_TEAM_MEMBERS tm ',
'        where tm.id = TEAM_MEMBER_ID and ',
'              gm.group_id = g.id and ',
'              gm.group_leader_yn = ''Y'' and ',
'              tm.IS_CURRENT_YN = ''Y'') group_Leaders',
'  from SP_GROUPS g'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Groups'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(19221556389040843102)
,p_name=>'Groups'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:150:&APP_SESSION.::&DEBUG.:RP:P150_ID:\#ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'MIKE'
,p_internal_uid=>8987502047894338702
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19221556808799843115)
,p_db_column_name=>'ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19221557172318843116)
,p_db_column_name=>'GROUP_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Group Name'
,p_column_link=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:RP,:P151_GROUP_ID:#ID#'
,p_column_linktext=>'#GROUP_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19221557965593843118)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19221558394804843119)
,p_db_column_name=>'CREATED'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19221558766267843119)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19221559213724843120)
,p_db_column_name=>'UPDATED'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19221559599144843121)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18962932197894064127)
,p_db_column_name=>'GROUP_MEMBERS'
,p_display_order=>18
,p_column_identifier=>'I'
,p_column_label=>'Group Members'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20277967939629266736)
,p_db_column_name=>'FULL_TIME'
,p_display_order=>28
,p_column_identifier=>'J'
,p_column_label=>'Full Time'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20277967962679266737)
,p_db_column_name=>'GROUP_LEADERS'
,p_display_order=>38
,p_column_identifier=>'K'
,p_column_label=>'Group Leaders'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444454597420591842)
,p_db_column_name=>'GROUP_TAG'
,p_display_order=>48
,p_column_identifier=>'L'
,p_column_label=>'Group Tag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19221581708754848935)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'89875274'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'GROUP_NAME:GROUP_TAG:GROUP_MEMBERS:FULL_TIME:GROUP_LEADERS:UPDATED:'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28239795046631125290)
,p_plug_name=>'Breadcrumb'
,p_region_sub_css_classes=>'has-header-actions'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(29104138401664140108)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(28239795046631125290)
,p_region_sub_css_classes=>'header-actions'
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>'select 1 as actions from dual'
,p_template_component_type=>'PARTIAL'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'AVATAR_ICON', 'fa-user',
  'AVATAR_SHAPE', 't-Avatar--rounded',
  'AVATAR_TYPE', 'icon',
  'BADGE_COL_WIDTH', 't-ContentRow-badge--md',
  'BADGE_LABEL_DISPLAY', 'N',
  'DISPLAY_AVATAR', 'N',
  'DISPLAY_BADGE', 'N',
  'HIDE_BORDERS', 'N',
  'REMOVE_PADDING', 'N')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(29104139635170140120)
,p_name=>'ACTIONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIONS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19221768348636888702)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(28239795046631125290)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19221560421411843123)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(19221556314761843102)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19221561012644843128)
,p_event_id=>wwv_flow_imp.id(19221560421411843123)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19221556314761843102)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18962931777685064123)
,p_name=>'on bc dc close'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(28239795046631125290)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18962931919867064124)
,p_event_id=>wwv_flow_imp.id(18962931777685064123)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19221556314761843102)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18962932033531064125)
,p_name=>'on groups region dc'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(19221556314761843102)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18962932139826064126)
,p_event_id=>wwv_flow_imp.id(18962932033531064125)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19221556314761843102)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(25215666224461882732)
,p_region_id=>wwv_flow_imp.id(29104138401664140108)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362316605839802174
,p_label=>'Add Group'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:150:&SESSION.::&DEBUG.:RP,150::'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-plus'
,p_is_hot=>true
,p_show_as_disabled=>false
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(29104138702243140111)
,p_region_id=>wwv_flow_imp.id(29104138401664140108)
,p_position_id=>362316004162771045
,p_display_sequence=>20
,p_template_id=>362317865359806322
,p_label=>'Actions'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(23319123351379204881)
,p_component_action_id=>wwv_flow_imp.id(29104138702243140111)
,p_menu_entry_type=>'ENTRY'
,p_label=>'&NOMENCLATURE_USERS. Details'
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-users'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(23319125038103204898)
,p_component_action_id=>wwv_flow_imp.id(29104138702243140111)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>60
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(26335459431270237377)
,p_component_action_id=>wwv_flow_imp.id(29104138702243140111)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>80
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:RP,103,CIR,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(26335459622422237378)
,p_component_action_id=>wwv_flow_imp.id(29104138702243140111)
,p_menu_entry_type=>'ENTRY'
,p_label=>'About Groups'
,p_display_sequence=>50
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:145:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-info'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(27950644598214448384)
,p_component_action_id=>wwv_flow_imp.id(29104138702243140111)
,p_menu_entry_type=>'ENTRY'
,p_label=>'View &NOMENCLATURE_USERS.'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-users'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(29104139408150140118)
,p_component_action_id=>wwv_flow_imp.id(29104138702243140111)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>70
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(35034248180020994200)
,p_component_action_id=>wwv_flow_imp.id(29104138702243140111)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>30
);
wwv_flow_imp.component_end;
end;
/
