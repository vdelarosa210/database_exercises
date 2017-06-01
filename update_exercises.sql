USE codeup_test_db;

select 'All albums in your table.' as '';
select name, sales from albums;
UPDATE albums set sales = sales * 10;
select name, sales, from albums;

select 'All albums released before 1980.' as '';
select name, release_date from albums where release_date < 1980;
UPDATE albums set release_date = release_date - 100 where release_date < 1980;

select 'All albums by Michael Jackson have been changed to Peter Jackson' as '';
UPDATE albums set artist = 'Peter Jackson' WHERE artist = 'Michael Jackson';
