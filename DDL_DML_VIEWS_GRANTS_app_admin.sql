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