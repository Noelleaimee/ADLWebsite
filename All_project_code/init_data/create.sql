DROP TABLE IF EXISTS userregistration CASCADE;
CREATE TABLE IF NOT EXISTS userregistration (
  firstname VARCHAR(30),
  lastname VARCHAR(30),
  username VARCHAR(30),       /* Name of the visiting team                     */
  email VARCHAR(255) NOT NULL,   /* Final score of the game for the Buffs         */
  passwords VARCHAR(255) NOT NULL, /* Final score of the game for the visiting team */
  PRIMARY KEY(email) /* A game's unique primary key consists of the visitor_name & the game date (this assumes you can't have multiple games against the same team in a single day) */
);