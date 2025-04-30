prompt --application/pages/page_00059
begin
--   Manifest
--     PAGE: 00059
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
 p_id=>59
,p_name=>'Initiative Focus Area Document Details'
,p_alias=>'IFA-DOCUMENT-DETAILS'
,p_step_title=>'&NOMENCLATURE_INITIATIVE. Focus Area Document Details'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(18401340157312233831)
,p_javascript_file_urls=>'#PRISMJS_DIRECTORY#prism#MIN#.js'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'25'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(45276402494848142403)
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
'       i.id initiative_id,',
'       i.initiative,',
'       f.area,',
'       a.focus_area,',
'       d.DOCUMENT_FILENAME,',
'       d.UPDATED,',
'       d.created,',
'       --d.doc_description,',
'       lower(d.created_by) author,',
'       dbms_lob.getlength(d.DOCUMENT_BLOB) doc_size,',
'       d.created date_created,',
'       substr(d.DOCUMENT_FILENAME,instr(d.DOCUMENT_FILENAME,''.'',-1)+1,length(d.DOCUMENT_FILENAME)-instr(d.DOCUMENT_FILENAME,''.'',-1)) file_extension',
'  from SP_INIT_FOCUS_AREA_DOCUMENTS d,',
'       sp_initiatives i,',
'       sp_areas f,',
'       sp_initiative_focus_areas a',
' where d.id = :P59_ID ',
'   and d.init_focus_area_id = a.id',
'   and a.initiative_id = i.id ',
'   and f.id = i.area_id',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P59_ID'
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
 p_id=>wwv_flow_imp.id(27360470614358127279)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27360471035663127280)
,p_query_column_id=>2
,p_column_alias=>'INITIATIVE_ID'
,p_column_display_sequence=>120
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27360471437928127280)
,p_query_column_id=>3
,p_column_alias=>'INITIATIVE'
,p_column_display_sequence=>20
,p_column_heading=>'Initiative'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_INITIATIVE:#INITIATIVE#'
,p_column_linktext=>'#INITIATIVE#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27360471799597127281)
,p_query_column_id=>4
,p_column_alias=>'AREA'
,p_column_display_sequence=>10
,p_column_heading=>'Area'
,p_column_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:23:P23_FOCUS_AREA:#AREA#'
,p_column_linktext=>'#AREA#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27267754333618923722)
,p_query_column_id=>5
,p_column_alias=>'FOCUS_AREA'
,p_column_display_sequence=>30
,p_column_heading=>'Focus Area'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27360472195301127281)
,p_query_column_id=>6
,p_column_alias=>'DOCUMENT_FILENAME'
,p_column_display_sequence=>50
,p_column_heading=>'Document Filename'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27360472563238127282)
,p_query_column_id=>7
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>60
,p_column_heading=>'Updated'
,p_column_format=>'SINCE_SHORT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27360473031175127282)
,p_query_column_id=>8
,p_column_alias=>'CREATED'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27360473421818127282)
,p_query_column_id=>9
,p_column_alias=>'AUTHOR'
,p_column_display_sequence=>80
,p_column_heading=>'Author'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27360473816318127283)
,p_query_column_id=>10
,p_column_alias=>'DOC_SIZE'
,p_column_display_sequence=>90
,p_column_heading=>'Size'
,p_column_format=>'FILESIZE'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27360474225026127283)
,p_query_column_id=>11
,p_column_alias=>'DATE_CREATED'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(27360474612994127283)
,p_query_column_id=>12
,p_column_alias=>'FILE_EXTENSION'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(47610112917902301719)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(149556631378123434106)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(48632729828299094863)
,p_plug_name=>'SQL'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
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
'       from SP_INIT_FOCUS_AREA_DOCUMENTS',
'       where id = :P59_ID) loop',
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
,p_plug_display_condition_type=>'VALUE_OF_ITEM_IN_CONDITION_IN_COLON_DELIMITED_LIST'
,p_plug_display_when_condition=>'P59_FILE_EXTENSION'
,p_plug_display_when_cond2=>'SQL'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(48632729917104094864)
,p_plug_name=>'PDF'
,p_region_name=>'pdf_viewer'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>120
,p_location=>null
,p_plug_source=>'&P59_PDF_LINK.'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P59_FILE_EXTENSION'
,p_plug_display_when_cond2=>'PDF'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49628630548440622488)
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
'       from SP_INIT_FOCUS_AREA_DOCUMENTS',
'       where id = :P59_ID) loop',
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
,p_plug_display_when_condition=>'P59_FILE_EXTENSION'
,p_plug_display_when_cond2=>'YAML'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49628630583597622489)
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
'       from SP_INIT_FOCUS_AREA_DOCUMENTS',
'       where id = :P59_ID) loop',
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
,p_plug_display_when_condition=>'P59_FILE_EXTENSION'
,p_plug_display_when_cond2=>'JAVA'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49628630717090622490)
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
'       from SP_INIT_FOCUS_AREA_DOCUMENTS',
'       where id = :P59_ID) loop',
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
,p_plug_display_when_condition=>'P59_FILE_EXTENSION'
,p_plug_display_when_cond2=>'JSON'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49628630838250622491)
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
'       from SP_INIT_FOCUS_AREA_DOCUMENTS',
'       where id = :P59_ID) loop',
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
,p_plug_display_when_condition=>'P59_FILE_EXTENSION'
,p_plug_display_when_cond2=>'XML'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49628630954605622492)
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
'       from SP_INIT_FOCUS_AREA_DOCUMENTS',
'       where id = :P59_ID) loop',
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
,p_plug_display_when_condition=>'P59_FILE_EXTENSION'
,p_plug_display_when_cond2=>'PLS:PLSQL:PLB'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(49628630985495622493)
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
'       from SP_INIT_FOCUS_AREA_DOCUMENTS',
'       where id = :P59_ID) loop',
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
,p_plug_display_when_condition=>'P59_FILE_EXTENSION'
,p_plug_display_when_cond2=>'PYC'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(51208878415799239834)
,p_plug_name=>'&P59_FILE_NAME.'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P59_DOCUMENT_IS_IMAGE'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(51700462884957817205)
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
'  from SP_INIT_FOCUS_AREA_DOCUMENTS d',
' where id = :P59_ID '))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  from SP_INIT_FOCUS_AREA_DOCUMENTS d',
' where id = :P59_ID ',
'   and DOC_description is not null'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P59_ID'
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
 p_id=>wwv_flow_imp.id(27360477790727127288)
,p_query_column_id=>1
,p_column_alias=>'DOC_DESCRIPTION'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(64536513441182572454)
,p_plug_name=>'No Preview Available'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source=>'This file type cannot be previewed.'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P59_FILE_EXTENSION not in (''SQL'',''PLS'',''PLSQL'',''PLB'',''YAML'',''JSON'',''XML'',''JAVA'',''PYC'',''PDF'') and',
':P59_DOCUMENT_IS_IMAGE is null'))
,p_plug_display_when_cond2=>'PLSQL'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27360468614289127277)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(47610112917902301719)
,p_button_name=>'Previous'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Previous'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:59:P59_ID,P59_PREV_PAGE:&P59_PREV_ID.,&P59_PREV_PAGE.'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27360468220955127277)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(47610112917902301719)
,p_button_name=>'Next'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Next'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:59:P59_ID,P59_PREV_PAGE:&P59_NEXT_ID.,&P59_PREV_PAGE.'
,p_icon_css_classes=>'fa-chevron-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27360469810761127278)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(47610112917902301719)
,p_button_name=>'Edit'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Edit'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.:56:P56_ID:&P59_ID.'
,p_icon_css_classes=>'fa-edit'
,p_security_scheme=>wwv_flow_imp.id(149556930589415434424)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(27360469365118127278)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(47610112917902301719)
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
 p_id=>wwv_flow_imp.id(27360468997840127278)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(47610112917902301719)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Navigate Up'
,p_button_position=>'UP'
,p_button_redirect_url=>'f?p=&APP_ID.:&P59_PREV_PAGE.:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-up'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43396198957957706300)
,p_name=>'P59_PREV_PAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(45276402494848142403)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(43396200291563706313)
,p_name=>'P59_PDF_LINK'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(45276402494848142403)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47618949114141063899)
,p_name=>'P59_DOCUMENT_BLOB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(51208878415799239834)
,p_prompt=>'Document'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'SQL',
  'sql_statement', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT DOCUMENT_BLOB ',
    '  from SP_INIT_FOCUS_AREA_DOCUMENTS d',
    ' where id = :P59_ID ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47618965233463063917)
,p_name=>'P59_DOCUMENT_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(45276402494848142403)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47618965654692063921)
,p_name=>'P59_NEXT_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(45276402494848142403)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47618965757241063922)
,p_name=>'P59_PREV_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(45276402494848142403)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(47637764110366262801)
,p_name=>'P59_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(45276402494848142403)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'US_ONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48632748690514094897)
,p_name=>'P59_FILE_EXTENSION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(45276402494848142403)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'I'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(52045259588903594772)
,p_name=>'P59_FILE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(51208878415799239834)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(74522843769958883827)
,p_name=>'P59_DOCUMENT_IS_IMAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(45276402494848142403)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_restricted_characters=>'WEB_SAFE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(27360481952059127296)
,p_computation_sequence=>10
,p_computation_item=>'P59_FILE_EXTENSION'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(substr(d.DOCUMENT_FILENAME,instr(d.DOCUMENT_FILENAME,''.'',-1)+1,length(d.DOCUMENT_FILENAME)-instr(d.DOCUMENT_FILENAME,''.'',-1))) ext',
'  from SP_INIT_FOCUS_AREA_DOCUMENTS d',
' where id = :P59_ID'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(27360480759474127295)
,p_computation_sequence=>10
,p_computation_item=>'P59_DOCUMENT_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DOCUMENT_FILENAME',
'  from SP_INIT_FOCUS_AREA_DOCUMENTS d',
' where id = :P59_ID',
''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(27360482753314127297)
,p_computation_sequence=>20
,p_computation_item=>'P59_DOCUMENT_IS_IMAGE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Y''',
'  from SP_INIT_FOCUS_AREA_DOCUMENTS d',
' where id = :P59_ID',
'and upper(substr(d.DOCUMENT_FILENAME,instr(d.DOCUMENT_FILENAME,''.'',-1)+1,length(d.DOCUMENT_FILENAME)-instr(d.DOCUMENT_FILENAME,''.'',-1)))',
' in (''JPG'',''JPEG'',''PNG'',''GIF'',''AVIF'',''WEBP'')',
''))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(27360481184297127295)
,p_computation_sequence=>30
,p_computation_item=>'P59_NEXT_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id',
'  from SP_INIT_FOCUS_AREA_DOCUMENTS d',
' where init_focus_area_id = (select init_focus_area_id from SP_INIT_FOCUS_AREA_DOCUMENTS d2 where d2.id = :P59_ID) and',
'       created < (select created from SP_INIT_FOCUS_AREA_DOCUMENTS d2 where d2.id = :P59_ID) and',
'          dbms_lob.getlength(DOCUMENT_BLOB) > 0 ',
'order by created desc',
'fetch first 1 rows only'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(27360481636141127296)
,p_computation_sequence=>40
,p_computation_item=>'P59_PREV_ID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT id',
'  from SP_INIT_FOCUS_AREA_DOCUMENTS d',
' where init_focus_area_id = (select init_focus_area_id from SP_INIT_FOCUS_AREA_DOCUMENTS d2 where d2.id = :P59_ID) and',
'       created > (select created from SP_INIT_FOCUS_AREA_DOCUMENTS d2 where d2.id = :P59_ID) and',
'          dbms_lob.getlength(DOCUMENT_BLOB) > 0 ',
'order by created ',
'fetch first 1 rows only'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(27360482374791127297)
,p_computation_sequence=>50
,p_computation_item=>'P59_FILE_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DOCUMENT_FILENAME',
'  from SP_INIT_FOCUS_AREA_DOCUMENTS d',
' where id = :P59_ID '))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(27360480376389127295)
,p_computation_sequence=>60
,p_computation_item=>'P59_PDF_LINK'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return APEX_PAGE.GET_URL (',
'            p_page      => 59,',
'            p_request   => ''APPLICATION_PROCESS=viewInitFocusAreaPDF'',',
'            p_plain_url => TRUE );'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27360484369809127298)
,p_name=>'DC'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(47610112917902301719)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27360485015721127299)
,p_event_id=>wwv_flow_imp.id(27360484369809127298)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(45276402494848142403)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27360485404731127299)
,p_name=>'Load PDF'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_when_cond=>'P59_FILE_EXTENSION'
,p_display_when_cond2=>'PDF'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27360485859164127300)
,p_event_id=>wwv_flow_imp.id(27360485404731127299)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#pdf_viewer'').html('''');',
'var url = ''&P59_PDF_LINK.'';',
'var preview = document.createElement(''embed''); ',
'preview.type = "application/pdf";',
'preview.width="100%";',
'preview.height="1000px";',
'preview.src = url;',
'$("#pdf_viewer").append(preview);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27360483469787127297)
,p_name=>'Disable Next Button'
,p_event_sequence=>30
,p_condition_element=>'P59_NEXT_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27360484039863127298)
,p_event_id=>wwv_flow_imp.id(27360483469787127297)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(27360468220955127277)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27360486296599127300)
,p_name=>'Disable Previous Button'
,p_event_sequence=>40
,p_condition_element=>'P59_PREV_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27360486821418127300)
,p_event_id=>wwv_flow_imp.id(27360486296599127300)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(27360468614289127277)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19846518025607368217)
,p_name=>'download doc'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(27360469365118127278)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19846518070872368218)
,p_event_id=>wwv_flow_imp.id(19846518025607368217)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DOWNLOAD'
,p_attribute_01=>'N'
,p_attribute_03=>'ATTACHMENT'
,p_attribute_05=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DOCUMENT_BLOB, DOCUMENT_FILENAME, DOCUMENT_MIMETYPE',
'  from SP_INITIATIVE_DOCUMENTS ',
' where id = :P59_ID'))
,p_attribute_06=>'P59_ID'
);
wwv_flow_imp.component_end;
end;
/
