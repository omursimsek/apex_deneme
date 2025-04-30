prompt --application/pages/page_00019
begin
--   Manifest
--     PAGE: 00019
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
 p_id=>19
,p_name=>'People Details'
,p_alias=>'PEOPLE-DETAILS'
,p_step_title=>'&NOMENCLATURE_USERS. Details'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401355622061234923)
,p_step_template=>2526643373347724467
,p_page_template_options=>'#DEFAULT#:t-PageBody--noContentPadding'
,p_protection_level=>'C'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13155077750843924720)
,p_plug_name=>'filters'
,p_region_template_options=>'#DEFAULT#:margin-top-md:margin-bottom-md'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>3
,p_location=>null
,p_plug_source=>'<div id="active_facets"></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14879915567092561201)
,p_plug_name=>'Breadcrumb'
,p_region_sub_css_classes=>'has-header-actions'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15744258922125576019)
,p_plug_name=>'Menubar'
,p_parent_plug_id=>wwv_flow_imp.id(14879915567092561201)
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
 p_id=>wwv_flow_imp.id(15744260155631576031)
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
 p_id=>wwv_flow_imp.id(16197846040588640536)
,p_name=>'Users '
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noBorder:t-Region--scrollBody:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'   id, ',
'   name,',
'   email_domain,',
'   email,',
'   tags,',
'   is_current,',
'   updated,',
'   focus_area_leads,',
'   initiatives_leads,',
'   project_leads,',
'   documents,',
'   comments,',
'   activities,',
'   --',
'   -- total',
'   --',
'   nvl(focus_area_leads,0) + ',
'   nvl(initiatives_leads,0) + ',
'   nvl(project_leads,0) + ',
'   nvl(documents,0) + ',
'   nvl(comments,0) + ',
'   nvl(comment_mentions,0) +',
'   nvl(activities,0) +',
'   nvl(milestones,0) +',
'   nvl(reviews,0)+',
'   nvl(tasks,0) total,',
'   --',
'   --',
'   --',
'   decode(nvl(project_leads,0),0,''No'',''Yes'') project_lead,',
'   comment_mentions,',
'   app_role,',
'   nvl((select COUNTRY_NAME from sp_countries cc where cc.id = x.country_id),''Unknown'') country,',
'   nvl((select region from sp_countries cc where cc.id = x.country_id),''Unknown'') region,',
'   milestones,',
'   reviews,',
'   tasks,',
'   has_activities,',
'   active_subscriptions,',
'   decode(active_subscriptions,0,''No'',''Yes'') has_subscriptions,',
'   has_profile_photo',
'from (',
'select ',
'    t.ID,',
'    t.FIRST_NAME||'' ''||t.last_name name,',
'    t.country_id,',
'    t.TAGS,',
'    t.app_role,',
'    decode(t.IS_CURRENT_YN,''Y'',''Yes'',''N'',''No'',IS_CURRENT_YN) IS_CURRENT,',
'    t.UPDATED,',
'    t.email,',
'    t.email_domain,',
'    --',
'    --flags',
'    --',
'    nvl((select ''Yes'' from dual where exists (',
'        select 1 ',
'        from SP_ACTIVITIES ap ',
'        where ap.TEAM_MEMBER_ID = t.id and ',
'              ap.end_date >= trunc(sysdate)',
'        )),''No'') has_activities,',
'    --',
'    -- project child attributes',
'    --',
'    (select count(*) from SP_AREAS f where f.owner_id = t.id) focus_area_leads,',
'    (select count(*) from SP_INITIATIVES i where i.sponsor_id = t.id) initiatives_leads,',
'    (select count(*) from sp_projects p where p.owner_id = t.id and ARCHIVED_YN = ''N'') project_leads,',
'    (select count(*) from SP_TASKS a, sp_task_types tt ',
'      where nvl(a.task_sub_type_id,a.task_type_id) = tt.id',
'        and tt.static_id like ''MILESTONE%''',
'        and a.owner_id = t.id) milestones,',
'    (select count(*) from SP_TASKS a, sp_task_types tt ',
'      where nvl(a.task_sub_type_id,a.task_type_id) = tt.id',
'        and tt.static_id like ''REVIEW%''',
'        and a.owner_id = t.id) reviews,',
'    (select count(*) from SP_TASKS a, sp_task_types tt ',
'      where nvl(a.task_sub_type_id,a.task_type_id) = tt.id',
'        and tt.static_id not like ''MILESTONE%''',
'        and tt.static_id not like ''REVIEW%''',
'        and a.owner_id = t.id) tasks,',
'    (select count(*) from SP_PROJECT_DOCUMENTS d where d.created_by = upper(t.email)) documents,',
'    (select count(*) from SP_PROJECT_COMMENTS c where c.AUTHOR_ID = t.id) comments,',
'    (select count(*) from SP_ACTIVITIES ap where ap.TEAM_MEMBER_ID = t.id and ap.end_date >= trunc(sysdate)) activities,',
'    --',
'    -- subscriptions',
'    --',
'    nvl((select count(*) from SP_NOTIFICATION_SUBSCRIPTIONS ns where ns.team_member_id = t.id and ns.opted_in_yn = ''Y''),0) active_subscriptions,',
'    --',
'    -- profile photo',
'    --',
'    decode(dbms_lob.getlength(photo),null,''No'',decode(dbms_lob.getlength(photo),0,''No'',''Yes'')) has_profile_photo,',
'    --',
'    -- comment mentions',
'    --',
'    (   ',
'    select count(distinct p.id)',
'    from SP_PROJECT_COMMENTS_EMAILS e,',
'         sp_projects p, ',
'         sp_team_members tm,',
'         SP_PROJECT_COMMENTS c',
'    where t.id = tm.id and',
'          e.email = tm.email and',
'          c.id = e.COMMENT_ID and',
'          c.project_id = p.id) comment_mentions',
'from SP_TEAM_MEMBERS t',
') x'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>30
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_report_total_text_format=>'Total'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16197846095189640537)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>10
,p_column_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP,20:P20_ID:#ID#'
,p_column_linktext=>'<span aria-hidden="true" class="fa fa-pencil-square-o"></span>'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_report_column_required_role=>wwv_flow_imp.id(149556930433130434424)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16197846218530640538)
,p_query_column_id=>2
,p_column_alias=>'NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Name'
,p_column_link=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_TEAM_MEMBER_ID:#ID#'
,p_column_linktext=>'#NAME#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16993590195790300311)
,p_query_column_id=>3
,p_column_alias=>'EMAIL_DOMAIN'
,p_column_display_sequence=>210
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21062910827581426612)
,p_query_column_id=>4
,p_column_alias=>'EMAIL'
,p_column_display_sequence=>190
,p_column_heading=>'Email'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16197846353142640540)
,p_query_column_id=>5
,p_column_alias=>'TAGS'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16993589991655300309)
,p_query_column_id=>6
,p_column_alias=>'IS_CURRENT'
,p_column_display_sequence=>170
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16197846848250640545)
,p_query_column_id=>7
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>200
,p_column_heading=>'Updated'
,p_column_format=>'SINCE_SHORT'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_default_sort_dir=>'desc'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16197847020565640546)
,p_query_column_id=>8
,p_column_alias=>'FOCUS_AREA_LEADS'
,p_column_display_sequence=>50
,p_column_heading=>'&NOMENCLATURE_AREA. Owner'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16197847050720640547)
,p_query_column_id=>9
,p_column_alias=>'INITIATIVES_LEADS'
,p_column_display_sequence=>60
,p_column_heading=>'&NOMENCLATURE_INITIATIVE. Owner'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16197847191709640548)
,p_query_column_id=>10
,p_column_alias=>'PROJECT_LEADS'
,p_column_display_sequence=>70
,p_column_heading=>'&NOMENCLATURE_PROJECT. Owner'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16197847312727640549)
,p_query_column_id=>11
,p_column_alias=>'DOCUMENTS'
,p_column_display_sequence=>100
,p_column_heading=>'Documents'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16197847393535640550)
,p_query_column_id=>12
,p_column_alias=>'COMMENTS'
,p_column_display_sequence=>110
,p_column_heading=>'Comments'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(10300808052541039220)
,p_query_column_id=>13
,p_column_alias=>'ACTIVITIES'
,p_column_display_sequence=>90
,p_column_heading=>'Current or Future Activities'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_required_patch=>wwv_flow_imp.id(24517378663928473922)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16993589276295300302)
,p_query_column_id=>14
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>160
,p_column_heading=>'Total'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(16993591565840300325)
,p_query_column_id=>15
,p_column_alias=>'PROJECT_LEAD'
,p_column_display_sequence=>220
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18411497175739477547)
,p_query_column_id=>16
,p_column_alias=>'COMMENT_MENTIONS'
,p_column_display_sequence=>120
,p_column_heading=>'Mentions'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(19443695932627318730)
,p_query_column_id=>17
,p_column_alias=>'APP_ROLE'
,p_column_display_sequence=>230
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20563625099166787128)
,p_query_column_id=>18
,p_column_alias=>'COUNTRY'
,p_column_display_sequence=>180
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20563626896588787146)
,p_query_column_id=>19
,p_column_alias=>'REGION'
,p_column_display_sequence=>240
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11587034236611630811)
,p_query_column_id=>20
,p_column_alias=>'MILESTONES'
,p_column_display_sequence=>130
,p_column_heading=>'Milestones'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20050768406068703113)
,p_query_column_id=>21
,p_column_alias=>'REVIEWS'
,p_column_display_sequence=>140
,p_column_heading=>'Reviews'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11587034279417630812)
,p_query_column_id=>22
,p_column_alias=>'TASKS'
,p_column_display_sequence=>150
,p_column_heading=>'Tasks'
,p_column_format=>'999G999G999G999G999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(13155077934190924721)
,p_query_column_id=>23
,p_column_alias=>'HAS_ACTIVITIES'
,p_column_display_sequence=>250
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14241840142630515230)
,p_query_column_id=>24
,p_column_alias=>'ACTIVE_SUBSCRIPTIONS'
,p_column_display_sequence=>260
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14241840328642515231)
,p_query_column_id=>25
,p_column_alias=>'HAS_SUBSCRIPTIONS'
,p_column_display_sequence=>270
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(14322867428785503144)
,p_query_column_id=>26
,p_column_alias=>'HAS_PROFILE_PHOTO'
,p_column_display_sequence=>280
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16993589662374300306)
,p_plug_name=>'Faceted Search'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(16197846040588640536)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'current_facets_selector', '#active_facets',
  'display_chart_for_top_n_values', '20',
  'show_charts', 'Y',
  'show_current_facets', 'E',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11638603509014495944)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(14879915567092561201)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13155077956147924722)
,p_name=>'P19_HAS_ACTIVITIES'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(16993589662374300306)
,p_prompt=>'Current or Future Activities'
,p_source=>'HAS_ACTIVITIES'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14241840400772515232)
,p_name=>'P19_HAS_SUBSCRIPTIONS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(16993589662374300306)
,p_prompt=>'Has Subscriptions'
,p_source=>'HAS_SUBSCRIPTIONS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14322867457036503145)
,p_name=>'P19_HAS_PROFILE_PHOTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(16993589662374300306)
,p_prompt=>'Has Profile Photo'
,p_source=>'HAS_PROFILE_PHOTO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>7
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16993589799432300307)
,p_name=>'P19_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(16993589662374300306)
,p_prompt=>'Search'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16993589931481300308)
,p_name=>'P19_TAGS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(16993589662374300306)
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>','
,p_multi_value_trim_space=>true
,p_fc_filter_combination=>'OR'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16993590124930300310)
,p_name=>'P19_IS_CURRENT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(16993589662374300306)
,p_prompt=>'Is Current'
,p_source=>'IS_CURRENT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_display_as=>'FILTER_DIALOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16993590253249300312)
,p_name=>'P19_EMAIL_DOMAIN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(16993589662374300306)
,p_prompt=>'Email Domain'
,p_source=>'EMAIL_DOMAIN'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16993591650224300326)
,p_name=>'P19_PROJECT_LEAD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(16993589662374300306)
,p_prompt=>'&NOMENCLATURE_PROJECT. Owner'
,p_source=>'PROJECT_LEAD'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_display_as=>'FILTER_DIALOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19443695825854318729)
,p_name=>'P19_APP_ROLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(16993589662374300306)
,p_prompt=>'App Role'
,p_source=>'APP_ROLE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20563625175536787129)
,p_name=>'P19_COUNTRY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(16993589662374300306)
,p_prompt=>'Country'
,p_source=>'COUNTRY'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>true
,p_fc_display_as=>'INLINE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20563626981818787147)
,p_name=>'P19_REGION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(16993589662374300306)
,p_prompt=>'Region'
,p_source=>'REGION'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov_sort_direction=>'ASC'
,p_item_template_options=>'#DEFAULT#'
,p_fc_show_label=>true
,p_fc_collapsible=>false
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_display_as=>'FILTER_DIALOG'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(16993590435123300313)
,p_name=>'DC'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(16197846040588640536)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16993590515166300314)
,p_event_id=>wwv_flow_imp.id(16993590435123300313)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(16197846040588640536)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(10581542878867449024)
,p_event_id=>wwv_flow_imp.id(16993590435123300313)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(16993589662374300306)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11652230044365405931)
,p_name=>'refresh on dialog closed'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(14879915567092561201)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11652230190534405932)
,p_event_id=>wwv_flow_imp.id(11652230044365405931)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(16197846040588640536)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11652230263148405933)
,p_event_id=>wwv_flow_imp.id(11652230044365405931)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(16993589662374300306)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19443695957364318731)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'sync roles'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sp_strategic_proj_util.sync_team_members_app_role (',
'    p_app_id => :APP_ID);'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9209641616217814331
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(11855786744923318643)
,p_region_id=>wwv_flow_imp.id(15744258922125576019)
,p_position_id=>362316004162771045
,p_display_sequence=>10
,p_template_id=>362316605839802174
,p_label=>'Add &NOMENCLATURE_USER.'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:RP,20::'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-plus'
,p_is_hot=>true
,p_show_as_disabled=>false
,p_authorization_scheme=>wwv_flow_imp.id(149556930433130434424)
);
wwv_flow_imp_page.create_component_action(
 p_id=>wwv_flow_imp.id(15744259222704576022)
,p_region_id=>wwv_flow_imp.id(15744258922125576019)
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
 p_id=>wwv_flow_imp.id(11571031534103681750)
,p_component_action_id=>wwv_flow_imp.id(15744259222704576022)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Add Multiple &NOMENCLATURE_USERS. (admin)'
,p_display_sequence=>10
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:RP,54::'
,p_icon_css_classes=>'fa-users'
,p_authorization_scheme=>wwv_flow_imp.id(149556930433130434424)
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12975579951731673288)
,p_component_action_id=>wwv_flow_imp.id(15744259222704576022)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Reset'
,p_display_sequence=>80
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,19::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(12975580142883673289)
,p_component_action_id=>wwv_flow_imp.id(15744259222704576022)
,p_menu_entry_type=>'ENTRY'
,p_label=>'About &NOMENCLATURE_USERS.'
,p_display_sequence=>40
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:109:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-info'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(14331409635139820611)
,p_component_action_id=>wwv_flow_imp.id(15744259222704576022)
,p_menu_entry_type=>'ENTRY'
,p_label=>'View &NOMENCLATURE_USERS. List'
,p_display_sequence=>30
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:74:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-users'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(14331411527559820630)
,p_component_action_id=>wwv_flow_imp.id(15744259222704576022)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>60
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(15744259928611576029)
,p_component_action_id=>wwv_flow_imp.id(15744259222704576022)
,p_menu_entry_type=>'ENTRY'
,p_label=>'Refresh'
,p_display_sequence=>70
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_comp_menu_entry(
 p_id=>wwv_flow_imp.id(21674368700482430111)
,p_component_action_id=>wwv_flow_imp.id(15744259222704576022)
,p_menu_entry_type=>'SEPARATOR'
,p_display_sequence=>20
);
wwv_flow_imp.component_end;
end;
/
