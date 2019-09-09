CREATE TABLE IF NOT EXISTS customers
(
	id bigserial not null constraint customers_pkey primary key,
	last_login timestamp with time zone,
	email varchar(254) not null constraint customers_email_74194881_uniq unique,
	password varchar(255) not null,
	name varchar(25) not null,
	sex smallint not null,
	birthday date not null,
	created_at timestamp with time zone not null,
	updated_at timestamp with time zone not null
);

CREATE TABLE IF NOT EXISTS staffs
(
    id bigserial not null constraint staffs_pkey primary key,
    staff_name VARCHAR(25) NOT NULL,
    created_at timestamp with time zone not null,
	updated_at timestamp with time zone not null
);

CREATE TABLE IF NOT EXISTS categories
(
    id bigserial not null constraint categories_pkey primary key,
    category_name VARCHAR(25) NOT NULL,
    created_at timestamp with time zone not null,
	updated_at timestamp with time zone not null
);

CREATE TABLE IF NOT EXISTS items
(
    id bigserial not null constraint items_pkey primary key,
    category_id BIGINT constraint items_category_id_ffe53f42_fk references categories deferrable initially deferred,
    item_name VARCHAR(25) NOT NULL,
    price INTEGER not null,
    stock_count INTEGER NOT NULL,
    created_at timestamp with time zone not null,
	updated_at timestamp with time zone not null
);

CREATE TABLE IF NOT EXISTS sales
(
    id bigserial not null constraint sales_pkey primary key,
	sales_date date not null,
    item_id BIGINT constraint sales_item_id_ffe53f42_fk references items deferrable initially deferred,
    customer_id BIGINT constraint sales_customer_id_ffe53f42_fk references customers deferrable initially deferred,
    staff_id BIGINT constraint sales_staff_id_ffe53f42_fk references staffs deferrable initially deferred,
    count integer not null,
    price integer not null
);
