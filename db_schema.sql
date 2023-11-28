-- Schema changes v1

-- drop redundant column
alter table albums
drop column "album_id album artist_name release_date genres average_rating n";

-- add primary key
alter table albums
add primary key(album_id);

-- add album index to get album details
create index idx_album
on albums(album);

-- add covering index for albums by artist
create index idx_artist_name
on albums(artist_name)
include (album);

