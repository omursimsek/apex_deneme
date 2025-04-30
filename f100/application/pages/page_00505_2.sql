prompt --application/pages/page_00505
begin
--   Manifest
--     PAGE: 00505
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
 p_id=>505
,p_name=>'Task Document Details'
,p_alias=>'TASK-DOCUMENT-DETAILS'
,p_step_title=>'Task Document Details'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401344032431234424)
,p_javascript_file_urls=>'#PRISMJS_DIRECTORY#prism#MIN#.js'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'25'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(28786564640944724303)
,p_plug_name=>'No Preview Available'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source=>'This file type cannot be previewed.'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P505_FILE_EXTENSION not in (''SQL'',''PLS'',''PLSQL'',''PLB'',''YAML'',''JSON'',''XML'',''JAVA'',''PYC'',''PDF'') and',
':P505_DOCUMENT_IS_IMAGE is null'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(46310423623599295048)
,p_name=>'Document Details'
,p_template=>4501440665235496320
,p_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:margin-left-md'
,p_component_template_options=>'#DEFAULT#:t-ContextualInfo-label--stacked'
,p_display_point=>'REGION_POSITION_01'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.ID,',
'       p.id project_id,',
'       p.project,',
'       (select task_type from sp_task_types rt where rt.id = t.task_type_id)||',
'           case when t.task_sub_type_id is not null then '': '' end ||',
'           (select task_type from sp_task_types rt where rt.id = t.task_sub_type_id) type,',
'       t.id task_id,',
'       d.DOCUMENT_FILENAME,',
'       d.UPDATED,',
'       d.created,',
'       --d.doc_description,',
'       lower(d.created_by) author,',
'       dbms_lob.getlength(d.DOCUMENT_BLOB) doc_size,',
'       d.created date_created,',
'       substr(d.DOCUMENT_FILENAME,instr(d.DOCUMENT_FILENAME,''.'',-1)+1,length(d.DOCUMENT_FILENAME)-instr(d.DOCUMENT_FILENAME,''.'',-1)) file_extension',
'  from SP_TASK_DOCUMENTS d,',
'       sp_tasks t,',
'       sp_projects p',
' where d.id = :P505_ID and d.task_id = t.id and t.project_id = p.id',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P505_ID'
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
 p_id=>wwv_flow_imp.id(28394488793678279918)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28393708975068231405)
,p_query_column_id=>2
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>150
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28393709134682231406)
,p_query_column_id=>3
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>70
,p_column_heading=>'Project'
,p_column_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:P3_PROJECT_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28393709183047231407)
,p_query_column_id=>4
,p_column_alias=>'TYPE'
,p_column_display_sequence=>80
,p_column_heading=>'Task'
,p_column_link=>'f?p=&APP_ID.:502:&SESSION.::&DEBUG.:502:P502_TASK_ID:#TASK_ID#'
,p_column_linktext=>'#TYPE#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28393709298040231408)
,p_query_column_id=>5
,p_column_alias=>'TASK_ID'
,p_column_display_sequence=>160
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28394490417344279919)
,p_query_column_id=>6
,p_column_alias=>'DOCUMENT_FILENAME'
,p_column_display_sequence=>60
,p_column_heading=>'Document Filename'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28394490806764279919)
,p_query_column_id=>7
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>90
,p_column_heading=>'Updated'
,p_column_format=>'SINCE_SHORT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28394491154121279920)
,p_query_column_id=>8
,p_column_alias=>'CREATED'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28394491605385279920)
,p_query_column_id=>9
,p_column_alias=>'AUTHOR'
,p_column_display_sequence=>110
,p_column_heading=>'Author'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28394491964480279920)
,p_query_column_id=>10
,p_column_alias=>'DOC_SIZE'
,p_column_display_sequence=>120
,p_column_heading=>'Size'
,p_column_format=>'FILESIZE'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28394492421095279920)
,p_query_column_id=>11
,p_column_alias=>'DATE_CREATED'
,p_column_display_sequence=>130
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28394492802665279921)
,p_query_column_id=>12
,p_column_alias=>'FILE_EXTENSION'
,p_column_display_sequence=>140
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(48644134046653454364)
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
 p_id=>wwv_flow_imp.id(49666750957050247508)
,p_plug_name=>'SQL'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_TASK_DOCUMENTS',
'       where id = :P505_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-sql">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_ajax_items_to_submit=>'P505_ID'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P505_FILE_EXTENSION'
,p_plug_display_when_cond2=>'SQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49666751045855247509)
,p_plug_name=>'PDF'
,p_region_name=>'pdf_viewer'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>120
,p_location=>null
,p_plug_source=>'&P505_PDF_LINK.'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P505_FILE_EXTENSION'
,p_plug_display_when_cond2=>'PDF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50662651677191775133)
,p_plug_name=>'YAML'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_TASK_DOCUMENTS',
'       where id = :P505_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-yaml">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P505_FILE_EXTENSION'
,p_plug_display_when_cond2=>'YAML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50662651712348775134)
,p_plug_name=>'Java'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_TASK_DOCUMENTS',
'       where id = :P505_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-java">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P505_FILE_EXTENSION'
,p_plug_display_when_cond2=>'JAVA'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50662651845841775135)
,p_plug_name=>'JSON'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_TASK_DOCUMENTS',
'       where id = :P505_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-json">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P505_FILE_EXTENSION'
,p_plug_display_when_cond2=>'JSON'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50662651967001775136)
,p_plug_name=>'XML'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_TASK_DOCUMENTS',
'       where id = :P505_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-xml">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P505_FILE_EXTENSION'
,p_plug_display_when_cond2=>'XML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50662652083356775137)
,p_plug_name=>'PL/SQL'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_TASK_DOCUMENTS',
'       where id = :P505_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-plsql">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P505_FILE_EXTENSION'
,p_plug_display_when_cond2=>'PLS:PLSQL:PLB'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50662652114246775138)
,p_plug_name=>'Python'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   s clob;',
'   l number;',
'   r clob;',
'   l_offset int := 1;',
'begin',
'   for c1 in (',
'       select TO_CLOB(DOCUMENT_BLOB) x',
'       from SP_TASK_DOCUMENTS',
'       where id = :P505_ID) loop',
'          s := c1.x;',
'   end loop;',
'   l := dbms_lob.getlength(s);',
'   r := ''<pre><code class="lang-python">''||chr(10);',
'   for i in 1..2000 loop',
'       if l_offset > dbms_lob.getlength(s) then ',
'          exit;',
'       else',
'          r := r||apex_escape.html(dbms_lob.substr(s,5000,l_offset));',
'          l_offset := l_offset + 5000;',
'       end if;',
'   end loop;',
'   r := r||chr(10)||''</code></pre>'';',
'   return r;',
'end;',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P505_FILE_EXTENSION'
,p_plug_display_when_cond2=>'PYC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(52242899544550392479)
,p_plug_name=>'&P505_FILE_NAME.'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P505_DOCUMENT_IS_IMAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(52734484013708969850)
,p_name=>'Document Description'
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DOC_description',
'  from SP_TASK_DOCUMENTS d',
' where id = :P505_ID '))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  from SP_TASK_DOCUMENTS d',
' where id = :P505_ID ',
'   and DOC_description is not null'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P505_ID'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(28394488004046279917)
,p_query_column_id=>1
,p_column_alias=>'DOC_DESCRIPTION'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28394496349211279925)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(48644134046653454364)
,p_button_name=>'Previous'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Previous'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:505:&SESSION.::&DEBUG.:505:P505_ID,P505_PREV_PAGE:&P505_PREV_ID.,&P505_PREV_PAGE.'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28394495946851279924)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(48644134046653454364)
,p_button_name=>'Next'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Next'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:505:&SESSION.::&DEBUG.:505:P505_ID,P505_PREV_PAGE:&P505_NEXT_ID.,&P505_PREV_PAGE.'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28394497631163279926)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(48644134046653454364)
,p_button_name=>'Edit'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Edit'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:504:&SESSION.::&DEBUG.:504:P504_ID:&P505_ID.'
,p_icon_css_classes=>'fa-edit'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28394497204914279925)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(48644134046653454364)
,p_button_name=>'download'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Download'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(28394496816921279925)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(48644134046653454364)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:&P505_PREV_PAGE.:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(44430217192090858937)
,p_name=>'P505_PREV_PAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(46310423623599295048)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(44430218525696858950)
,p_name=>'P505_PDF_LINK'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(46310423623599295048)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48652982779296216556)
,p_name=>'P505_DOCUMENT_BLOB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(52242899544550392479)
,p_prompt=>'Document'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'SQL',
  'sql_statement', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT DOCUMENT_BLOB ',
    '  from SP_TASK_DOCUMENTS d',
    ' where id = :P505_ID ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48652983467596216554)
,p_name=>'P505_DOCUMENT_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(46310423623599295048)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48652983888825216558)
,p_name=>'P505_NEXT_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(46310423623599295048)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48652983991374216559)
,p_name=>'P505_PREV_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(46310423623599295048)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48671782344499415438)
,p_name=>'P505_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(46310423623599295048)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(49666766924647247534)
,p_name=>'P505_FILE_EXTENSION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(46310423623599295048)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(53079293254058747429)
,p_name=>'P505_FILE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(52242899544550392479)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(75556862004092036464)
,p_name=>'P505_DOCUMENT_IS_IMAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(46310423623599295048)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(28394502390362279931)
,p_computation_sequence=>10
,p_computation_item=>'P505_FILE_EXTENSION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(substr(d.DOCUMENT_FILENAME,instr(d.DOCUMENT_FILENAME,''.'',-1)+1,length(d.DOCUMENT_FILENAME)-instr(d.DOCUMENT_FILENAME,''.'',-1))) ext',
'  from SP_TASK_DOCUMENTS d',
' where id = :P505_ID'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(28394501217403279930)
,p_computation_sequence=>10
,p_computation_item=>'P505_DOCUMENT_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DOCUMENT_FILENAME',
'  from SP_TASK_DOCUMENTS d',
' where id = :P505_ID',
''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(28394503175125279931)
,p_computation_sequence=>20
,p_computation_item=>'P505_DOCUMENT_IS_IMAGE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Y''',
'  from SP_TASK_DOCUMENTS d',
' where id = :P505_ID',
'and upper(substr(d.DOCUMENT_FILENAME,instr(d.DOCUMENT_FILENAME,''.'',-1)+1,length(d.DOCUMENT_FILENAME)-instr(d.DOCUMENT_FILENAME,''.'',-1)))',
' in (''JPG'',''JPEG'',''PNG'',''GIF'',''AVIF'',''WEBP'')',
''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(28394501626642279930)
,p_computation_sequence=>30
,p_computation_item=>'P505_NEXT_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id',
'  from SP_TASK_DOCUMENTS d',
' where task_id = (select task_id from SP_TASK_DOCUMENTS d2 where d2.id = :P505_ID) and',
'       created < (select created from SP_TASK_DOCUMENTS d2 where d2.id = :P505_ID) and',
'          dbms_lob.getlength(DOCUMENT_BLOB) > 0 ',
'order by created desc',
'fetch first 1 rows only'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(28394502017565279931)
,p_computation_sequence=>40
,p_computation_item=>'P505_PREV_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id',
'  from SP_TASK_DOCUMENTS d',
' where task_id = (select task_id from SP_TASK_DOCUMENTS d2 where d2.id = :P505_ID) and',
'       created > (select created from SP_TASK_DOCUMENTS d2 where d2.id = :P505_ID) and',
'          dbms_lob.getlength(DOCUMENT_BLOB) > 0 ',
'order by created ',
'fetch first 1 rows only'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(28394502741648279931)
,p_computation_sequence=>50
,p_computation_item=>'P505_FILE_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DOCUMENT_FILENAME',
'  from SP_TASK_DOCUMENTS d',
' where id = :P505_ID '))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(28394500775551279930)
,p_computation_sequence=>60
,p_computation_item=>'P505_PDF_LINK'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return APEX_PAGE.GET_URL (',
'            p_page      => 505,',
'            p_request   => ''APPLICATION_PROCESS=viewTaskPDF'',',
'            p_plain_url => TRUE );'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28394504807583279933)
,p_name=>'DC'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(48644134046653454364)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28394505251453279933)
,p_event_id=>wwv_flow_imp.id(28394504807583279933)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(46310423623599295048)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28394505736437279934)
,p_name=>'Load PDF'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_cond=>'P505_FILE_EXTENSION'
,p_display_when_cond2=>'PDF'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28394506190611279934)
,p_event_id=>wwv_flow_imp.id(28394505736437279934)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#pdf_viewer'').html('''');',
'var url = ''&P505_PDF_LINK.'';',
'var preview = document.createElement(''embed''); ',
'preview.type = "application/pdf";',
'preview.width="100%";',
'preview.height="1000px";',
'preview.src = url;',
'$("#pdf_viewer").append(preview);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28394503870722279932)
,p_name=>'Disable Next Button'
,p_event_sequence=>30
,p_condition_element=>'P505_NEXT_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28394504388107279932)
,p_event_id=>wwv_flow_imp.id(28394503870722279932)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(28394495946851279924)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(28394506582933279934)
,p_name=>'Disable Previous Button'
,p_event_sequence=>40
,p_condition_element=>'P505_PREV_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28394507076047279934)
,p_event_id=>wwv_flow_imp.id(28394506582933279934)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(28394496349211279925)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19846518371753368221)
,p_name=>'Download doc'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(28394497204914279925)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19846518527505368222)
,p_event_id=>wwv_flow_imp.id(19846518371753368221)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DOWNLOAD'
,p_attribute_01=>'N'
,p_attribute_03=>'ATTACHMENT'
,p_attribute_05=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DOCUMENT_BLOB, DOCUMENT_FILENAME, DOCUMENT_MIMETYPE ',
'  from SP_TASK_DOCUMENTS ',
' where id = :P505_ID'))
,p_attribute_06=>'P505_ID'
);
wwv_flow_imp.component_end;
end;
/
