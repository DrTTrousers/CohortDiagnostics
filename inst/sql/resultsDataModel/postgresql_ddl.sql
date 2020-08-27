--DDL Specification for package CohortDiagnostics package version: 2.0
 --Data Model Version 2.0
 --Last update 2020-08-27
 --Number of tables 29
 
 ----------------------------------------------------------------------- 
 --Table name analysis_ref
 --Number of fields in table 7
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.analysis_ref (
 
			analysis_id integer NOT NULL, 
			analysis_name varchar(50) NOT NULL, 
			domain_id varchar(20) NULL, 
			start_day NUMERIC NULL, 
			end_day NUMERIC NULL, 
			is_binary varchar(1) NOT NULL, 
			missing_means_zero varchar(1) NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name cohort
 --Number of fields in table 5
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.cohort (
 
			cohort_full_name varchar(255) NOT NULL, 
			cohort_id integer NOT NULL, 
			cohort_name varchar(255) NOT NULL, 
			sql TEXT NOT NULL, 
			json TEXT NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name cohort_count
 --Number of fields in table 4
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.cohort_count (
 
			cohort_id integer NOT NULL, 
			cohort_entries NUMERIC NOT NULL, 
			cohort_subjects NUMERIC NOT NULL, 
			database_id varchar(20) NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name cohort_inc_result
 --Number of fields in table 4
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.cohort_inc_result (
 
			cohort_definition_id integer NOT NULL, 
			inclusion_rule_mask NUMERIC NOT NULL, 
			person_count NUMERIC NOT NULL, 
			mode_id integer NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name cohort_inc_stats
 --Number of fields in table 6
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.cohort_inc_stats (
 
			cohort_definition_id integer NOT NULL, 
			rule_sequence NUMERIC NOT NULL, 
			person_count NUMERIC NOT NULL, 
			gain_count NUMERIC NOT NULL, 
			person_total NUMERIC NOT NULL, 
			mode_id integer NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name cohort_inclusion
 --Number of fields in table 4
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.cohort_inclusion (
 
			cohort_definition_id integer NOT NULL, 
			rule_sequence NUMERIC NOT NULL, 
			name varchar(50) NOT NULL, 
			description varchar(1) NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name cohort_overlap
 --Number of fields in table 12
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.cohort_overlap (
 
			either_subjects NUMERIC NOT NULL, 
			both_subjects NUMERIC NOT NULL, 
			t_only_subjects NUMERIC NOT NULL, 
			c_only_subjects NUMERIC NOT NULL, 
			t_before_c_subjects NUMERIC NOT NULL, 
			c_before_t_subjects NUMERIC NOT NULL, 
			same_day_subjects NUMERIC NOT NULL, 
			t_in_c_subjects NUMERIC NOT NULL, 
			c_in_t_subjects NUMERIC NOT NULL, 
			target_cohort_id integer NOT NULL, 
			comparator_cohort_id integer NOT NULL, 
			database_id varchar(20) NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name cohort_summary_stats
 --Number of fields in table 4
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.cohort_summary_stats (
 
			cohort_definition_id integer NOT NULL, 
			base_count NUMERIC NOT NULL, 
			final_count NUMERIC NOT NULL, 
			mode_id integer NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name concept
 --Number of fields in table 10
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.concept (
 
			concept_id integer NOT NULL, 
			concept_name varchar(255) NOT NULL, 
			domain_id varchar(20) NOT NULL, 
			vocabulary_id varchar(20) NOT NULL, 
			concept_class_id varchar(20) NOT NULL, 
			standard_concept varchar(1) NULL, 
			concept_code varchar(50) NOT NULL, 
			valid_start_date Date NOT NULL, 
			valid_end_date Date NOT NULL, 
			invalid_reason varchar(1) NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name concept_ancestor
 --Number of fields in table 4
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.concept_ancestor (
 
			ancestor_concept_id NUMERIC NOT NULL, 
			descendant_concept_id NUMERIC NOT NULL, 
			min_levels_of_separation NUMERIC NOT NULL, 
			max_levels_of_separation NUMERIC NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name concept_class
 --Number of fields in table 3
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.concept_class (
 
			concept_class_id varchar(20) NOT NULL, 
			concept_class_name varchar(50) NOT NULL, 
			concept_class_concept_id integer NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name concept_relationship
 --Number of fields in table 6
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.concept_relationship (
 
			concept_id_1 integer NOT NULL, 
			concept_id_2 integer NOT NULL, 
			relationship_id varchar(20) NOT NULL, 
			valid_start_date Date NOT NULL, 
			valid_end_date Date NOT NULL, 
			invalid_reason varchar(1) NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name concept_sets
 --Number of fields in table 5
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.concept_sets (
 
			cohort_id integer NOT NULL, 
			concept_set_id integer NOT NULL, 
			concept_set_sql TEXT NOT NULL, 
			concept_set_name varchar(50) NOT NULL, 
			concept_set_expression TEXT NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name covariate_ref
 --Number of fields in table 4
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.covariate_ref (
 
			covariate_id NUMERIC NOT NULL, 
			covariate_name TEXT NOT NULL, 
			analysis_id integer NOT NULL, 
			concept_id integer NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name covariate_value
 --Number of fields in table 6
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.covariate_value (
 
			covariate_id NUMERIC NOT NULL, 
			mean NUMERIC NOT NULL, 
			average_value NUMERIC NULL, 
			sd NUMERIC NOT NULL, 
			cohort_id integer NOT NULL, 
			database_id varchar(20) NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name database
 --Number of fields in table 4
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.database (
 
			database_id varchar(20) NOT NULL, 
			database_name varchar(50) NOT NULL, 
			description TEXT NOT NULL, 
			is_meta_analysis NUMERIC NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name domain
 --Number of fields in table 3
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.domain (
 
			domain_id varchar(20) NOT NULL, 
			domain_name varchar(20) NOT NULL, 
			domain_concept_id integer NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name incidence_rate
 --Number of fields in table 8
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.incidence_rate (
 
			cohort_count NUMERIC NOT NULL, 
			person_years NUMERIC NOT NULL, 
			gender varchar(20) NULL, 
			age_group varchar(20) NULL, 
			calendar_year NUMERIC NULL, 
			incidence_rate NUMERIC NOT NULL, 
			cohort_id integer NOT NULL, 
			database_id varchar(20) NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name included_source_concept
 --Number of fields in table 7
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.included_source_concept (
 
			cohort_id integer NOT NULL, 
			concept_set_id integer NOT NULL, 
			concept_id integer NOT NULL, 
			source_concept_id integer NOT NULL, 
			concept_subjects NUMERIC NOT NULL, 
			concept_count NUMERIC NOT NULL, 
			database_id varchar(20) NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name inclusion_rule_stats
 --Number of fields in table 8
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.inclusion_rule_stats (
 
			rule_sequence_id integer NOT NULL, 
			rule_name varchar(50) NOT NULL, 
			meet_subjects NUMERIC NOT NULL, 
			gain_subjects NUMERIC NOT NULL, 
			total_subjects NUMERIC NOT NULL, 
			remain_subjects NUMERIC NOT NULL, 
			cohort_id integer NOT NULL, 
			database_id varchar(20) NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name index_event_breakdown
 --Number of fields in table 4
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.index_event_breakdown (
 
			concept_id integer NOT NULL, 
			concept_count NUMERIC NOT NULL, 
			cohort_id integer NOT NULL, 
			database_id varchar(20) NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name orphan_concept
 --Number of fields in table 5
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.orphan_concept (
 
			cohort_id integer NOT NULL, 
			concept_set_id integer NOT NULL, 
			concept_id integer NOT NULL, 
			concept_count NUMERIC NOT NULL, 
			database_id varchar(20) NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name relationship
 --Number of fields in table 6
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.relationship (
 
			relationship_id varchar(20) NOT NULL, 
			relationship_name varchar(255) NOT NULL, 
			is_hierarchical NUMERIC NOT NULL, 
			defines_ancestry NUMERIC NOT NULL, 
			reverse_relationship_id varchar(20) NOT NULL, 
			relationship_concept_id integer NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name temporal_analysis_ref
 --Number of fields in table 5
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.temporal_analysis_ref (
 
			analysis_id integer NOT NULL, 
			analysis_name varchar(20) NOT NULL, 
			domain_id varchar(20) NOT NULL, 
			is_binary varchar(1) NOT NULL, 
			missing_means_zero varchar(1) NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name temporal_covariate_ref
 --Number of fields in table 4
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.temporal_covariate_ref (
 
			covariate_id NUMERIC NOT NULL, 
			covariate_name TEXT NOT NULL, 
			analysis_id integer NOT NULL, 
			concept_id integer NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name temporal_covariate_value
 --Number of fields in table 9
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.temporal_covariate_value (
 
			start_day NUMERIC NOT NULL, 
			end_day NUMERIC NOT NULL, 
			covariate_id NUMERIC NOT NULL, 
			mean NUMERIC NOT NULL, 
			time_id integer NOT NULL, 
			average_value NUMERIC NOT NULL, 
			sd NUMERIC NOT NULL, 
			cohort_id integer NOT NULL, 
			database_id varchar(20) NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name time_distribution
 --Number of fields in table 16
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.time_distribution (
 
			covariate_id integer NOT NULL, 
			count_value NUMERIC NOT NULL, 
			min_value NUMERIC NOT NULL, 
			max_value NUMERIC NOT NULL, 
			average_value NUMERIC NOT NULL, 
			standard_deviation NUMERIC NOT NULL, 
			median_value NUMERIC NOT NULL, 
			p_10_value NUMERIC NOT NULL, 
			p_25_value NUMERIC NOT NULL, 
			p_75_value NUMERIC NOT NULL, 
			p_90_value NUMERIC NOT NULL, 
			time_metric varchar(50) NOT NULL, 
			analysis_id integer NOT NULL, 
			concept_id integer NOT NULL, 
			cohort_id integer NOT NULL, 
			database_id varchar(20) NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name time_ref
 --Number of fields in table 3
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.time_ref (
 
			time_id integer NOT NULL, 
			start_day NUMERIC NOT NULL, 
			end_day NUMERIC NOT NULL );  
 
 ----------------------------------------------------------------------- 
 --Table name vocabulary
 --Number of fields in table 5
 --HINT DISTRIBUTE ON RANDOM
 CREATE TABLE @resultsDatabaseSchema.vocabulary (
 
			vocabulary_id varchar(20) NOT NULL, 
			vocabulary_name varchar(255) NOT NULL, 
			vocabulary_reference varchar(255) NOT NULL, 
			vocabulary_version varchar(50) NULL, 
			vocabulary_concept_id integer NOT NULL );  