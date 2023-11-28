-- Schema changes v1

-- drop redundant column
alter table albums
drop column "album_id	album	artist_name release_date	genres	average_rating	n";

-- add unique index concurrently
create unique index concurrently pk_album
on albums(album_id);

-- create primary key using index
alter table albums
add primary key using index pk_album;

-- add album index to get album details
create index concurrently idx_album
on albums(album);

-- add covering index for albums by artist
create index concurrently idx_artist_name
on albums(artist_name)
include (album);

