CREATE TABLE transactions_internal (
  id SERIAL PRIMARY KEY,
  sender_id INTEGER NOT NULL,
  reciever_id INTEGER NOT NULL,
  description TEXT,
  amount NUMERIC(10, 2) NOT NULL,
  time TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transactions_external (
  id SERIAL PRIMARY KEY,
  sender_id INTEGER NOT NULL,
  reciever_account TEXT NOT NULL,
  description TEXT,
  amount NUMERIC(10, 2) NOT NULL,
  time TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE transactions_eth (
  id SERIAL PRIMARY KEY,
  sender_id INTEGER NOT NULL,
  reciever_wallet TEXT NOT NULL,
  chain TEXT NOT NULL,
  description TEXT,
  amount NUMERIC(10, 2) NOT NULL,
  time TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE withdraws_fiat (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  user_account TEXT NOT NULL,
  description TEXT,
  amount NUMERIC(10, 2) NOT NULL,
  time TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE withdraws_eth (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  user_wallet TEXT NOT NULL,
  description TEXT,
  amount NUMERIC(10, 2) NOT NULL,
  time TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);