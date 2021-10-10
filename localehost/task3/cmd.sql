-- создание таблицы жанров
CREATE TABLE public.genre
(
    id serial NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE public.genre
    OWNER to postgres;
GRANT ALL ON TABLE public.genre TO postgres;

-- заполнение таблицы жанров
INSERT INTO public.genre (name) VALUES ('поп');
INSERT INTO public.genre (name) VALUES ('рок');
INSERT INTO public.genre (name) VALUES ('кантри');
INSERT INTO public.genre (name) VALUES ('классика');
INSERT INTO public.genre (name) VALUES ('регги');
INSERT INTO public.genre (name) VALUES ('супер пупер жанр');
commit;


-----------------------------------------------------------------
-- создание таблицы исполнителей
CREATE TABLE public.performer
(
    id serial NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE public.performer
    OWNER to postgres;
GRANT ALL ON TABLE public.performer TO postgres;

--заполнение таблицы исполнителей
INSERT INTO public.performer (name) VALUES ('Макс Корж');
INSERT INTO public.performer (name) VALUES ('Серебро');
INSERT INTO public.performer (name) VALUES ('Hello');
INSERT INTO public.performer (name) VALUES ('Atata');
INSERT INTO public.performer (name) VALUES ('Ututu');
INSERT INTO public.performer (name) VALUES ('Super performer');
INSERT INTO public.performer (name) VALUES ('Double super performer');
INSERT INTO public.performer (name) VALUES ('Very super performer');
INSERT INTO public.performer (name) VALUES ('Super puper performer');
INSERT INTO public.performer (name) VALUES ('Super atata');
INSERT INTO public.performer (name) VALUES ('YoYo');
INSERT INTO public.performer (name) VALUES ('XXX');
commit;


-----------------------------------------------------------------
-- создание таблицы связки исполнитель-жанр
CREATE TABLE public.performer_genre
(
    performer_id integer NOT NULL,
    genre_id integer NOT NULL,
    CONSTRAINT performer_id FOREIGN KEY (performer_id)
        REFERENCES public.performer (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT genre_id FOREIGN KEY (genre_id)
        REFERENCES public.genre (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
ALTER TABLE public.performer_genre
    OWNER to postgres;
GRANT ALL ON TABLE public.performer_genre TO postgres;

-- заполнение таблицы связки исполнитель-жанр
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (1, 1);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (1, 2);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (1, 3);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (2, 1);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (3, 3);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (4, 5);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (5, 1);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (6, 2);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (7, 3);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (8, 1);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (9, 2);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (10, 1);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (11, 4);
INSERT INTO public.performer_genre (performer_id, genre_id) VALUES (12, 4);
commit;


-----------------------------------------------------------------
-- создание таблицы песен
CREATE TABLE public.song
(
    id serial NOT NULL,
    name character varying NOT NULL,
    performer_id integer,
    duration double precision NOT NULL,
    release_date date NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT performer_id FOREIGN KEY (performer_id)
        REFERENCES public.performer (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
ALTER TABLE public.song
    OWNER to postgres;
GRANT ALL ON TABLE public.song TO postgres;

-- заполнение таблицы с песнями
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 1', 1, 200, current_timestamp);
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 2', 2, 120, date '2001-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 3', 3, 240, date '2021-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 4', 4, 256, date '2011-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 5', 5, 222, date '2005-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 6', 6, 263, date '2006-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 7', 7, 340, date '2007-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 8', 8, 323, date '2008-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 9', 9, 230, date '2000-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 10', 10, 400, date '2009-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 11', 11, 240, date '2003-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 12', 12, 129, date '2008-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 13', 1, 120, date '1999-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 14', 2, 312, date '2018-09-28');
INSERT INTO public.song (name, performer_id, duration, release_date)
	VALUES ('song 15', 3, 200, date '2019-09-28');


-----------------------------------------------------------------
-- создание таблицы связки песня-жанр
CREATE TABLE public.song_genre
(
    song_id integer NOT NULL,
    genre_id integer NOT NULL,
    CONSTRAINT song_id FOREIGN KEY (song_id)
        REFERENCES public.song (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT genre_id FOREIGN KEY (genre_id)
        REFERENCES public.genre (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
ALTER TABLE public.song_genre
    OWNER to postgres;
GRANT ALL ON TABLE public.song_genre TO postgres;

-- заполнение таблицы связки песня-жанр
INSERT INTO public.song_genre (song_id, genre_id) VALUES (1, 1);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (1, 2);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (3, 4);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (4, 5);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (5, 6);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (6, 5);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (7, 4);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (8, 3);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (9, 2);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (10, 1);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (11, 2);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (12, 3);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (12, 5);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (12, 2);
INSERT INTO public.song_genre (song_id, genre_id) VALUES (3, 2);


-- Запрос 1
SELECT s.name, p.name, s.duration, s.release_date
	FROM public.song s,
	     public.genre gn,
		 public.performer p,
		 public.song_genre sg
	  where sg.genre_id = gn.id
		and sg.song_id = s.id
		and s.performer_id = p.id
		and gn.name = 'рок'
		order by s.release_date desc
		limit 10;

-- Запрос 2
SELECT p.name, count(s.id) as cnt
	FROM public.song s,
		 public.performer p
	  where s.performer_id = p.id
	  group by p.id
	  order by cnt desc
	  limit 5;
