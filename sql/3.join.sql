-- 1번 유저가 작성한 모든 점수
-- Score.objects.filter(user_id=1)
-- User.objects.get(id=1).score_set.all()

SELECT * FROM movies_user
JOIN movies_score ON movies_user.id = movies_score.user_id
WHERE movies_user.id=1;


-- 1번 영화의 카테고리
-- Movie.objects.get(id=1).categories.all()

SELECT (name) FROM movies_movie
JOIN movies_category_movies ON movies_movie.id = movies_category_movies.movie_id
JOIN movies_category ON movies_category.id = movies_category_movies.category_id
WHERE movies_movie.id=1;


-- 1번 유저가 작성한 모든 점수의 평균
-- User.objects.get(id=1).score_set.all().aggregate(Avg('value'))
-- Score.objects.filter(user_id=1).aggregate(Avg('value'))

SELECT AVG(value) FROM movies_user
JOIN movies_score ON movies_score.user_id = movies_user.id
WHERE movies_user.id=1;

SELECT AVG(value) FROM movies_score
WHERE user_id=1;


-- drama 카테고리에 속한 모든 영화
-- Score.objects.filter(user_id=1).aggregate(Avg('value'))
SELECT * FROM movies_movie
JOIN movies_category_movies ON movies_category_movies.movie_id = movies_movie.id
JOIN movies_category ON movies_category_movies.category_id = movies_category.id
WHERE movies_category.name='drama';


-- User.objects.values('country').annotate(Count('id'))
SELECT * FROM movies_user
GROUP BY country;

-- 나라별 점수 평균
-- User.objects.values('country').annotate(Count('id'), Avg('score__value'))
SELECT country, COUNT(*), AVG(value) FROM movies_user
JOIN movies_score ON movies_score.user_id = movies_user.id
GROUP BY country;