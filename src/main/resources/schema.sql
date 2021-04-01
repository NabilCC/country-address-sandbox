CREATE TABLE IF NOT EXISTS public.address (
	address_id  INTEGER         NOT NULL,
	level_1     VARCHAR(255)    NOT NULL,
	level_2     VARCHAR(255)    ,
	level_3     VARCHAR(255)    ,
	level_4     VARCHAR(255)    ,
	level_5     VARCHAR(255)    ,
	address     VARCHAR(255)    NOT NULL,
	postcode    VARCHAR(10)     NOT NULL,
	latitude    NUMERIC(17,15)  NOT NULL,
	longitude   NUMERIC(17,15)  NOT NULL,
	CONSTRAINT address_pkey     PRIMARY KEY (address_id)
);
--
CREATE TABLE IF NOT EXISTS public.asset (
	asset_id      INTEGER     NOT NULL,
	frame_id      NUMERIC(9)  NOT NULL,
	business_unit VARCHAR(20) NOT NULL,
	address_id    INTEGER     NOT NULL,
	CONSTRAINT    assets_pkey PRIMARY KEY (frame_id),
	CONSTRAINT    assets_fkey_address FOREIGN KEY (address_id) REFERENCES address (address_id)
);
--
CREATE TABLE IF NOT EXISTS public.address_mapping (
	business_unit VARCHAR(20)   NOT NULL,
	level_1       VARCHAR(255)  ,
	level_2       VARCHAR(255)  ,
	level_3       VARCHAR(255)  ,
	level_4       VARCHAR(255)  ,
	level_5       VARCHAR(255)
);
--