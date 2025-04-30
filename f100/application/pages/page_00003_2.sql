prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
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
 p_id=>3
,p_name=>'Project Details'
,p_alias=>'PROJECT-DETAILS'
,p_step_title=>'&P3_PROJECT_NAME.'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401344032431234424)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.project-rds-region {',
'  background-color: rgba(219, 204, 175, .2);',
'}',
'',
'.t-Body-title {',
'  --ut-palette-warning-shade: rgba(var(--oj-palette-neutral-rgb-160));',
'  --ut-component-background-color: rgba(var(--oj-palette-neutral-rgb-170));',
'  --ut-alert-horizontal-border-radius: 0px;',
'}',
'',
'.t-ContextualInfo .t-Button--link {',
'  --a-button-line-height: 1rem;',
'  --a-button-border-radius: 0;',
'  --a-button-font-weight: normal;',
'}',
'',
'.t-ContextualInfo .t-Button--link:hover {',
'  text-decoration: none;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_deep_linking=>'Y'
,p_page_component_map=>'27'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10949660310772474002)
,p_plug_name=>'Reviews'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(13408792237973796442)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10949660375803474003)
,p_plug_name=>'review content'
,p_title=>'Reviews'
,p_parent_plug_id=>wwv_flow_imp.id(10949660310772474002)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.ID,',
'       --',
'       (select case when first_name is not null or last_name is not null',
'                    then first_name||'' ''||last_name',
'                    else email',
'                    end',
'               from sp_team_members t where t.id = r.owner_id) owner,',
'       --',
'       t.task_type type,',
'       --',
'       case when length(r.description) > 200',
'            then substr(r.description,1,200)||''...''',
'            else r.description',
'            end description,',
'       --',
'       (select status from sp_task_statuses where id = r.status_id) status,',
'       r.impact,',
'       r.start_date,',
'       r.target_complete,',
'       --',
'       r.updated,',
'       --',
'       (select count(*) from sp_task_comments ',
'         where task_id = r.id',
'          and (nvl(private_yn,''N'') = ''N''  or lower(created_by) = lower(:app_user) )) nbr_comments,',
'       --',
'       (select count(*) from sp_task_documents where task_id = r.id) nbr_docs,',
'       (select count(*) from sp_task_links where task_id = r.id) nbr_links,',
'       t.display_seq ob',
'  from sp_tasks r,',
'       sp_task_types t',
' where project_id = :P3_PROJECT_ID',
'   and nvl(r.task_sub_type_id,r.task_type_id) = t.id',
'   and t.static_id like ''REVIEW%'''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P3_PROJECT_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'tasks content'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(10949660505254474004)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:509:&SESSION.::&DEBUG.:RP,509:P509_ID:#ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'SBKENNED'
,p_internal_uid=>715606164107969604
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949660605868474005)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949660675885474006)
,p_db_column_name=>'TYPE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Review'
,p_column_link=>'f?p=&APP_ID.:502:&SESSION.::&DEBUG.:502:P502_TASK_ID,P502_PROJECT_ID,P502_PREV_PAGE:#ID#,&P3_PROJECT_ID.,3'
,p_column_linktext=>'#TYPE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949660792503474007)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Details'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949660895434474008)
,p_db_column_name=>'OWNER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949661002470474009)
,p_db_column_name=>'STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949661123975474010)
,p_db_column_name=>'START_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Start'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949661235110474011)
,p_db_column_name=>'TARGET_COMPLETE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Complete'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949661295305474012)
,p_db_column_name=>'UPDATED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949661359603474013)
,p_db_column_name=>'NBR_COMMENTS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Comments'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949661471648474014)
,p_db_column_name=>'NBR_DOCS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Documents'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949661572438474015)
,p_db_column_name=>'NBR_LINKS'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Links'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949661675714474016)
,p_db_column_name=>'OB'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Order'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11587036234135630831)
,p_db_column_name=>'IMPACT'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Impact'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11323188613824663822)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10891343'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TYPE:DESCRIPTION:OWNER:STATUS:IMPACT:START_DATE:TARGET_COMPLETE:UPDATED:NBR_COMMENTS:NBR_DOCS:NBR_LINKS:'
,p_sort_column_1=>'OB'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19846519764299368235)
,p_plug_name=>'review button container'
,p_parent_plug_id=>wwv_flow_imp.id(10949660375803474003)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from sp_task_history h,',
'       sp_tasks t,',
'       sp_task_types tt',
' where h.task_id = t.id',
'   and t.task_type_id = tt.id',
'   and tt.task_type = ''Review''',
'   and t.project_id = :P3_PROJECT_ID'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10949661759611474017)
,p_plug_name=>'Milestones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10949661864107474018)
,p_plug_name=>'milestone content'
,p_title=>'Milestones'
,p_parent_plug_id=>wwv_flow_imp.id(10949661759611474017)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>90
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.ID,',
'       --',
'       (select case when first_name is not null or last_name is not null',
'                    then first_name||'' ''||last_name',
'                    else email',
'                    end',
'               from sp_team_members t where t.id = r.owner_id) owner,',
'       --',
'       t.task_type type,',
'       --',
'       case when length(r.description) > 200',
'            then substr(r.description,1,200)||''...''',
'            else r.description',
'            end description,',
'       --',
'       (select status from sp_task_statuses where id = r.status_id) status,',
'       r.start_date,',
'       r.target_complete,',
'       --',
'       r.updated,',
'       --',
'       (select count(*) from sp_task_comments ',
'         where task_id = r.id',
'          and (nvl(private_yn,''N'') = ''N''  or lower(created_by) = lower(:app_user) )) nbr_comments,',
'       --',
'       (select count(*) from sp_task_documents where task_id = r.id) nbr_docs,',
'       (select count(*) from sp_task_links where task_id = r.id) nbr_links,',
'       t.display_seq ob',
'  from sp_tasks r,',
'       sp_task_types t',
' where project_id = :P3_PROJECT_ID',
'   and nvl(r.task_sub_type_id,r.task_type_id) = t.id',
'   and t.static_id like ''MILESTONE%'''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P3_PROJECT_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'tasks content'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(10949662005600474019)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:508:&SESSION.::&DEBUG.:RP,508:P508_ID:#ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'SBKENNED'
,p_internal_uid=>715607664453969619
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949662127958474020)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949662187326474021)
,p_db_column_name=>'TYPE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Milestone'
,p_column_link=>'f?p=&APP_ID.:502:&SESSION.::&DEBUG.:502:P502_TASK_ID,P502_PROJECT_ID,P502_PREV_PAGE:#ID#,&P3_PROJECT_ID.,3'
,p_column_linktext=>'#TYPE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949662256873474022)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Details'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949662356569474023)
,p_db_column_name=>'OWNER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949662464586474024)
,p_db_column_name=>'STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949662640766474025)
,p_db_column_name=>'START_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Start'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949662731452474026)
,p_db_column_name=>'TARGET_COMPLETE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Complete'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949662769715474027)
,p_db_column_name=>'UPDATED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949662874748474028)
,p_db_column_name=>'NBR_COMMENTS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Comments'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949662959381474029)
,p_db_column_name=>'NBR_DOCS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Documents'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949663057813474030)
,p_db_column_name=>'NBR_LINKS'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Links'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949663179931474031)
,p_db_column_name=>'OB'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Order'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11323188022863663812)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10891337'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:TYPE:DESCRIPTION:OWNER:STATUS:START_DATE:TARGET_COMPLETE:UPDATED:NBR_COMMENTS:NBR_DOCS:NBR_LINKS'
,p_sort_column_1=>'OB'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'0'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19846518956881368227)
,p_plug_name=>'milestone button container'
,p_parent_plug_id=>wwv_flow_imp.id(10949661864107474018)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from sp_task_history h,',
'       sp_tasks t,',
'       sp_task_types tt',
' where h.task_id = t.id',
'   and t.task_type_id = tt.id',
'   and tt.task_type = ''Milestone''',
'   and t.project_id = :P3_PROJECT_ID'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11048520548622204119)
,p_plug_name=>'Related'
,p_region_name=>'RELATED'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>160
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.ID,',
'       (select project from sp_projects p where p.id = r.RELATED_PROJECT_ID) related_project,',
'       (select project from sp_projects p where p.id = r.PROJECT_ID) project,',
'       (select p2.pct_complete from sp_projects p2 where p2.id = r.RELATED_PROJECT_ID) pct_complete,',
'       i.initiative related_initiative,',
'       a.area related_area,',
'       a.id aria_id,',
'       i.id initiative_id,',
'       r.project_id,',
'       r.RELATED_PROJECT_ID,',
'       r.project_relation,',
'       r.CREATED,',
'       r.CREATED_BY,',
'       r.UPDATED,',
'       r.UPDATED_BY,',
'       p.FRIENDLY_IDENTIFIER,',
'       p.PROJECT_URL_NAME,',
'       (select p2.FRIENDLY_IDENTIFIER from sp_projects p2 where p2.id = r.RELATED_PROJECT_ID) related_fi,',
'       (select p2.PROJECT_URL_NAME from sp_projects p2 where p2.id = r.RELATED_PROJECT_ID) related_pn',
'  from SP_PROJECT_RELATED r,',
'       sp_projects p,',
'       sp_initiatives i,',
'       sp_areas a',
'where  r.PROJECT_ID = :P3_PROJECT_ID and ',
'       r.RELATED_PROJECT_ID = p.id and ',
'       i.id = p.initiative_id and ',
'       i.area_id = a.id and ',
'       p.DUPLICATE_OF_PROJECT_ID is null and',
'       p.ARCHIVED_YN = ''N''',
'union ',
'select r.ID,',
'       (select project from sp_projects p where p.id = r.RELATED_PROJECT_ID) related_project,',
'       (select project from sp_projects p where p.id = r.PROJECT_ID) project,',
'       (select p2.pct_complete from sp_projects p2 where p2.id = r.PROJECT_ID) pct_complete,',
'       i.initiative related_initiative,',
'       a.area related_area,',
'       a.id aria_id,',
'       i.id initiative_id,',
'       r.project_id,',
'       r.RELATED_PROJECT_ID,',
'       r.project_relation,',
'       r.CREATED,',
'       r.CREATED_BY,',
'       r.UPDATED,',
'       r.UPDATED_BY,',
'       p.FRIENDLY_IDENTIFIER,',
'       p.PROJECT_URL_NAME,',
'       (select p2.FRIENDLY_IDENTIFIER from sp_projects p2 where p2.id = r.PROJECT_ID) related_fi,',
'       (select p2.PROJECT_URL_NAME from sp_projects p2 where p2.id = r.PROJECT_ID) related_pn',
'  from SP_PROJECT_RELATED r,',
'         sp_projects p,',
'       sp_initiatives i,',
'       sp_areas a',
'where  RELATED_PROJECT_ID = :P3_PROJECT_ID and',
'       r.RELATED_PROJECT_ID = p.id and ',
'       i.id = p.initiative_id and ',
'       i.area_id = a.id and ',
'       p.DUPLICATE_OF_PROJECT_ID is null and',
'       p.ARCHIVED_YN = ''N''',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P3_PROJECT_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Related'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11048520777120204121)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10:P10_ID:#ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'MIKE'
,p_internal_uid=>814466435973699721
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11048520843024204122)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11048521047920204124)
,p_db_column_name=>'RELATED_PROJECT_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Related Project Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11048521355993204127)
,p_db_column_name=>'CREATED'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11048521482571204128)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11048521545123204129)
,p_db_column_name=>'UPDATED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11048521720324204130)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11048521745604204131)
,p_db_column_name=>'RELATED_PROJECT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Related &NOMENCLATURE_PROJECT.'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#RELATED_FI#,#RELATED_PN#'
,p_column_linktext=>'#RELATED_PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14836461016063655725)
,p_db_column_name=>'PROJECT'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'&NOMENCLATURE_PROJECT.'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#RELATED_FI#,#RELATED_PN#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14836461094966655726)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Project Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14836461412304655729)
,p_db_column_name=>'PROJECT_RELATION'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Relationship'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14836461846120655734)
,p_db_column_name=>'RELATED_INITIATIVE'
,p_display_order=>140
,p_column_identifier=>'P'
,p_column_label=>'Related &NOMENCLATURE_INITIATIVE.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14836462030139655735)
,p_db_column_name=>'RELATED_AREA'
,p_display_order=>150
,p_column_identifier=>'Q'
,p_column_label=>'Related &NOMENCLATURE_AREA.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14836462114164655736)
,p_db_column_name=>'ARIA_ID'
,p_display_order=>160
,p_column_identifier=>'R'
,p_column_label=>'Aria Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14836462184934655737)
,p_db_column_name=>'INITIATIVE_ID'
,p_display_order=>170
,p_column_identifier=>'S'
,p_column_label=>'Initiative Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17021978224672113650)
,p_db_column_name=>'FRIENDLY_IDENTIFIER'
,p_display_order=>180
,p_column_identifier=>'T'
,p_column_label=>'Friendly Identifier'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17338228186362072901)
,p_db_column_name=>'PROJECT_URL_NAME'
,p_display_order=>190
,p_column_identifier=>'U'
,p_column_label=>'Project Url Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17338228253177072902)
,p_db_column_name=>'RELATED_FI'
,p_display_order=>200
,p_column_identifier=>'V'
,p_column_label=>'Related Fi'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17338228346806072903)
,p_db_column_name=>'RELATED_PN'
,p_display_order=>210
,p_column_identifier=>'W'
,p_column_label=>'Related Pn'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15060242963541540920)
,p_db_column_name=>'PCT_COMPLETE'
,p_display_order=>220
,p_column_identifier=>'X'
,p_column_label=>'Pct Complete'
,p_column_html_expression=>'#PCT_COMPLETE#%'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11276378873515580321)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10423246'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT:RELATED_PROJECT:PROJECT_RELATION:RELATED_AREA:RELATED_INITIATIVE:CREATED:'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11424699967460781421)
,p_plug_name=>'Contributors'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11424700079954781422)
,p_plug_name=>'contributors content'
,p_title=>'Contributors'
,p_parent_plug_id=>wwv_flow_imp.id(11424699967460781421)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.ID,',
'       t.first_name||'' ''||t.last_name name,',
'       c.TEAM_MEMBER_ID,',
'       (select RESOURCE_TYPE from SP_RESOURCE_TYPES r where r.id = c.RESPONSIBILITY_ID) responsibility,',
'       c.tags,',
'       c.CREATED,',
'       c.updated,',
'       c.responsibility comments,',
'       --',
'       nvl((select count(*) from SP_PROJECT_COMMENTS pc where pc.PROJECT_ID = c.project_id and pc.AUTHOR_ID = c.team_member_id),0) +',
'       nvl((select count(*) from SP_PROJECT_DOCUMENTS pd where pd.PROJECT_ID = c.project_id and pd.created_by = upper(t.email)),0) +',
'       nvl((select count(*) from SP_PROJECT_LINKS l where l.PROJECT_ID = c.project_id and l.created_by = upper(t.email)),0) ',
'       contributions',
'  from SP_PROJECT_CONTRIBUTORS c,',
'       SP_TEAM_MEMBERS t',
'where c.project_id = :P3_PROJECT_ID and',
'      t.id = c.TEAM_MEMBER_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P3_PROJECT_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'tasks content'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11424700235244781423)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_ID:#ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'SBKENNED'
,p_internal_uid=>1190645894098277023
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11424700282481781424)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11424701480654781436)
,p_db_column_name=>'NAME'
,p_display_order=>90
,p_column_identifier=>'C'
,p_column_label=>'Name'
,p_column_link=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:73:P73_TEAM_MEMBER_ID:#TEAM_MEMBER_ID#'
,p_column_linktext=>'#NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11424701841260781440)
,p_db_column_name=>'RESPONSIBILITY'
,p_display_order=>130
,p_column_identifier=>'G'
,p_column_label=>'Responsibility'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11424702001497781441)
,p_db_column_name=>'TAGS'
,p_display_order=>140
,p_column_identifier=>'H'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11424702046287781442)
,p_db_column_name=>'CREATED'
,p_display_order=>150
,p_column_identifier=>'I'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11424700995960781431)
,p_db_column_name=>'UPDATED'
,p_display_order=>160
,p_column_identifier=>'B'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11424702239467781443)
,p_db_column_name=>'COMMENTS'
,p_display_order=>170
,p_column_identifier=>'J'
,p_column_label=>'Comments'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11424702293685781444)
,p_db_column_name=>'CONTRIBUTIONS'
,p_display_order=>180
,p_column_identifier=>'K'
,p_column_label=>'Contributions'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11439077900605817802)
,p_db_column_name=>'TEAM_MEMBER_ID'
,p_display_order=>190
,p_column_identifier=>'L'
,p_column_label=>'Team Member Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11437281817362673062)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'12032275'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NAME:RESPONSIBILITY:COMMENTS:CONTRIBUTIONS:CREATED:UPDATED'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'NAME'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19846518910674368226)
,p_plug_name=>'contributor button container'
,p_parent_plug_id=>wwv_flow_imp.id(11424700079954781422)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from SP_PROJECT_HISTORY',
' where project_id = :P3_PROJECT_ID',
'   and attribute_column = ''CONTRIBUTOR'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14605934198933650833)
,p_plug_name=>'Comments'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14605934270419650834)
,p_plug_name=>'Comment Form'
,p_parent_plug_id=>wwv_flow_imp.id(14605934198933650833)
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(116194800787357778995)
,p_name=>'Comments Report'
,p_region_name=>'COMMENTS'
,p_parent_plug_id=>wwv_flow_imp.id(14605934198933650833)
,p_template=>4501440665235496320
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_component_template_options=>'#DEFAULT#:t-Comments--chat'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select pc.ID,',
'       -- Display Columns',
'       tm.initials user_icon,',
'       pc.created comment_date,',
'       tm.first_name || '' '' || tm.last_name user_name,',
'       --',
'       pc.body_html comment_text,',
'       case when lower(pc.created_by) = lower(:app_user)',
'            then ''<a href="''||apex_util.prepare_URL(',
'                 p_url => ''f?p=''||:APP_ID||'':28:''||:APP_SESSION||''::NO:28:P28_ID:''||pc.id,',
'                 p_checksum_type => ''3''',
'                 )||''">edit</a>'' ',
'            end actions,',
'       decode(pc.private_yn,null,null,''N'',null,''Y'','' Private Comment'') private_comment_label,',
'       '' '' attribute_1,',
'       '' '' attribute_2,',
'       '' '' attribute_3,',
'       '' '' attribute_4,',
'       ''u-color-''||ora_hash(pc.created_by,45) icon_modifier,',
'',
'       -- Data Columns',
'       pc.ROW_VERSION,',
'       pc.PROJECT_ID,',
'       pc.BODY,',
'       pc.BODY_HTML,',
'       pc.PUBLISH_YN,',
'       pc.AUTHOR_APP_USER,',
'       pc.AUTHOR_ID,',
'       pc.CONTENT_FLAG_STATUS,',
'       --',
'       pc.CREATED,',
'       pc.CREATED_BY,',
'       pc.UPDATED,',
'       pc.UPDATED_BY,',
'       tm.id team_member_id',
'  from SP_PROJECT_COMMENTS pc, ',
'       sp_team_members tm',
'where pc.author_id = tm.id and',
'      pc.project_id = :P3_PROJECT_ID and',
'      pc.comment_on = ''PROJECT'' and ',
'      (nvl(pc.private_yn,''N'') = ''N'' or lower(pc.created_by) = lower(:app_user) )',
'order by created desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P3_PROJECT_ID'
,p_lazy_loading=>false
,p_query_row_template=>2613168815517880001
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Comments'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194800860951778996)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194802236464779010)
,p_query_column_id=>2
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>150
,p_column_heading=>'User Icon'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194802403254779011)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>160
,p_column_heading=>'Comment Date'
,p_column_format=>'SINCE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194802506448779012)
,p_query_column_id=>4
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>170
,p_column_heading=>'User Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194802579512779013)
,p_query_column_id=>5
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>180
,p_column_heading=>'Comment Text'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if PRIVATE_COMMENT_LABEL/}<strong class="u-danger-text">#PRIVATE_COMMENT_LABEL#</strong><br />{endif/}',
'#COMMENT_TEXT#'))
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194802643305779014)
,p_query_column_id=>6
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>190
,p_column_heading=>'Actions'
,p_report_column_required_role=>wwv_flow_imp.id(149556930589415434424)
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14605934607527650837)
,p_query_column_id=>7
,p_column_alias=>'PRIVATE_COMMENT_LABEL'
,p_column_display_sequence=>270
,p_column_heading=>'Private Comment Label'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194802814071779015)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>200
,p_column_heading=>'Attribute 1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194802849335779016)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>210
,p_column_heading=>'Attribute 2'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(124765700201091036167)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>220
,p_column_heading=>'Attribute 3'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(124765700237433036168)
,p_query_column_id=>11
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>230
,p_column_heading=>'Attribute 4'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(124765700340158036169)
,p_query_column_id=>12
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>240
,p_column_heading=>'Icon Modifier'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194800971603778997)
,p_query_column_id=>13
,p_column_alias=>'ROW_VERSION'
,p_column_display_sequence=>20
,p_column_heading=>'Row Version'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194801094884778998)
,p_query_column_id=>14
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>30
,p_column_heading=>'Project Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194801158496778999)
,p_query_column_id=>15
,p_column_alias=>'BODY'
,p_column_display_sequence=>40
,p_column_heading=>'Body'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194801327393779000)
,p_query_column_id=>16
,p_column_alias=>'BODY_HTML'
,p_column_display_sequence=>50
,p_column_heading=>'Body Html'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194801417613779001)
,p_query_column_id=>17
,p_column_alias=>'PUBLISH_YN'
,p_column_display_sequence=>60
,p_column_heading=>'Publish Yn'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194801516425779002)
,p_query_column_id=>18
,p_column_alias=>'AUTHOR_APP_USER'
,p_column_display_sequence=>70
,p_column_heading=>'Author App User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194801602096779003)
,p_query_column_id=>19
,p_column_alias=>'AUTHOR_ID'
,p_column_display_sequence=>80
,p_column_heading=>'Author Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194801683195779004)
,p_query_column_id=>20
,p_column_alias=>'CONTENT_FLAG_STATUS'
,p_column_display_sequence=>90
,p_column_heading=>'Content Flag Status'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194801876671779006)
,p_query_column_id=>21
,p_column_alias=>'CREATED'
,p_column_display_sequence=>110
,p_column_heading=>'Created'
,p_column_format=>'SINCE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194801962493779007)
,p_query_column_id=>22
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>120
,p_column_heading=>'Created By'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194802053642779008)
,p_query_column_id=>23
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(116194802178623779009)
,p_query_column_id=>24
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>140
,p_column_heading=>'Updated By'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(124734657464463559080)
,p_query_column_id=>25
,p_column_alias=>'TEAM_MEMBER_ID'
,p_column_display_sequence=>250
,p_column_heading=>'User ID'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17257582559059253683)
,p_plug_name=>'Breadcrumb'
,p_region_sub_css_classes=>'has-header-actions'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>0
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18121925914092268501)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(17257582559059253683)
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
 p_id=>wwv_flow_imp.id(18121927147598268513)
,p_name=>'ACTIONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIONS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21062912982816426634)
,p_plug_name=>'Duplicate of:'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning:margin-bottom-none'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'&P3_DUP_PROJECT.'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select 1 from sp_projects where id = :P3_PROJECT_ID and DUPLICATE_OF_PROJECT_ID is not null'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21062913048090426635)
,p_plug_name=>'Archived &NOMENCLATURE_PROJECT.'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning:margin-bottom-none'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select ARCHIVED_YN from sp_projects where id = :P3_PROJECT_ID and ARCHIVED_YN = ''Y'''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22139812640087252020)
,p_plug_name=>'Description'
,p_region_name=>'DESCRIPTION'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23828521231231297746)
,p_plug_name=>'description button container'
,p_parent_plug_id=>wwv_flow_imp.id(22139812640087252020)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>1102
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41349812503142670145)
,p_plug_name=>'description content'
,p_title=>'Description'
,p_parent_plug_id=>wwv_flow_imp.id(22139812640087252020)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>120
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    x clob;',
'begin',
'x := ''No description provided.'';',
'for c1 in (select description from sp_projects d ',
'            where d.id = :P3_PROJECT_ID',
'              and description is not null) loop',
'    x := apex_markdown.to_html(c1.description);',
'end loop;',
'return x;',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22211880150373173007)
,p_plug_name=>'footer'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>140
,p_plug_display_point=>'REGION_POSITION_05'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11789952245001593111)
,p_name=>'Additional Attriubtes'
,p_parent_plug_id=>wwv_flow_imp.id(22211880150373173007)
,p_template=>4501440665235496320
,p_display_sequence=>500
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id,',
'       p.created,',
'       --',
'       --',
'       --',
'       p.project_group_id,',
'       (select group_name from sp_project_groups pg where pg.id = p.project_group_id) project_group,',
'       --',
'       nvl((select first_name||'' ''||last_name from sp_team_members tm ',
'        where tm.email = lower(p.created_by)),lower(p.created_by)) created_by,',
'       (select id from sp_team_members tm ',
'         where tm.email = lower(p.created_by)) created_by_id,',
'       lower(p.created_by) created_by_email,',
'       --',
'       p.updated,',
'       --',
'       nvl((select first_name||'' ''||last_name from sp_team_members tm ',
'        where tm.email = lower(p.updated_by)),lower(p.updated_by)) updated_by,',
'       (select id from sp_team_members tm ',
'         where tm.email = lower(p.updated_by)) updated_by_id,',
'       lower(p.updated_by) updated_by_email,',
'       --',
'       (select count(*) cnt from SP_FAVORITES f where f.project_id = p.id) favorited,',
'       --',
'       (select count(*) c from sp_proj_interactions_log l where l.project_id = p.id)||'' by ''||',
'       (select count(distinct(app_user)) u ',
'        from sp_proj_interactions_log l ',
'        where l.project_id = p.id) ||'' users'' interactoions,',
'       --',
'       (select count(*)',
'        from SP_PROJECT_HISTORY',
'        where  project_id = p.id) +',
'       (select count(*)',
'        from sp_task_history h,',
'             sp_tasks t,',
'             sp_task_types tt',
'        where h.task_id = t.id',
'        and t.task_type_id = tt.id',
'        and t.project_id = p.id) changes',
'from SP_PROJECTS p',
'where p.id = :P3_PROJECT_ID'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P3_PROJECT_ID'
,p_lazy_loading=>false
,p_query_row_template=>2115772683903439354
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11789955749013593146)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11789954085404593129)
,p_query_column_id=>2
,p_column_alias=>'CREATED'
,p_column_display_sequence=>20
,p_column_heading=>'Created'
,p_column_format=>'SINCE_SHORT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16885493923754600630)
,p_query_column_id=>3
,p_column_alias=>'PROJECT_GROUP_ID'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16885493979814600631)
,p_query_column_id=>4
,p_column_alias=>'PROJECT_GROUP'
,p_column_display_sequence=>10
,p_column_heading=>'Group'
,p_column_link=>'f?p=&APP_ID.:119:&SESSION.::&DEBUG.:RP,119:P119_PROJECT_GROUP_ID:#PROJECT_GROUP_ID#'
,p_column_linktext=>'#PROJECT_GROUP#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11789955499897593143)
,p_query_column_id=>5
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>30
,p_column_heading=>'Created By'
,p_column_link=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_TEAM_MEMBER_ID:#CREATED_BY_ID#'
,p_column_linktext=>'#CREATED_BY#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16100681725610685424)
,p_query_column_id=>6
,p_column_alias=>'CREATED_BY_ID'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16885491081687600602)
,p_query_column_id=>7
,p_column_alias=>'CREATED_BY_EMAIL'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11789954327089593131)
,p_query_column_id=>8
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>40
,p_column_heading=>'Updated'
,p_column_format=>'SINCE_SHORT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11789956016391593148)
,p_query_column_id=>9
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>50
,p_column_heading=>'Updated By'
,p_column_link=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_TEAM_MEMBER_ID:#UPDATED_BY_ID#'
,p_column_linktext=>'#UPDATED_BY#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16100681835900685425)
,p_query_column_id=>10
,p_column_alias=>'UPDATED_BY_ID'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16885491141789600603)
,p_query_column_id=>11
,p_column_alias=>'UPDATED_BY_EMAIL'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11789955381007593142)
,p_query_column_id=>12
,p_column_alias=>'FAVORITED'
,p_column_display_sequence=>110
,p_column_heading=>'Favorited'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16885491000266600601)
,p_query_column_id=>13
,p_column_alias=>'INTERACTOIONS'
,p_column_display_sequence=>80
,p_column_heading=>'Interactions'
,p_column_link=>'f?p=&APP_ID.:600:&SESSION.::&DEBUG.:RP,600:P600_PROJECT_ID:#ID#'
,p_column_linktext=>'#INTERACTOIONS#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11789956098961593149)
,p_query_column_id=>14
,p_column_alias=>'CHANGES'
,p_column_display_sequence=>70
,p_column_heading=>'Changes'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_link=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:64:p64_project_id:#ID#'
,p_column_linktext=>'#CHANGES#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24578149357484384821)
,p_plug_name=>'Activity'
,p_region_name=>'ACTIVITY'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(24517378663928473922)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24528493753787933683)
,p_plug_name=>'activity content'
,p_title=>'Activity'
,p_parent_plug_id=>wwv_flow_imp.id(24578149357484384821)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>121
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ap.id, ',
'       at.activity_type,',
'       ap.comments,',
'       ap.start_date,',
'       ap.end_date,',
'       to_char(ap.end_date,''Day DD-MON-YYYY'') end_date_formatted,',
'       to_char(ap.start_date,''Day DD-MON-YYYY'')||'' to ''||to_char(ap.end_date,''Day DD-MON-YYYY'') TIMELINE,',
'       ap.end_date - ap.start_date days,',
'       round(ap.end_date - sysdate) days_remaining,',
'       ap.url,',
'       tm.first_name||'' ''||tm.last_name name,',
'       --',
'       p.project,',
'       p.friendly_identifier,',
'       p.PROJECT_URL_NAME,',
'       apex_util.get_since(ap.updated) last_updated,',
'       --',
'       tm.first_name||'' ''||tm.last_name owner,',
'       --',
'       -- optional initiative',
'       --',
'       decode(ap.initiative_id,null,null,(',
'           select initiative from sp_initiatives where id = ap.initiative_id',
'       )) initiative,',
'       ap.initiative_id,',
'       --',
'       -- timeframe',
'       --',
'        decode(',
'           greatest(trunc(sysdate),trunc(ap.end_date)),',
'           trunc(sysdate),',
'           ''Past'',',
'           decode(',
'               greatest(trunc(sysdate),trunc(ap.start_date)),',
'               trunc(sysdate),',
'               ''Current'',',
'               ''Future'')',
'           ) timeframe,',
'       --',
'       -- pie chart icon in 10% chunks that show time percent complete',
'       --',
'       ''fa-pie-chart-''||sp_date_range_pct_comp(ap.start_date, ap.end_date) icon',
'from sp_activities ap,',
'     sp_projects p,',
'     sp_activity_types at,',
'     sp_team_members tm',
'where ap.project_id = p.id and',
'      p.id = :P3_PROJECT_ID and',
'      ap.activity_type_id = at.id and',
'      ap.team_member_id = tm.id and',
'      --',
'      --',
'      --',
'      (  ',
'         trunc(sysdate) between ap.start_date and ap.end_date or ',
'         (nvl(:P3_INCLUDE_FUTURE,''N'') = ''Y'' and ap.start_date >= trunc(sysdate)) or',
'         (nvl(:P3_INCLUDE_PAST,''N'') = ''Y'' and ap.end_date < trunc(sysdate))',
'      )',
'order by ap.updated desc',
''))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$CONTENT_ROW'
,p_ajax_items_to_submit=>'P3_PROJECT_ID,P3_INCLUDE_FUTURE,P3_INCLUDE_PAST'
,p_plug_query_num_rows=>30
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_required_patch=>wwv_flow_imp.id(24517378663928473922)
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'APPLY_THEME_COLORS', 'Y',
  'AVATAR_ICON', '&ICON.',
  'AVATAR_SHAPE', 't-Avatar--noShape',
  'AVATAR_SIZE', 't-Avatar--md',
  'AVATAR_TYPE', 'icon',
  'BADGE_COL_WIDTH', 't-ContentRow-badge--lg',
  'BADGE_LABEL', '&NOMENCLATURE_PROJECTS.',
  'BADGE_LABEL_DISPLAY', 'N',
  'BADGE_VALUE', 'TIMEFRAME',
  'DESCRIPTION', wwv_flow_string.join(wwv_flow_t_varchar2(
    '<strong>Owner</strong>: &OWNER.<br>',
    '<strong>&ACTIVITY_TYPE.</strong>: &TIMELINE.<br>',
    '{if PROJECT/}<strong>&NOMENCLATURE_PROJECT.</strong>: &PROJECT.<br>{endif/}',
    '{if INITIATIVE/}<strong>&NOMENCLATURE_INITIATIVE.</strong>: &INITIATIVE.<br>{endif/}')),
  'DISPLAY_AVATAR', 'Y',
  'DISPLAY_BADGE', 'Y',
  'HIDE_BORDERS', 'N',
  'MISC', 'Updated &LAST_UPDATED.',
  'REMOVE_PADDING', 'N',
  'TITLE', '&COMMENTS.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(11914011914593314312)
,p_name=>'TIMEFRAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIMEFRAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>340
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15702849222386490539)
,p_name=>'INITIATIVE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INITIATIVE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>350
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15702849272167490540)
,p_name=>'INITIATIVE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INITIATIVE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>360
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24528493929093933684)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24528495321712933698)
,p_name=>'DAYS_REMAINING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DAYS_REMAINING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>150
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24528495473451933700)
,p_name=>'ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>170
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24528497417811933719)
,p_name=>'ACTIVITY_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVITY_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>190
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24528497533088933720)
,p_name=>'COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENTS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>200
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24528497633899933721)
,p_name=>'START_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'START_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>210
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24528497725639933722)
,p_name=>'END_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'END_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>220
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24549730417671485173)
,p_name=>'DAYS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DAYS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>230
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24549730454907485174)
,p_name=>'URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>240
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24549730608726485175)
,p_name=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>250
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24549730731256485176)
,p_name=>'PROJECT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>260
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24549730779981485177)
,p_name=>'FRIENDLY_IDENTIFIER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FRIENDLY_IDENTIFIER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>270
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24549730841794485178)
,p_name=>'TIMELINE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TIMELINE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>280
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24549730989155485179)
,p_name=>'PROJECT_URL_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROJECT_URL_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>290
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24549731119060485180)
,p_name=>'LAST_UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LAST_UPDATED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>300
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24549731892055485188)
,p_name=>'END_DATE_FORMATTED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'END_DATE_FORMATTED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>310
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(24578151567779384843)
,p_name=>'OWNER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OWNER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>330
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24578149505589384822)
,p_plug_name=>'Activity Filters'
,p_parent_plug_id=>wwv_flow_imp.id(24578149357484384821)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>1111
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27131733073126351624)
,p_plug_name=>'Tasks'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27131733321060351626)
,p_plug_name=>'task content'
,p_title=>'Tasks'
,p_parent_plug_id=>wwv_flow_imp.id(27131733073126351624)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with today as (select trunc(sysdate) day from dual)',
'select r.ID,',
'       --',
'       (select case when first_name is not null or last_name is not null',
'                    then first_name||'' ''||last_name',
'                    else email',
'                    end',
'               from sp_team_members t where t.id = r.owner_id) owner,',
'       --',
'       (select task_type from sp_task_types rt where rt.id = r.task_type_id)||',
'           case when r.task_sub_type_id is not null then '': '' end ||',
'           (select task_type from sp_task_types rt where rt.id = r.task_sub_type_id) ||',
'           case when r.task is not null then '' - ''||r.task end type,',
'       --',
'       case when length(r.description) > 200',
'            then substr(r.description,1,200)||''...''',
'            else r.description',
'            end description,',
'       --',
'       s.status,',
'       s.display_seq,',
'       r.start_date,',
'       r.target_complete,',
'       case when s.indicates_complete_yn = ''N'' and',
'                 r.target_complete is not null',
'            then least(5, trunc(r.target_complete) - trunc(r.target_complete, ''iw'') + 1)',
'                 - least(5, today.day - trunc(today.day, ''iw'') + 1)',
'                 + (trunc(r.target_complete, ''iw'') - trunc(today.day, ''iw'')) * 5 / 7',
'       end weekdays_left,',
'       --',
'       r.updated,',
'       --',
'       (select count(*) from sp_task_comments ',
'         where task_id = r.id',
'          and (nvl(private_yn,''N'') = ''N''  or lower(created_by) = lower(:app_user) )) nbr_comments,',
'       --',
'       (select count(*) from sp_task_documents where task_id = r.id) nbr_docs,',
'       (select count(*) from sp_task_links where task_id = r.id) nbr_links,',
'       t.display_seq ob',
'  from sp_tasks r,',
'       sp_task_types t,',
'       sp_task_statuses s,',
'       today',
' where project_id = :P3_PROJECT_ID',
'   and nvl(r.task_sub_type_id,r.task_type_id) = t.id',
'   and r.status_id = s.id (+)',
'   and t.static_id not like ''MILESTONE%''',
'   and t.static_id not like ''REVIEW%'''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P3_PROJECT_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'tasks content'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(27131733362334351627)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:501:&SESSION.::&DEBUG.:RP,501:P501_ID:#ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'SBKENNED'
,p_internal_uid=>16897679021187847227
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27131733517020351628)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27131733904625351632)
,p_db_column_name=>'TYPE'
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>'Task'
,p_column_link=>'f?p=&APP_ID.:502:&SESSION.::&DEBUG.:502:P502_TASK_ID,P502_PROJECT_ID,P502_PREV_PAGE:#ID#,&P3_PROJECT_ID.,3'
,p_column_linktext=>'#TYPE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28345380782597316302)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>40
,p_column_identifier=>'I'
,p_column_label=>'Details'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27131733680222351630)
,p_db_column_name=>'OWNER'
,p_display_order=>50
,p_column_identifier=>'C'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27131733757998351631)
,p_db_column_name=>'STATUS'
,p_display_order=>60
,p_column_identifier=>'D'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27131734400326351637)
,p_db_column_name=>'START_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Start'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27131734458187351638)
,p_db_column_name=>'TARGET_COMPLETE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Complete'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27131733627249351629)
,p_db_column_name=>'UPDATED'
,p_display_order=>90
,p_column_identifier=>'B'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28345385040912316344)
,p_db_column_name=>'NBR_COMMENTS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Comments'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28345385132902316345)
,p_db_column_name=>'NBR_DOCS'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Documents'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28345385145737316346)
,p_db_column_name=>'NBR_LINKS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Links'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28512075452740784439)
,p_db_column_name=>'OB'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Task OB'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14025086532691589550)
,p_db_column_name=>'DISPLAY_SEQ'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Status OB'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20235788797218330548)
,p_db_column_name=>'WEEKDAYS_LEFT'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>'Weekdays Left'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(28345025767050284522)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'181109715'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TYPE:OWNER:STATUS:START_DATE:TARGET_COMPLETE:WEEKDAYS_LEFT:DESCRIPTION:UPDATED'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'DISPLAY_SEQ'
,p_sort_direction_2=>'ASC NULLS LAST'
,p_sort_column_3=>'OB'
,p_sort_direction_3=>'ASC NULLS FIRST'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(13802730536971216417)
,p_report_id=>wwv_flow_imp.id(28345025767050284522)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'STATUS'
,p_operator=>'!='
,p_expr=>'Completed'
,p_condition_sql=>'"STATUS" != #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# != ''Completed''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(41711956957890422346)
,p_name=>'Project Details'
,p_template=>4501440665235496320
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked:t-Report--hideNoPagination'
,p_display_point=>'REGION_POSITION_01'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.ID,',
'       p.INITIATIVE_ID,',
'       f.area focus_area,',
'       f.id focus_area_id,',
'       i.initiative,',
'       p.PROJECT,',
'       --',
'       -- initiative focus area',
'       --',
'       (select focus_area from SP_INITIATIVE_FOCUS_AREAS ifa where ifa.id = p.FOCUS_AREA_ID) initiative_focus_area,',
'       (select id from SP_INITIATIVE_FOCUS_AREAS ifa where ifa.id = p.FOCUS_AREA_ID) init_focus_area_id,',
'       --',
'       -- owner',
'       --',
'       (select t.first_name||'' ''||t.last_name',
'       from SP_TEAM_MEMBERS t ',
'       where t.id = p.OWNER_ID) project_owner,',
'       --',
'       p.owner_id,',
'       --',
'       nvl(decode(p.RELEASE_DEPENDENT_YN,''N'',p.TARGET_COMPLETE,',
'           (select release_target_date from SP_RELEASE_TRAINS t where t.id = p.release_id) ),p.TARGET_COMPLETE) target_complete,',
'       --',
'       -- status',
'       --',
'       case p.pct_complete when 0 then s.pc0_label   ||'' - ''|| p.pct_complete ||''%''',
'                           when 10 then s.pc10_label ||'' - ''|| p.pct_complete ||''%''',
'                           when 20 then s.pc20_label ||'' - ''|| p.pct_complete ||''%''',
'                           when 30 then s.pc30_label ||'' - ''|| p.pct_complete ||''%''',
'                           when 40 then s.pc40_label ||'' - ''|| p.pct_complete ||''%''',
'                           when 50 then s.pc50_label ||'' - ''|| p.pct_complete ||''%''',
'                           when 60 then s.pc60_label ||'' - ''|| p.pct_complete ||''%''',
'                           when 70 then s.pc70_label ||'' - ''|| p.pct_complete ||''%''',
'                           when 80 then s.pc80_label ||'' - ''|| p.pct_complete ||''%''',
'                           when 90 then s.pc90_label ||'' - ''|| p.pct_complete ||''%''',
'                           when 100 then s.pc100_label ||'' - ''|| p.pct_complete ||''%''',
'                           end as status,',
'       --',
'       -- priority',
'       --',
'       p.PRIORITY_ID,',
'       nvl((select ''P''||PRIORITY from sp_project_priorities pp where pp.id = p.priority_id),''Not Prioritized'') priority,',
'       --',
'       -- Group',
'       --',
'       (select group_name ',
'       from sp_project_groups pg ',
'       where p.project_group_id = pg.id) project_group,',
'       --',
'       nvl(decode(p.RELEASE_DEPENDENT_YN,''Yes'',''No''),''No'') RELEASE_DEPENDENT_YN,',
'       --',
'       -- only show release if tagged as release dependent',
'       --',
'       decode(p.RELEASE_DEPENDENT_YN,',
'           ''Y'',(select RELEASE_TRAIN||'' ''||release from SP_RELEASE_TRAINS r where r.id = p.release_id),',
'           decode(p.TARGET_COMPLETE,null,''Not Targeted'',to_char(p.TARGET_COMPLETE,''DD-MON-YYYY''))) release,',
'       --',
'       p.release_id,',
'       p.TAGS,',
'       p.CREATED,',
'       p.CREATED_BY,',
'       p.UPDATED,',
'       p.UPDATED_BY,',
'       p.project_size,',
'       p.friendly_identifier,',
'       decode(p.ACTIVE_YN,''Y'',''Yes'',''N'',''No'',''Unknown'') active_yn,',
'       --',
'       -- external link',
'       --',
'       p.external_system_link,',
'       p.friendly_identifier ||'' <button type="button" title="Copy Permalink" aria-label="Copy Permalink" data-clipboard-source="''||:P3_PERMALINK_PREFIX||p.friendly_identifier||''&pn=''||p.project_url_name||''" class="t-Button t-Button--noLabel t-Button'
||'--icon t-Button--link padding-none">''||''<span class="fa fa-copy" aria-hidden="true"></span>''||''</button>'' perma_link,',
'       p.external_ticket_identifier,',
'       --',
'       -- favorite_icon',
'       --',
'       nvl((select ''<span class="fa fa-heart u-danger-text" aria-hidden="true"></span>'' ',
'            from sp_favorites fav ',
'            where fav.project_id = p.id and ',
'                  fav.team_member_id = :APP_USER_ID),',
'                  ''<span class="fa fa-heart-o" aria-hidden="true"></span>'') favorite_icon',
'       --',
'  from SP_PROJECTS p, ',
'       SP_INITIATIVES i,',
'       SP_AREAS f,',
'       SP_PROJECT_SCALES s',
'where ',
'      p.initiative_id = i.id and',
'      i.area_id = f.id and',
'      p.id = :P3_PROJECT_ID and  ',
'      p.status_scale = s.scale_letter',
'     '))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'APP_USER_ID,P3_PROJECT_ID'
,p_lazy_loading=>false
,p_query_row_template=>2115772683903439354
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711956985954422347)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711957086276422348)
,p_query_column_id=>2
,p_column_alias=>'INITIATIVE_ID'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711957251023422349)
,p_query_column_id=>3
,p_column_alias=>'FOCUS_AREA'
,p_column_display_sequence=>30
,p_column_heading=>'&NOMENCLATURE_AREA.'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_FOCUS_AREA:#FOCUS_AREA#'
,p_column_linktext=>'#FOCUS_AREA#'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ifa.focus_area ',
'  from SP_PROJECTS p, ',
'       SP_INITIATIVES i,',
'       SP_AREAS f,',
'       SP_PROJECT_SCALES s,',
'       SP_INITIATIVE_FOCUS_AREAS ifa',
'where ',
'      i.area_id = f.id and',
'      p.id = :P3_PROJECT_ID and  ',
'      p.status_scale = s.scale_letter and ',
'      ifa.id = p.FOCUS_AREA_ID and ',
'      trim(ifa.focus_area) is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711958794993422365)
,p_query_column_id=>4
,p_column_alias=>'FOCUS_AREA_ID'
,p_column_display_sequence=>220
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711957296979422350)
,p_query_column_id=>5
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>40
,p_column_heading=>'&NOMENCLATURE_INITIATIVE.'
,p_column_link=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP,:P94_INITIATIVE_ID:#INITIATIVE_ID#'
,p_column_linktext=>'#INITIATIVE#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711957449979422351)
,p_query_column_id=>6
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(26540072375492957823)
,p_query_column_id=>7
,p_column_alias=>'INITIATIVE_FOCUS_AREA'
,p_column_display_sequence=>50
,p_column_heading=>'Focus Area'
,p_column_link=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:33:P33_INIT_FOCUS_AREA_ID:#INIT_FOCUS_AREA_ID#'
,p_column_linktext=>'#INITIATIVE_FOCUS_AREA#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27267754877707923728)
,p_query_column_id=>8
,p_column_alias=>'INIT_FOCUS_AREA_ID'
,p_column_display_sequence=>300
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41862936657705777426)
,p_query_column_id=>9
,p_column_alias=>'PROJECT_OWNER'
,p_column_display_sequence=>70
,p_column_heading=>'Owner'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RR,5:P5_ID:#OWNER_ID#'
,p_column_linktext=>'#PROJECT_OWNER#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41862936625096777425)
,p_query_column_id=>10
,p_column_alias=>'OWNER_ID'
,p_column_display_sequence=>230
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711957658585422353)
,p_query_column_id=>11
,p_column_alias=>'TARGET_COMPLETE'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from SP_PROJECTS p',
'where ',
'      RELEASE_DEPENDENT_YN = ''N'' and',
'      p.id = :P3_PROJECT_ID and ',
'      p.target_complete is not null'))
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711957869765422355)
,p_query_column_id=>12
,p_column_alias=>'STATUS'
,p_column_display_sequence=>100
,p_column_heading=>'Completeness'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711957947561422356)
,p_query_column_id=>13
,p_column_alias=>'PRIORITY_ID'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711958070775422357)
,p_query_column_id=>14
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>120
,p_column_heading=>'Priority'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11137835405673223113)
,p_query_column_id=>15
,p_column_alias=>'PROJECT_GROUP'
,p_column_display_sequence=>60
,p_column_heading=>'Group'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>'select 1 from sp_projects where project_group_id is not null and id = :P3_PROJECT_ID'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711958161547422358)
,p_query_column_id=>16
,p_column_alias=>'RELEASE_DEPENDENT_YN'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711958271087422359)
,p_query_column_id=>17
,p_column_alias=>'RELEASE'
,p_column_display_sequence=>150
,p_column_heading=>'Release'
,p_column_link=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.:RP,117:p117_release_id:#RELEASE_ID#'
,p_column_linktext=>'#RELEASE#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 x',
'  from SP_PROJECTS p',
'where ',
'      p.id = :P3_PROJECT_ID and',
'      trim(decode(p.RELEASE_DEPENDENT_YN,',
'           ''Y'',(select RELEASE_TRAIN||release from SP_RELEASE_TRAINS r where r.id = p.release_id),',
'           decode(p.TARGET_COMPLETE,null,null,to_char(p.TARGET_COMPLETE,''DD-MON-YYYY''))) ) is not null'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(31870179652397298346)
,p_query_column_id=>18
,p_column_alias=>'RELEASE_ID'
,p_column_display_sequence=>270
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711958276934422360)
,p_query_column_id=>19
,p_column_alias=>'TAGS'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711958447616422361)
,p_query_column_id=>20
,p_column_alias=>'CREATED'
,p_column_display_sequence=>180
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711958560724422362)
,p_query_column_id=>21
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>190
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711958661983422363)
,p_query_column_id=>22
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>200
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(41711958772479422364)
,p_query_column_id=>23
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>210
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10300343212854735337)
,p_query_column_id=>24
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>140
,p_column_heading=>'Size'
,p_column_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:34:P34_ID:#ID#'
,p_column_linktext=>'#PROJECT_SIZE#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(22139810782842252002)
,p_query_column_id=>25
,p_column_alias=>'FRIENDLY_IDENTIFIER'
,p_column_display_sequence=>240
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_required_patch=>wwv_flow_imp.id(15989153410617755570)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(24711884423213498125)
,p_query_column_id=>26
,p_column_alias=>'ACTIVE_YN'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_required_patch=>wwv_flow_imp.id(28325828910135123747)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16496910736625286404)
,p_query_column_id=>27
,p_column_alias=>'EXTERNAL_SYSTEM_LINK'
,p_column_display_sequence=>260
,p_column_heading=>'External Link'
,p_column_html_expression=>'<a href="#EXTERNAL_SYSTEM_LINK#" target="_blank">#EXTERNAL_TICKET_IDENTIFIER#</a>'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from   SP_PROJECTS p',
'where  ID = :P3_PROJECT_ID and ',
'       p.external_ticket_identifier is not null and ',
'       p.external_ticket_system is not null and ',
'       p.display_external_link_yn = ''Y'''))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20235784720737330507)
,p_query_column_id=>28
,p_column_alias=>'PERMA_LINK'
,p_column_display_sequence=>250
,p_column_heading=>'Permalink'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16496910939956286406)
,p_query_column_id=>29
,p_column_alias=>'EXTERNAL_TICKET_IDENTIFIER'
,p_column_display_sequence=>290
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12342028894137717606)
,p_query_column_id=>30
,p_column_alias=>'FAVORITE_ICON'
,p_column_display_sequence=>280
,p_column_heading=>'My Favorite'
,p_column_link=>'f?p=&APP_ID.:128:&SESSION.::&DEBUG.:RP,128:P128_PROJECT_ID:#ID#'
,p_column_linktext=>'#FAVORITE_ICON#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41711958914988422366)
,p_plug_name=>'RDS'
,p_region_css_classes=>'u-padding-inline-dynamic project-rds-region'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_08'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'SESSION')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(124734657576411559081)
,p_plug_name=>'Links'
,p_region_name=>'LINKS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select :NOMENCLATURE_PROJECT type,',
'       ''6'' edit_page,',
'       l.id, ',
'       l.LINK_name, ',
'       decode(greatest(length(l.link_url),80),80,',
'           l.link_url,',
'           substr(l.link_url,1,39)||''...''||substr(l.link_url,length(l.link_url)-39)',
'           ) link_url,',
'       l.link_url full_url,',
'       l.created, ',
'       l.updated, ',
'       lower(created_by) added_by,',
'       decode(important_yn,''Y'',''Yes'',''N'',''No'',null,''No'') important',
'from SP_PROJECT_LINKS l ',
'where project_id = :P3_PROJECT_ID',
'union all',
'select case when t.task_sub_type_id is not null',
'            then (select task_type from sp_task_types',
'                   where id = t.task_type_id)||'': ''',
'            end ||',
'       tt.task_type || case when t.task is not null then '' - ''||t.task end type,',
'       ''506'' edit_page,',
'       l.id, ',
'       l.LINK_name, ',
'       decode(greatest(length(l.link_url),80),80,',
'           l.link_url,',
'           substr(l.link_url,1,39)||''...''||substr(l.link_url,length(l.link_url)-39)',
'           ) link_url,',
'       l.link_url full_url,',
'       l.created, ',
'       l.updated, ',
'       lower(l.created_by) added_by,',
'       decode(l.important_yn,''Y'',''Yes'',''N'',''No'',null,''No'') important',
'  from SP_TASK_LINKS l,',
'       SP_TASKS t,',
'       sp_task_types tt',
' where t.project_id = :P3_PROJECT_ID',
'   and t.id = l.task_id',
'   and nvl(t.task_sub_type_id,t.task_type_id) = tt.id',
'order by created desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P3_PROJECT_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Links'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11048519847713204112)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:#EDIT_PAGE#:&SESSION.::&DEBUG.:#EDIT_PAGE#:P#EDIT_PAGE#_ID:#ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'MIKE'
,p_internal_uid=>814465506566699712
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11048520017066204113)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11587035934527630828)
,p_db_column_name=>'TYPE'
,p_display_order=>20
,p_column_identifier=>'P'
,p_column_label=>'Belongs to'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from SP_TASK_LINKS l,',
'       SP_TASKS t',
' where t.project_id = :P3_PROJECT_ID',
'   and t.id = l.task_id'))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(24929238793709914225)
,p_db_column_name=>'LINK_NAME'
,p_display_order=>30
,p_column_identifier=>'M'
,p_column_label=>'Link'
,p_column_link=>'#FULL_URL#'
,p_column_linktext=>'#LINK_NAME#'
,p_column_link_attr=>'target="_blank"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11048520145653204115)
,p_db_column_name=>'LINK_URL'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'URL'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11048520428559204117)
,p_db_column_name=>'CREATED'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18411496175187477537)
,p_db_column_name=>'UPDATED'
,p_display_order=>60
,p_column_identifier=>'H'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(24929237753656914215)
,p_db_column_name=>'IMPORTANT'
,p_display_order=>70
,p_column_identifier=>'K'
,p_column_label=>'Important'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(26269779090687083423)
,p_db_column_name=>'ADDED_BY'
,p_display_order=>80
,p_column_identifier=>'N'
,p_column_label=>'Added By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10768145208307431030)
,p_db_column_name=>'FULL_URL'
,p_display_order=>90
,p_column_identifier=>'O'
,p_column_label=>'Full Url'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11587035996368630829)
,p_db_column_name=>'EDIT_PAGE'
,p_display_order=>110
,p_column_identifier=>'Q'
,p_column_label=>'Edit Page'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11067176992556358982)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8331227'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TYPE:LINK_NAME:LINK_URL:IMPORTANT:UPDATED:ADDED_BY:'
,p_sort_column_1=>'IMPORTANT'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'UPDATED'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(124734659362586559099)
,p_plug_name=>'Documents'
,p_region_name=>'DOCUMENTS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select :NOMENCLATURE_PROJECT type,',
'       ''12'' edit_page,',
'       ''30'' display_page,',
'       d.ID,',
'       d.DOCUMENT_FILENAME,',
'       d.UPDATED,',
'       d.created,',
'       decode(greatest(length(d.doc_description),200),200,d.doc_description,substr(d.doc_description,1,200)||''...'') doc_description,',
'       d.tags,',
'       lower(created_by) created_by,',
'       dbms_lob.getlength(d.DOCUMENT_BLOB) doc_size,',
'       created date_created,',
'       substr(DOCUMENT_FILENAME,instr(DOCUMENT_FILENAME,''.'',-1)+1,length(DOCUMENT_FILENAME)-instr(DOCUMENT_FILENAME,''.'',-1)) file_extension,',
'       decode(important_yn,''Y'', ''Yes'',''No'') important',
'  from SP_PROJECT_DOCUMENTS d',
' where project_id = :P3_PROJECT_ID',
'union all',
'select case when t.task_sub_type_id is not null',
'            then (select task_type from sp_task_types',
'                   where id = t.task_type_id)||'': ''',
'            end ||',
'       tt.task_type || case when t.task is not null then '' - ''||t.task end type,',
'       ''504'' edit_page,',
'       ''505'' display_page,',
'       d.ID,',
'       d.DOCUMENT_FILENAME,',
'       d.UPDATED,',
'       d.created,',
'       decode(greatest(length(d.doc_description),200),200,d.doc_description,substr(d.doc_description,1,200)||''...'') doc_description,',
'       d.tags,',
'       lower(d.created_by) created_by,',
'       dbms_lob.getlength(d.DOCUMENT_BLOB) doc_size,',
'       d.created date_created,',
'       substr(d.DOCUMENT_FILENAME,instr(d.DOCUMENT_FILENAME,''.'',-1)+1,length(d.DOCUMENT_FILENAME)-instr(d.DOCUMENT_FILENAME,''.'',-1)) file_extension,',
'       decode(d.important_yn,''Y'', ''Yes'',''No'') important',
'  from SP_TASK_DOCUMENTS d,',
'       SP_TASKS t,',
'       sp_task_types tt',
' where t.project_id = :P3_PROJECT_ID',
'   and t.id = d.task_id',
'   and nvl(t.task_sub_type_id,t.task_type_id) = tt.id',
'order by created desc',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P3_PROJECT_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Documents'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11043273174251854423)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_control_break=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_download=>'N'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:#EDIT_PAGE#:&SESSION.::&DEBUG.:#EDIT_PAGE#:P#EDIT_PAGE#_ID:#ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'MIKE'
,p_internal_uid=>809218833105350023
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11043273275415854424)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11587035629856630825)
,p_db_column_name=>'TYPE'
,p_display_order=>20
,p_column_identifier=>'N'
,p_column_label=>'Belongs to'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from SP_TASK_DOCUMENTS d,',
'       SP_TASKS t',
' where t.project_id = :P3_PROJECT_ID',
'   and t.id = d.task_id'))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11043273407806854425)
,p_db_column_name=>'DOCUMENT_FILENAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Filename'
,p_column_link=>'f?p=&APP_ID.:#DISPLAY_PAGE#:&SESSION.::&DEBUG.:#DISPLAY_PAGE#:P#DISPLAY_PAGE#_ID,P#DISPLAY_PAGE#_PREV_PAGE:#ID#,3'
,p_column_linktext=>'#DOCUMENT_FILENAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11043273832607854429)
,p_db_column_name=>'DOC_DESCRIPTION'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11043274038136854431)
,p_db_column_name=>'DOC_SIZE'
,p_display_order=>50
,p_column_identifier=>'H'
,p_column_label=>'Size'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FILESIZE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11043273584770854427)
,p_db_column_name=>'UPDATED'
,p_display_order=>60
,p_column_identifier=>'D'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11043273660613854428)
,p_db_column_name=>'CREATED'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11043274055174854432)
,p_db_column_name=>'DATE_CREATED'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Created On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11480128245920703211)
,p_db_column_name=>'FILE_EXTENSION'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'File Extension'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22139811949861252014)
,p_db_column_name=>'TAGS'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25160229132377885941)
,p_db_column_name=>'IMPORTANT'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Important'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(26269777388930083406)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Added By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11587035676687630826)
,p_db_column_name=>'EDIT_PAGE'
,p_display_order=>130
,p_column_identifier=>'O'
,p_column_label=>'Edit Page'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11587035784303630827)
,p_db_column_name=>'DISPLAY_PAGE'
,p_display_order=>140
,p_column_identifier=>'P'
,p_column_label=>'Display Page'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11045009409055447194)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8109551'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TYPE:DOCUMENT_FILENAME:DOC_DESCRIPTION:CREATED_BY:IMPORTANT:DOC_SIZE:UPDATED:'
,p_sort_column_1=>'IMPORTANT'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'UPDATED'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_sum_columns_on_break=>'DOC_SIZE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19846518788740368225)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19846518910674368226)
,p_button_name=>'view_contributor_change_history'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'View Contributor Change History'
,p_button_redirect_url=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP,64:P64_PROJECT_ID,P64_ATTRIBUTE_COLUMN:&P3_PROJECT_ID.,Contributor'
,p_icon_css_classes=>'fa-glasses'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19846519124479368228)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19846518956881368227)
,p_button_name=>'view_milesteone_change_history'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'View Milestone Change History'
,p_button_redirect_url=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP,64:P64_PROJECT_ID,P64_PARENT_TYPE:&P3_PROJECT_ID.,Milestone'
,p_icon_css_classes=>'fa-glasses'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19846519871151368236)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19846519764299368235)
,p_button_name=>'view_review_change_history'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'View Review Change History'
,p_button_redirect_url=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP,64:P64_PROJECT_ID,P64_PARENT_TYPE:&P3_PROJECT_ID.,Review'
,p_icon_css_classes=>'fa-glasses'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11048521982227204133)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11048520548622204119)
,p_button_name=>'add_related_project'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Related &NOMENCLATURE_PROJECT.'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11424702545833781447)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11424699967460781421)
,p_button_name=>'add_contributor'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Contributor'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(23828521080059297745)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(23828521231231297746)
,p_button_name=>'view_description_change_history'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'View Description Change History'
,p_button_redirect_url=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP,64:P64_PROJECT_ID,P64_ATTRIBUTE_COLUMN:&P3_PROJECT_ID.,Description'
,p_icon_css_classes=>'fa-glasses'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(124765700585217036171)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(14605934270419650834)
,p_button_name=>'POST_COMMENT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post Comment'
,p_warn_on_unsaved_changes=>null
,p_grid_column_css_classes=>'u-flex u-align-items-center'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11439077773824817801)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11424699967460781421)
,p_button_name=>'about_contributor_roles'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'About Contributor Roles'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-info'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(42879256804679632907)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(124734657576411559081)
,p_button_name=>'add_link'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapTop'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Link'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21062914190028426646)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(21062913048090426635)
,p_button_name=>'unmark_as_archived'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Restore'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:52:&SESSION.::&DEBUG.:RP,52:P52_PROJECT_ID:&P3_PROJECT_ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22049595947464874324)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(21062912982816426634)
,p_button_name=>'view_Duplicate'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'View Primary'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:P3_PROJECT_ID:&P3_DUP_PROJECT_ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21062914011284426644)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(21062912982816426634)
,p_button_name=>'unmark_as_duplidate'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Not a Duplicate'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50:P50_PROJECT_ID:&P3_PROJECT_ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(22139812483153252019)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(41349812503142670145)
,p_button_name=>'edit_description'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edit'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP,32:P32_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-edit'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(24578149774428384825)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(24528493753787933683)
,p_button_name=>'add_activity'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--padLeft:t-Button--gapTop'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Activity'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101:P101_PROJECT_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10949663329939474032)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10949660375803474003)
,p_button_name=>'add_review'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Review'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:509:&SESSION.::&DEBUG.:509:P509_PROJECT_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(10949663410260474033)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10949661864107474018)
,p_button_name=>'add_milestone'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Milestone'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:508:&SESSION.::&DEBUG.:508:P508_PROJECT_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11480127653925703205)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(124734659362586559099)
,p_button_name=>'view_images'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Image Gallery'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:29:P29_PROJECT_ID:&P3_PROJECT_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from SP_PROJECT_DOCUMENTS d',
' where project_id = :P3_PROJECT_ID and ',
'       (',
'           lower(DOCUMENT_FILENAME) like ''%.png'' or ',
'           lower(DOCUMENT_FILENAME) like ''%.jpg'' or ',
'           lower(DOCUMENT_FILENAME) like ''%.jpeg'' or ',
'           lower(DOCUMENT_FILENAME) like ''%.gif'' or ',
'           lower(DOCUMENT_FILENAME) like ''%.tiff'' or ',
'           lower(DOCUMENT_FILENAME) like ''%.ai'' ',
'       )',
'union all',
'select 1 ',
'  from SP_task_DOCUMENTS d,',
'       sp_tasks t',
' where d.task_id = t.id',
'   and t.project_id = :P3_PROJECT_ID and ',
'       (',
'           lower(d.DOCUMENT_FILENAME) like ''%.png'' or ',
'           lower(d.DOCUMENT_FILENAME) like ''%.jpg'' or ',
'           lower(d.DOCUMENT_FILENAME) like ''%.jpeg'' or ',
'           lower(d.DOCUMENT_FILENAME) like ''%.gif'' or ',
'           lower(d.DOCUMENT_FILENAME) like ''%.tiff'' or ',
'           lower(d.DOCUMENT_FILENAME) like ''%.ai'' ',
'       )'))
,p_button_condition_type=>'EXISTS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27131733238285351625)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(27131733321060351626)
,p_button_name=>'add_task'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Task'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:501:&SESSION.::&DEBUG.:501:P501_PROJECT_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(124734660904543559114)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(124734659362586559099)
,p_button_name=>'add_document'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Document'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RR,12:P12_PROJECT_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(42863273622515575364)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(17257582559059253683)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_PROJECT_VIEW.:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10266884584449923477)
,p_name=>'P3_INCLUDE_FUTURE'
,p_item_sequence=>23
,p_item_plug_id=>wwv_flow_imp.id(24578149505589384822)
,p_item_default=>'Y'
,p_prompt=>'Include Future'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11048521878421204132)
,p_name=>'P3_RELATED_PROJECT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11048520548622204119)
,p_prompt=>'Add Related &NOMENCLATURE_PROJECT.'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select (select area from sp_areas f where f.id = i.area_id)||',
'       '' / ''||i.initiative ||',
'       '' / ''||p.project project, ',
'       p.id',
'from   sp_projects p,',
'       sp_initiatives i ',
'where  p.id != :P3_PROJECT_ID and',
'       p.id not in (',
'       select r.related_project_id ',
'       from   sp_project_related r ',
'       where  r.project_id = :P3_PROJECT_ID and r.related_project_id is not null) and',
'       p.initiative_id = i.id and  ',
'       p.ARCHIVED_YN = ''N''',
'order by 1'))
,p_cSize=>30
,p_grid_row_css_classes=>'u-align-items-center'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11424702380503781445)
,p_name=>'P3_CONTRIBUTOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11424699967460781421)
,p_item_default=>'APP_USER_ID'
,p_item_default_type=>'ITEM'
,p_prompt=>'Add Contributor'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'SP_TEAM_MEMBERS - CURRENT ONLY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select last_name||'', ''||first_name||'' (''||lower(email)||'')'' d, id r',
'from SP_TEAM_MEMBERS',
'where is_current_yn = ''Y''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- select &NOMENCLATURE_USER. -'
,p_cSize=>30
,p_grid_row_css_classes=>'u-align-items-center'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '2')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11424702476916781446)
,p_name=>'P3_CONTRIBUTOR_ROLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11424699967460781421)
,p_item_default=>'select max(id) from SP_RESOURCE_TYPES where IS_DEFAULT_YN = ''Y'''
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Role'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select RESOURCE_TYPE, id',
'from SP_RESOURCE_TYPES',
'order by 1'))
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11958140839433354323)
,p_name=>'P3_INCLUDE_PAST'
,p_item_sequence=>33
,p_item_plug_id=>wwv_flow_imp.id(24578149505589384822)
,p_item_default=>'Y'
,p_prompt=>'Include Past'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13732077851604739647)
,p_name=>'P3_PRIVATE_YN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(14605934270419650834)
,p_item_default=>'N'
,p_prompt=>'This is a private comment'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#:margin-left-md'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20235784409731330504)
,p_name=>'P3_PERMALINK_PREFIX'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(17257582559059253683)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22049595666197874321)
,p_name=>'P3_DUP_PROJECT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(17257582559059253683)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22049596056079874325)
,p_name=>'P3_DUP_PROJECT_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(17257582559059253683)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22139810929768252003)
,p_name=>'FI'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(17257582559059253683)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_item_comment=>'friendly identifier'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(22139811275470252007)
,p_name=>'PN'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(17257582559059253683)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(24929238683932914224)
,p_name=>'P3_LINK_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(124734657576411559081)
,p_prompt=>'Link Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>255
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41547360036934037135)
,p_name=>'P3_PROJECT_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(17257582559059253683)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(41711959150730422368)
,p_name=>'P3_HAS_VOTED_CLASS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17257582559059253683)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42879256712735632906)
,p_name=>'P3_LINK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(124734657576411559081)
,p_prompt=>'Link URL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>1609122147107268652
,p_item_template_options=>'#DEFAULT#'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'URL',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(122188984200385143016)
,p_name=>'P3_PROJECT_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(17257582559059253683)
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(124765700457964036170)
,p_name=>'P3_COMMENT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(14605934270419650834)
,p_prompt=>' Comment'
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_grid_label_column_span=>0
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) { return options; }',
'///* JS Init Function for Comments Rich Text Editor */',
'//function( options ) {',
'//    options.editorOptions.paste_data_images = false;',
'//    return options;',
'//}',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'Y',
  'format', 'MARKDOWN',
  'min_height', '180')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(22139810970237252004)
,p_computation_sequence=>20
,p_computation_item=>'P3_PROJECT_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return sp_strategic_proj_util.get_project_id (',
'    p_friendly_identifier => :FI,',
'    p_project_url_name => :PN);'))
,p_compute_when=>'P3_PROJECT_ID'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(41547360068623037136)
,p_computation_sequence=>40
,p_computation_item=>'P3_PROJECT_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select project from sp_projects where id = :P3_project_id'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(22049595787915874322)
,p_computation_sequence=>50
,p_computation_item=>'P3_DUP_PROJECT'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select (select b.project from sp_projects b where b.id = a.DUPLICATE_OF_PROJECT_ID) project',
'from sp_projects a',
'where a.id = :P3_PROJECT_ID'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(22049596238797874326)
,p_computation_sequence=>60
,p_computation_item=>'P3_DUP_PROJECT_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DUPLICATE_OF_PROJECT_ID',
'from sp_projects',
'where id = :P3_PROJECT_ID'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(10300808343578039223)
,p_computation_sequence=>70
,p_computation_item=>'P3_INCLUDE_FUTURE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'Y'
,p_compute_when=>'P3_INCLUDE_FUTURE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20235784554510330506)
,p_computation_sequence=>90
,p_computation_item=>'P3_PERMALINK_PREFIX'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>'return APEX_UTIL.HOST_URL(''SCRIPT'') || ''project-details?fi='';'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(124765700725717036172)
,p_name=>'Add Comment'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(124765700585217036171)
,p_condition_element=>'P3_COMMENT'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(124765700734865036173)
,p_event_id=>wwv_flow_imp.id(124765700725717036172)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'add comment'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_strategic_proj_util.add_project_comment (',
'    p_app_user      => :APP_USER,',
'    p_comment       => :P3_COMMENT,',
'    p_project_id    => :P3_PROJECT_ID,',
'    p_comment_on    => ''PROJECT'',',
'    p_component_id  => null,',
'    p_private_yn    => nvl(:P3_PRIVATE_YN,''N''));'))
,p_attribute_02=>'P3_COMMENT,P3_PRIVATE_YN,P3_PROJECT_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28418378543872926038)
,p_event_id=>wwv_flow_imp.id(124765700725717036172)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'send alerts'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_project_link  varchar2(4000);',
'    l_mentions      varchar2(4000);',
'begin',
'for c1 in (',
'    select p.project, p.friendly_identifier fi, p.project_url_name, p.owner_id, t.first_name, t.screen_name',
'      from sp_projects p,',
'           sp_team_members t',
'     where p.id = :P3_PROJECT_ID',
'       and p.owner_id = t.id (+)',
') loop',
'    l_project_link := :P3_PERMALINK_PREFIX||c1.fi||''&pn=''||c1.project_url_name;',
'',
'    if apex_util.get_build_option_status (p_application_id => :APP_ID, p_build_option_name => ''Comment Tagging'') = ''INCLUDE'' then',
'    l_mentions := sp_strategic_proj_util.find_mentions(:P3_COMMENT);',
'    -- mentions (not current user)',
'    if l_mentions is not null then',
'        for c2 in (',
'            select id, first_name',
'              from sp_team_members',
'             where instr('':''||l_mentions||'':'','':''||screen_name||'':'') > 0',
'               and id != :APP_USER_ID',
'        ) loop',
'            sp_strategic_proj_util.comment_notification (',
'                p_team_member_id => c2.id,',
'                p_app_name       => :NOMENCLATURE_STRATEGIC_PLANNER, p_app_id => :APP_ID,',
'                p_title          => ''You were mentioned in a comment added to ''||c1.project,',
'                p_project_id     => :P3_PROJECT_ID, p_project_link => l_project_link,',
'                p_email_contents => ''Hi ''||c2.first_name||''<br/><br/>''||',
'                                    ''You were mentioned in a new comment added to <a  style="font-weight:bold" href="''||l_project_link||''">''||c1.project||''</a><br/>''||',
'                                    ''Comment by: ''||lower(:APP_USER)||''<br/>''||',
'                                    substr(:P3_COMMENT,1,3600)||case when length(:P3_COMMENT) > 3600 then '' ...'' end );',
'        end loop;',
'    end if;',
'    end if;',
'',
'    -- owner (not current user and not tagged in comment)',
'    if c1.owner_id is not null and c1.owner_id != :APP_USER_ID and instr('':''||l_mentions||'':'','':''||c1.screen_name||'':'') = 0 then',
'        sp_strategic_proj_util.comment_notification (',
'            p_team_member_id => c1.owner_id,',
'            p_app_name       => :NOMENCLATURE_STRATEGIC_PLANNER, p_app_id => :APP_ID,',
'            p_title          => ''New comment added to ''||c1.project,',
'            p_project_id     => :P3_PROJECT_ID, p_project_link => l_project_link,',
'            p_email_contents => ''Hi ''||c1.first_name||''<br/><br/>''||',
'                                ''A new comment was just added to <a  style="font-weight:bold" href="''||l_project_link||''">''||c1.project||''</a><br/>''||',
'                                ''Comment by: ''||lower(:APP_USER)||''<br/>''||',
'                                substr(:P3_COMMENT,1,3600)||case when length(:P3_COMMENT) > 3600 then '' ...'' end );',
'    end if;',
'',
'    -- favorited (not owner, not current user and not tagged in comment)',
'    for c2 in (',
'        select f.team_member_id, t.first_name',
'          from sp_favorites f,',
'               sp_team_members t',
'         where f.project_id = :P3_PROJECT_ID',
'           and f.team_member_id = t.id',
'           and f.team_member_id != :APP_USER_ID',
'           and f.team_member_id != c1.owner_id',
'           and instr('':''||l_mentions||'':'','':''||t.screen_name||'':'') = 0',
'    ) loop',
'        sp_strategic_proj_util.comment_notification (',
'            p_team_member_id => c2.team_member_id,',
'            p_app_name       => :NOMENCLATURE_STRATEGIC_PLANNER, p_app_id => :APP_ID,',
'            p_title          => ''New comment added to ''||c1.project,',
'            p_project_id     => :P3_PROJECT_ID, p_project_link => l_project_link,',
'            p_email_contents => ''Hi ''||c2.first_name||''<br/><br/>''||',
'                                ''A new comment was just added to <a  style="font-weight:bold" href="''||l_project_link||''">''||c1.project||''</a><br/>''||',
'                                ''Comment by: ''||lower(:APP_USER)||''<br/>''||',
'                                substr(:P3_COMMENT,1,3600)||case when length(:P3_COMMENT) > 3600 then '' ...'' end );',
'    end loop;',
'end loop;',
'end;'))
,p_attribute_02=>'P3_COMMENT,P3_PRIVATE_YN,P3_PROJECT_ID,APP_USER_ID,APP_USER'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'N'
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P3_PRIVATE_YN'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28418378733637926039)
,p_event_id=>wwv_flow_imp.id(124765700725717036172)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'reset comment'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P3_COMMENT := null;'
,p_attribute_02=>'P3_COMMENT'
,p_attribute_03=>'P3_COMMENT'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(124765700917778036174)
,p_event_id=>wwv_flow_imp.id(124765700725717036172)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(116194800787357778995)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18259858421949635945)
,p_event_id=>wwv_flow_imp.id(124765700725717036172)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.ariaAlertMessage("Comment Added Successfully");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(124734659204939559097)
,p_name=>'rpt dialog close'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(124734657576411559081)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(124734659267918559098)
,p_event_id=>wwv_flow_imp.id(124734659204939559097)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(124734657576411559081)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(124734661044329559116)
,p_name=>'doc refresh dialog close'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(124734659362586559099)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(125281101744086144367)
,p_event_id=>wwv_flow_imp.id(124734661044329559116)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(124734659362586559099)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11587034395339630813)
,p_name=>'milestone refresh dialog close'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(10949661864107474018)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11587034539253630814)
,p_event_id=>wwv_flow_imp.id(11587034395339630813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10949661864107474018)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11587034582715630815)
,p_name=>'milestone reviews dialog close'
,p_event_sequence=>70
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(10949660375803474003)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11587034674144630816)
,p_event_id=>wwv_flow_imp.id(11587034582715630815)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10949660375803474003)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(42879256865759632908)
,p_name=>'add link'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(42879256804679632907)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25160225808197885908)
,p_event_id=>wwv_flow_imp.id(42879256865759632908)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Please supply a Link URL and a Link Name.'
,p_attribute_02=>'Missing Link Details'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'$v(''P3_LINK'') === '''' || $v(''P3_LINK_NAME'') === '''''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42879256955289632909)
,p_event_id=>wwv_flow_imp.id(42879256865759632908)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P3_LINK_NAME is not null and :P3_LINK is not null',
'then sp_strategic_proj_util.add_project_link (',
'         p_project_id    => :P3_PROJECT_ID,',
'         p_link_name     => :P3_LINK_NAME,',
'         p_link_url      => :P3_LINK );',
'    :P3_LINK_NAME := null;',
'    :P3_LINK := null;',
'end if;'))
,p_attribute_02=>'P3_LINK_NAME,P3_LINK,P3_PROJECT_ID'
,p_attribute_03=>'P3_LINK,P3_LINK_NAME'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42879257134847632910)
,p_event_id=>wwv_flow_imp.id(42879256865759632908)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(124734657576411559081)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18259858542737635947)
,p_event_id=>wwv_flow_imp.id(42879256865759632908)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.ariaAlertMessage("Link Added Successfully");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(42908332235106296229)
,p_name=>'doc refresh on dialog close'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(124734659362586559099)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42908332332373296230)
,p_event_id=>wwv_flow_imp.id(42908332235106296229)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(124734659362586559099)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(10300343400553735339)
,p_name=>'comments refresh on dialog close'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(116194800787357778995)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(10300343518904735340)
,p_event_id=>wwv_flow_imp.id(10300343400553735339)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(116194800787357778995)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14836460706186655722)
,p_name=>'add related'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11048521982227204133)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16100681603696685423)
,p_event_id=>wwv_flow_imp.id(14836460706186655722)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Please select a related &NOMENCLATURE_PROJECT..'
,p_attribute_02=>'Missing Related &NOMENCLATURE_PROJECT. Details'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'$v(''P3_RELATED_PROJECT_ID'') === '''''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14836460766700655723)
,p_event_id=>wwv_flow_imp.id(14836460706186655722)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P3_RELATED_PROJECT_ID is not null then',
'    sp_strategic_proj_util.add_related_project (',
'        p_related_project_id => :P3_RELATED_PROJECT_ID,',
'        p_project_id => :P3_PROJECT_ID );',
'end if;'))
,p_attribute_02=>'P3_RELATED_PROJECT_ID,P3_PROJECT_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P3_RELATED_PROJECT_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14836462421680655739)
,p_event_id=>wwv_flow_imp.id(14836460706186655722)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_RELATED_PROJECT_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14836460925094655724)
,p_event_id=>wwv_flow_imp.id(14836460706186655722)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11048520548622204119)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14836461160775655727)
,p_name=>'refresh related'
,p_event_sequence=>120
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11048520548622204119)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14836461268918655728)
,p_event_id=>wwv_flow_imp.id(14836461160775655727)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11048520548622204119)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(40549417437688266429)
,p_name=>'Remove Tag'
,p_event_sequence=>140
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.js-remove-tag'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(40549417538489266430)
,p_event_id=>wwv_flow_imp.id(40549417437688266429)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_TAG_TO_REMOVE'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).data(''tag'');'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(40549417701570266432)
,p_event_id=>wwv_flow_imp.id(40549417437688266429)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_strategic_proj_util.remove_project_tag (',
'    p_project_id => :P3_PROJECT_ID, ',
'    p_tag => :P3_TAG_TO_REMOVE);',
':P3_TAG_TO_REMOVE := null;'))
,p_attribute_02=>'P3_PROJECT_ID'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24578149542677384823)
,p_name=>'show future activity da'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_INCLUDE_FUTURE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24578150043002384828)
,p_event_id=>wwv_flow_imp.id(24578149542677384823)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P3_INCLUDE_FUTURE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24578149684247384824)
,p_event_id=>wwv_flow_imp.id(24578149542677384823)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(24528493753787933683)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24578151228243384839)
,p_name=>'show activity on dc on add'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(24578149774428384825)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24578151241401384840)
,p_event_id=>wwv_flow_imp.id(24578151228243384839)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(24528493753787933683)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24578151421296384841)
,p_name=>'refresh description'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(22139812483153252019)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24578151496127384842)
,p_event_id=>wwv_flow_imp.id(24578151421296384841)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(23828521231231297746)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(24578151720187384844)
,p_name=>'refresh activity rpt on dc'
,p_event_sequence=>180
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(24528493753787933683)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(24578151763626384845)
,p_event_id=>wwv_flow_imp.id(24578151720187384844)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(24528493753787933683)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(10300807853999039218)
,p_name=>'edit description dialog closed'
,p_event_sequence=>190
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(23828521231231297746)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(10300807966200039219)
,p_event_id=>wwv_flow_imp.id(10300807853999039218)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41349812503142670145)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28345381268807316307)
,p_name=>'refresh tasks'
,p_event_sequence=>200
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(27131733321060351626)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28345381343112316308)
,p_event_id=>wwv_flow_imp.id(28345381268807316307)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(27131733321060351626)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12326321288870394411)
,p_name=>'show past activity'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_INCLUDE_PAST'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12326321405736394412)
,p_event_id=>wwv_flow_imp.id(12326321288870394411)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P3_INCLUDE_PAST,P3_INCLUDE_FUTURE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12326321532304394413)
,p_event_id=>wwv_flow_imp.id(12326321288870394411)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(24528493753787933683)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12342029165868717609)
,p_name=>'refresh on change project'
,p_event_sequence=>220
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(41711956957890422346)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12342029328032717610)
,p_event_id=>wwv_flow_imp.id(12342029165868717609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41711956957890422346)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12676957744688819445)
,p_event_id=>wwv_flow_imp.id(12342029165868717609)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(17257582559059253683)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12534187820152400733)
,p_name=>'on edit description dialog close'
,p_event_sequence=>230
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(41349812503142670145)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12534187913774400734)
,p_event_id=>wwv_flow_imp.id(12534187820152400733)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41349812503142670145)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12616282175151930911)
,p_name=>'refresh on dialog closed bc'
,p_event_sequence=>240
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(17257582559059253683)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12616282328655930912)
,p_event_id=>wwv_flow_imp.id(12616282175151930911)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(17257582559059253683)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13102717565485650125)
,p_event_id=>wwv_flow_imp.id(12616282175151930911)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(41711956957890422346)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11424702699414781448)
,p_name=>'add contributor'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11424702545833781447)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11424702805073781449)
,p_event_id=>wwv_flow_imp.id(11424702699414781448)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'   c int := 0;',
'begin',
'   select count(*) into c from SP_PROJECT_CONTRIBUTORS where project_id = :P3_PROJECT_ID and TEAM_MEMBER_ID = :P3_CONTRIBUTOR;',
'   if c = 0 then ',
'      insert into SP_PROJECT_CONTRIBUTORS',
'      (PROJECT_ID, TEAM_MEMBER_ID, RESPONSIBILITY_ID)',
'      values',
'      (:P3_PROJECT_ID, :P3_CONTRIBUTOR, :P3_CONTRIBUTOR_ROLE);',
'   end if;',
'',
'   :P3_CONTRIBUTOR := null;',
'   for c1 in (select max(id) id from SP_RESOURCE_TYPES where IS_DEFAULT_YN = ''Y'') loop',
'       :P3_CONTRIBUTOR_ROLE := c1.id;',
'   end loop;',
'end;'))
,p_attribute_02=>'P3_PROJECT_ID,P3_CONTRIBUTOR,P3_CONTRIBUTOR_ROLE'
,p_attribute_03=>'P3_CONTRIBUTOR,P3_CONTRIBUTOR_ROLE'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11424702919053781450)
,p_event_id=>wwv_flow_imp.id(11424702699414781448)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11424700079954781422)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18259858726955635948)
,p_event_id=>wwv_flow_imp.id(11424702699414781448)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.ariaAlertMessage("Contributor Added Successfully");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(10768145312592431031)
,p_name=>'refresh cont on dc'
,p_event_sequence=>260
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11424699967460781421)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(10768145378184431032)
,p_event_id=>wwv_flow_imp.id(10768145312592431031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11424700079954781422)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11670361559882389671)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'log'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_log.log_interaction(',
'    p_project_id => :P3_PROJECT_ID);'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1436307218735885271
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(14264580061652945497)
,p_region_id=>wwv_flow_imp.id(18121925914092268501)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362316605839802174
,p_label=>'Edit'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24:P24_ID:&P3_PROJECT_ID.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-edit'
,p_is_hot=>true
,p_show_as_disabled=>false
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(15702849433578490541)
,p_region_id=>wwv_flow_imp.id(24528493753787933683)
,p_position_id=>348722977165395441
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:RP,140:P140_ID:&ID.'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(18121926214671268504)
,p_region_id=>wwv_flow_imp.id(18121925914092268501)
,p_position_id=>362316004162771045
,p_display_sequence=>20
,p_template_id=>362317865359806322
,p_label=>'Actions'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(24528495912229933704)
,p_region_id=>wwv_flow_imp.id(24528493753787933683)
,p_position_id=>362316004162771045
,p_display_sequence=>20
,p_template_id=>362317865359806322
,p_label=>'Actions'
,p_button_display_type=>'ICON'
,p_icon_css_classes=>'fa-ellipsis-v'
,p_action_css_classes=>'t-Button--noUI'
,p_is_hot=>false
,p_show_as_disabled=>false
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(11363383884656409316)
,p_component_action_id=>wwv_flow_imp.id(24528495912229933704)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Activity Quick Look'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:RP,140:P140_ID:&ID.'
,p_icon_css_classes=>'fa-badge-check'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12616282451416930914)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Archive'
,p_display_sequence=>80
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:RP,47:P47_PROJECT_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-remove'
,p_condition_type=>'EXISTS'
,p_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ARCHIVED_YN ',
'  from sp_projects ',
' where id = :P3_PROJECT_ID',
'   and ARCHIVED_YN = ''N'''))
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12616282551864930915)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Mark as Duplicate'
,p_display_sequence=>50
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49:P49_PROJECT_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-file-text'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12616282830751930917)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>140
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(13979821233883308569)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>190
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RR,3:PN,FI:&PN.,&FI.'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(14048831329931925081)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'ENTRY'
,p_label=>'View Project History'
,p_display_sequence=>110
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP,64:P64_PROJECT_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-clock-o'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(14735117122901021291)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>90
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(15832360650038183340)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Add Links from Comments'
,p_display_sequence=>100
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:31:P31_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-external-link'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(16100680347998685411)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'ENTRY'
,p_label=>'View Tag History'
,p_display_sequence=>120
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:82:&SESSION.::&DEBUG.:RP,82:P82_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-tags'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(16100680690613685414)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'ENTRY'
,p_label=>'View Project Exceptions'
,p_display_sequence=>130
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:93:&SESSION.::&DEBUG.:RP,93:P93_PROJECT_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-clipboard-x'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(18121926920578268511)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>180
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(18259858885596635950)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Copy'
,p_display_sequence=>60
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:116:&SESSION.::&DEBUG.:RP,116:P116_PROJECT_ID:&P3_PROJECT_ID.'
,p_icon_css_classes=>'fa-copy'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(20044408486992129703)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Find Screen Names'
,p_display_sequence=>160
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:123:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-user'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(20044408561960129704)
,p_component_action_id=>wwv_flow_imp.id(18121926214671268504)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>170
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(24528495974714933705)
,p_component_action_id=>wwv_flow_imp.id(24528495912229933704)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit Activity'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101:P101_ID:&ID.'
,p_icon_css_classes=>'fa-edit'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp.component_end;
end;
/
