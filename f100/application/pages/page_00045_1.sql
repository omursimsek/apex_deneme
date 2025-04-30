prompt --application/pages/page_00045
begin
--   Manifest
--     PAGE: 00045
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
 p_id=>45
,p_name=>'Archived &NOMENCLATURE_PROJECTS.'
,p_alias=>'ARCHIVED-NOMENCLATURE-PROJECTS'
,p_step_title=>'Archived &NOMENCLATURE_PROJECTS.'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(21103783134283959393)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21898875405921757283)
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
 p_id=>wwv_flow_imp.id(21898875992481757286)
,p_plug_name=>'Archived &NOMENCLATURE_PROJECTS.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       friendly_identifier,',
'       INITIATIVE_ID,',
'       (select initiative from sp_initiatives i where i.id = p.INITIATIVE_ID) initiative,',
'       (select area from sp_areas f where id = (select area_id from sp_initiatives i where i.id = p.INITIATIVE_ID)) area,',
'       PROJECT,',
'       OWNER_ID,',
'       TARGET_COMPLETE,',
'       pct_complete,',
'       PRIORITY_ID,',
'       RELEASE,',
'       RELEASE_ID,',
'       PROJECT_SIZE,',
'       DESCRIPTION,',
'       --',
'       -- initiative focus area',
'       --',
'       nvl((select focus_area from sp_initiative_focus_areas ifa where ifa.id = p.focus_area_id),''Not Identified'') Init_focus_area,',
'       --',
'       --',
'       --',
'       COMMENTS,',
'       LINKS,',
'       DOCUMENTS,',
'       RELEASE_DEPENDENT_YN,',
'       TAGS,',
'       CREATED,',
'       CREATED_BY,',
'       UPDATED,',
'       UPDATED_BY,',
'       UPPER_PROJECT_NAME,',
'       ARCHIVED_YN,',
'       ARCHIVED_DATE,',
'       archived_date archived_since,',
'       lower(archived_by) ARCHIVED_BY,',
'       DUPLICATE_OF_PROJECT_ID,',
'       (select project from sp_projects p2 where p2.id = p.DUPLICATE_OF_PROJECT_ID) duplicate_of',
'  from SP_PROJECTS p',
'where ARCHIVED_YN = ''Y'''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Archived &NOMENCLATURE_PROJECTS.'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(21898876085118757286)
,p_name=>'Archived &NOMENCLATURE_PROJECTS.'
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
,p_internal_uid=>11664821743972252886
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898877949554757554)
,p_db_column_name=>'ID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898878822442757556)
,p_db_column_name=>'PROJECT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'&NOMENCLATURE_PROJECT.'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:P3_PROJECT_ID:#ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898879610921757557)
,p_db_column_name=>'TARGET_COMPLETE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Target Complete'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898880838059757558)
,p_db_column_name=>'RELEASE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Release'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898881567419757560)
,p_db_column_name=>'PROJECT_SIZE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Project Size'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898881961245757560)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Description'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898882820760757561)
,p_db_column_name=>'COMMENTS'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Comments'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898883226217757561)
,p_db_column_name=>'LINKS'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Links'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898883630594757561)
,p_db_column_name=>'DOCUMENTS'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Documents'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898883970082757562)
,p_db_column_name=>'RELEASE_DEPENDENT_YN'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Release Dependent '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898884369051757562)
,p_db_column_name=>'TAGS'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898885564109757563)
,p_db_column_name=>'CREATED'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898885977872757564)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898886389024757564)
,p_db_column_name=>'UPDATED'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898886754904757564)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898887160185757565)
,p_db_column_name=>'UPPER_PROJECT_NAME'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Upper Project Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898887600086757565)
,p_db_column_name=>'ARCHIVED_YN'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Archived '
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898887949381757565)
,p_db_column_name=>'ARCHIVED_DATE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Archived Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898888361673757566)
,p_db_column_name=>'ARCHIVED_BY'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Archived By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21898888790312757566)
,p_db_column_name=>'DUPLICATE_OF_PROJECT_ID'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Duplicate of Project ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21062913167133426636)
,p_db_column_name=>'INITIATIVE_ID'
,p_display_order=>38
,p_column_identifier=>'AC'
,p_column_label=>'Initiative Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21062913334214426637)
,p_db_column_name=>'OWNER_ID'
,p_display_order=>48
,p_column_identifier=>'AD'
,p_column_label=>'Owner Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21062913529200426639)
,p_db_column_name=>'PRIORITY_ID'
,p_display_order=>68
,p_column_identifier=>'AF'
,p_column_label=>'Priority Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21062913640885426640)
,p_db_column_name=>'RELEASE_ID'
,p_display_order=>78
,p_column_identifier=>'AG'
,p_column_label=>'Release Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21062913713716426641)
,p_db_column_name=>'INITIATIVE'
,p_display_order=>88
,p_column_identifier=>'AH'
,p_column_label=>'Initiative'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21062913821329426642)
,p_db_column_name=>'AREA'
,p_display_order=>98
,p_column_identifier=>'AI'
,p_column_label=>'Area'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21062913879425426643)
,p_db_column_name=>'DUPLICATE_OF'
,p_display_order=>108
,p_column_identifier=>'AJ'
,p_column_label=>'Duplicate of'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:P3_PROJECT_ID:#DUPLICATE_OF_PROJECT_ID#'
,p_column_linktext=>'#DUPLICATE_OF#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22139810711038252001)
,p_db_column_name=>'FRIENDLY_IDENTIFIER'
,p_display_order=>118
,p_column_identifier=>'AK'
,p_column_label=>'Friendly Identifier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15698270640523220141)
,p_db_column_name=>'PCT_COMPLETE'
,p_display_order=>128
,p_column_identifier=>'AL'
,p_column_label=>'Pct Complete'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22814214669251835445)
,p_db_column_name=>'ARCHIVED_SINCE'
,p_display_order=>138
,p_column_identifier=>'AM'
,p_column_label=>'Archived'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19575128834345374249)
,p_db_column_name=>'INIT_FOCUS_AREA'
,p_display_order=>148
,p_column_identifier=>'AN'
,p_column_label=>'Focus Area'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(21898959375453761321)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'116649051'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT:AREA:INITIATIVE:INIT_FOCUS_AREA:CREATED:UPDATED:ARCHIVED_SINCE:ARCHIVED_DATE:ARCHIVED_BY'
,p_sort_column_1=>'ARCHIVED_SINCE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'ARCHIVED_DATE'
,p_sort_direction_2=>'DESC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21899463741496196525)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(21898875405921757283)
,p_button_name=>'refresh'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset'
,p_button_position=>'CHANGE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:RP,45::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21899454380984195464)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(21898875405921757283)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp.component_end;
end;
/
