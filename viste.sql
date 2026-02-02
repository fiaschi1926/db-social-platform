-- ESERCIZIO 1
CREATE INDEX idx_media_user_id
ON db_social_platform.medias(user_id);

CREATE INDEX idx_media_type
ON db_social_platform.medias(type);


EXPLAIN ANALYZE

with medias_photo as (
	SELECT user_id,path FROM db_social_platform.medias m
	where type ='photo'
)

SELECT u.email,path from db_social_platform.users u
inner join medias_photo mp on mp.user_id = u.id



CREATE VIEW db_social_platform.v_esercizio1 as (
	with medias_photo as (
		SELECT user_id,path FROM db_social_platform.medias m
		where type ='photo'
	)

	SELECT u.email,path from db_social_platform.users u
	inner join medias_photo mp on mp.user_id = u.id
)


CREATE MATERIALIZED VIEW db_social_platform.mv_esercizio1 as (
	with medias_photo as (
		SELECT user_id,path FROM db_social_platform.medias m
		where type ='photo'
	)

	SELECT u.email,path from db_social_platform.users u
	inner join medias_photo mp on mp.user_id = u.id
)



--ESERCIZIO 2
CREATE VIEW db_social_platform.v_esercizio2 as (
	SELECT mp.media_id,m.path,mp.post_id,p.tags,p.user_id
	FROM db_social_platform.medias m
	inner join db_social_platform.media_post mp on m.id = mp.media_id
	inner join db_social_platform.posts p on p.id=mp.post_id
)


CREATE MATERIALIZED VIEW db_social_platform.mv_esercizio2 as (
	SELECT mp.media_id,m.path,mp.post_id,p.tags,p.user_id
	FROM db_social_platform.medias m
	inner join db_social_platform.media_post mp on m.id = mp.media_id
	inner join db_social_platform.posts p on p.id=mp.post_id
)
