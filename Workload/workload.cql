-- READ
-- Show if a User is Online/Offline/Streaming/Watching.
SELECT username, status
FROM user
WHERE username = ‘osccN';

-- Show, given a game, which user are streaming it.
SELECT title, user, streaming
FROM game
WHERE title = ‘game3';

-- Show, given a user, the list of streaming done.
SELECT username, streaming
FROM user
WHERE username = 'osccN'; 
	
-- Show how many viewers there are in a streaming.
SELECT streamingid, currentViews
FROM streaming
WHERE streamingId = 78;
-- or
SELECT streamingId, viewers
FROM streamLine
WHERE streamingId = 78
ORDER BY currentTime DESC
LIMIT 1;

-- Show, given a streaming, what is the time with the highest number of
-- viewers, the user who has done it and the title of the game.
SELECT streamingId, user, game, maxView, maxViewTime
FROM streaming
WHERE streamingId = 78;

-- Show the viewer average for a stream.
SELECT AVG(viewers) AS avarageViews
FROM streamLine
WHERE streamingId = 78;

-- Show all the online streaming
SELECT streamingId
FROM streaming
WHERE finished = false;

-- Given a user, show all the users that follow him and are online
SELECT username, status
FROM user
WHERE following status = ‘online' AND CONTAINS ‘osccN' ALLOW FILTERING; 

-- Given a streaming, show all the clip that users have done
SELECT streamingId, clip
FROM streaming
WHERE streamingId = 24;

-- Given a clip, show all the informations about the clip, the user that has done it and what streaming it refers to
SELECT *
FROM clip
WHERE clipId = 12;


-- UPDATE
-- A user can modify his Email or Password.
UPDATE user SET password = ‘newPassword', email = ‘newEmail@email.com' WHERE username = ‘osccN';

-- The User's Status can change to Online or Offline when he opens or close
-- Twitch website.
-- When the user login
UPDATE user SET status = ‘Online' WHERE username = ‘osccN';
-- When the user logout
UPDATE user SET status = ‘Offline' WHERE username = ‘osccN';

-- The Status can change to Streaming or Watching if he is Streaming or
-- watching another user's Streaming.
-- When the user is watching someone
UPDATE user SET status = ‘Watching' WHERE username = ‘osccN';
-- When the user is streaming
UPDATE user SET status = ‘Streaming' WHERE username = ‘osccN';

-- The Game's viewers are updated with the sum of all viewers watching 
-- streaming of that 
-- specific Game every 5 minutes.
-- In the application we can use this following query to obtain the number of
-— total views
-- total = 
SELECT SUM(currentViews)
FROM streaming
WHERE game = ‘game3' AND finished = false ALLOW FILTERING;
-- And then update the game
UPDATE game SET viewers = total WHERE title = ‘game3';

-- The Streaming's EndingTime and Finished is updated when the stream is over.
UPDATE streaming SET finished = true, endingTime = dateof(now());

-- The Streaming's Viewers are updated during the stream every 5 minutes.
INSERT INTO streamline (streamingId, currentTime, viewers) VALUES (1, '00:05:00', 32);
UPDATE straming SET currentViews = 32 WHERE streamingId = 1;


-- REMOVE
-- A user can delete his account.
DELETE FROM user WHERE username = ‘osccN';
DELETE FROM streaming WHERE user = ‘osccN';
DELETE FROM clip WHERE user = ‘osccN';
UPDATE user SET following = following – {‘osccN'}, followed = followed  – {‘osccN'};
UPDATE game SET user = user – {‘osccN'};

-- A user can remove the clip he made on other channels.
DELETE FROM clip WHERE clipId = 5;
UPDATE user SET clip = clip – {5};
UPDATE streaming SET clip = clip – {5}; 

-- A user can remove the follow to another user. In this case if we have A and 
-- B, we remove B to A's followings, and A to B's followers.
UPDATE user SET following = following – {‘osccN'} WHERE username = ‘BetaemevarT';
UPDATE user SET followed = followed – {‘BetaemevarT'} WHERE username = ‘osccN';
