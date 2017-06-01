USE codeup_test_db;

select 'The name of all albums by Pink Floyd.' as '';
SELECT name FROM albums WHERE artist = 'Pink Floyd';

select 'The year Sgt. Pepper''s Lonely Hearts Club Band was released' as '';
SELECT release_date FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

select 'The genre for Nevermind' as '';
SELECT genre FROM albums WHERE name = 'Nevermind';

select 'Which albums were released in the 1990s' as '';
select name from albums where release_date BETWEEN 1990 and 1999;

select 'These albums had less than 20 million certified sales' as '';
SELECT * from albums WHERE sales <= 20.00;

select 'These albums contain a rock genre' as '';
SELECT * from albums WHERE genre like '%rock%';