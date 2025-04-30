prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1801054401786990
,p_default_application_id=>100
,p_default_id_offset=>1802635531803972
,p_default_owner=>'OMUR'
);
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(149557269712237859365)
,p_welcome_message=>'This application installer will guide you through the process of creating your database objects and seed data.'
,p_configuration_message=>'You can configure the following attributes of your application.'
,p_build_options_message=>'You can choose to include the following build options.'
,p_validation_message=>'The following validations will be performed to ensure your system is compatible with this application.'
,p_install_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_message=>'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.'
,p_upgrade_confirm_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_success_message=>'Your application''s supporting objects have been installed.'
,p_upgrade_failure_message=>'Installation of database objects and seed data has failed.'
,p_deinstall_success_message=>'Deinstallation complete.'
,p_deinstall_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    sys.dbms_scheduler.drop_job    ',
'     (job_name => ''SP_NOTIF_SUBSCRIPTIONS'');',
'end;',
'/',
'',
'drop sequence   sp_seq;',
'drop sequence   sp_kb_stack_rank_seq;',
'',
'drop package    sp_globals;',
'drop package    sp_release_timeline;',
'drop package    sp_log;',
'drop package    sp_strategic_proj_util;',
'drop package    sp_value_compare;',
'drop package    sp_contributor_summary;',
'drop procedure  sp_favorite_toggle;',
'drop function   sp_date_range_pct_comp;',
'drop function   sp_tag_diff;',
'',
'drop table SP_APP_NOMENCLATURE           cascade constraints;',
'drop table sp_app_pages                  cascade constraints;',
'drop table sp_app_settings               cascade constraints;',
'drop table sp_app_log                    cascade constraints;',
'drop table SP_DEFAULT_TAGS               cascade constraints;',
'drop table sp_countries                  cascade constraints;',
'drop table sp_project_priorities         cascade constraints;',
'drop table sp_resource_types             cascade constraints;',
'drop table sp_team_members               cascade constraints;',
'drop table SP_TEAM_MEMBER_NOTIFICATIONS  cascade constraints;',
'drop table sp_areas                      cascade constraints;',
'drop table sp_initiatives                cascade constraints;',
'drop table sp_initiative_history         cascade constraints;',
'drop table sp_initiative_documents       cascade constraints;',
'drop table sp_initiative_comments        cascade constraints;',
'drop table sp_initiative_links           cascade constraints;',
'drop table sp_initiative_focus_areas     cascade constraints;',
'drop table sp_init_focus_area_history    cascade constraints;',
'drop table sp_init_focus_area_documents  cascade constraints;',
'drop table sp_init_focus_area_comments   cascade constraints;',
'drop table sp_init_focus_area_links      cascade constraints;',
'drop table sp_projects                   cascade constraints;',
'drop table sp_project_history            cascade constraints;',
'drop table sp_project_contributors       cascade constraints;',
'drop table sp_project_comments           cascade constraints;',
'drop table sp_project_documents          cascade constraints;',
'drop table sp_project_links              cascade constraints;',
'drop table sp_project_related            cascade constraints;',
'drop table sp_project_comments_emails    cascade constraints;',
'drop table sp_project_sizes              cascade constraints;',
'drop table sp_project_groups             cascade constraints;',
'drop table sp_release_trains             cascade constraints;',
'drop table sp_release_comments           cascade constraints;',
'drop table sp_release_milestone_types    cascade constraints;',
'drop table sp_release_milestones         cascade constraints;',
'drop table sp_release_documents          cascade constraints;',
'drop table sp_release_history            cascade constraints;',
'drop table SP_RELEASE_LINKS              cascade constraints;',
'drop table sp_proj_interactions_log      cascade constraints;',
'drop table sp_favorites                  cascade constraints;',
'drop table sp_configurable_text          cascade constraints;',
'drop table sp_project_scales             cascade constraints;',
'drop table sp_activity_types             cascade constraints;',
'drop table sp_activities                 cascade constraints;',
'drop table sp_notifications              cascade constraints;',
'drop table sp_notification_subscriptions cascade constraints;',
'drop table SP_GROUPS                     cascade constraints;',
'drop table SP_GROUP_MEMBERS              cascade constraints;',
'drop table SP_DEFAULT_PEOPLE_TAGS        cascade constraints;',
'drop table SP_EXTERNAL_TICKETING_SYSTEMS cascade constraints;',
'drop table SP_APPLICATION_NOTIFICATIONS  cascade constraints;',
'drop table sp_competencies               cascade constraints;',
'drop table sp_task_comments              cascade constraints;',
'drop table sp_task_documents             cascade constraints;',
'drop table sp_task_links                 cascade constraints;',
'drop table sp_task_history               cascade constraints;',
'drop table sp_tasks                      cascade constraints;',
'drop table sp_task_statuses              cascade constraints;',
'drop table sp_initiative_default_tasks   cascade constraints;',
'drop table sp_task_types                 cascade constraints;'))
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
,p_required_names_available=>'SP_NOTIF_SUBSCRIPTIONS:SP_RELEASE_TIMELINE:SP_SEQ:SP_LOG:SP_STRATEGIC_PROJ_UTIL:SP_VALUE_COMPARE:SP_PROJ_STATUS_UI:SP_CONTRIBUTOR_SUMMARY:SP_FAVORITE_TOGGLE:SP_DATE_RANGE_PCT_COMP:SP_TAG_DIFF:SP_PROJECT_PRIORITIES:SP_RESOURCE_TYPES:SP_TEAM_MEMBERS:SP'
||'_INITIATIVES:SP_INITIATIVE_DOCUMENTS:SP_INITIATIVE_COMMENTS:SP_PROJECTS:SP_PROJECT_CONTRIBUTORS:SP_PROJECT_HISTORY:SP_PROJECT_COMMENTS:SP_PROJECT_DOCUMENTS:SP_PROJECT_LINKS:SP_PROJECT_RELATED:SP_APP_NOMENCLATURE:SP_APP_PAGES:SP_APP_SETTINGS:SP_DEFAUL'
||'T_TAGS:SP_COUNTRIES:SP_PROJECT_COMMENTS_EMAILS:SP_PROJECT_SIZES:SP_RELEASE_TRAINS:SP_RELEASE_COMMENTS:SP_RELEASE_MILESTONES:SP_RELEASE_DOCUMENTS:SP_RELEASE_HISTORY:SP_RELEASE_LINKS:SP_INITIATIVE_LINKS:SP_PROJ_INTERACTIONS_LOG:SP_FAVORITES:SP_CONFIGUR'
||'ABLE_TEXT:SP_PROJECT_SCALES:SP_ACTIVITY_TYPES:SP_ACTIVITIES:SP_NOTIFICATIONS:SP_NOTIFICATION_SUBSCRIPTIONS:SP_GROUPS:SP_GROUP_MEMBERS:SP_DEFAULT_PEOPLE_TAGS:SP_EXTERNAL_TICKETING_SYSTEMS:SP_APPLICATION_NOTIFICATIONS:SP_COMPETENCIES:SP_TASK_TYPES:SP_I'
||'NITIATIVE_DEFAULT_TASKS:SP_TASK_STATUSES:SP_TASKS:SP_TASK_HISTORY:SP_TASK_LINKS:SP_TASK_DOCUMENTS:SP_TASK_COMMENTS:SP_AREAS:SP_INITIATIVE_FOCUS_AREAS:SP_TEAM_MEMBER_NOTIFICATIONS:SP_APP_LOG:SP_GLOBALS'
);
wwv_flow_imp.component_end;
end;
/
