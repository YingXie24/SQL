DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS fx_rates;
DROP TABLE IF EXISTS currency_details;

CREATE TABLE transactions (
    number INTEGER ,
    currency CHARACTER(3) NOT NULL,
    amount BIGINT NOT NULL,
    state VARCHAR(25) NOT NULL,
    created_date DATETIME NOT NULL,
    merchant_category VARCHAR(100),
    merchant_country VARCHAR(3),
    entry_method VARCHAR(4) NOT NULL,
    user_id VARCHAR(36) NOT NULL,
    type VARCHAR(20) NOT NULL,
    source VARCHAR(20) NOT NULL,
    id VARCHAR(36) PRIMARY KEY
);

CREATE TABLE users (
    number INTEGER,
    failed_sign_in_attempts INTEGER,
    kyc VARCHAR(20),
    birth_year INTEGER,
    country VARCHAR(2),
    state VARCHAR(25) NOT NULL,
    created_date DATETIME NOT NULL,
    terms_version DATE,
    phone_country VARCHAR(300),
    has_email BOOLEAN NOT NULL,
    id VARCHAR(36) PRIMARY KEY
);

CREATE TABLE fx_rates (
    base_ccy VARCHAR(3),
    ccy VARCHAR(10),
    rate DOUBLE
);

CREATE TABLE currency_details (
    currency VARCHAR(10) PRIMARY KEY,
    iso_code INTEGER,
    exponent INTEGER,
    is_crypto BOOLEAN NOT NULL
);
