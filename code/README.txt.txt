Galaxy Simulations
by: Vincent Whitney
date: 05/09/2011
Department of Physics
Ithaca College

1.) The first program to run is gravsim.m
Make sure you open the file and understand the parameters of the program. 
You can change the radius of the galaxy as well as the strength of gravity
or the initial speed of the particles with respect to the center of the 
system. The input for calling the program is the number of particles you want 
in the simulation. Keep in mind this number will double in size for the collision
simulation. The amount of time you give the program, ie the range of the t for-loop,
will determine the state of the output matrix that you read into collide. Alternatively
you can unquote marked passages in gravsim to make a movie of just the galaxy forming.

2.) Once you have the matrix from gravsim.m you can input it into the program
collide.m. This program has similar properties to gravsim, make sure that the 
strength of gravity for the two are equal as it will adjust the shape of the galaxy
otherwise. As this program displays the images it will also save copies of the 
images as the default setting so as to be read with gravmovie.m. You can change the 
starting positions and initial velocities of the galaxies within the initial
coordinates section in the beginning of the program. Can be changed to save the
images as a movie without gravmovie.m

3.) Gravmovie.m has instructions within it, but in summarizing the program reads each
of the images saved by either gravsim.m or gravmovie.m and saves them as a movie
into Matlab. You can read this movie in matlab by reading the file (saved in your current folder)
into matlab with the name M. Play with "movie(M)". You can also simply save the output of
the program as the variable M, and use the same command. You can save the movie
as an .avi file with the command "movie2avi(M,filename)"