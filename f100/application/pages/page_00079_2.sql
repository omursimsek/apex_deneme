prompt --application/pages/page_00079
begin
--   Manifest
--     PAGE: 00079
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
 p_id=>79
,p_name=>'Change History Interactive Report'
,p_alias=>'CHANGE-HISTORY-INTERACTIVE-REPORT'
,p_step_title=>'Change History Interactive Report'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(21103783134283959393)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(31127907977221465416)
,p_plug_name=>'Change History'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select :NOMENCLATURE_PROJECT               change_to,',
'       p.project                           project,',
'       ''P''||to_char(p.priority_id)         priority,',
'       p.PROJECT_SIZE                      project_size,',
'       (select tm.first_name||'' ''||tm.last_name',
'        from   sp_team_members TM  ',
'        where  tm.id = p.OWNER_ID)         owner,',
'       decode(p.ACTIVE_YN,''Y'',''Yes'',''No'')  active,                ',
'       --',
'       pc.PROJECT_ID                       project_id,',
'       p.FRIENDLY_IDENTIFIER               FI,',
'       p.PROJECT_URL_NAME                  PN,  ',
'       case when f.project_id is not null then ''Yes'' else ''No'' end favorite,',
'       pc.changed_on ATTRIBUTE_CHANGE_DATE,',
'       case pc.change_type when ''CREATE'' then ''Added''',
'                           when ''UPDATE'' then ''Updated''',
'                           when ''DELETE'' then ''Deleted''',
'                           else pc.change_type',
'            end change_type,',
'       --',
'       initcap(replace(pc.attribute_column,''_'','' '')) ATTRIBUTE_COLUMN,',
'       decode(pc.old_value,''Y'',''Yes'',''N'',''No'',old_value) OLD_VALUE,',
'       decode(pc.new_value,''Y'',''Yes'',''N'',''No'',new_value) NEW_VALUE,',
'       pc.changed_by,',
'       --',
'       -- status',
'       --',
'       p.PCT_COMPLETE||''%'' status,',
'       --',
'       -- release',
'       --',
'        nvl(decode(',
'           p.RELEASE_DEPENDENT_YN,',
'           ''Y'',',
'           (select t.release_train||'' ''||t.release from SP_RELEASE_TRAINS t where t.id = p.release_id),',
'           decode(',
'               to_char(p.target_complete,''DD-MON-YYYY''),',
'               null,',
'               ''Not Targeted'',',
'               to_char(p.target_complete,''MON-YYYY'')',
'               )),''Not Targeted'')  release',
'  from SP_PROJECT_HISTORY pc,',
'       sp_projects p,',
'       sp_favorites f',
' where p.id = pc.project_id',
'   and p.ARCHIVED_YN = ''N''',
'   and p.id = f.project_id (+)',
'union all',
'select tt.task_type ||',
'       case when t.task_sub_type_id is not null',
'            then (select '': ''||task_type from sp_task_types where t.task_sub_type_id = id)',
'            end change_to,',
'       p.project                           project,',
'       ''P''||to_char(p.priority_id)         priority,',
'       p.PROJECT_SIZE                      project_size,',
'       (select tm.first_name||'' ''||tm.last_name',
'        from   sp_team_members TM  ',
'        where  tm.id = p.OWNER_ID)         owner,',
'       decode(p.ACTIVE_YN,''Y'',''Yes'',''No'')  active,                 ',
'       --',
'       t.PROJECT_ID                        project_id,',
'       p.FRIENDLY_IDENTIFIER               FI,',
'       p.PROJECT_URL_NAME                  PN,  ',
'       case when f.project_id is not null then ''Yes'' else ''No'' end favorite,',
'       pc.changed_on ATTRIBUTE_CHANGE_DATE,',
'       case pc.change_type when ''CREATE'' then ''Added''',
'                           when ''UPDATE'' then ''Updated''',
'                           when ''DELETE'' then ''Deleted''',
'                           else pc.change_type',
'            end change_type,',
'       --',
'       initcap(replace(pc.attribute_column,''_'','' '')) ATTRIBUTE_COLUMN,',
'       decode(pc.old_value,''Y'',''Yes'',''N'',''No'',old_value) OLD_VALUE,',
'       decode(pc.new_value,''Y'',''Yes'',''N'',''No'',new_value) NEW_VALUE,',
'       pc.changed_by,',
'       --',
'       -- status',
'       --',
'       p.PCT_COMPLETE||''%'' status,',
'       --',
'       -- release',
'       --',
'        nvl(decode(',
'           p.RELEASE_DEPENDENT_YN,',
'           ''Y'',',
'           (select t.release_train||'' ''||t.release from SP_RELEASE_TRAINS t where t.id = p.release_id),',
'           decode(',
'               to_char(p.target_complete,''DD-MON-YYYY''),',
'               null,',
'               ''Not Targeted'',',
'               to_char(p.target_complete,''MON-YYYY'')',
'               )),''Not Targeted'')  release',
'  from sp_task_history pc,',
'       sp_tasks t,',
'       sp_task_types tt,',
'       sp_projects p,',
'       sp_favorites f',
' where pc.task_id = t.id',
'   and t.task_type_id = tt.id',
'   and t.project_id = p.id',
'   and p.ARCHIVED_YN = ''N''',
'   and p.id = f.project_id (+)'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(17407958066665141415)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'SBKENNED'
,p_internal_uid=>7173903725518637015
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407959247810141427)
,p_db_column_name=>'ATTRIBUTE_CHANGE_DATE'
,p_display_order=>10
,p_column_identifier=>'L'
,p_column_label=>'Attribute Change Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407958206759141416)
,p_db_column_name=>'CHANGE_TO'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Change To'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407958348117141418)
,p_db_column_name=>'PROJECT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:FI,PN:#FI#,#PN#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407958466188141419)
,p_db_column_name=>'PRIORITY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407958612372141420)
,p_db_column_name=>'PROJECT_SIZE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Project Size'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407958725727141421)
,p_db_column_name=>'OWNER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407958750397141422)
,p_db_column_name=>'ACTIVE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Active'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407959070490141425)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Project Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407959208936141426)
,p_db_column_name=>'FAVORITE'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Favorite'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407959467948141429)
,p_db_column_name=>'CHANGE_TYPE'
,p_display_order=>110
,p_column_identifier=>'N'
,p_column_label=>'Change Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407959573763141430)
,p_db_column_name=>'ATTRIBUTE_COLUMN'
,p_display_order=>120
,p_column_identifier=>'O'
,p_column_label=>'Attribute Column'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407959641560141431)
,p_db_column_name=>'OLD_VALUE'
,p_display_order=>130
,p_column_identifier=>'P'
,p_column_label=>'Old Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407959793117141432)
,p_db_column_name=>'NEW_VALUE'
,p_display_order=>140
,p_column_identifier=>'Q'
,p_column_label=>'New Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407959930903141433)
,p_db_column_name=>'CHANGED_BY'
,p_display_order=>150
,p_column_identifier=>'R'
,p_column_label=>'Changed By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407959971354141434)
,p_db_column_name=>'STATUS'
,p_display_order=>160
,p_column_identifier=>'S'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407960137886141435)
,p_db_column_name=>'RELEASE'
,p_display_order=>170
,p_column_identifier=>'T'
,p_column_label=>'Release'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407960219735141436)
,p_db_column_name=>'FI'
,p_display_order=>180
,p_column_identifier=>'U'
,p_column_label=>'Fi'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(17407960269998141437)
,p_db_column_name=>'PN'
,p_display_order=>190
,p_column_identifier=>'V'
,p_column_label=>'Pn'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19570316879354784812)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'93362626'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ATTRIBUTE_CHANGE_DATE:CHANGE_TO:ATTRIBUTE_COLUMN:PROJECT:CHANGE_TYPE:OLD_VALUE:NEW_VALUE:CHANGED_BY:'
,p_sort_column_1=>'ATTRIBUTE_CHANGE_DATE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(31486587832244459350)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19570257710293774823)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(31486587832244459350)
,p_button_name=>'Filter_Report'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Filter Report'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:RR,::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19570257339543774823)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(31486587832244459350)
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
