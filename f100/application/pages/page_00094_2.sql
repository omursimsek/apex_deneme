prompt --application/pages/page_00094
begin
--   Manifest
--     PAGE: 00094
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
 p_id=>94
,p_name=>'Initiative'
,p_alias=>'INITIATIVE'
,p_step_title=>'&NOMENCLATURE_INITIATIVE.: &P94_INITIATIVE.'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.sp-tag {',
'    padding: 2px 4px;',
'    display: inline-block;',
'    vertical-align: text-bottom;',
'    border-radius: 3px;',
'    background-color: rgba(0,0,0,.1);',
'    text-overflow: ellipsis;',
'    white-space: nowrap;',
'}',
'.sp-tags-container {',
'    display: flex;',
'    align-items: center;',
'    flex-wrap: wrap;',
'    gap: 4px;',
'    justify-content: flex-start;',
'}',
'',
'.resize-region {',
'  resize: vertical;',
'  overflow: auto;',
'}',
'',
'.a-CardView-iconWrap,',
'.a-CardView-badge { align-self: flex-start; }',
'',
'.project-rds-region {',
'    background-color: rgb(219 204 175 / 20%);',
'}',
'.t-Body-title {',
'    --ut-palette-warning-shade: rgba(var(--oj-palette-neutral-rgb-160));',
'    --ut-component-background-color: rgba(var(--oj-palette-neutral-rgb-170)); ',
'    --ut-alert-horizontal-border-radius: 0;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'27'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13628144736873228410)
,p_plug_name=>'Focus Areas'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>160
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13628144881513228412)
,p_plug_name=>'focus area content'
,p_title=>'Focus Areas'
,p_parent_plug_id=>wwv_flow_imp.id(13628144736873228410)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'       focus_area,',
'       (select count(*) from sp_projects where focus_area_id = a.id) cnt,',
'       greatest(a.updated,nvl((select max(updated) from sp_projects where focus_area_id = a.id),a.updated)) last_update',
'  from sp_initiative_focus_areas a',
' where initiative_id = :P94_INITIATIVE_ID',
'   and active_yn = ''Y'''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P94_INITIATIVE_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Focus Areas'
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
,p_plug_footer=>'Only these focus areas will be available to be associated with the &NOMENCLATURE_PROJECTS. added to this &NOMENCLATURE_INITIATIVE..'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(13628145520521228418)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'Focus Areas not set for this &NOMENCLATURE_INITIATIVE..  These are set by an Administrator of this application.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'SBKENNED'
,p_internal_uid=>3394091179374724018
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13628145619103228419)
,p_db_column_name=>'FOCUS_AREA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Focus Area'
,p_column_link=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:33:P33_INIT_FOCUS_AREA_ID:#ID#'
,p_column_linktext=>'#FOCUS_AREA#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13628145675462228420)
,p_db_column_name=>'CNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'&NOMENCLATURE_PROJECT. Count'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27267754354365923723)
,p_db_column_name=>'LAST_UPDATE'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13628146031528228423)
,p_db_column_name=>'ID'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(13651617010472426523)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'34175627'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FOCUS_AREA:CNT:LAST_UPDATE:'
,p_sort_column_1=>'FOCUS_AREA'
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
 p_id=>wwv_flow_imp.id(14711152546088402933)
,p_plug_name=>'Associated Releases'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rt.id,',
'       release_train||'' ''||release release,',
'       RELEASE_TARGET_DATE,',
'       RELEASE_OPEN_DATE,',
'       decode(nvl(rt.RELEASE_COMPLETED,''N''),''Y'',''Yes'',''N'',''No'',RELEASE_COMPLETED) COMPLETED,',
'       (select count(*) from sp_projects p where nvl(p.ARCHIVED_YN,''N'') = ''N'' and ',
'      p.DUPLICATE_OF_PROJECT_ID is null and',
'      p.initiative_id = :P94_INITIATIVE_ID and',
'      p.release_id is not null and ',
'      p.release_id = rt.id) project_count',
'from   sp_release_trains rt',
'where rt.id in (',
'select distinct p.release_id',
'from  SP_PROJECTS p',
'where nvl(p.ARCHIVED_YN,''N'') = ''N'' and ',
'      p.DUPLICATE_OF_PROJECT_ID is null and',
'      p.initiative_id = :P94_INITIATIVE_ID and',
'      p.release_id is not null)',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Associated Releases'
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
,p_plug_footer=>'<p>This reports lists releases that have one or more associated &NOMENCLATURE_PROJECTS. that corresponds to the selected &NOMENCLATURE_INITIATIVE..</p>'
,p_required_patch=>wwv_flow_imp.id(14578465101782602994)
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(14900104561165538725)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>4666050220019034325
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14900104706802538726)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14900104775514538727)
,p_db_column_name=>'RELEASE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Release'
,p_column_link=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.::P117_RELEASE_ID:#ID#'
,p_column_linktext=>'#RELEASE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14900104895993538728)
,p_db_column_name=>'RELEASE_TARGET_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Release Target Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'FMDD Month YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14900104943137538729)
,p_db_column_name=>'RELEASE_OPEN_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Release Open Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'FMDD Month YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14900105096903538730)
,p_db_column_name=>'COMPLETED'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Completed'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14900105235350538731)
,p_db_column_name=>'PROJECT_COUNT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Project Count'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(14931832365415907017)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'46977781'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RELEASE:RELEASE_TARGET_DATE:RELEASE_OPEN_DATE:COMPLETED:PROJECT_COUNT'
,p_sort_column_1=>'RELEASE_OPEN_DATE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14900102235260538701)
,p_plug_name=>'RDS'
,p_region_css_classes=>'u-padding-inline-dynamic project-rds-region'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14900105291411538732)
,p_plug_name=>'&NOMENCLATURE_PROJECTS. '
,p_icon_css_classes=>' '
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.ID,',
'       p.PROJECT,',
'       (select FIRST_NAME ||'' ''||last_name from SP_TEAM_MEMBERS x where x.ID = p.OWNER_ID) the_owner,',
'       (select ''P''||PRIORITY from SP_PROJECT_PRIORITIES x where x.ID = p.PRIORITY_ID) priority,',
'       p.PCT_COMPLETE pct_complete,',
'       (select decode(greatest(length(initiative),15),15,initiative,substr(initiative,1,12)||''...'') initiative ',
'        from sp_initiatives i ',
'        where i.id = p.initiative_id) initiative,',
'       --',
'       -- release',
'       --',
'       --decode(p.release_id,',
'       --   null, decode(p.TARGET_COMPLETE,null,''No Target'',to_char(p.TARGET_COMPLETE,''DD-MON-YYYY'')),',
'       --   (select RELEASE_TRAIN||'' ''||release from SP_RELEASE_TRAINS r where r.id = p.RELEASE_ID)) release,',
'       nvl(decode(',
'           p.RELEASE_DEPENDENT_YN,',
'           ''Y'',',
'           (select t.release_train||'' ''||t.release from SP_RELEASE_TRAINS t where t.id = p.release_id),',
'           decode(',
'               to_char(p.target_complete,''DD-MON-YYYY''),',
'               null,',
'               ''Not Targeted'',',
'               to_char(p.target_complete,''MON-YYYY'')',
'               )),''Not Targeted'')  release,',
'       --',
'       p.PROJECT_SIZE,',
'       p.UPDATED,',
'       p.owner_id,',
'       p.friendly_identifier,',
'       p.project_url_name,',
'       nvl((select first_name||'' ''||last_name from SP_TEAM_MEMBERS tm where tm.email = lower(p.updated_by)),lower(p.updated_by)) updated_by,',
'       null actions,',
'       p.tags',
'from  SP_PROJECTS p',
'where nvl(p.ARCHIVED_YN,''N'') = ''N'' and ',
'      p.DUPLICATE_OF_PROJECT_ID is null and',
'      p.initiative_id = :P94_INITIATIVE_ID',
'order by p.updated desc nulls last',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P94_INITIATIVE_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'&NOMENCLATURE_PROJECTS. '
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
,p_plug_footer=>'Click the &NOMENCLATURE_PROJECT. name to view details.'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(14900106935436538748)
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
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24:P24_ID:#ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'MIKE'
,p_internal_uid=>4666052594290034348
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14900106944843538749)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14900107114515538750)
,p_db_column_name=>'PROJECT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'&NOMENCLATURE_PROJECT. Name'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#FRIENDLY_IDENTIFIER#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14931842363033916401)
,p_db_column_name=>'THE_OWNER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Owner'
,p_column_link=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_TEAM_MEMBER_ID:#OWNER_ID#'
,p_column_linktext=>'#THE_OWNER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14931842483010916402)
,p_db_column_name=>'PRIORITY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14931842563553916403)
,p_db_column_name=>'PCT_COMPLETE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Completeness'
,p_column_html_expression=>'#PCT_COMPLETE#%'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14931842690652916404)
,p_db_column_name=>'INITIATIVE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Initiative'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14931842797226916405)
,p_db_column_name=>'RELEASE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Release'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14931842877781916406)
,p_db_column_name=>'PROJECT_SIZE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Size'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14931843018411916407)
,p_db_column_name=>'UPDATED'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14931843147056916409)
,p_db_column_name=>'OWNER_ID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Owner Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14931843334271916410)
,p_db_column_name=>'FRIENDLY_IDENTIFIER'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Friendly Identifier'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14931843428273916411)
,p_db_column_name=>'PROJECT_URL_NAME'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Project Url Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14931843596150916413)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14962822966608873032)
,p_db_column_name=>'ACTIONS'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Quick Look'
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID:#ID#'
,p_column_linktext=>'<span class="fa fa-align-justify" aria-hidden="true"></span>'
,p_column_link_attr=>'View &NOMENCLATURE_PROJECTS. Details'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(26599274048203222937)
,p_db_column_name=>'TAGS'
,p_display_order=>210
,p_column_identifier=>'Y'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(14931684402387560807)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'46976301'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT:THE_OWNER:PRIORITY:PCT_COMPLETE:RELEASE:PROJECT_SIZE:UPDATED:ACTIONS'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'PCT_COMPLETE'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14956298548701989728)
,p_plug_name=>'Activities'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
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
'       --',
'       i.initiative,',
'       i.id initiative_id,',
'       --',
'       tm.first_name||'' ''||tm.last_name owner,',
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
'     sp_initiatives i,',
'     sp_activity_types at,',
'     sp_team_members tm',
'where ap.initiative_id = i.id and',
'      i.id = :P94_INITIATIVE_ID and',
'      ap.activity_type_id = at.id and',
'      ap.team_member_id = tm.id ',
'order by ap.updated desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Activities'
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
 p_id=>wwv_flow_imp.id(14956298729582989729)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101:P101_ID:#ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'MIKE'
,p_internal_uid=>4722244388436485329
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14956298778688989730)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14956299187147989734)
,p_db_column_name=>'COMMENTS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Details'
,p_column_link=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:RP,140:P140_ID:#ID#'
,p_column_linktext=>'#COMMENTS#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14956299306413989735)
,p_db_column_name=>'START_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Start'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'FMDD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14956299422229989736)
,p_db_column_name=>'END_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'End'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'FMDD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14956300129471989743)
,p_db_column_name=>'URL'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Url'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14960460407583713911)
,p_db_column_name=>'INITIATIVE_ID'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Initiative Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14960461322475713920)
,p_db_column_name=>'OWNER'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14960461386021713921)
,p_db_column_name=>'ACTIVITY_TYPE'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Activity Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(14960461717230713924)
,p_db_column_name=>'TIMEFRAME'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Timeframe'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15702849538911490542)
,p_db_column_name=>'END_DATE_FORMATTED'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'End Date Formatted'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15702849557147490543)
,p_db_column_name=>'TIMELINE'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Timeline'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15702849673523490544)
,p_db_column_name=>'DAYS'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15702849749221490545)
,p_db_column_name=>'DAYS_REMAINING'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Days Remaining'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15702849898042490546)
,p_db_column_name=>'INITIATIVE'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Initiative'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15702849943330490547)
,p_db_column_name=>'ICON'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Icon'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(14960315850435078395)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'47262616'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TIMEFRAME:OWNER:ACTIVITY_TYPE:COMMENTS:START_DATE:END_DATE'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(15038278694880353625)
,p_report_id=>wwv_flow_imp.id(14960315850435078395)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'TIMEFRAME'
,p_operator=>'='
,p_expr=>'Current'
,p_condition_sql=>'"TIMEFRAME" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Current''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17586950454365698120)
,p_plug_name=>'Initiative Details'
,p_region_css_classes=>'u-flex'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:margin-left-md'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15141651882937020530)
,p_plug_name=>'Initiative Icon'
,p_parent_plug_id=>wwv_flow_imp.id(17586950454365698120)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select i.id, ',
'       case when i.image is not null then i.image else f.image end image,',
'       case when i.image is not null then i.image_name else f.image_name end alt_text, ',
'       case when i.image is not null then i.image_name else f.image_name end image_name, ',
'       case when i.image is not null then i.image_mimetype else f.image_mimetype end image_mimetype ',
'  from SP_INITIATIVES i,',
'       sp_areas f',
' where i.id = :P94_INITIATIVE_ID',
'   and i.area_id = f.id'))
,p_template_component_type=>'REPORT'
,p_lazy_loading=>false
,p_plug_source_type=>'TMPL_THEME_42$AVATAR'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from SP_INITIATIVES i,',
'       sp_areas f',
' where i.id = :P94_INITIATIVE_ID',
'   and i.area_id = f.id',
'   and (i.image is not null or f.image is not null)'))
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'IMAGE', '{"source":"BLOB_COLUMN","blobColumn":"IMAGE","filenameColumn":"IMAGE_NAME","mimeTypeColumn":"IMAGE_MIMETYPE","lastUpdatedColumn":""}',
  'SIZE', 't-Avatar--xs',
  'TYPE', 'IMAGE')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15141651995171020531)
,p_name=>'IMAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE'
,p_data_type=>'BLOB'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15141652065843020532)
,p_name=>'ALT_TEXT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALT_TEXT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>20
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15141652234710020533)
,p_name=>'IMAGE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>30
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15141652260839020534)
,p_name=>'IMAGE_MIMETYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IMAGE_MIMETYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>40
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15141652371511020535)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>50
,p_is_group=>false
,p_use_as_row_header=>false
,p_is_primary_key=>true
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(46377745337049035280)
,p_name=>'&NOMENCLATURE_INITIATIVE.'
,p_parent_plug_id=>wwv_flow_imp.id(17586950454365698120)
,p_template=>4501440665235496320
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select f.area focus_area, ',
'       i.initiative, ',
'       ''<button type="button" title="Copy Permalink" aria-label="Copy Permalink" data-clipboard-source="''||:P94_PERMALINK_PREFIX||i.friendly_identifier||''&pn=''||i.initiative_url_name||''" class="t-Button t-Button--noLabel t-Button--icon t-Button--link'
||' padding-none">''||i.friendly_identifier||''</button>'' perma_link,',
'       --',
'       -- projects',
'       --',
'       (select count(*) ',
'        from sp_projects p ',
'        where p.initiative_id = i.id and ',
'              p.ARCHIVED_YN = ''N'' and',
'              p.DUPLICATE_OF_PROJECT_ID is null) projects,',
'       --',
'       -- projects',
'       --',
'       (select count(*) ',
'        from sp_projects p ',
'        where p.initiative_id = i.id and ',
'              p.ARCHIVED_YN = ''N'' and',
'              p.pct_complete = 100 and',
'              p.DUPLICATE_OF_PROJECT_ID is null) projects_resolved,',
'       --',
'       -- owner',
'       --',
'       (select first_name||'' ''||last_name ',
'        from sp_team_members tm ',
'        where tm.id = i.SPONSOR_ID) the_owner,',
'       --',
'       i.sponsor_id owner_id,',
'       --',
'       (select count(*) from sp_initiative_comments ic where ic.initiative_id = i.id) comments,',
'       --',
'       (select count(*) from sp_activities ia where ia.initiative_id = i.id) initiative_activities,',
'       --',
'       i.updated,',
'       --',
'       i.id',
'  from SP_INITIATIVES i,',
'       SP_AREAS f',
'where i.area_id = f.id and',
'      i.id = :P94_INITIATIVE_ID',
'',
'     '))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P94_INITIATIVE_ID'
,p_lazy_loading=>false
,p_query_row_template=>2115772683903439354
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14899843813386117347)
,p_query_column_id=>1
,p_column_alias=>'FOCUS_AREA'
,p_column_display_sequence=>20
,p_column_heading=>'&NOMENCLATURE_AREA.'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_FOCUS_AREA:#FOCUS_AREA#'
,p_column_linktext=>'#FOCUS_AREA#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14899845010432117349)
,p_query_column_id=>2
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>30
,p_column_heading=>'&NOMENCLATURE_INITIATIVE.'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28418376232635926014)
,p_query_column_id=>3
,p_column_alias=>'PERMA_LINK'
,p_column_display_sequence=>40
,p_column_heading=>'Permalink'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14711152509240402932)
,p_query_column_id=>4
,p_column_alias=>'PROJECTS'
,p_column_display_sequence=>50
,p_column_heading=>'&NOMENCLATURE_PROJECTS.'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15832358517048183318)
,p_query_column_id=>5
,p_column_alias=>'PROJECTS_RESOLVED'
,p_column_display_sequence=>60
,p_column_heading=>'Projects Resolved'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14962822250281873025)
,p_query_column_id=>6
,p_column_alias=>'THE_OWNER'
,p_column_display_sequence=>100
,p_column_heading=>'Owner'
,p_column_link=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_TEAM_MEMBER_ID:#OWNER_ID#'
,p_column_linktext=>'#THE_OWNER#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14962822399831873026)
,p_query_column_id=>7
,p_column_alias=>'OWNER_ID'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14962822523290873027)
,p_query_column_id=>8
,p_column_alias=>'COMMENTS'
,p_column_display_sequence=>80
,p_column_heading=>'Comments'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14962823087016873033)
,p_query_column_id=>9
,p_column_alias=>'INITIATIVE_ACTIVITIES'
,p_column_display_sequence=>90
,p_column_heading=>'Initiative Activities'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15037237597470310715)
,p_query_column_id=>10
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(17586950319828698118)
,p_query_column_id=>11
,p_column_alias=>'ID'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19681922153369249124)
,p_plug_name=>'Links'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select l.ID,',
'       77 edit_page,',
'       :NOMENCLATURE_INITIATIVE belongs_to,',
'       LINK_NAME,',
'       LINK_URL,',
'       case when lower(link_url) not like ''http%''',
'            then ''http://''||link_url',
'            else link_url',
'            end for_link,',
'       decode(IMPORTANT_YN,''Y'',''Yes'',''N'',''No'',IMPORTANT_YN) IMPORTANT,',
'       CREATED,',
'       lower(CREATED_BY) created_by,',
'       UPDATED,',
'       UPDATED_BY',
'from SP_INITIATIVE_LINKS l',
'where  initiative_id = :P94_INITIATIVE_ID',
'union all',
'select l.ID,',
'       40 edit_page,',
'       ''Focus Area: ''||a.focus_area belongs_to,',
'       l.LINK_NAME,',
'       l.LINK_URL,',
'       case when lower(link_url) not like ''http%''',
'            then ''http://''||link_url',
'            else link_url',
'            end for_link,',
'       decode(l.IMPORTANT_YN,''Y'',''Yes'',''N'',''No'',l.IMPORTANT_YN) IMPORTANT,',
'       l.CREATED,',
'       lower(l.CREATED_BY) created_by,',
'       l.UPDATED,',
'       l.UPDATED_BY',
'from SP_INIT_FOCUS_AREA_LINKS l,',
'     SP_INITIATIVE_FOCUS_AREAS a',
'where a.initiative_id = :P94_INITIATIVE_ID',
'  and a.id = l.init_focus_area_id'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P94_INITIATIVE_ID'
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
 p_id=>wwv_flow_imp.id(19681922229220249125)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:#EDIT_PAGE#:&SESSION.::&DEBUG.:RP,#EDIT_PAGE#:P#EDIT_PAGE#_ID:#ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'MIKE'
,p_internal_uid=>9447867888073744725
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19681922343270249126)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27267754507086923724)
,p_db_column_name=>'BELONGS_TO'
,p_display_order=>20
,p_column_identifier=>'L'
,p_column_label=>'Belongs To'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19681922608325249128)
,p_db_column_name=>'LINK_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Link'
,p_column_html_expression=>'<a href="#FOR_LINK#" target="_blank">#LINK_NAME#</a>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19681922635916249129)
,p_db_column_name=>'LINK_URL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'URL'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19681922866782249131)
,p_db_column_name=>'CREATED'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19681922958940249132)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Added By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19681923095599249133)
,p_db_column_name=>'UPDATED'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19681923214365249134)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(24929238896163914226)
,p_db_column_name=>'IMPORTANT'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Important'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27267754621028923725)
,p_db_column_name=>'EDIT_PAGE'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Edit Page'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27267754682818923726)
,p_db_column_name=>'FOR_LINK'
,p_display_order=>110
,p_column_identifier=>'N'
,p_column_label=>'For Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19684306515443295633)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'47246263'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'BELONGS_TO:LINK_NAME:LINK_URL:IMPORTANT:UPDATED:CREATED_BY:'
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
 p_id=>wwv_flow_imp.id(22317304089953358269)
,p_plug_name=>'Breadcrumb'
,p_region_sub_css_classes=>'has-header-actions'
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
 p_id=>wwv_flow_imp.id(23181647444986373087)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(22317304089953358269)
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
 p_id=>wwv_flow_imp.id(23181648678492373099)
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
 p_id=>wwv_flow_imp.id(28393712274950231438)
,p_plug_name=>'Default Tasks'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>170
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_header=>'These tasks will be pre-created for all &NOMENCLATURE_PROJECTS. added to this &NOMENCLATURE_INITIATIVE..'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(28512075184666784436)
,p_name=>'task content'
,p_title=>'Default Tasks'
,p_parent_plug_id=>wwv_flow_imp.id(28393712274950231438)
,p_template=>4501440665235496320
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--noBorders'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when t.parent_type_id is not null',
'            then t2.task_type||'': ''',
'            end ||',
'           t.task_type task',
'  from sp_task_types t,',
'       sp_task_types t2,',
'       sp_initiative_default_tasks i',
' where t.parent_type_id = t2.id (+)',
'   and t.id = i.type_id',
'   and t.include_yn = ''Y''',
'   and i.initiative_id = :P94_INITIATIVE_ID',
' order by nvl(t2.display_seq,t.display_seq), t.display_seq nulls first'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P94_INITIATIVE_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28512075307732784437)
,p_query_column_id=>1
,p_column_alias=>'TASK'
,p_column_display_sequence=>10
,p_column_heading=>'Task'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28512075413284784438)
,p_plug_name=>'button'
,p_parent_plug_id=>wwv_flow_imp.id(28393712274950231438)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(31369236213033369935)
,p_name=>'Additional Attriubtes'
,p_template=>4501440665235496320
,p_display_sequence=>180
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked:t-Report--hideNoPagination'
,p_display_point=>'REGION_POSITION_05'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(i.created_by) created_by,',
'       i.created,',
'       lower(i.updated_by) last_updated_by,',
'       i.updated',
'  from SP_INITIATIVES i',
'where i.id = :P94_INITIATIVE_ID',
'',
'     '))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P94_INITIATIVE_ID'
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
 p_id=>wwv_flow_imp.id(20024072788590924398)
,p_query_column_id=>1
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>10
,p_column_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20024073222440924399)
,p_query_column_id=>2
,p_column_alias=>'CREATED'
,p_column_display_sequence=>20
,p_column_heading=>'Created'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20024072426508924397)
,p_query_column_id=>3
,p_column_alias=>'LAST_UPDATED_BY'
,p_column_display_sequence=>30
,p_column_heading=>'Last Updated By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20024073617697924399)
,p_query_column_id=>4
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>40
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(128981405310253408673)
,p_name=>'Comments'
,p_template=>4501440665235496320
,p_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Comments--chat'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ic.ID,',
'       -- Display Columns',
'       tm.initials user_icon,',
'       apex_util.get_since(ic.created) comment_date,',
'       tm.first_name || '' '' || tm.last_name user_name,',
'       --',
'       ic.body_html comment_text,',
'       case when lower(ic.created_by) = lower(:app_user)',
'            then ''<a href="''||apex_util.prepare_URL(',
'                 p_url => ''f?p=''||:APP_ID||'':87:''||:APP_SESSION||''::NO:87:P87_ID:''||ic.id,',
'                 p_checksum_type => ''3''',
'                 )||''">edit</a>'' ',
'            end actions,',
'       '' '' attribute_1,',
'       '' '' attribute_2,',
'       '' '' attribute_3,',
'       '' '' attribute_4,',
'       ''u-color-''||ora_hash(ic.created_by,45) icon_modifier,',
'       --',
'       --',
'       --',
'       decode(ic.private_yn,null,null,''N'',null,''Y'','' Private Comment'') private_comment_label,',
'       --',
'       -- Data Columns',
'       --',
'       ic.BODY,',
'       ic.BODY_HTML,',
'       ic.AUTHOR_ID,',
'       --',
'       ic.CREATED,',
'       ic.CREATED_BY,',
'       ic.UPDATED,',
'       ic.UPDATED_BY,',
'       tm.id team_member_id',
'  from sp_initiative_comments ic, ',
'       sp_team_members tm',
'where ic.author_id = tm.id and',
'      ic.initiative_id = :P94_INITIATIVE_ID and  ',
'      (nvl(ic.private_yn,''N'') = ''N'' or lower(ic.created_by) = lower(:app_user) )',
'order by created desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P94_INITIATIVE_ID'
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
 p_id=>wwv_flow_imp.id(14931394041831717879)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_heading=>'Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931186872566717872)
,p_query_column_id=>2
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>150
,p_column_heading=>'User Icon'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931187262023717873)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>160
,p_column_heading=>'Comment Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931187704255717874)
,p_query_column_id=>4
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>170
,p_column_heading=>'User Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931188113212717874)
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
 p_id=>wwv_flow_imp.id(14931188461797717875)
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
 p_id=>wwv_flow_imp.id(14931388890948717875)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>200
,p_column_heading=>'Attribute 1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931389288223717876)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>210
,p_column_heading=>'Attribute 2'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931389722448717876)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>220
,p_column_heading=>'Attribute 3'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931390080360717876)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>230
,p_column_heading=>'Attribute 4'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931390484906717877)
,p_query_column_id=>11
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>240
,p_column_heading=>'Icon Modifier'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15037239427810310733)
,p_query_column_id=>12
,p_column_alias=>'PRIVATE_COMMENT_LABEL'
,p_column_display_sequence=>260
,p_column_heading=>'Private Comment Label'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931390843628717877)
,p_query_column_id=>13
,p_column_alias=>'BODY'
,p_column_display_sequence=>40
,p_column_heading=>'Body'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931391320688717877)
,p_query_column_id=>14
,p_column_alias=>'BODY_HTML'
,p_column_display_sequence=>50
,p_column_heading=>'Body Html'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931391686990717878)
,p_query_column_id=>15
,p_column_alias=>'AUTHOR_ID'
,p_column_display_sequence=>80
,p_column_heading=>'Author Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931392088019717878)
,p_query_column_id=>16
,p_column_alias=>'CREATED'
,p_column_display_sequence=>110
,p_column_heading=>'Created'
,p_column_format=>'SINCE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931392497243717878)
,p_query_column_id=>17
,p_column_alias=>'CREATED_BY'
,p_column_display_sequence=>120
,p_column_heading=>'Created By'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931392932075717878)
,p_query_column_id=>18
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931393279169717879)
,p_query_column_id=>19
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>140
,p_column_heading=>'Updated By'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14931393648876717879)
,p_query_column_id=>20
,p_column_alias=>'TEAM_MEMBER_ID'
,p_column_display_sequence=>250
,p_column_heading=>'User ID'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(140768580847092860586)
,p_plug_name=>'Documents'
,p_region_name=>'DOCUMENTS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>150
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select :NOMENCLATURE_INITIATIVE type,',
'       ''13'' edit_page, ''53'' display_page,',
'       d.ID,',
'       d.DOCUMENT_FILENAME,',
'       d.UPDATED,',
'       d.created,',
'       case when length(d.doc_description) > 200',
'            then substr(d.doc_description,1,200)||''...''',
'            else d.doc_description',
'            end doc_description,',
'       d.tags,',
'       lower(created_by) created_by,',
'       dbms_lob.getlength(d.DOCUMENT_BLOB) doc_size,',
'       created date_created,',
'       substr(DOCUMENT_FILENAME,instr(DOCUMENT_FILENAME,''.'',-1)+1,length(DOCUMENT_FILENAME)-instr(DOCUMENT_FILENAME,''.'',-1)) file_extension,',
'       decode(important_yn,''Y'',''Yes'',''No'') important',
'  from SP_INITIATIVE_DOCUMENTS d',
' where initiative_id = :P94_INITIATIVE_ID',
' union all',
'select ''Focus Area: ''||a.focus_area type,',
'       ''56'' edit_page, ''59'' display_page,',
'       d.ID,',
'       d.DOCUMENT_FILENAME,',
'       d.UPDATED,',
'       d.created,',
'       case when length(d.doc_description) > 200',
'            then substr(d.doc_description,1,200)||''...''',
'            else d.doc_description',
'            end doc_description,',
'       d.tags,',
'       lower(d.created_by) created_by,',
'       dbms_lob.getlength(d.DOCUMENT_BLOB) doc_size,',
'       d.created date_created,',
'       substr(DOCUMENT_FILENAME,instr(DOCUMENT_FILENAME,''.'',-1)+1,length(DOCUMENT_FILENAME)-instr(DOCUMENT_FILENAME,''.'',-1)) file_extension,',
'       decode(d.important_yn,''Y'',''Yes'',''No'') important',
'  from SP_INIT_focus_area_DOCUMENTS d,',
'       sp_initiative_focus_areas a',
' where a.initiative_id = :P94_INITIATIVE_ID',
'   and a.id = d.init_focus_area_id',
'order by created desc',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P94_INITIATIVE_ID'
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
 p_id=>wwv_flow_imp.id(27077194658758155910)
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
,p_internal_uid=>16843140317611651510
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27077194759922155911)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27267754019602923719)
,p_db_column_name=>'TYPE'
,p_display_order=>20
,p_column_identifier=>'O'
,p_column_label=>'Belongs to'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from SP_INIT_FOCUS_AREA_DOCUMENTS d,',
'       SP_INITIATIVE_FOCUS_AREAS fa',
' where fa.initiative_id = :P94_INITIATIVE_ID',
'   and fa.id = d.init_focus_area_id'))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27077194892313155912)
,p_db_column_name=>'DOCUMENT_FILENAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Filename'
,p_column_link=>'f?p=&APP_ID.:#DISPLAY_PAGE#:&SESSION.::&DEBUG.:#DISPLAY_PAGE#:P#DISPLAY_PAGE#_ID,P#DISPLAY_PAGE#_PREV_PAGE:#ID#,94'
,p_column_linktext=>'#DOCUMENT_FILENAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27077195317114155916)
,p_db_column_name=>'DOC_DESCRIPTION'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27077195522643155918)
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
 p_id=>wwv_flow_imp.id(27077195069277155914)
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
 p_id=>wwv_flow_imp.id(27077195145120155915)
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
 p_id=>wwv_flow_imp.id(27077195539681155919)
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
 p_id=>wwv_flow_imp.id(27514049730427004698)
,p_db_column_name=>'FILE_EXTENSION'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'File Extension'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38173733434367553501)
,p_db_column_name=>'TAGS'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(25160229446626885945)
,p_db_column_name=>'IMPORTANT'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Important'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(26269777286037083405)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Added By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27267754083673923720)
,p_db_column_name=>'EDIT_PAGE'
,p_display_order=>140
,p_column_identifier=>'P'
,p_column_label=>'Edit Page'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27267754223361923721)
,p_db_column_name=>'DISPLAY_PAGE'
,p_display_order=>150
,p_column_identifier=>'Q'
,p_column_label=>'Display Page'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(27078930893561748681)
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
 p_id=>wwv_flow_imp.id(14931394463579717880)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(128981405310253408673)
,p_button_name=>'POST_COMMENT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post Comment'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_grid_column_css_classes=>'u-flex u-align-items-center margin-bottom-md'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14959683497567763851)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(19681922153369249124)
,p_button_name=>'add_link'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--gapTop'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Link'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28512072121253784405)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(28512075413284784438)
,p_button_name=>'edit_tasks'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edit Default Tasks'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:95:&SESSION.::&DEBUG.:RR,95:P95_INITIATIVE_ID:&P94_INITIATIVE_ID.'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13628148106592228444)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(13628144881513228412)
,p_button_name=>'add_focus_area'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Focus Area'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:10151:&SESSION.::&DEBUG.:10151:P10151_INITIATIVE_ID:&P94_INITIATIVE_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930433130434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14960460880614713916)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(14956298548701989728)
,p_button_name=>'add_activity'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Add Activity'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101:P101_INITIATIVE_ID,P101_TEAM_MEMBER_ID:&P94_INITIATIVE_ID.,&APP_USER_ID.'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(26267979730392805895)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(140768580847092860586)
,p_button_name=>'view_images'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Image Gallery'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:62:P62_INITIATIVE_ID:&P94_INITIATIVE_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from SP_INITIATIVE_DOCUMENTS d',
' where initiative_id = :P94_INITIATIVE_ID and ',
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
'  from SP_INIT_focus_area_DOCUMENTS d,',
'       SP_INITIATIVE_FOCUS_AREAS f',
'   where f.initiative_id = :P94_INITIATIVE_ID and ',
'         f.id = d.init_focus_area_id and',
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
 p_id=>wwv_flow_imp.id(15037238416287310723)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(14900105291411538732)
,p_button_name=>'Add_project'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Add Project'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24:P24_INITIATIVE_ID:&P94_INITIATIVE_ID.'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(26267980117258805896)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(140768580847092860586)
,p_button_name=>'add_document'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Document'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RR,13:P13_INITIATIVE_ID:&P94_INITIATIVE_ID.'
,p_icon_css_classes=>'fa-plus'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14898917694253352501)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22317304089953358269)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:RP,:P66_AREA_ID:&P94_AREA_ID.'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14711151545992402923)
,p_name=>'P94_INITIATIVE_ID'
,p_item_sequence=>40
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14711151720537402924)
,p_name=>'P94_AREA_ID'
,p_item_sequence=>90
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14711151765094402925)
,p_name=>'P94_INITIATIVE'
,p_item_sequence=>80
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14711152302160402930)
,p_name=>'P94_AREA'
,p_item_sequence=>100
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15037239301897310732)
,p_name=>'P94_PRIVATE_YN'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(128981405310253408673)
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
 p_id=>wwv_flow_imp.id(19681927094581249170)
,p_name=>'P94_LINK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(19681922153369249124)
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
 p_id=>wwv_flow_imp.id(19681927495712249174)
,p_name=>'P94_LINK_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19681922153369249124)
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
 p_id=>wwv_flow_imp.id(28418375769896926010)
,p_name=>'IFI'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28418375913473926011)
,p_name=>'INN'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(28418375987261926012)
,p_name=>'P94_PERMALINK_PREFIX'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(137552523658035665900)
,p_name=>'P94_COMMENT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(128981405310253408673)
,p_prompt=>' '
,p_display_as=>'NATIVE_RICH_TEXT_EDITOR'
,p_grid_label_column_span=>0
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_custom_html', 'Y',
  'format', 'MARKDOWN',
  'min_height', '180')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(11478912516841627492)
,p_computation_sequence=>10
,p_computation_item=>'P94_INITIATIVE_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return sp_strategic_proj_util.get_initiative_id (',
'    p_friendly_identifier => :IFI,',
'    p_initiative_url_name => :INN);'))
,p_compute_when=>'P94_INITIATIVE_ID'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(14711151841832402926)
,p_computation_sequence=>20
,p_computation_item=>'P94_INITIATIVE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select INITIATIVE',
'from   sp_initiatives i',
'where  id = :P94_INITIATIVE_ID'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(14711151969155402927)
,p_computation_sequence=>30
,p_computation_item=>'P94_AREA_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select area_id',
'from   sp_initiatives i',
'where  id = :P94_INITIATIVE_ID'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(14711152439894402931)
,p_computation_sequence=>40
,p_computation_item=>'P94_AREA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select area ',
'from sp_areas a  ',
'where a.id = (',
'    select area_id',
'    from   sp_initiatives i',
'    where  id = :P94_INITIATIVE_ID)'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(28418376112546926013)
,p_computation_sequence=>50
,p_computation_item=>'P94_PERMALINK_PREFIX'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>'return APEX_UTIL.HOST_URL(''SCRIPT'') || ''initiative?ifi='';'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(14931843733944916414)
,p_computation_sequence=>60
,p_computation_item=>'LAST_PROJECT_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'94'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14900103313591538712)
,p_name=>'post comment'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(14931394463579717880)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14900103406509538713)
,p_event_id=>wwv_flow_imp.id(14900103313591538712)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into sp_initiative_comments (',
'    initiative_id,',
'    body,',
'    author_id,',
'    private_yn',
'    ) values (',
'    :P94_INITIATIVE_ID,',
'    :P94_COMMENT,',
'    :APP_USER_ID,',
'    nvl(:P94_PRIVATE_YN,''N'')',
'    );',
':P94_COMMENT := null;',
':P94_PRIVATE_YN := null;'))
,p_attribute_02=>'P94_INITIATIVE_ID,P94_COMMENT,APP_USER_ID,P94_PRIVATE_YN'
,p_attribute_03=>'P94_COMMENT'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14900103536326538714)
,p_event_id=>wwv_flow_imp.id(14900103313591538712)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(128981405310253408673)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15037236448331310704)
,p_event_id=>wwv_flow_imp.id(14900103313591538712)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(46377745337049035280)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14900104346032538723)
,p_name=>'on comments dialog closed'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(128981405310253408673)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14900104495951538724)
,p_event_id=>wwv_flow_imp.id(14900104346032538723)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(128981405310253408673)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15037236759966310707)
,p_event_id=>wwv_flow_imp.id(14900104346032538723)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(46377745337049035280)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14956298242364989725)
,p_name=>'add initiative link'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(14959683497567763851)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25160225958083885910)
,p_event_id=>wwv_flow_imp.id(14956298242364989725)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Please supply a Link URL and a Link Name.'
,p_attribute_02=>'Missing Link Details'
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'$v(''P94_LINK'') === '''' || $v(''P94_LINK_NAME'') === '''''
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14956298413065989726)
,p_event_id=>wwv_flow_imp.id(14956298242364989725)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P94_LINK_NAME is not null and :P94_LINK is not null then',
'insert into SP_INITIATIVE_LINKS (',
'    initiative_id, link_name, link_url)',
'values (',
'    :P94_INITIATIVE_ID, :P94_LINK_NAME, :P94_LINK);',
':P94_LINK_NAME := null;',
':P94_LINK := null;',
'end if;'))
,p_attribute_02=>'P94_INITIATIVE_ID,P94_LINK_NAME,P94_LINK'
,p_attribute_03=>'P94_LINK_NAME,P94_LINK'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14956298448039989727)
,p_event_id=>wwv_flow_imp.id(14956298242364989725)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19681922153369249124)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15037236998092310709)
,p_event_id=>wwv_flow_imp.id(14956298242364989725)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(46377745337049035280)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14960461138461713918)
,p_name=>'refresh on activity dc'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(14956298548701989728)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14960461205285713919)
,p_event_id=>wwv_flow_imp.id(14960461138461713918)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(14956298548701989728)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15037237382817310713)
,p_event_id=>wwv_flow_imp.id(14960461138461713918)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(46377745337049035280)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(25160229178156885942)
,p_name=>'refresh on documents'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(140768580847092860586)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25160229262195885943)
,p_event_id=>wwv_flow_imp.id(25160229178156885942)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(140768580847092860586)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28512073185544784416)
,p_name=>'refresh on tasks'
,p_event_sequence=>60
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(28512075413284784438)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28512073315133784417)
,p_event_id=>wwv_flow_imp.id(28512073185544784416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(28512075184666784436)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14962822635883873028)
,p_name=>'contextual info dialog close refresh'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(22317304089953358269)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14962822663657873029)
,p_event_id=>wwv_flow_imp.id(14962822635883873028)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(46377745337049035280)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15037237066110310710)
,p_name=>'on links region dc'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(19681922153369249124)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15037237166467310711)
,p_event_id=>wwv_flow_imp.id(15037237066110310710)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(46377745337049035280)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15037237263545310712)
,p_event_id=>wwv_flow_imp.id(15037237066110310710)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19681922153369249124)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15037238444418310724)
,p_name=>'projects tab refresh on dialog closed'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(14900105291411538732)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15037238570540310725)
,p_event_id=>wwv_flow_imp.id(15037238444418310724)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(14900105291411538732)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13628148159623228445)
,p_name=>'refresh on focus areas'
,p_event_sequence=>200
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(13628144881513228412)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
,p_security_scheme=>wwv_flow_imp.id(149556930433130434424)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13628148301606228446)
,p_event_id=>wwv_flow_imp.id(13628148159623228445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13628144881513228412)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(16520649078135166731)
,p_region_id=>wwv_flow_imp.id(23181647444986373087)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362316605839802174
,p_label=>'Edit'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:RP,22:P22_ID:&P94_INITIATIVE_ID.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-edit'
,p_is_hot=>true
,p_show_as_disabled=>false
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(23181647745565373090)
,p_region_id=>wwv_flow_imp.id(23181647444986373087)
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
 p_id=>wwv_flow_imp.id(11368121309817827065)
,p_component_action_id=>wwv_flow_imp.id(23181647745565373090)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Kanban'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:160:&SESSION.::&DEBUG.::P160_INITIATIVE_ID:&P94_INITIATIVE_ID.'
,p_icon_css_classes=>'fa-columns'
,p_build_option_id=>wwv_flow_imp.id(21855158598441364965)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(14711152061166402928)
,p_component_action_id=>wwv_flow_imp.id(23181647745565373090)
,p_menu_entry_type=>'ENTRY'
,p_label=>'&NOMENCLATURE_PROJECTS.'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23:P23_FOCUS_AREA,P23_INITIATIVE,P23_INITIATIVE_ID,P23_FOCUS_AREA_ID:&P94_AREA.,&P94_INITIATIVE.,&P94_INITIATIVE_ID.,&P94_AREA_ID.'
,p_icon_css_classes=>'fa-package'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(14711152238124402929)
,p_component_action_id=>wwv_flow_imp.id(23181647745565373090)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>80
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(17638299668617861607)
,p_component_action_id=>wwv_flow_imp.id(23181647745565373090)
,p_menu_entry_type=>'ENTRY'
,p_label=>'About &NOMENCLATURE_INITIATIVES.'
,p_display_sequence=>70
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-info'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(19039542764777413155)
,p_component_action_id=>wwv_flow_imp.id(23181647745565373090)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>90
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP,94:P94_INITIATIVE_ID:&P94_INITIATIVE_ID.'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(19039542933394413156)
,p_component_action_id=>wwv_flow_imp.id(23181647745565373090)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>40
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(23181648451472373097)
,p_component_action_id=>wwv_flow_imp.id(23181647745565373090)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>100
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(27145839770738113301)
,p_component_action_id=>wwv_flow_imp.id(23181647745565373090)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>60
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(27145839907181113302)
,p_component_action_id=>wwv_flow_imp.id(23181647745565373090)
,p_menu_entry_type=>'ENTRY'
,p_label=>'View History'
,p_display_sequence=>50
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:11:P11_INITIATIVE_ID:&P94_INITIATIVE_ID.'
,p_icon_css_classes=>'fa-clock-o'
);
wwv_flow_imp.component_end;
end;
/
