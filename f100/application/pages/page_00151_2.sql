prompt --application/pages/page_00151
begin
--   Manifest
--     PAGE: 00151
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
 p_id=>151
,p_name=>'Group Members'
,p_alias=>'GROUP-MEMBERS'
,p_step_title=>'Group Members'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(20452810691500035245)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.project-rds-region {',
'    background-color: rgb(219 204 175 / 20%);',
'}',
'.t-Body-title {',
'    --ut-palette-warning-shade: rgba(var(--oj-palette-neutral-rgb-160));',
'    --ut-component-background-color: rgba(var(--oj-palette-neutral-rgb-170)); ',
'    --ut-alert-horizontal-border-radius: 0;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(20442394029406870290)
,p_protection_level=>'C'
,p_page_component_map=>'25'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18962933876434064144)
,p_plug_name=>'RDS'
,p_region_css_classes=>'u-padding-inline-dynamic project-rds-region'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'USER')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18962933961562064145)
,p_plug_name=>'Member &NOMENCLATURE_PROJECTS.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       --',
'       -- IDs',
'       --',
'       p.ID as project_id,',
'       p.owner_id,',
'       --',
'       -- project information',
'       --',
'       p.PROJECT,',
'       (select FIRST_NAME ||'' ''||last_name from SP_TEAM_MEMBERS x where x.ID = p.OWNER_ID) the_owner,',
'       (select ''P''||PRIORITY from SP_PROJECT_PRIORITIES x where x.ID = p.PRIORITY_ID) priority,',
'       p.PCT_COMPLETE pct_complete,',
'       p.PROJECT_SIZE,',
'       p.friendly_identifier,',
'       p.project_url_name,',
'       replace(lower(p.tags),'','','', '') as tags,',
'       --',
'       -- favorite',
'       --',
'       nvl((',
'           select ''Yes'' ',
'           from sp_favorites f ',
'           where f.project_id = p.id and ',
'                 f.team_member_id = :APP_USER_ID),''No'') favorite,',
'       --',
'       -- project description',
'       --',
'       decode(nvl(dbms_lob.getlength(p.description),0),0,''Not Provided'',',
'           dbms_lob.substr(p.description,200,1)||',
'           decode(greatest(dbms_lob.getlength(p.description),200),200,null,''...'')) description,',
'       --',
'       -- updated',
'       --',
'       p.UPDATED,',
'       nvl((select first_name||'' ''||last_name from SP_TEAM_MEMBERS tm where tm.email = lower(p.updated_by)),lower(p.updated_by)) updated_by,',
'       --',
'       -- last comments',
'       --',
'       (select max(dbms_lob.substr(c.body,200,1)||',
'               decode(greatest(dbms_lob.getlength(c.body),200),200,null,''...'')) last_comment ',
'        from   SP_PROJECT_COMMENTS c ',
'        where c.project_id = p.id and ',
'              c.private_yn = ''N'' and ',
'              c.created = (select max(c2.created) from sp_project_comments c2 where c2.project_id = p.id and c2.private_yn = ''N''))',
'        as last_comment,',
'       --',
'       (select max(c.created) from sp_project_comments c where c.project_id = p.id and c.private_yn = ''N'') last_comment_on,',
'       (select first_name||'' ''||last_name from SP_TEAM_MEMBERS t where t.id = (select max(c.author_id) from sp_project_comments c where c.project_id = p.id and c.created = (select max(c.created) from sp_project_comments c where c.project_id = p.id an'
||'d c.private_yn = ''N''))) last_comment_by,',
'       --',
'       -- last owner comments',
'       --',
'       (select max(dbms_lob.substr(c.body,200,1)||',
'               decode(greatest(dbms_lob.getlength(c.body),200),200,null,''...'')) last_comment ',
'        from   SP_PROJECT_COMMENTS c ',
'        where c.project_id = p.id and ',
'              c.private_yn = ''N'' and ',
'              c.AUTHOR_ID = p.owner_id and',
'              c.created = (select max(c2.created) from sp_project_comments c2 where c2.project_id = p.id and c2.AUTHOR_ID = p.owner_id and c2.private_yn = ''N''))',
'        as last_comment_by_owner,',
'       --',
'       (select max(c.created) from sp_project_comments c where c.project_id = p.id and c.author_id = p.owner_id and c.private_yn = ''N'') last_comment_by_owner_on,',
'       (select count(*) from sp_project_comments c where c.project_id = p.id and c.created >= sysdate - 28 and c.private_yn = ''N'') comments_28d,',
'       --',
'       -- activity',
'       --',
'       nvl((select count(*) from SP_ACTIVITIES ap where ap.project_id = p.id and trunc(sysdate) >= ap.start_date and trunc(sysdate) <= ap.end_date),0) current_activity_count,',
'       --',
'       -- release',
'       --',
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
'       -- initiative and area',
'       --',
'       i.initiative,',
'       (select area from sp_areas a where a.id = i.area_id) area,',
'       --',
'       -- quick look',
'       --',
'       null quick_look',
'from  SP_PROJECTS p,',
'      sp_initiatives i',
'where nvl(p.ARCHIVED_YN,''N'') = ''N'' and ',
'      p.DUPLICATE_OF_PROJECT_ID is null and',
'      p.initiative_id = i.id and ',
'      p.OWNER_ID in (select team_member_id from SP_GROUP_MEMBERS gm where gm.group_id = :P151_GROUP_ID)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P151_GROUP_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Member &NOMENCLATURE_PROJECTS.'
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
 p_id=>wwv_flow_imp.id(18962934065365064146)
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
,p_internal_uid=>8728879724218559746
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18962934206239064147)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Project Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18962934330407064148)
,p_db_column_name=>'OWNER_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Owner Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18962934390926064149)
,p_db_column_name=>'PROJECT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#FRIENDLY_IDENTIFIER#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18962934458160064150)
,p_db_column_name=>'THE_OWNER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242077492192072601)
,p_db_column_name=>'PRIORITY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242077639840072602)
,p_db_column_name=>'PCT_COMPLETE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Complete'
,p_column_html_expression=>'#PCT_COMPLETE#%'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242077724070072603)
,p_db_column_name=>'PROJECT_SIZE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Size'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242077781407072604)
,p_db_column_name=>'FRIENDLY_IDENTIFIER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Friendly Identifier'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242077913755072605)
,p_db_column_name=>'PROJECT_URL_NAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Project Url Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242077942478072606)
,p_db_column_name=>'TAGS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242078137077072607)
,p_db_column_name=>'FAVORITE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Favorite'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242078230394072608)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242078647065072613)
,p_db_column_name=>'UPDATED'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242078745214072614)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242078893008072615)
,p_db_column_name=>'LAST_COMMENT'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Last Comment'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242078997744072616)
,p_db_column_name=>'LAST_COMMENT_ON'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Last Comment On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242079129309072617)
,p_db_column_name=>'LAST_COMMENT_BY'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Last Comment By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242079188285072618)
,p_db_column_name=>'LAST_COMMENT_BY_OWNER'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Last Comment By Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242079291785072619)
,p_db_column_name=>'LAST_COMMENT_BY_OWNER_ON'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Last Comment By Owner On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242079420086072620)
,p_db_column_name=>'COMMENTS_28D'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Comments 28d'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242079514027072621)
,p_db_column_name=>'CURRENT_ACTIVITY_COUNT'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Current Activity Count'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242079595822072622)
,p_db_column_name=>'RELEASE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Release'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242080107795072627)
,p_db_column_name=>'INITIATIVE'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Initiative'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242080199563072628)
,p_db_column_name=>'AREA'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Area'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19242080259986072629)
,p_db_column_name=>'QUICK_LOOK'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Quick Look'
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID:#PROJECT_ID#'
,p_column_linktext=>'<span class="fa fa-align-justify" aria-hidden="true"></span>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19241967357171718031)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'90079131'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'INITIATIVE:PROJECT:THE_OWNER:RELEASE:PRIORITY:PCT_COMPLETE:PROJECT_SIZE:TAGS:FAVORITE:UPDATED:QUICK_LOOK'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19223190375577378551)
,p_plug_name=>'Group Members'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select gm.ID,',
'       gm.GROUP_ID,',
'       gm.TEAM_MEMBER_ID,',
'       (select first_name||'' ''||last_name from sp_team_members tm where tm.id = gm.TEAM_MEMBER_ID) group_member,',
'       (select email from sp_team_members tm where tm.id = gm.TEAM_MEMBER_ID) email,',
'       gm.ASSIGNMENT,',
'       gm.CREATED,',
'       gm.CREATED_BY,',
'       gm.UPDATED,',
'       gm.UPDATED_BY,',
'       decode(nvl(gm.full_time_yn,''N''),''Y'',''Yes'',''N'',''No'') full_time,',
'       decode(nvl(gm.group_leader_yn,''N''),''Y'',''Yes'',''N'',''No'') leader',
'  from SP_GROUP_MEMBERS gm',
'  where gm.group_id = :P151_GROUP_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Group Members'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(19223190510321378551)
,p_name=>'Group Members'
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
,p_detail_link=>'f?p=&APP_ID.:152:&APP_SESSION.::&DEBUG.:RP:P152_ID:\#ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'MIKE'
,p_internal_uid=>8989136169174874151
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19223190882458378554)
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
 p_id=>wwv_flow_imp.id(19223192091562378556)
,p_db_column_name=>'ASSIGNMENT'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Assignment'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19223192414282378556)
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
 p_id=>wwv_flow_imp.id(19223192786779378557)
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
 p_id=>wwv_flow_imp.id(19223193235331378557)
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
 p_id=>wwv_flow_imp.id(19223193604788378558)
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
 p_id=>wwv_flow_imp.id(18962933136366064136)
,p_db_column_name=>'GROUP_ID'
,p_display_order=>18
,p_column_identifier=>'I'
,p_column_label=>'Group Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18962933233714064137)
,p_db_column_name=>'TEAM_MEMBER_ID'
,p_display_order=>28
,p_column_identifier=>'J'
,p_column_label=>'Team Member Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18962933275314064138)
,p_db_column_name=>'GROUP_MEMBER'
,p_display_order=>38
,p_column_identifier=>'K'
,p_column_label=>'Group Member'
,p_column_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:RP,5:P5_ID:#TEAM_MEMBER_ID#'
,p_column_linktext=>'#GROUP_MEMBER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18962933396806064139)
,p_db_column_name=>'EMAIL'
,p_display_order=>48
,p_column_identifier=>'L'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20277967445705266732)
,p_db_column_name=>'FULL_TIME'
,p_display_order=>58
,p_column_identifier=>'M'
,p_column_label=>'Full Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20277967562655266733)
,p_db_column_name=>'LEADER'
,p_display_order=>68
,p_column_identifier=>'N'
,p_column_label=>'Leader'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19223228734850386176)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'89891744'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'GROUP_MEMBER:EMAIL:ASSIGNMENT:FULL_TIME:LEADER:UPDATED:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20277969125217266748)
,p_plug_name=>'Description'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   x clob;',
'begin',
'   for c1 in (select description from SP_GROUPS where id = :P151_GROUP_ID) loop',
'       x := apex_escape.html(c1.description);',
'   end loop;',
'   return x;',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20444450609790591802)
,p_plug_name=>'Associated &NOMENCLATURE_PROJECTS.'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>31
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       --',
'       -- IDs',
'       --',
'       p.ID as project_id,',
'       p.owner_id,',
'       --',
'       -- project information',
'       --',
'       p.PROJECT,',
'       (select FIRST_NAME ||'' ''||last_name from SP_TEAM_MEMBERS x where x.ID = p.OWNER_ID) the_owner,',
'       (select ''P''||PRIORITY from SP_PROJECT_PRIORITIES x where x.ID = p.PRIORITY_ID) priority,',
'       p.PCT_COMPLETE pct_complete,',
'       p.PROJECT_SIZE,',
'       p.friendly_identifier,',
'       p.project_url_name,',
'       replace(lower(p.tags),'','','', '') as tags,',
'       --',
'       -- favorite',
'       --',
'       nvl((',
'           select ''Yes'' ',
'           from sp_favorites f ',
'           where f.project_id = p.id and ',
'                 f.team_member_id = :APP_USER_ID),''No'') favorite,',
'       --',
'       -- project description',
'       --',
'       decode(nvl(dbms_lob.getlength(p.description),0),0,''Not Provided'',',
'           dbms_lob.substr(p.description,200,1)||',
'           decode(greatest(dbms_lob.getlength(p.description),200),200,null,''...'')) description,',
'       -- updated',
'       --',
'       p.UPDATED,',
'       nvl((select first_name||'' ''||last_name from SP_TEAM_MEMBERS tm where tm.email = lower(p.updated_by)),lower(p.updated_by)) updated_by,',
'       --',
'       -- last comments',
'       --',
'       (select max(dbms_lob.substr(c.body,200,1)||',
'               decode(greatest(dbms_lob.getlength(c.body),200),200,null,''...'')) last_comment ',
'        from   SP_PROJECT_COMMENTS c ',
'        where c.project_id = p.id and ',
'              c.private_yn = ''N'' and ',
'              c.created = (select max(c2.created) from sp_project_comments c2 where c2.project_id = p.id and c2.private_yn = ''N''))',
'        as last_comment,',
'       --',
'       (select max(c.created) from sp_project_comments c where c.project_id = p.id and c.private_yn = ''N'') last_comment_on,',
'       (select first_name||'' ''||last_name from SP_TEAM_MEMBERS t where t.id = (select max(c.author_id) from sp_project_comments c where c.project_id = p.id and c.created = (select max(c.created) from sp_project_comments c where c.project_id = p.id an'
||'d c.private_yn = ''N''))) last_comment_by,',
'       --',
'       -- last owner comments',
'       --',
'       (select max(dbms_lob.substr(c.body,200,1)||',
'               decode(greatest(dbms_lob.getlength(c.body),200),200,null,''...'')) last_comment ',
'        from   SP_PROJECT_COMMENTS c ',
'        where c.project_id = p.id and ',
'              c.private_yn = ''N'' and ',
'              c.AUTHOR_ID = p.owner_id and',
'              c.created = (select max(c2.created) from sp_project_comments c2 where c2.project_id = p.id and c2.AUTHOR_ID = p.owner_id and c2.private_yn = ''N''))',
'        as last_comment_by_owner,',
'       --',
'       (select max(c.created) from sp_project_comments c where c.project_id = p.id and c.author_id = p.owner_id and c.private_yn = ''N'') last_comment_by_owner_on,',
'       (select count(*) from sp_project_comments c where c.project_id = p.id and c.created >= sysdate - 28 and c.private_yn = ''N'') comments_28d,',
'       --',
'       -- activity',
'       --',
'       nvl((select count(*) from SP_ACTIVITIES ap where ap.project_id = p.id and trunc(sysdate) >= ap.start_date and trunc(sysdate) <= ap.end_date),0) current_activity_count,',
'       --',
'       -- release',
'       --',
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
'       -- initiative and area',
'       --',
'       i.initiative,',
'       (select area from sp_areas a where a.id = i.area_id) area,',
'       --',
'       -- quick look',
'       --',
'       null quick_look',
'from  SP_PROJECTS p,',
'      sp_initiatives i',
'where nvl(p.ARCHIVED_YN,''N'') = ''N'' and ',
'      p.DUPLICATE_OF_PROJECT_ID is null and',
'      p.initiative_id = i.id and ',
'      instr(',
'          '',''||p.tags||'','',',
'          '',''||:P151_GROUP_TAG||'',''',
'          ) > 0 and',
'      :P151_GROUP_TAG is not null'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P151_GROUP_TAG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Associated &NOMENCLATURE_PROJECTS.'
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
 p_id=>wwv_flow_imp.id(20444450698261591803)
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
,p_internal_uid=>10210396357115087403
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444450837019591804)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Project Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444450872766591805)
,p_db_column_name=>'OWNER_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Owner Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444450971923591806)
,p_db_column_name=>'PROJECT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#FRIENDLY_IDENTIFIER#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444451077795591807)
,p_db_column_name=>'THE_OWNER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444451159529591808)
,p_db_column_name=>'PRIORITY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444451306969591809)
,p_db_column_name=>'PCT_COMPLETE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Complete'
,p_column_html_expression=>'#PCT_COMPLETE#%'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444451351974591810)
,p_db_column_name=>'PROJECT_SIZE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Size'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444451494805591811)
,p_db_column_name=>'FRIENDLY_IDENTIFIER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Friendly Identifier'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444451609884591812)
,p_db_column_name=>'PROJECT_URL_NAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Project Url Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444451642869591813)
,p_db_column_name=>'TAGS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444451788058591814)
,p_db_column_name=>'FAVORITE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Favorite'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444451843594591815)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444452440845591820)
,p_db_column_name=>'UPDATED'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444452532201591821)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444452615112591822)
,p_db_column_name=>'LAST_COMMENT'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Last Comment'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444452687362591823)
,p_db_column_name=>'LAST_COMMENT_ON'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Last Comment On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444452757501591824)
,p_db_column_name=>'LAST_COMMENT_BY'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Last Comment By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444452917425591825)
,p_db_column_name=>'LAST_COMMENT_BY_OWNER'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Last Comment By Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444453012938591826)
,p_db_column_name=>'LAST_COMMENT_BY_OWNER_ON'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Last Comment By Owner On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444453135784591827)
,p_db_column_name=>'COMMENTS_28D'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Comments 28d'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444453226199591828)
,p_db_column_name=>'CURRENT_ACTIVITY_COUNT'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Current Activity Count'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444453248095591829)
,p_db_column_name=>'RELEASE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Release'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444453777568591834)
,p_db_column_name=>'INITIATIVE'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Initiative'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444453924452591835)
,p_db_column_name=>'AREA'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Area'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20444453947105591836)
,p_db_column_name=>'QUICK_LOOK'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Quick Look'
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID:#PROJECT_ID#'
,p_column_linktext=>'<span class="fa fa-align-justify" aria-hidden="true"></span>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(20444622754743621731)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'102105685'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT:THE_OWNER:PRIORITY:PROJECT_SIZE:TAGS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(37229207041018010982)
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
 p_id=>wwv_flow_imp.id(38093550396051025800)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(37229207041018010982)
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
 p_id=>wwv_flow_imp.id(38093551629557025812)
,p_name=>'ACTIONS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIONS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_display_sequence=>10
,p_use_as_row_header=>false
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(56460306786744611209)
,p_name=>'Group'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody:t-Region-orderBy--end:margin-left-md'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked'
,p_display_point=>'REGION_POSITION_01'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select g.group_name, g.id, g.created, g.updated,',
'       (select count(*) from SP_GROUP_MEMBERS gm where gm.group_id = g.id) members, group_tag',
'from SP_GROUPS  g',
'where g.id = :P151_GROUP_ID'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2115772683903439354
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18962932349990064129)
,p_query_column_id=>1
,p_column_alias=>'GROUP_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Group Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19223416061128053246)
,p_query_column_id=>2
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18962932531328064130)
,p_query_column_id=>3
,p_column_alias=>'CREATED'
,p_column_display_sequence=>40
,p_column_heading=>'Created'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18962932627939064131)
,p_query_column_id=>4
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>50
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19242080407183072630)
,p_query_column_id=>5
,p_column_alias=>'MEMBERS'
,p_column_display_sequence=>60
,p_column_heading=>'Members'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20277968927907266746)
,p_query_column_id=>6
,p_column_alias=>'GROUP_TAG'
,p_column_display_sequence=>30
,p_column_heading=>'Group Tag'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19223466612778390094)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(37229207041018010982)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18962932260765064128)
,p_name=>'P151_GROUP_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19223190375577378551)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18962933452291064140)
,p_name=>'P151_GROUP_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(19223190375577378551)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20444454057228591837)
,p_name=>'P151_GROUP_TAG'
,p_item_sequence=>50
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18962933557219064141)
,p_computation_sequence=>10
,p_computation_item=>'P151_GROUP_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select group_name from sp_groups g where g.id = :P151_GROUP_ID'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(19242080505769072631)
,p_computation_sequence=>20
,p_computation_item=>'LAST_PROJECT_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'151'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20444454413620591840)
,p_computation_sequence=>30
,p_computation_item=>'P151_GROUP_TAG'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select group_tag from sp_groups where id = :P151_GROUP_ID'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19223194348813378559)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(19223190375577378551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19223194916021378559)
,p_event_id=>wwv_flow_imp.id(19223194348813378559)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19223190375577378551)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18962932676990064132)
,p_name=>'create button dialog close'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(37229207041018010982)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18962932806923064133)
,p_event_id=>wwv_flow_imp.id(18962932676990064132)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19223190375577378551)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18962932873500064134)
,p_name=>'refresh on page edit'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(19223190375577378551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18962933023373064135)
,p_event_id=>wwv_flow_imp.id(18962932873500064134)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19223190375577378551)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20277969182604266749)
,p_name=>'refresh on breadcrumb dialog close'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(37229207041018010982)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20277969286431266750)
,p_event_id=>wwv_flow_imp.id(20277969182604266749)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(56460306786744611209)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20444450520510591801)
,p_event_id=>wwv_flow_imp.id(20277969182604266749)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(19223190375577378551)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20444454522312591841)
,p_event_id=>wwv_flow_imp.id(20277969182604266749)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(20277969125217266748)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(34205078218848768424)
,p_region_id=>wwv_flow_imp.id(38093550396051025800)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362316605839802174
,p_label=>'Add Group Member'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:152:&SESSION.::&DEBUG.:RP,152:P152_GROUP_ID:&P151_GROUP_ID.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-plus'
,p_is_hot=>true
,p_show_as_disabled=>false
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(38093550696630025803)
,p_region_id=>wwv_flow_imp.id(38093550396051025800)
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
 p_id=>wwv_flow_imp.id(20277968978779266747)
,p_component_action_id=>wwv_flow_imp.id(38093550696630025803)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Edit Group'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:150:&SESSION.::&DEBUG.:RP,150:P150_ID:&P151_GROUP_ID.'
,p_icon_css_classes=>'fa-edit'
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(20444454723978591843)
,p_component_action_id=>wwv_flow_imp.id(38093550696630025803)
,p_menu_entry_type=>'ENTRY'
,p_label=>'About Groups'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:145:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-info'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(32308537032490090590)
,p_component_action_id=>wwv_flow_imp.id(38093550696630025803)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>30
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(35324871425657123069)
,p_component_action_id=>wwv_flow_imp.id(38093550696630025803)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>50
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:RP,151::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(38093551402537025810)
,p_component_action_id=>wwv_flow_imp.id(38093550696630025803)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp.component_end;
end;
/
