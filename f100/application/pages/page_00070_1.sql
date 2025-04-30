prompt --application/pages/page_00070
begin
--   Manifest
--     PAGE: 00070
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
 p_id=>70
,p_name=>'Project Groups'
,p_alias=>'PROJECT-GROUPS'
,p_step_title=>'Project Groups'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11462170223606275126)
,p_plug_name=>'Project Groups'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select g.ID,',
'       g.GROUP_NAME,',
'       g.GROUP_DESCRIPTION,',
'       CREATED,',
'       lower(g.created_by) CREATED_BY,',
'       --',
'       --',
'       --',
'       greatest(nvl(',
'           (select max(p.updated)',
'            from sp_projects p',
'            where p.ARCHIVED_YN = ''N''',
'              and p.DUPLICATE_OF_PROJECT_ID is null',
'              and p.project_group_id = g.id),',
'           g.updated),',
'           g.UPDATED) updated,',
'       --',
'       lower(g.updated_by) UPDATED_BY,',
'       --',
'       -- is group active',
'       --',
'       decode(g.is_active_yn,''Y'',''Yes'',''No'') group_active,',
'       --',
'       -- associated projects',
'       --',
'       (select count(*) ',
'       from sp_projects p ',
'       where g.id = p.project_group_id and',
'             p.ARCHIVED_YN = ''N'' and',
'             p.DUPLICATE_OF_PROJECT_ID is null and',
'             p.PCT_COMPLETE != 0 and ',
'             p.PCT_COMPLETE != 100) active_project_count,',
'       (select count(*) ',
'          from sp_projects p ',
'         where g.id = p.project_group_id and',
'               p.ARCHIVED_YN = ''N'' and',
'               p.DUPLICATE_OF_PROJECT_ID is null) total_project_count,',
'       (select listagg(distinct i.initiative,'', '') ',
'               within group (order by i.initiative)',
'          from sp_projects p,',
'               sp_initiatives i',
'         where g.id = p.project_group_id',
'           and p.ARCHIVED_YN = ''N''',
'           and p.DUPLICATE_OF_PROJECT_ID is null',
'           and p.initiative_id = i.id) initiatives',
'  from SP_PROJECT_GROUPS g'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Project Groups'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11462170292096275126)
,p_name=>'Project Groups'
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
,p_detail_link=>'f?p=&APP_ID.:90:&APP_SESSION.::&DEBUG.:RP:P90_ID:\#ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'MICHAEL.HICHWA@ORACLE.COM'
,p_internal_uid=>1228115950949770726
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11462171203332275127)
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
 p_id=>wwv_flow_imp.id(11462171615998275129)
,p_db_column_name=>'GROUP_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'&NOMENCLATURE_PROJECT. Group'
,p_column_link=>'f?p=&APP_ID.:119:&SESSION.::&DEBUG.:RP,:P119_PROJECT_GROUP_ID:#ID#'
,p_column_linktext=>'#GROUP_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11462171998856275129)
,p_db_column_name=>'GROUP_DESCRIPTION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11462172420935275129)
,p_db_column_name=>'CREATED'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11462172747545275130)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11462173157270275130)
,p_db_column_name=>'UPDATED'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11462173635363275131)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11137835484091223114)
,p_db_column_name=>'ACTIVE_PROJECT_COUNT'
,p_display_order=>17
,p_column_identifier=>'H'
,p_column_label=>'Active &NOMENCLATURE_PROJECTS.'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11137835634005223115)
,p_db_column_name=>'TOTAL_PROJECT_COUNT'
,p_display_order=>27
,p_column_identifier=>'I'
,p_column_label=>'Total &NOMENCLATURE_PROJECTS.'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11137835814770223117)
,p_db_column_name=>'GROUP_ACTIVE'
,p_display_order=>37
,p_column_identifier=>'J'
,p_column_label=>'Active'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12560926030921477325)
,p_db_column_name=>'INITIATIVES'
,p_display_order=>47
,p_column_identifier=>'K'
,p_column_label=>'Initiatives'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11462291857225568704)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'12282376'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'GROUP_NAME:INITIATIVES:ACTIVE_PROJECT_COUNT:TOTAL_PROJECT_COUNT:UPDATED:'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_sum_columns_on_break=>'ACTIVE_PROJECT_COUNT:TOTAL_PROJECT_COUNT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11462175370707275132)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11462174061845275131)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11462175370707275132)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Group'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:90:&APP_SESSION.::&DEBUG.:90::'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11657276447430689396)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11462175370707275132)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_PROJECT_VIEW.:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11462174371242275131)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11462170223606275126)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11462174897006275132)
,p_event_id=>wwv_flow_imp.id(11462174371242275131)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11462170223606275126)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11137834683481223106)
,p_name=>'refresh report on dc'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11462174061845275131)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11137834823656223107)
,p_event_id=>wwv_flow_imp.id(11137834683481223106)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11462170223606275126)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
