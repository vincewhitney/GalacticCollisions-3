function M=gravmovie
%Vincent Whitney
%Ithaca College Physics Department
%Date: 05/09/2011

%Change n to the number of frames you wish to compile into the movie.
%Alternatively you can change the range to not start at 1 to create a movie
%of a section within the simulation
n=0;

M=moviein(n);
tic
for i=1:n
    filename=['gravsim' num2str(i) '.jpg'];
    x=imread(filename, 'jpg');
    image(x)
    axis off
    M(:,i)=getframe;
end
toc
save gravsim.mat M

%played with movie(M)



movie(M,5,20)