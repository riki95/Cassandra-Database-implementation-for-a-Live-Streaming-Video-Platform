The excel file has been used to create the dataset.

We used a website to create some random users. This website just return a list of random strings that are readable, and not just a shuffle of chars. This is helpful if we want to read a username.

The excel file has many pages. The one in CAPS are the TABLES corresponding to the cassandra ones. The other pages not in CAPS are auxiliary pages, used for example to create data for the CAPS one.

In order to create the follower and following relations, we created a matrix in which we randomly put 0 or 1 in each column if a user follows another one or not. If it is so, we insert the follow relation into the user's table. This table has been the most difficult to work with because we have to implement something that is easy to do in a node graph for example, but difficult here.

Into the STREAMING table we randomly generated the timestamps according to the date and the hour for the start and the finish of the stream. Viewers are again coming from a random number generator.

For CLIP's title or GAME's we just used names like "ClipTitle1" and so on, incrementing the number of 1 each time, because it is not an interesting data. In CLIP we generated starting and ending time which has to be a maximum length of 60 seconds (30 seconds minimum).