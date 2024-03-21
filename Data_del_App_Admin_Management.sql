-- Revoke privileges granted to 'analyst'
REVOKE SELECT ON ticket_sales_match_wise FROM analyst;
REVOKE SELECT ON match_summary_view FROM analyst;
REVOKE SELECT ON revenue_of_the_club_through_merchandise FROM analyst;
REVOKE SELECT ON player_PerformanceTrack_Attacker_Individual_View FROM analyst;

-- Revoke privileges granted to 'customer_access'
REVOKE SELECT ON match FROM customer_access;
REVOKE SELECT ON club FROM customer_access;
REVOKE SELECT ON merchandise FROM customer_access;
REVOKE SELECT ON ticket FROM customer_access;
REVOKE SELECT ON stadium FROM customer_access;
REVOKE SELECT ON match_stat FROM customer_access;

-- Drop all the tables
drop table attacker;
drop table club cascade constraints;
drop table club_data;
drop table commentator cascade constraints;
drop table defender cascade constraints;
drop table midfielder cascade constraints;
drop table goal_keeper cascade constraints;
drop table manager cascade constraints;
drop table match cascade constraints;
drop table match_club cascade constraints;
drop table match_commentator cascade constraints;
drop table match_refree cascade constraints;
drop table match_stat cascade constraints;
drop table merchandise cascade constraints;
drop table owner cascade constraints;
drop table player cascade constraints;
drop table points_table cascade constraints;
drop table refree cascade constraints;
drop table stadium cascade constraints;
drop table ticket cascade constraints;

-- Drop all the views
DROP VIEW ticket_sales_match_wise;
DROP VIEW match_summary_view;
DROP VIEW revenue_of_the_club_through_merchandise;
DROP VIEW player_PerformanceTrack_Attacker_Individual_View;

