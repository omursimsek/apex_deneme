prompt --application/pages/page_00039
begin
--   Manifest
--     PAGE: 00039
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
 p_id=>39
,p_name=>'Page Views'
,p_alias=>'PAGE-VIEWS'
,p_step_title=>'Page Views'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(149556931645203434433)
,p_page_css_classes=>'rw-pillar--sienna'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(149556930433130434424)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19329175453269514520)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19329176067308514522)
,p_plug_name=>'Page Performance'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select step_id page,',
'    USERID_LC username,',
'    nvl((   select p.page_title||'' (''||p.PAGE_FUNCTION||'')'' page_name',
'        from apex_application_pages p',
'        where p.page_id = l.step_id',
'            and p.application_id = :app_id ),''Unknown'') page_name,',
'    elap                  elapsed,',
'    session_id,',
'    nvl(num_rows,0)       num_rows,',
'    decode(page_mode,''P'',''Partial Page'',''D'',''Full Page'',''Other - ''||page_mode) page_mode,',
'    time_stamp,',
'    time_stamp time_stamp_since',
'from apex_activity_log l',
'where flow_id = :app_id',
'    and userid is not null'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Page Performance'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(19329176168402514522)
,p_name=>'Page Performance'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>9095121827256010122
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19329176528121514526)
,p_db_column_name=>'PAGE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19329176965301514527)
,p_db_column_name=>'PAGE_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Page Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(16534028143480949577)
,p_db_column_name=>'ELAPSED'
,p_display_order=>12
,p_column_identifier=>'O'
,p_column_label=>'Elapsed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D000'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(16534028229000949578)
,p_db_column_name=>'SESSION_ID'
,p_display_order=>22
,p_column_identifier=>'P'
,p_column_label=>'Session ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(16534028258063949579)
,p_db_column_name=>'NUM_ROWS'
,p_display_order=>32
,p_column_identifier=>'Q'
,p_column_label=>'Num Rows'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(16534028445523949580)
,p_db_column_name=>'PAGE_MODE'
,p_display_order=>42
,p_column_identifier=>'R'
,p_column_label=>'Page Mode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(16534028545592949581)
,p_db_column_name=>'TIME_STAMP'
,p_display_order=>52
,p_column_identifier=>'S'
,p_column_label=>'Time Stamp'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(16534028644397949582)
,p_db_column_name=>'TIME_STAMP_SINCE'
,p_display_order=>62
,p_column_identifier=>'T'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17156580076629192787)
,p_db_column_name=>'USERNAME'
,p_display_order=>72
,p_column_identifier=>'U'
,p_column_label=>'Username'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19329184054249515177)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'27689094'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PAGE:PAGE_NAME:ELAPSED:USERNAME:NUM_ROWS:PAGE_MODE:TIME_STAMP_SINCE'
,p_sort_column_1=>'TIME_STAMP_SINCE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'ELAPSED'
,p_sort_direction_2=>'DESC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13623600833079957436)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19329175453269514520)
,p_button_name=>'refresh'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Refresh'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP,39::'
,p_icon_css_classes=>'fa-undo'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13767034786723739763)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(19329175453269514520)
,p_button_name=>'page_performance'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Page Performance'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.:RP,::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13778936700476758408)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(19329175453269514520)
,p_button_name=>'user_interactions'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'User Interactions'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:72:&SESSION.::&DEBUG.:RP,::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13767034427985739761)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19329175453269514520)
,p_button_name=>'up'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:10000:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp.component_end;
end;
/
