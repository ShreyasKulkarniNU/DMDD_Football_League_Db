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

INSERT INTO owner (owner_id, net_worth, investment_in_club, first_name, last_name) VALUES ('OWN001', 1000000, 500000, 'John', 'Doe'); 
INSERT INTO owner (owner_id, net_worth, investment_in_club, first_name, last_name) VALUES ('OWN002', 1500000, 700000, 'Jane', 'Smith'); 
INSERT INTO owner (owner_id, net_worth, investment_in_club, first_name, last_name) VALUES ('OWN003', 800000, 400000, 'David', 'Jones');
INSERT INTO owner (owner_id, net_worth, investment_in_club, first_name, last_name) VALUES ('OWN004', 2000000, 900000, 'Emily', 'Brown'); 
INSERT INTO owner (owner_id, net_worth, investment_in_club, first_name, last_name) VALUES ('OWN005', 1200000, 600000, 'Michael', 'Wilson'); 
INSERT INTO owner (owner_id, net_worth, investment_in_club, first_name, last_name) VALUES ('OWN006', 1800000, 850000, 'Jessica', 'Garcia');

INSERT INTO commentator (commentator_id, number_of_matches_commentated, language, first_name, last_name) VALUES ('COM001', 200, 'English', 'Martin', 'Tyler');
INSERT INTO commentator (commentator_id, number_of_matches_commentated, language, first_name, last_name) VALUES ('COM002', 180, 'Spanish', 'Carlos', 'Martinez');
INSERT INTO commentator (commentator_id, number_of_matches_commentated, language, first_name, last_name) VALUES ('COM003', 150, 'French', 'Thierry', 'Henry');
INSERT INTO commentator (commentator_id, number_of_matches_commentated, language, first_name, last_name) VALUES ('COM004', 170, 'German', 'Thomas', 'Muller');
INSERT INTO commentator (commentator_id, number_of_matches_commentated, language, first_name, last_name) VALUES ('COM005', 160, 'Italian', 'Gianluca', 'Vialli');
INSERT INTO commentator (commentator_id, number_of_matches_commentated, language, first_name, last_name) VALUES ('COM006', 190, 'Portuguese', 'Luis', 'Figo');

INSERT INTO stadium (stadium_id, stadium_name, city, capacity, "SIZE", attendance) VALUES ('STD001', 'Old Trafford', 'Manchester', 76000, 105, 75000);
INSERT INTO stadium (stadium_id, stadium_name, city, capacity, "SIZE", attendance) VALUES ('STD002', 'Camp Nou', 'Barcelona', 99354, 110, 90000);
INSERT INTO stadium (stadium_id, stadium_name, city, capacity, "SIZE", attendance) VALUES ('STD003', 'Wembley', 'London', 90000, 105, 85000);
INSERT INTO stadium (stadium_id, stadium_name, city, capacity, "SIZE", attendance) VALUES ('STD004', 'San Siro', 'Milan', 80018, 105, 78000);
INSERT INTO stadium (stadium_id, stadium_name, city, capacity, "SIZE", attendance) VALUES ('STD005', 'Anfield', 'Liverpool', 54074, 101, 53000);
INSERT INTO stadium (stadium_id, stadium_name, city, capacity, "SIZE", attendance) VALUES ('STD006', 'Santiago Bernabeu', 'Madrid', 81044, 107, 80000);

INSERT INTO match (match_id, match_date, result, stadium_id, time) VALUES ('MAT001', TO_DATE('2024-04-01', 'YYYY-MM-DD'), '3-1', 'STD001', TO_DATE('14:00', 'HH24:MI'));
INSERT INTO match (match_id, match_date, result, stadium_id, time) VALUES ('MAT002', TO_DATE('2024-04-02', 'YYYY-MM-DD'), '2-2', 'STD002', TO_DATE('17:00', 'HH24:MI'));
INSERT INTO match (match_id, match_date, result, stadium_id, time) VALUES ('MAT003', TO_DATE('2024-04-03', 'YYYY-MM-DD'), '0-1', 'STD003', TO_DATE('19:00', 'HH24:MI'));
INSERT INTO match (match_id, match_date, result, stadium_id, time) VALUES ('MAT004', TO_DATE('2024-04-04', 'YYYY-MM-DD'), '4-0', 'STD004', TO_DATE('21:00', 'HH24:MI'));
INSERT INTO match (match_id, match_date, result, stadium_id, time) VALUES ('MAT005', TO_DATE('2024-04-05', 'YYYY-MM-DD'), '1-3', 'STD005', TO_DATE('16:00', 'HH24:MI'));
INSERT INTO match (match_id, match_date, result, stadium_id, time) VALUES ('MAT006', TO_DATE('2024-04-06', 'YYYY-MM-DD'), '2-0', 'STD006', TO_DATE('18:00', 'HH24:MI'));

INSERT INTO match_commentator (mat_com_id, match_id, commentator_id) VALUES ('MCOM001', 'MAT001', 'COM001');
INSERT INTO match_commentator (mat_com_id, match_id, commentator_id) VALUES ('MCOM002', 'MAT001', 'COM002');
INSERT INTO match_commentator (mat_com_id, match_id, commentator_id) VALUES ('MCOM003', 'MAT003', 'COM003');
INSERT INTO match_commentator (mat_com_id, match_id, commentator_id) VALUES ('MCOM004', 'MAT003', 'COM004');
INSERT INTO match_commentator (mat_com_id, match_id, commentator_id) VALUES ('MCOM005', 'MAT002', 'COM005');
INSERT INTO match_commentator (mat_com_id, match_id, commentator_id) VALUES ('MCOM006', 'MAT002', 'COM006');

INSERT INTO manager (manager_id, first_name, last_name, number_of_coaches, number_of_clubs_managed) VALUES ('MNG001', 'John', 'Doe', 5, 3); 
INSERT INTO manager (manager_id, first_name, last_name, number_of_coaches, number_of_clubs_managed) VALUES ('MNG002', 'Jane', 'Smith', 4, 2); 
INSERT INTO manager (manager_id, first_name, last_name, number_of_coaches, number_of_clubs_managed) VALUES ('MNG003', 'David', 'Jones', 6, 4); 
INSERT INTO manager (manager_id, first_name, last_name, number_of_coaches, number_of_clubs_managed) VALUES ('MNG004', 'Emily', 'Brown', 7, 5);
INSERT INTO manager (manager_id, first_name, last_name, number_of_coaches, number_of_clubs_managed) VALUES ('MNG005', 'Michael', 'Wilson', 3, 2); 
INSERT INTO manager (manager_id, first_name, last_name, number_of_coaches, number_of_clubs_managed) VALUES ('MNG006', 'Jessica', 'Garcia', 4, 3); 
INSERT INTO manager (manager_id, first_name, last_name, number_of_coaches, number_of_clubs_managed) VALUES ('MNG007', 'Daniel', 'Martinez', 5, 4); 
INSERT INTO manager (manager_id, first_name, last_name, number_of_coaches, number_of_clubs_managed) VALUES ('MNG008', 'Sophia', 'Lopez', 2, 1); 

INSERT INTO club (club_id, owner_id, club_name, number_of_players, manager_id) VALUES ('CLB001', 'OWN001', 'Arsenal',28, 'MNG001');
INSERT INTO club (club_id, owner_id, club_name, number_of_players, manager_id) VALUES ('CLB002', 'OWN002', 'Manchester United',32, 'MNG002');
INSERT INTO club (club_id, owner_id, club_name, number_of_players, manager_id) VALUES ('CLB003', 'OWN003', 'Manchester City',32, 'MNG003');
INSERT INTO club (club_id, owner_id, club_name, number_of_players, manager_id) VALUES ('CLB004', 'OWN004', 'Liverpool',30, 'MNG004');
INSERT INTO club (club_id, owner_id, club_name, number_of_players, manager_id) VALUES ('CLB005', 'OWN005', 'Tottenham',28, 'MNG005');
INSERT INTO club (club_id, owner_id, club_name, number_of_players, manager_id) VALUES ('CLB006', 'OWN006', 'Chelsea FC', 24, 'MNG006');

INSERT INTO merchandise (item_no, club_id, item_name, buyer_name, category, price) VALUES ('MRC001', 'CLB001', 'United Jersey 2024', 'River Brown','Apparel', 90);
INSERT INTO merchandise (item_no, club_id, item_name, buyer_name, category, price) VALUES ('MRC002', 'CLB002', 'Barca Scarf 2024', 'Jamie Williams', 'Accessory', 20);
INSERT INTO merchandise (item_no, club_id, item_name, buyer_name, category, price) VALUES ('MRC003', 'CLB003', 'Liverpool Mug', 'Casey Smith','Accessory', 15);
INSERT INTO merchandise (item_no, club_id, item_name, buyer_name, category, price) VALUES ('MRC004', 'CLB004', 'Madrid Cap', 'Alex Brown','Accessory', 25);
INSERT INTO merchandise (item_no, club_id, item_name, buyer_name, category, price) VALUES ('MRC005', 'CLB005', 'Milan Keychain', 'Morgan Williams', 'Accessory', 10);
INSERT INTO merchandise (item_no, club_id, item_name, buyer_name, category, price) VALUES ('MRC006', 'CLB006', 'Chelsea Backpack', 'Jordan Davis','Apparel', 110);
INSERT INTO merchandise (item_no, club_id, item_name, buyer_name, category, price) VALUES ('MRC007', 'CLB004', 'Madrid Flag', 'River Miller','Accessories', 18.00); 
INSERT INTO merchandise (item_no, club_id, item_name, buyer_name, category, price) VALUES ('MRC008', 'CLB004', 'Madrid Keychain', 'Jamie Miller','Accessories', 5.50); 

INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR001', 'CLB001', 'Theory','Henry',10,'Attacker',100,111,199,11,1,1000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR002', 'CLB001', 'Robin','Van Persie',7,'Attacker',111,150,100,6,2,1100000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR003', 'CLB001', 'Andrew','Arshavin',9,'Attacker',101,100,219,11,0,1000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR004', 'CLB001', 'Ben','White',5,'Defender',60,111,189,31,21,1000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR005', 'CLB001', 'Gabriel','Jesus',7,'MidFielder',60,111,189,12,2,1000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR006', 'CLB002', 'Cristiano','Ronaldo',7,'Attacker',200,291,199,17,7,10000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR007', 'CLB002', 'Wayne','Roony',10,'MidFielder',210,201,299,12,1,10000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR008', 'CLB002', 'Harry','Maguire',4,'Defender',200,91,99,22,2,10000000);
INSERT INTO player (player_id, club_id, first_name, last_name, jersey_number, player_type, number_of_matches, number_of_goals, number_of_assists, number_of_yellow_cards, number_of_red_cards, wages) VALUES ('PLR009', 'CLB002', 'Robin','VonderSaar',1,'GoalKeeper',210,21,100,06,1,10000000);

INSERT INTO midfielder (player_id, midfielder_role, number_of_throughballs, total_number_of_chances_created, number_of_passes_completed, number_of_corners, number_of_freekicks, pass_Rating) VALUES ('PLR005','Central-Attacking',91,280,398,20,10,90);
INSERT INTO midfielder (player_id, midfielder_role, number_of_throughballs, total_number_of_chances_created, number_of_passes_completed, number_of_corners, number_of_freekicks, pass_Rating) VALUES ('PLR007','Central-Defensive',85,250,378,25,5,92);

INSERT INTO goal_keeper (player_id, goalie_type, number_of_saves, number_of_cleansheets, penalties_rating) VALUES ('PLR009', 'Attacking',500, 150, 20); 
--INSERT INTO goal_keeper (player_id, goalie_type, number_of_saves, number_of_cleansheets, penalties_rating) VALUES ('PLR010', 'Deffensive',400, 150, 20); 

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

INSERT INTO match_club (mat_club_id, match_id, club_id) VALUES ('MC001', 'MAT001', 'CLB001');
INSERT INTO match_club (mat_club_id, match_id, club_id) VALUES ('MC002', 'MAT001', 'CLB002');
INSERT INTO match_club (mat_club_id, match_id, club_id) VALUES ('MC003', 'MAT002', 'CLB003');
INSERT INTO match_club (mat_club_id, match_id, club_id) VALUES ('MC004', 'MAT002', 'CLB004');
INSERT INTO match_club (mat_club_id, match_id, club_id) VALUES ('MC005', 'MAT003', 'CLB005');
INSERT INTO match_club (mat_club_id, match_id, club_id) VALUES ('MC006', 'MAT003', 'CLB006');

INSERT INTO points_table (club_id, rank, matches_played, matches_won, matches_lost, matches_drawn, no_result, season_club_sk, season) VALUES ('CLB001', 1, 38, 30, 5, 3, 0, 'CLB001_2024', '2024');
INSERT INTO points_table (club_id, rank, matches_played, matches_won, matches_lost, matches_drawn, no_result, season_club_sk, season) VALUES ('CLB002', 2, 38, 28, 7, 3, 0, 'CLB002_2024', '2024');
INSERT INTO points_table (club_id, rank, matches_played, matches_won, matches_lost, matches_drawn, no_result, season_club_sk, season) VALUES ('CLB003', 3, 38, 26, 8, 4, 0, 'CLB003_2024', '2024');
INSERT INTO points_table (club_id, rank, matches_played, matches_won, matches_lost, matches_drawn, no_result, season_club_sk, season) VALUES ('CLB004', 4, 38, 25, 9, 4, 0, 'CLB004_2024', '2024');
INSERT INTO points_table (club_id, rank, matches_played, matches_won, matches_lost, matches_drawn, no_result, season_club_sk, season) VALUES ('CLB005', 5, 38, 24, 10, 4, 0, 'CLB005_2024', '2024');
INSERT INTO points_table (club_id, rank, matches_played, matches_won, matches_lost, matches_drawn, no_result, season_club_sk, season) VALUES ('CLB006', 6, 38, 23, 11, 4, 0, 'CLB006_2024', '2024');

INSERT INTO refree (refree_id, first_name, last_name, years_of_experience, number_of_games_officiated, number_of_red_cards) VALUES ('REF001', 'Mark', 'Clattenburg', 12, 300, 25);
INSERT INTO refree (refree_id, first_name, last_name, years_of_experience, number_of_games_officiated, number_of_red_cards) VALUES ('REF002', 'Howard', 'Webb', 15, 400, 30);
INSERT INTO refree (refree_id, first_name, last_name, years_of_experience, number_of_games_officiated, number_of_red_cards) VALUES ('REF003', 'Pierluigi', 'Collina', 20, 500, 5);
INSERT INTO refree (refree_id, first_name, last_name, years_of_experience, number_of_games_officiated, number_of_red_cards) VALUES ('REF004', 'Felix', 'Brych', 10, 250, 20);
INSERT INTO refree (refree_id, first_name, last_name, years_of_experience, number_of_games_officiated, number_of_red_cards) VALUES ('REF005', 'Cüneyt', 'Çakır', 13, 350, 22);
INSERT INTO refree (refree_id, first_name, last_name, years_of_experience, number_of_games_officiated, number_of_red_cards) VALUES ('REF006', 'Björn', 'Kuipers', 14, 320, 18);

INSERT INTO match_refree (mat_ref_sk, match_id, refree_id) VALUES ('MREF001', 'MAT001', 'REF001');
INSERT INTO match_refree (mat_ref_sk, match_id, refree_id) VALUES ('MREF002', 'MAT001', 'REF002');
INSERT INTO match_refree (mat_ref_sk, match_id, refree_id) VALUES ('MREF003', 'MAT002', 'REF003');
INSERT INTO match_refree (mat_ref_sk, match_id, refree_id) VALUES ('MREF004', 'MAT002', 'REF004');
INSERT INTO match_refree (mat_ref_sk, match_id, refree_id) VALUES ('MREF005', 'MAT003', 'REF005');
INSERT INTO match_refree (mat_ref_sk, match_id, refree_id) VALUES ('MREF006', 'MAT003', 'REF006');

INSERT INTO ticket (ticket_id, stadium_id, ticket_price, seat_number, ticket_type, sale_date, ticket_status, payment_method, buyer_name, match_id) VALUES ('TCK001', 'STD001', 50, 101, 'Standard', TO_DATE('2024-03-30', 'YYYY-MM-DD'), 'Sold', 'Credit Card', 'John Doe', 'MAT001');
INSERT INTO ticket (ticket_id, stadium_id, ticket_price, seat_number, ticket_type, sale_date, ticket_status, payment_method, buyer_name, match_id) VALUES ('TCK002', 'STD002', 55, 102, 'Standard', TO_DATE('2024-03-31', 'YYYY-MM-DD'), 'Sold', 'Debit Card', 'Alice Johnson', 'MAT002');
INSERT INTO ticket (ticket_id, stadium_id, ticket_price, seat_number, ticket_type, sale_date, ticket_status, payment_method, buyer_name, match_id) VALUES ('TCK003', 'STD003', 60, 103, 'Premium', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Available', 'Cash', 'Bob Smith', 'MAT003');
INSERT INTO ticket (ticket_id, stadium_id, ticket_price, seat_number, ticket_type, sale_date, ticket_status, payment_method, buyer_name, match_id) VALUES ('TCK004', 'STD001', 65, 104, 'VIP', TO_DATE('2024-03-30', 'YYYY-MM-DD'), 'Available', 'Credit Card', 'Carol White', 'MAT001');
INSERT INTO ticket (ticket_id, stadium_id, ticket_price, seat_number, ticket_type, sale_date, ticket_status, payment_method, buyer_name, match_id) VALUES ('TCK005', 'STD002', 50, 105, 'Standard', TO_DATE('2024-03-31', 'YYYY-MM-DD'), 'Sold', 'Credit Card', 'Dave Green', 'MAT002');
INSERT INTO ticket (ticket_id, stadium_id, ticket_price, seat_number, ticket_type, sale_date, ticket_status, payment_method, buyer_name, match_id) VALUES ('TCK006', 'STD003', 55, 106, 'Standard', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Sold', 'Debit Card', 'Eva Black', 'MAT003');
INSERT INTO ticket (ticket_id, stadium_id, ticket_price, seat_number, ticket_type, sale_date, ticket_status, payment_method, buyer_name, match_id) VALUES ('TCK007', 'STD001', 75, 104, 'Regular', TO_DATE('2024-03-30', 'YYYY-MM-DD'), 'Available', 'Credit Card', 'Alicia Joe', 'MAT001'); 
INSERT INTO ticket (ticket_id, stadium_id, ticket_price, seat_number, ticket_type, sale_date, ticket_status, payment_method, buyer_name, match_id) VALUES ('TCK008', 'STD002', 85, 204, 'Premium', TO_DATE('2024-03-31', 'YYYY-MM-DD'), 'Available', 'Credit Card', 'Mary Jane', 'MAT002');

INSERT INTO match_stat (match_id, match_goals, match_penalties, match_fouls) VALUES ('MAT001', 4, 1, 10);
INSERT INTO match_stat (match_id, match_goals, match_penalties, match_fouls) VALUES ('MAT002', 4, 0, 12);
INSERT INTO match_stat (match_id, match_goals, match_penalties, match_fouls) VALUES ('MAT003', 1, 0, 8);
INSERT INTO match_stat (match_id, match_goals, match_penalties, match_fouls) VALUES ('MAT004', 4, 1, 11);
INSERT INTO match_stat (match_id, match_goals, match_penalties, match_fouls) VALUES ('MAT005', 4, 0, 9);
INSERT INTO match_stat (match_id, match_goals, match_penalties, match_fouls) VALUES ('MAT006', 2, 0, 10);

commit;

--ticket sales per match view
CREATE VIEW ticket_sales_match_wise AS
SELECT
  m.match_id,
  m.match_date,
  s.stadium_name,
  s.city,
  COUNT(t.ticket_id) AS tickets_sold
FROM match m
JOIN stadium s ON m.stadium_id = s.stadium_id
JOIN ticket t ON m.match_id = t.match_id
GROUP BY m.match_id, m.match_date, s.stadium_name, s.city
ORDER BY m.match_date;

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

--match summary view
CREATE VIEW match_summary_view AS
SELECT
  m.match_id,
  m.match_date,
  m.time,
  s.stadium_name,
  mc.club_id,
  ms.match_goals,
  ms.match_penalties,
  ms.match_fouls,
  pt.rank AS club_position_in_the_points_table
FROM match m
JOIN stadium s ON m.stadium_id = s.stadium_id
JOIN match_stat ms ON m.match_id = ms.match_id
JOIN match_club mc ON m.match_id = mc.match_id
JOIN points_table pt ON mc.club_id = pt.club_id
GROUP BY m.match_id, m.match_date, m.time, s.stadium_name, mc.club_id, ms.match_goals, ms.match_penalties, ms.match_fouls, pt.rank
ORDER BY m.match_date, m.time;

-- View to calculate revenue for each item sold
CREATE VIEW Merchandise_Items_View AS
SELECT 
    m.club_id,
    m.item_name,
    m.price,
    COUNT(*) AS quantity_sold,
    COUNT(*) * m.price AS total_revenue
FROM 
    merchandise m
GROUP BY 
    m.item_no, m.club_id, m.item_name, m.price;

--This view categorizes merchandise items based on their price range, which can help with pricing strategies.
CREATE OR REPLACE VIEW MerchandisePriceRange AS
SELECT
    CASE
        WHEN price < 50 THEN 'Low Price'
        WHEN price BETWEEN 50 AND 100 THEN 'Medium Price'
        ELSE 'High Price'
    END AS price_range,
    COUNT(*) AS count
FROM merchandise
GROUP BY
    CASE
        WHEN price < 50 THEN 'Low Price'
        WHEN price BETWEEN 50 AND 100 THEN 'Medium Price'
        ELSE 'High Price'
    END;

---------------------------------------------------------PACKAGE MERCHANDISE---------------------------------
set serveroutput on;
CREATE OR REPLACE PACKAGE merchandise_mgmt AS
    PROCEDURE INSERT_MERCHANDISE(
        p_item_no        VARCHAR2,
        p_club_id        VARCHAR2,
        p_item_name      VARCHAR2,
        p_buyer_name     VARCHAR2,
        p_category       VARCHAR2,
        p_price          NUMBER
    );

    PROCEDURE UpdateMerchandise(
        p_item_no        VARCHAR2,
        p_club_id        VARCHAR2,
        p_item_name      VARCHAR2,
        p_buyer_name     VARCHAR2,
        p_category       VARCHAR2,
        p_price          NUMBER
    );

    PROCEDURE delete_merchandise(
        p_item_no        VARCHAR2
    );

END merchandise_mgmt;
/

CREATE OR REPLACE PACKAGE BODY merchandise_mgmt AS
    invalid_item_no EXCEPTION;
    invalid_club_id EXCEPTION;
    null_value_found EXCEPTION;
    duplicate_primary_key EXCEPTION;
    invalid_foreign_key EXCEPTION;
    out_of_range_exception EXCEPTION;

    PROCEDURE INSERT_MERCHANDISE(
        p_item_no        VARCHAR2,
        p_club_id        VARCHAR2,
        p_item_name      VARCHAR2,
        p_buyer_name     VARCHAR2,
        p_category       VARCHAR2,
        p_price          NUMBER
    ) AS
        v_count NUMBER;
    BEGIN
        -- Check for null values
        IF p_item_no IS NULL OR p_club_id IS NULL OR p_item_name IS NULL OR 
           p_buyer_name IS NULL OR p_category IS NULL OR p_price IS NULL THEN
            RAISE null_value_found;
        END IF;
        
        -- Check for data type
        -- No need to check as PL/SQL handles data type implicitly
        
        -- Check for min and max range for p_price
        IF p_price < 0 THEN
            RAISE out_of_range_exception;
        END IF;

        -- Check for duplicate primary key
        BEGIN
            INSERT INTO merchandise (item_no, club_id, item_name, buyer_name, category, price)
            VALUES (p_item_no, p_club_id, p_item_name, p_buyer_name, p_category, p_price);
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                RAISE duplicate_primary_key;
        END;
        
        -- Check for invalid foreign key (assuming club_id is a foreign key)
        BEGIN
            SELECT COUNT(*) INTO v_count FROM club WHERE club_id = p_club_id;
            IF v_count = 0 THEN
                RAISE invalid_foreign_key;
            END IF;
        END;

    EXCEPTION
        WHEN null_value_found THEN
            DBMS_OUTPUT.PUT_LINE('Error: One or more required fields are null.');
        WHEN out_of_range_exception THEN
            DBMS_OUTPUT.PUT_LINE('Error: Price must be greater than or equal to 0.');
        WHEN duplicate_primary_key THEN
            DBMS_OUTPUT.PUT_LINE('Error: Duplicate primary key found.');
        WHEN invalid_foreign_key THEN
            DBMS_OUTPUT.PUT_LINE('Error: Invalid foreign key constraint.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
    END INSERT_MERCHANDISE;

    PROCEDURE UpdateMerchandise(
    p_item_no        VARCHAR2,
    p_club_id        VARCHAR2,
    p_item_name      VARCHAR2,
    p_buyer_name     VARCHAR2,
    p_category       VARCHAR2,
    p_price          NUMBER
) AS
    v_count NUMBER;
BEGIN
    -- Check for null values
    IF p_item_no IS NULL OR p_club_id IS NULL OR p_item_name IS NULL OR 
       p_buyer_name IS NULL OR p_category IS NULL OR p_price IS NULL THEN
        RAISE null_value_found;
    END IF;

    -- Check for data type (no need to check explicitly in PL/SQL)
    
    -- Check for min and max range for p_price
    IF p_price < 0 THEN
        RAISE out_of_range_exception;
    END IF;

    -- Check for duplicate primary key
    BEGIN
        -- Assuming item_no is the primary key
        SELECT COUNT(*) INTO v_count FROM merchandise WHERE item_no = p_item_no;
        IF v_count = 0 THEN
            RAISE invalid_item_no;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE invalid_item_no;
    END;

    -- Check for invalid foreign key (assuming club_id is a foreign key)
    BEGIN
        SELECT COUNT(*) INTO v_count FROM club WHERE club_id = p_club_id;
        IF v_count = 0 THEN
            RAISE invalid_foreign_key;
        END IF;
    END;

    -- Update merchandise
    UPDATE merchandise
    SET club_id = p_club_id,
        item_name = p_item_name,
        buyer_name = p_buyer_name,
        category = p_category,
        price = p_price
    WHERE item_no = p_item_no;

EXCEPTION
    WHEN null_value_found THEN
        DBMS_OUTPUT.PUT_LINE('Error: One or more required fields are null.');
    WHEN out_of_range_exception THEN
        DBMS_OUTPUT.PUT_LINE('Error: Price must be greater than or equal to 0.');
    WHEN invalid_item_no THEN
        DBMS_OUTPUT.PUT_LINE('Error: Merchandise with item number ' || p_item_no || ' not found.');
    WHEN invalid_foreign_key THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid foreign key constraint.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END UpdateMerchandise;

    PROCEDURE delete_merchandise(
        p_item_no        VARCHAR2
    ) AS
    BEGIN
        -- Check for null values
        IF p_item_no IS NULL THEN
            RAISE null_value_found;
        END IF;

        -- Delete merchandise
        DELETE FROM merchandise WHERE item_no = p_item_no;

        -- Check if any row was deleted
        IF SQL%ROWCOUNT = 0 THEN
            RAISE invalid_item_no;
        END IF;

    EXCEPTION
        WHEN null_value_found THEN
            DBMS_OUTPUT.PUT_LINE('Error: Item number must be provided.');
        WHEN invalid_item_no THEN
            DBMS_OUTPUT.PUT_LINE('Error: Merchandise with item number ' || p_item_no || ' not found.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
    END delete_merchandise;

END merchandise_mgmt;
/

-------------------------------------------------------------------ending package merchandise-----------------------------------------------------------


-------------------------------TESTING PACKAGE MERCHSNDISE MANAGEMENT ----------------------------------------------------------------------

SET SERVEROUTPUT ON;

-- Test Case 1: Inserting a merchandise with valid data
BEGIN
    merchandise_mgmt.INSERT_MERCHANDISE(
        p_item_no    => 'item001',
        p_club_id    => 'CLB001',
        p_item_name  => 'Test Item',
        p_buyer_name => 'Test Buyer',
        p_category   => 'Test Category',
        p_price      => 50.00
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Test Case 1: Inserting a merchandise with valid data - PASSED');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Test Case 1: Inserting a merchandise with valid data - FAILED. Error: ' || SQLERRM);
END;
/

-- Test Case 2: Inserting a merchandise with NULL values
BEGIN
    merchandise_mgmt.INSERT_MERCHANDISE(
        p_item_no    => NULL,
        p_club_id    => NULL,
        p_item_name  => NULL,
        p_buyer_name => NULL,
        p_category   => NULL,
        p_price      => NULL
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Test Case 2: Inserting a merchandise with NULL values - PASSED');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Test Case 2: Inserting a merchandise with NULL values - FAILED. Error: ' || SQLERRM);
END;
/

-- Test Case 3: Updating a merchandise with valid data
BEGIN
    merchandise_mgmt.UpdateMerchandise(
        p_item_no    => 'item001',
        p_club_id    => 'clb001',
        p_item_name  => 'Updated Item Name',
        p_buyer_name => 'Updated Buyer Name',
        p_category   => 'Updated Category',
        p_price      => 60.00
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Test Case 3: Updating a merchandise with valid data - PASSED');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Test Case 3: Updating a merchandise with valid data - FAILED. Error: ' || SQLERRM);
END;
/

-- Test Case 4: Deleting a merchandise with valid data
BEGIN
    merchandise_mgmt.delete_merchandise(
        p_item_no    => 'item001'
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Test Case 4: Deleting a merchandise with valid data - PASSED');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Test Case 4: Deleting a merchandise with valid data - FAILED. Error: ' || SQLERRM);
END;
/

-- Test Case 5: Updating a merchandise with invalid data (Invalid item number)
BEGIN
    merchandise_mgmt.UpdateMerchandise(
        p_item_no    => 'invalid_item_no',
        p_club_id    => 'clb001',
        p_item_name  => 'Updated Item Name',
        p_buyer_name => 'Updated Buyer Name',
        p_category   => 'Updated Category',
        p_price      => 60.00
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Test Case 5: Updating a merchandise with invalid data (Invalid item number) - PASSED');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Test Case 5: Updating a merchandise with invalid data (Invalid item number) - FAILED. Error: ' || SQLERRM);
END;
/

-- Add more test cases as needed...





-------------------------------END -----   TESTING PACKAGE MERCHSNDISE MANAGEMENT ----------------------------------------------------------------------


GRANT SELECT ON ticket_sales_match_wise TO analyst;
GRANT SELECT ON match_summary_view TO analyst;
GRANT SELECT ON revenue_of_the_club_through_merchandise TO analyst;
GRANT SELECT ON player_PerformanceTrack_Attacker_Individual_View TO analyst;


GRANT SELECT ON match TO customer_access;
GRANT SELECT ON club TO customer_access;
GRANT SELECT ON merchandise TO customer_access;
GRANT SELECT ON ticket TO customer_access;
GRANT SELECT ON stadium TO customer_access;
GRANT SELECT ON match_stat TO customer_access;








