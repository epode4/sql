-- Movies.objects.all()
SELECT * FROM movies_movie;

-- User.objects.all()
SELECT * FROM movies_user;

-- Movie.objects.all().order_by('-year')
SELECT * FROM movies_movie
ORDER BY year DESC;

-- orm(django orm)에서 하나씩 출력하고 싶을 때
-- for movie in Movie.objects.all().order_by('-year'):  
--    ...:     print(movie.id, movie.title)