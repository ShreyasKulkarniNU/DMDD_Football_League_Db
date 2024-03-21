CREATE TABLE attacker (
    player_id            VARCHAR2(10) NOT NULL,
    attacker_role        VARCHAR2(20) NOT NULL,
    number_of_shots      NUMBER,
    number_of_dribbles   NUMBER,
    top_sprint_Speed     NUMBER
);

CREATE UNIQUE INDEX attacker__idx ON
    attacker (
        player_id
    ASC );

ALTER TABLE attacker ADD CONSTRAINT attacker_pk PRIMARY KEY ( player_id );

CREATE TABLE midfielder (
    player_id                 VARCHAR2(10) NOT NULL,
    midfielder_role        VARCHAR2(20) NOT NULL,
    number_of_throughballs    NUMBER,
    total_number_of_chances_created NUMBER,
    number_of_passes_completed NUMBER,
    number_of_corners NUMBER,
    number_of_freekicks NUMBER,
    pass_rating NUMBER
);

CREATE UNIQUE INDEX midfielder__idx ON
    midfielder (
        player_id
    ASC );

ALTER TABLE midfielder ADD CONSTRAINT midfielder_pk PRIMARY KEY ( player_id );

CREATE TABLE club (
    club_id            VARCHAR2(10) NOT NULL,
    owner_id           VARCHAR2(10),
    club_name          VARCHAR2(255),
    number_of_players  NUMBER,
    manager_id         VARCHAR2(10)
);

CREATE UNIQUE INDEX club__idx ON
    club (
        manager_id
    ASC );

ALTER TABLE club ADD CONSTRAINT club_pk PRIMARY KEY ( club_id );

ALTER TABLE club ADD CONSTRAINT club_owner_id_un UNIQUE ( owner_id );

ALTER TABLE club ADD CONSTRAINT club_manager_id_un UNIQUE ( manager_id );

CREATE TABLE club_data (
    club_id                     VARCHAR2(10) NOT NULL,
    number_of_trophies          NUMBER,
    number_of_wins              NUMBER,
    number_of_players_purchased NUMBER,
    number_of_players_sold      NUMBER,
    club_budget                 NUMBER
);

CREATE UNIQUE INDEX club_data__idx ON
    club_data (
        club_id
    ASC );

ALTER TABLE club_data ADD CONSTRAINT club_data_pk PRIMARY KEY ( club_id );

CREATE TABLE commentator (
    commentator_id                VARCHAR2(10) NOT NULL,
    number_of_matches_commentated NUMBER,
    language                      VARCHAR2(20),
    first_name                    VARCHAR2(255),
    last_name                     VARCHAR2(255)
);

ALTER TABLE commentator ADD CONSTRAINT commentator_pk PRIMARY KEY ( commentator_id );

CREATE TABLE defender (
    player_id                 VARCHAR2(10) NOT NULL,
    defender_role        VARCHAR2(20) NOT NULL,
    number_of_interception    NUMBER,
    number_of_blocks          NUMBER,
    number_of_sliding_tackles NUMBER
);

CREATE UNIQUE INDEX defender__idx ON
    defender (
        player_id
    ASC );

ALTER TABLE defender ADD CONSTRAINT defender_pk PRIMARY KEY ( player_id );

CREATE TABLE goal_keeper (
    player_id                    VARCHAR2(10) NOT NULL,
    goalie_type                  VARCHAR2(20) NOT NULL,
    number_of_saves              NUMBER,
    number_of_cleansheets        NUMBER,
    penalties_rating             NUMBER
);

CREATE UNIQUE INDEX goal_keeper__idx ON
    goal_keeper (
        player_id
    ASC );

ALTER TABLE goal_keeper ADD CONSTRAINT goal_keeper_pk PRIMARY KEY ( player_id );

CREATE TABLE manager (
    manager_id              VARCHAR2(10) NOT NULL,
    first_name              VARCHAR2(255),
    last_name               VARCHAR2(255),
    number_of_coaches       NUMBER,
    number_of_clubs_managed NUMBER
);

ALTER TABLE manager ADD CONSTRAINT manager_pk PRIMARY KEY ( manager_id );

CREATE TABLE match (
    match_id           VARCHAR2(10) NOT NULL,
    match_date         DATE,
    result             VARCHAR2(20),
    stadium_id         VARCHAR2(10),
    time               DATE
);

ALTER TABLE match ADD CONSTRAINT match_pk PRIMARY KEY ( match_id );

CREATE TABLE match_club (
    mat_club_id    VARCHAR2(20) NOT NULL,
    match_id       VARCHAR2(10),
    club_id        VARCHAR2(10)
);

ALTER TABLE match_club ADD CONSTRAINT match_club_pk PRIMARY KEY ( mat_club_id );

ALTER TABLE match_club ADD CONSTRAINT match_club_match_club_id_un UNIQUE (match_id, club_id);

CREATE TABLE match_commentator (
    mat_com_id                 VARCHAR2(20) NOT NULL,
    match_id                   VARCHAR2(10),
    commentator_id             VARCHAR2(10)
);

ALTER TABLE match_commentator ADD CONSTRAINT match_commentator_pk PRIMARY KEY ( mat_com_id );

ALTER TABLE match_commentator ADD CONSTRAINT match_commentator_match_id_un UNIQUE (match_id, commentator_id);

CREATE TABLE match_refree (
    mat_ref_sk       VARCHAR2(20) NOT NULL,
    match_id         VARCHAR2(10),
    refree_id        VARCHAR2(10)
);

ALTER TABLE match_refree ADD CONSTRAINT match_refree_pk PRIMARY KEY ( mat_ref_sk );

ALTER TABLE match_refree ADD CONSTRAINT match_refree_refree_id_un UNIQUE (match_id, refree_id);

CREATE TABLE match_stat (
    match_id        VARCHAR2(10) NOT NULL,
    match_goals     NUMBER,
    match_penalties NUMBER,
    match_fouls     NUMBER
);

CREATE UNIQUE INDEX match_stat__idx ON
    match_stat (
        match_id
    ASC );

ALTER TABLE match_stat ADD CONSTRAINT match_stat_pk PRIMARY KEY ( match_id );

CREATE TABLE merchandise (
    item_no      VARCHAR2(10) NOT NULL,
    club_id      VARCHAR2(10),
    item_name    VARCHAR2(255),
    buyer_name   VARCHAR(255),
    category     VARCHAR2(255),
    price        NUMBER
);

ALTER TABLE merchandise ADD CONSTRAINT merchandise_pk PRIMARY KEY ( item_no );

CREATE TABLE owner (
    owner_id           VARCHAR2(10) NOT NULL,
    net_worth          NUMBER,
    investment_in_club NUMBER,
    first_name         VARCHAR2(255),
    last_name          VARCHAR2(255)
);

CREATE UNIQUE INDEX owner__idx ON
    owner (
        owner_id
    ASC );

ALTER TABLE owner ADD CONSTRAINT owner_pk PRIMARY KEY ( owner_id );

CREATE TABLE player (
    player_id         VARCHAR2(10) NOT NULL,
    club_id           VARCHAR2(10),
    first_name        VARCHAR2(255),
    last_name         VARCHAR2(255),
    jersey_number     NUMBER,
    player_type       VARCHAR2(20),
    number_of_matches NUMBER,
    number_of_goals   NUMBER,
    number_of_assists NUMBER,
    number_of_yellow_cards NUMBER,
    number_of_red_cards NUMBER,
    wages             NUMBER
);

ALTER TABLE player ADD CONSTRAINT player_pk PRIMARY KEY ( player_id );

CREATE TABLE points_table (
    club_id        VARCHAR2(10) NOT NULL,
    rank           NUMBER NOT NULL,
    matches_played NUMBER,
    matches_won    NUMBER,
    matches_lost   NUMBER,
    matches_drawn  NUMBER,
    no_result      NUMBER,
    season_club_sk VARCHAR2(20) NOT NULL,
    season         VARCHAR2(10)
);

ALTER TABLE points_table ADD CONSTRAINT points_table_pk PRIMARY KEY ( season_club_sk );

ALTER TABLE points_table ADD CONSTRAINT pts_table_un UNIQUE (club_id, season);

CREATE TABLE refree (
    refree_id                  VARCHAR2(10) NOT NULL,
    first_name                 VARCHAR2(255),
    last_name                  VARCHAR2(255),
    years_of_experience        NUMBER,
    number_of_games_officiated NUMBER,
    number_of_red_cards        NUMBER
);

ALTER TABLE refree ADD CONSTRAINT refree_pk PRIMARY KEY ( refree_id );

CREATE TABLE stadium (
    stadium_id   VARCHAR2(10) NOT NULL,
    stadium_name VARCHAR2(100),
    city         VARCHAR2(100),
    capacity     NUMBER,
    "SIZE"       NUMBER,
    attendance   NUMBER
);

ALTER TABLE stadium ADD CONSTRAINT stadium_pk PRIMARY KEY ( stadium_id );

CREATE TABLE ticket (
    ticket_id          VARCHAR2(10) NOT NULL,
    stadium_id         VARCHAR2(10),
    ticket_price       NUMBER,
    seat_number        NUMBER,
    ticket_type        VARCHAR2(10),
    sale_date          DATE,
    ticket_status      VARCHAR2(20),
    payment_method     VARCHAR2(20),
    buyer_name         VARCHAR2(255),
    match_id           VARCHAR2(10)
);

ALTER TABLE ticket ADD CONSTRAINT ticket_pk PRIMARY KEY ( ticket_id );

ALTER TABLE attacker
    ADD CONSTRAINT attacker_player_fk FOREIGN KEY ( player_id )
        REFERENCES player ( player_id );

ALTER TABLE club_data
    ADD CONSTRAINT club_data_club_fk FOREIGN KEY ( club_id )
        REFERENCES club ( club_id );

ALTER TABLE club
    ADD CONSTRAINT club_manager_fk FOREIGN KEY ( manager_id )
        REFERENCES manager ( manager_id );
        
ALTER TABLE club
    ADD CONSTRAINT club_owner_fk FOREIGN KEY ( owner_id )
        REFERENCES owner ( owner_id );

ALTER TABLE defender
    ADD CONSTRAINT defender_player_fk FOREIGN KEY ( player_id )
        REFERENCES player ( player_id );

ALTER TABLE goal_keeper
    ADD CONSTRAINT goal_keeper_player_fk FOREIGN KEY ( player_id )
        REFERENCES player ( player_id );

ALTER TABLE match_club
    ADD CONSTRAINT match_club_club_fk FOREIGN KEY ( club_id )
        REFERENCES club ( club_id );

ALTER TABLE match_club
    ADD CONSTRAINT match_club_match_fk FOREIGN KEY ( match_id )
        REFERENCES match ( match_id );

ALTER TABLE match_commentator
    ADD CONSTRAINT match_comm_commentator_fk FOREIGN KEY ( commentator_id )
        REFERENCES commentator ( commentator_id );

ALTER TABLE match_commentator
    ADD CONSTRAINT match_commentator_match_fk FOREIGN KEY ( match_id )
        REFERENCES match ( match_id );

ALTER TABLE match_refree
    ADD CONSTRAINT match_refree_match_fk FOREIGN KEY ( match_id )
        REFERENCES match ( match_id );

ALTER TABLE match_refree
    ADD CONSTRAINT match_refree_refree_fk FOREIGN KEY ( refree_id )
        REFERENCES refree ( refree_id );

ALTER TABLE match
    ADD CONSTRAINT match_stadium_fk FOREIGN KEY ( stadium_id )
        REFERENCES stadium ( stadium_id );

ALTER TABLE match_stat
    ADD CONSTRAINT match_stat_match_fk FOREIGN KEY ( match_id )
        REFERENCES match ( match_id );

ALTER TABLE merchandise
    ADD CONSTRAINT merchandise_club_fk FOREIGN KEY ( club_id )
        REFERENCES club ( club_id );

ALTER TABLE player
    ADD CONSTRAINT player_club_fk FOREIGN KEY ( club_id )
        REFERENCES club ( club_id );

ALTER TABLE points_table
    ADD CONSTRAINT points_table_club_fk FOREIGN KEY ( club_id )
        REFERENCES club ( club_id );

ALTER TABLE ticket
    ADD CONSTRAINT ticket_match_fk FOREIGN KEY ( match_id )
        REFERENCES match ( match_id );

ALTER TABLE ticket
    ADD CONSTRAINT ticket_stadium_fk FOREIGN KEY ( stadium_id )
        REFERENCES stadium ( stadium_id );

INSERT INTO club (club_id, owner_id, club_name, number_of_players, manager_id) VALUES ('CLB001', 'OWN001', 'Arsenal',28, 'MNG001');
INSERT INTO club (club_id, owner_id, club_name, number_of_players, manager_id) VALUES ('CLB002', 'OWN002', 'Manchester United',32, 'MNG002');
INSERT INTO club (club_id, owner_id, club_name, number_of_players, manager_id) VALUES ('CLB003', 'OWN003', 'Manchester City',32, 'MNG003');
INSERT INTO club (club_id, owner_id, club_name, number_of_players, manager_id) VALUES ('CLB004', 'OWN004', 'Liverpool',30, 'MNG004');
INSERT INTO club (club_id, owner_id, club_name, number_of_players, manager_id) VALUES ('CLB005', 'OWN005', 'Tottenham',28, 'MNG005');
INSERT INTO club (club_id, owner_id, club_name, number_of_players, manager_id) VALUES ('CLB006', 'OWN006', 'Chelsea FC', 24, 'MNG006');


INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR001', 'CLB001', 'Theory','Henry',10,'Attacker',100,111,199,11,1,1000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR002', 'CLB001', 'Robin','Van Persie',7,'Attacker',111,150,100,6,2,1100000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR003', 'CLB001', 'Andrew','Arshavin',9,'Attacker',101,100,219,11,0,1000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR004', 'CLB001', 'Ben','White',5,'Defender',60,111,189,31,21,1000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR005', 'CLB001', 'Gabriel','Jesus',7,'MidFielder',60,111,189,12,2,1000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR006', 'CLB002', 'Cristiano','Ronaldo',7,'Attacker',200,291,199,17,7,10000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR007', 'CLB002', 'Wayne','Roony',10,'MidFielder',210,201,299,12,1,10000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR008', 'CLB002', 'Harry','Maguire',4,'Defender',200,91,99,22,2,10000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR009', 'CLB002', 'Robin','VonderSaar',1,'GoalKeeper',210,21,100,06,1,10000000);


INSERT INTO attacker (player_id, attacker_role, number_of_shots, number_of_dribbles, top_sprint_Speed) VALUES ('PLR001', 'Striker',320, 250, 86); 
INSERT INTO attacker (player_id, attacker_role, number_of_shots, number_of_dribbles, top_sprint_Speed) VALUES ('PLR002', 'Striker',1111,2110,89);
INSERT INTO attacker (player_id, attacker_role, number_of_shots, number_of_dribbles, top_sprint_Speed) VALUES ('PLR003', 'Striker',300, 230, 80);

INSERT INTO defender (player_id, defender_role, number_of_interception, number_of_blocks, number_of_sliding_tackles) VALUES ('PLR004', 'RightBack',150, 80, 40); 
INSERT INTO defender (player_id, defender_role, number_of_interception, number_of_blocks, number_of_sliding_tackles) VALUES ('PLR008', 'centerBack',140, 85, 35); 


INSERT INTO club_data (club_id, number_of_trophies, number_of_wins, number_of_players_purchased, number_of_players_sold, club_budget) VALUES ('CLB001', 20, 600, 5, 3, 1000000);
INSERT INTO club_data (club_id, number_of_trophies, number_of_wins, number_of_players_purchased, number_of_players_sold, club_budget) VALUES ('CLB002', 25, 650, 4, 2, 1500000);
INSERT INTO club_data (club_id, number_of_trophies, number_of_wins, number_of_players_purchased, number_of_players_sold, club_budget) VALUES ('CLB003', 18, 550, 6, 4, 900000);
INSERT INTO club_data (club_id, number_of_trophies, number_of_wins, number_of_players_purchased, number_of_players_sold, club_budget) VALUES ('CLB004', 22, 620, 3, 1, 1200000);
INSERT INTO club_data (club_id, number_of_trophies, number_of_wins, number_of_players_purchased, number_of_players_sold, club_budget) VALUES ('CLB005', 17, 500, 7, 5, 800000);
INSERT INTO club_data (club_id, number_of_trophies, number_of_wins, number_of_players_purchased, number_of_players_sold, club_budget) VALUES ('CLB006', 19, 560, 2, 2, 950000);

INSERT INTO match (match_id, match_date, result, stadium_id, time) VALUES ('MAT001', TO_DATE('2024-04-01', 'YYYY-MM-DD'), '3-1', 'STD001', TO_DATE('14:00', 'HH24:MI'));
INSERT INTO match (match_id, match_date, result, stadium_id, time) VALUES ('MAT002', TO_DATE('2024-04-02', 'YYYY-MM-DD'), '2-2', 'STD002', TO_DATE('17:00', 'HH24:MI'));
INSERT INTO match (match_id, match_date, result, stadium_id, time) VALUES ('MAT003', TO_DATE('2024-04-03', 'YYYY-MM-DD'), '0-1', 'STD003', TO_DATE('19:00', 'HH24:MI'));
INSERT INTO match (match_id, match_date, result, stadium_id, time) VALUES ('MAT004', TO_DATE('2024-04-04', 'YYYY-MM-DD'), '4-0', 'STD004', TO_DATE('21:00', 'HH24:MI'));
INSERT INTO match (match_id, match_date, result, stadium_id, time) VALUES ('MAT005', TO_DATE('2024-04-05', 'YYYY-MM-DD'), '1-3', 'STD005', TO_DATE('16:00', 'HH24:MI'));
INSERT INTO match (match_id, match_date, result, stadium_id, time) VALUES ('MAT006', TO_DATE('2024-04-06', 'YYYY-MM-DD'), '2-0', 'STD006', TO_DATE('18:00', 'HH24:MI'));

INSERT INTO match_club (mat_club_id, match_id, club_id) VALUES ('MC001', 'MAT001', 'CLB001');
INSERT INTO match_club (mat_club_id, match_id, club_id) VALUES ('MC002', 'MAT001', 'CLB002');
INSERT INTO match_club (mat_club_id, match_id, club_id) VALUES ('MC003', 'MAT002', 'CLB003');
INSERT INTO match_club (mat_club_id, match_id, club_id) VALUES ('MC004', 'MAT002', 'CLB004');
INSERT INTO match_club (mat_club_id, match_id, club_id) VALUES ('MC005', 'MAT003', 'CLB005');
INSERT INTO match_club (mat_club_id, match_id, club_id) VALUES ('MC006', 'MAT003', 'CLB006');

--revenue of the club through merchandise
CREATE VIEW revenue_of_the_club_through_merchandise AS
SELECT
  c.club_id,
  c.club_name,
  SUM(m.price) AS total_revenue,
  COUNT(m.item_no) AS items_sold,
  (SELECT category FROM merchandise m2 WHERE m2.club_id = c.club_id GROUP BY m2.category ORDER BY COUNT(*) DESC FETCH FIRST 1 ROW ONLY) AS top_selling_category
FROM club c
JOIN merchandise m ON c.club_id = m.club_id
GROUP BY c.club_id, c.club_name
ORDER BY total_revenue DESC;

-- player_PerformanceTrack_Attacker_Individual_View
CREATE or REPLACE VIEW player_PerformanceTrack_Attacker_Individual_View 
AS 
SELECT 
pl.first_name || ' '|| pl.last_name as NAME, 
pl.number_of_matches as Total_Played,
pl.number_of_goals as Total_Goals_Scored,
pl.number_of_assists as Total_Assists,
pa.attacker_role,
pa.number_of_Shots as Total_Shots,
pa.top_sprint_Speed as Highest_Pace
from 
player pl 
join
attacker pa ON pl.player_id = pa.player_id;

GRANT SELECT ON ticket_sales_match_wise TO analyst;
GRANT SELECT ON match_summary_view TO analyst;

GRANT SELECT ON match TO customer_access;
GRANT SELECT ON club TO customer_access;
GRANT SELECT ON merchandise TO customer_access;