prompt --application/pages/page_00086
begin
--   Manifest
--     PAGE: 00086
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
 p_id=>86
,p_name=>'Projects Interactive Report'
,p_alias=>'PROJECTS-INTERACTIVE-REPORT1'
,p_step_title=>'&NOMENCLATURE_PROJECTS. Interactive Report'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18817461586394195582)
,p_plug_name=>'Projects Interactive Report'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
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
'       case when p.requires_reviews_yn = ''Y'' then ''Yes'' else ''No'' end requires_reviews,',
'       case when p.doc_impact_yn = ''Y'' then ''Yes'' else ''No'' end doc_impact,',
'       p.friendly_identifier,',
'       p.project_url_name,',
'       replace(lower(p.tags),'','','', '') as tags,',
'       (select group_name from sp_project_groups',
'         where id = p.project_group_id) project_group,',
'       --',
'       external_ticket_identifier,',
'       external_system_link,',
'       external_sync_yn,',
'       sync_identifier,',
'       sync_system_link,',
'       last_synced_on,',
'       last_sync_status,',
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
'       -- contributors',
'       --',
'       (select listagg(distinct xtm.first_name||'' ''||xtm.last_name, '', '') within group (order by 1) names',
'          from SP_TASKS xpc, SP_TEAM_MEMBERS xtm',
'         where xpc.project_id = p.id and',
'               xpc.OWNER_ID = xtm.id',
'                ) contributors,',
'       --',
'       -- contributor emails',
'       --',
'       (select listagg(distinct xtm.email, '', '') within group (order by 1) names',
'          from SP_TASKS xpc, SP_TEAM_MEMBERS xtm',
'         where xpc.project_id = p.id and',
'               xpc.OWNER_ID = xtm.id',
'               ) contributor_emails,',
'       --',
'       -- reviews',
'       --',
'       (select count(*) from sp_tasks t, sp_task_types tt',
'         where t.project_id = p.id ',
'           and nvl(t.task_sub_type_id,t.task_type_id) = tt.id    ',
'           and tt.static_id like ''REVIEW%'') review_cnt,',
'       (select listagg(distinct xtm.first_name||'' ''||xtm.last_name, '', '') within group (order by 1) names',
'          from SP_TASKS xpc, SP_TEAM_MEMBERS xtm, sp_task_types tt',
'         where xpc.project_id = p.id and',
'               xpc.OWNER_ID = xtm.id and ',
'               nvl(xpc.task_sub_type_id,xpc.task_type_id) = tt.id and ',
'               tt.static_id like ''REVIEW%''',
'                ) reviewers,',
'       (select listagg(tt.task_type||'' - ''||nvl(to_char(t.target_complete,''DD-MON-YYYY''),''No date''), '', '') within group (order by t.target_complete nulls first) ',
'          from sp_tasks t, sp_task_types tt',
'         where t.project_id = p.id ',
'           and nvl(t.task_sub_type_id,t.task_type_id) = tt.id    ',
'           and tt.static_id like ''REVIEW%'') reviews,',
'       --',
'       -- milestones',
'       --',
'       (select count(*) from sp_tasks t, sp_task_types tt',
'         where t.project_id = p.id ',
'           and nvl(t.task_sub_type_id,t.task_type_id) = tt.id    ',
'           and tt.static_id like ''MILESTONE%'') milestone_cnt,',
'       (select listagg(tt.task_type||'' - ''||nvl(to_char(t.target_complete,''DD-MON-YYYY''),''No date''), '', '') within group (order by t.target_complete nulls first) ',
'          from sp_tasks t, sp_task_types tt',
'         where t.project_id = p.id ',
'           and nvl(t.task_sub_type_id,t.task_type_id) = tt.id    ',
'           and tt.static_id like ''MILESTONE%'') milestones,',
'       --',
'       -- updated',
'       --',
'       p.UPDATED,',
'       P.CREATED,',
'       nvl((select first_name||'' ''||last_name from SP_TEAM_MEMBERS tm where tm.email = lower(p.updated_by)),lower(p.updated_by)) updated_by,',
'       --',
'       -- last comments',
'       --',
'       (select max(dbms_lob.substr(c.body,255,1)||',
'               decode(greatest(dbms_lob.getlength(c.body),255),255,null,''...'')) last_comment ',
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
'       (select max(dbms_lob.substr(c.body,255,1)||',
'               decode(greatest(dbms_lob.getlength(c.body),255),255,null,''...'')) last_comment ',
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
'       (select focus_area from sp_initiative_focus_areas where id = p.focus_area_id) focus_area,',
'       -- ',
'       -- size',
'       --',
'       p.PROJECT_SIZE,',
'       z.size_description,',
'       z.effort_days,',
'       round((100 - p.PCT_COMPLETE) * z.effort_days *.01) days_remaining,',
'       --',
'       -- quick look',
'       --',
'       null quick_look',
'from  SP_PROJECTS p,',
'      sp_project_scales s,',
'      sp_initiatives i,',
'      SP_PROJECT_SIZES z',
'where nvl(p.ARCHIVED_YN,''N'') = ''N'' and ',
'      p.DUPLICATE_OF_PROJECT_ID is null and',
'      p.status_scale = s.scale_letter and ',
'      p.initiative_id = i.id and',
'      p.PROJECT_SIZE = z.project_size'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Projects Interactive Report'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(18817461732300195582)
,p_name=>'Projects Interactive Report'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_save_rpt_public_auth_scheme=>wwv_flow_imp.id(149556930433130434424)
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24:P24_ID:#PROJECT_ID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_auth_scheme=>wwv_flow_imp.id(149556930589415434424)
,p_owner=>'MIKE'
,p_internal_uid=>8583407391153691182
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817462307194195587)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Project Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817462746537195591)
,p_db_column_name=>'OWNER_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Owner Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817463236615195593)
,p_db_column_name=>'PROJECT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'&NOMENCLATURE_PROJECT.'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:FI,PN:#FRIENDLY_IDENTIFIER#,#PROJECT_URL_NAME#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817463617345195595)
,p_db_column_name=>'THE_OWNER'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817463947780195596)
,p_db_column_name=>'PRIORITY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817464347061195597)
,p_db_column_name=>'PCT_COMPLETE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Comp'
,p_column_html_expression=>'#PCT_COMPLETE#%'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817464799405195598)
,p_db_column_name=>'PROJECT_SIZE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Size'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817465237687195599)
,p_db_column_name=>'FRIENDLY_IDENTIFIER'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Friendly Identifier'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817465622124195600)
,p_db_column_name=>'PROJECT_URL_NAME'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Project Url Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817465956034195603)
,p_db_column_name=>'UPDATED'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817466389923195604)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817466827665195605)
,p_db_column_name=>'LAST_COMMENT'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Last Comment'
,p_column_html_expression=>'#LAST_COMMENT# - #LAST_COMMENT_BY# - #LAST_COMMENT_ON#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817467149439195607)
,p_db_column_name=>'LAST_COMMENT_ON'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Last Comment Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817467682635195608)
,p_db_column_name=>'LAST_COMMENT_BY'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Last Comment By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817468207028195610)
,p_db_column_name=>'LAST_COMMENT_BY_OWNER'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Last Comment By Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817468568683195612)
,p_db_column_name=>'LAST_COMMENT_BY_OWNER_ON'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Last Comment By Owner Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817469356187195616)
,p_db_column_name=>'CURRENT_ACTIVITY_COUNT'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Current Activity Count'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817469834369195618)
,p_db_column_name=>'INITIATIVE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Initiative'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18817470264763195620)
,p_db_column_name=>'RELEASE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Release'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18635534646316822417)
,p_db_column_name=>'AREA'
,p_display_order=>35
,p_column_identifier=>'Z'
,p_column_label=>'&NOMENCLATURE_AREA.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18635534803711822418)
,p_db_column_name=>'COMMENTS_28D'
,p_display_order=>45
,p_column_identifier=>'AA'
,p_column_label=>'Comments 28d'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18635535201189822422)
,p_db_column_name=>'CONTRIBUTORS'
,p_display_order=>55
,p_column_identifier=>'AB'
,p_column_label=>'Contributors'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18635535615381822426)
,p_db_column_name=>'CONTRIBUTOR_EMAILS'
,p_display_order=>85
,p_column_identifier=>'AF'
,p_column_label=>'Contributor Emails'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18635536512083822435)
,p_db_column_name=>'QUICK_LOOK'
,p_display_order=>95
,p_column_identifier=>'AG'
,p_column_label=>'Quick Look'
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:RP,36:P36_ID:#PROJECT_ID#'
,p_column_linktext=>'<span class="fa fa-align-justify" aria-hidden="true"></span>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18635536597244822436)
,p_db_column_name=>'TAGS'
,p_display_order=>105
,p_column_identifier=>'AH'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18635537089064822441)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>115
,p_column_identifier=>'AI'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18962929584050064101)
,p_db_column_name=>'FAVORITE'
,p_display_order=>125
,p_column_identifier=>'AJ'
,p_column_label=>'Favorite'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22349830070393897838)
,p_db_column_name=>'REQUIRES_REVIEWS'
,p_display_order=>135
,p_column_identifier=>'AL'
,p_column_label=>'Requires Reviews'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(13408792237973796442)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22582864973903320647)
,p_db_column_name=>'CREATED'
,p_display_order=>145
,p_column_identifier=>'AM'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE_SHORT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22582865107084320648)
,p_db_column_name=>'EXTERNAL_TICKET_IDENTIFIER'
,p_display_order=>155
,p_column_identifier=>'AN'
,p_column_label=>'External Ticket Identifier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22582865211427320649)
,p_db_column_name=>'EXTERNAL_SYSTEM_LINK'
,p_display_order=>165
,p_column_identifier=>'AO'
,p_column_label=>'External System Link'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(22582865246530320650)
,p_db_column_name=>'SIZE_DESCRIPTION'
,p_display_order=>175
,p_column_identifier=>'AP'
,p_column_label=>'Size Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23664880428653389201)
,p_db_column_name=>'EFFORT_DAYS'
,p_display_order=>185
,p_column_identifier=>'AQ'
,p_column_label=>'Effort Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(23664880488352389202)
,p_db_column_name=>'DAYS_REMAINING'
,p_display_order=>195
,p_column_identifier=>'AR'
,p_column_label=>'Days Remaining'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28786569180781724349)
,p_db_column_name=>'MILESTONES'
,p_display_order=>215
,p_column_identifier=>'AT'
,p_column_label=>'Milestones'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949663808563474037)
,p_db_column_name=>'REVIEW_CNT'
,p_display_order=>225
,p_column_identifier=>'AU'
,p_column_label=>'Review Cnt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(13408792237973796442)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949663866922474038)
,p_db_column_name=>'REVIEWERS'
,p_display_order=>235
,p_column_identifier=>'AV'
,p_column_label=>'Reviewers'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(13408792237973796442)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949663953057474039)
,p_db_column_name=>'REVIEWS'
,p_display_order=>245
,p_column_identifier=>'AW'
,p_column_label=>'Reviews'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(13408792237973796442)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10949664104955474040)
,p_db_column_name=>'MILESTONE_CNT'
,p_display_order=>255
,p_column_identifier=>'AX'
,p_column_label=>'Milestone Cnt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11587034841825630818)
,p_db_column_name=>'DOC_IMPACT'
,p_display_order=>265
,p_column_identifier=>'AY'
,p_column_label=>'Doc Impact'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13628145222534228415)
,p_db_column_name=>'FOCUS_AREA'
,p_display_order=>275
,p_column_identifier=>'AZ'
,p_column_label=>'Focus Area'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from sp_initiative_focus_areas'))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13628146081356228424)
,p_db_column_name=>'EXTERNAL_SYNC_YN'
,p_display_order=>285
,p_column_identifier=>'BA'
,p_column_label=>'External Sync'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13628146161652228425)
,p_db_column_name=>'SYNC_IDENTIFIER'
,p_display_order=>295
,p_column_identifier=>'BB'
,p_column_label=>'Sync Identifier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13628146255258228426)
,p_db_column_name=>'SYNC_SYSTEM_LINK'
,p_display_order=>305
,p_column_identifier=>'BC'
,p_column_label=>'Sync System Link'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13628146356809228427)
,p_db_column_name=>'LAST_SYNCED_ON'
,p_display_order=>315
,p_column_identifier=>'BD'
,p_column_label=>'Last Synced On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13628146460490228428)
,p_db_column_name=>'LAST_SYNC_STATUS'
,p_display_order=>325
,p_column_identifier=>'BE'
,p_column_label=>'Last Sync Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(28418375547127926008)
,p_db_column_name=>'PROJECT_GROUP'
,p_display_order=>335
,p_column_identifier=>'BF'
,p_column_label=>'&NOMENCLATURE_PROJECT. Group'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(18817274704809552531)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'85832204'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'INITIATIVE:RELEASE:PROJECT:THE_OWNER:CONTRIBUTORS:PRIORITY:PCT_COMPLETE:PROJECT_SIZE:FOCUS_AREA:CURRENT_ACTIVITY_COUNT:LAST_COMMENT:FAVORITE:UPDATED:QUICK_LOOK:'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(23665490819173288621)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Milestones and Reviews'
,p_report_seq=>10
,p_report_alias=>'134314365'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'INITIATIVE:RELEASE:PROJECT:THE_OWNER:PRIORITY:PCT_COMPLETE:PROJECT_SIZE:MILESTONES:REVIEWS:REQUIRES_REVIEWS:UPDATED:QUICK_LOOK:'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(23665519383378296008)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Effort and Days Remaining'
,p_report_seq=>10
,p_report_alias=>'134314651'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'INITIATIVE:RELEASE:PROJECT:THE_OWNER:PRIORITY:PCT_COMPLETE:PROJECT_SIZE:EFFORT_DAYS:DAYS_REMAINING:LAST_COMMENT:UPDATED:QUICK_LOOK'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23435751115442832833)
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
 p_id=>wwv_flow_imp.id(24300094470475847651)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(23435751115442832833)
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
 p_id=>wwv_flow_imp.id(24300095703981847663)
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
 p_id=>wwv_flow_imp.id(18821016844495710410)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(23435751115442832833)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_PROJ_JUMP_PG.:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18635535062270822421)
,p_computation_sequence=>10
,p_computation_item=>'LAST_PROJECT_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'86'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18635535914944822429)
,p_name=>'refresh on dc'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(23435751115442832833)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18635536031343822430)
,p_event_id=>wwv_flow_imp.id(18635535914944822429)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(18817461586394195582)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18635537450676822445)
,p_name=>'refresh on dc from report'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(18817461586394195582)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18635537544257822446)
,p_event_id=>wwv_flow_imp.id(18635537450676822445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(18817461586394195582)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(20442748618036524647)
,p_region_id=>wwv_flow_imp.id(24300094470475847651)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362316605839802174
,p_label=>'Add &NOMENCLATURE_PROJECT.'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:104,24::'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-plus'
,p_is_hot=>true
,p_show_as_disabled=>false
,p_authorization_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(24300094771054847654)
,p_region_id=>wwv_flow_imp.id(24300094470475847651)
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
 p_id=>wwv_flow_imp.id(18635535039944822420)
,p_component_action_id=>wwv_flow_imp.id(24300094771054847654)
,p_menu_entry_type=>'ENTRY'
,p_label=>'My &NOMENCLATURE_PROJECTS.'
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:113:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-package'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(20157989790266887719)
,p_component_action_id=>wwv_flow_imp.id(24300094771054847654)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>140
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP,CIR,RIR,86::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(20157989958883887720)
,p_component_action_id=>wwv_flow_imp.id(24300094771054847654)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>60
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(20157993399273887755)
,p_component_action_id=>wwv_flow_imp.id(24300094771054847654)
,p_menu_entry_type=>'ENTRY'
,p_label=>'About &NOMENCLATURE_PROJECTS.'
,p_display_sequence=>120
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-info'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(20226999886315504231)
,p_component_action_id=>wwv_flow_imp.id(24300094771054847654)
,p_menu_entry_type=>'ENTRY'
,p_label=>'&NOMENCLATURE_PROJECTS. Primary Report'
,p_display_sequence=>20
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-package'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(20913285594460600440)
,p_component_action_id=>wwv_flow_imp.id(24300094771054847654)
,p_menu_entry_type=>'ENTRY'
,p_label=>'My Activities'
,p_display_sequence=>70
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:RP,102:P102_PERSON:&APP_USER_FIRST_LAST_NAME.'
,p_icon_css_classes=>'fa-badge-check'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(20913285679284600441)
,p_component_action_id=>wwv_flow_imp.id(24300094771054847654)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>110
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(20913285848303600442)
,p_component_action_id=>wwv_flow_imp.id(24300094771054847654)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>80
,p_build_option_id=>wwv_flow_imp.id(14578465101782602994)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(21522351395887140556)
,p_component_action_id=>wwv_flow_imp.id(24300094771054847654)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Releases'
,p_display_sequence=>90
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-ship'
,p_build_option_id=>wwv_flow_imp.id(14578465101782602994)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(24300095476961847661)
,p_component_action_id=>wwv_flow_imp.id(24300094771054847654)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>130
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp.component_end;
end;
/
