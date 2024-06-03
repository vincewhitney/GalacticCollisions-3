function [z]= gravsim(n)
%Vincent Whitney
%Ithaca College Physics Department
%Date: 05/09/2011

x=zeros(1,n);
dx=zeros(1,n);
y=zeros(1,n);
dy=zeros(1,n);
S=0.00055;
theta=[];

%Placing the n particles, here I place them in random places in a circle
%with a concentration towards the center by squaring the random rumber,
%which is less than 1. I then give them a veloctiy based on the square root
%of the radius and make it in an orientation perpendicular to the radius.
for i=1:1:n
    theta(i)=2*pi*rand;
    ra=rand;
    r=double(200*ra^(1.6));
    x(i)=double(r*sin(theta(i)))+1500;
    y(i)=double(r*cos(theta(i)))+1500;
    
    dy(i)=(r^(1/3))*sin(theta(i))*n*S*2;
    dx(i)=-(r^(1/3))*cos(theta(i))*n*S*2;
end

%Finding the sum of the velocities to center the frame
%
%sumdx=sum(dx)/n;
%sumdy=sum(dy)/n;
%for i=1:1:n
%dx(i)=(dx(i)-sumdx)/10;
%dy(i)=(dy(i)-sumdy)/10;
%end


%Calculating the change in velocity per unit time, d2x and d2y, and
%changing the velocities accordingly.
for t=1:1:10
    tic
     e=zeros(3000,3000,3,'uint8');
    for n1=1:1:n
        for n2=1:1:n
            if n1~=n2
                if n2>n1
                r=sqrt((y(n1)-y(n2))^2+(x(n1)-x(n2))^2);
                if r<2
                    r=2;
                end
                
                V1=sqrt((dx(n1)*dx(n1))+(dy(n1)*dy(n1)));  
                V2=sqrt((dx(n2)*dx(n2))+(dy(n2)*dy(n2))); 
                d2x=(double(-(((x(n2)-x(n1))/(r)^3))))*2;
                d2y=(double(-(((y(n2)-y(n1))/(r)^3))))*2;
                if V1>r
                    d2x=(double(-(((x(n2)-x(n1))/(r)^2))));
                   d2y=(double(-(((y(n2)-y(n1))/(r)^2))));
                
                end
                 if V2>r
                    d2x=(double(-(((x(n2)-x(n1))/(r)^2))));
                    d2y=(double(-(((y(n2)-y(n1))/(r)^2))));
                
               end
                
                dx(n1)=dx(n1)+d2x;
                dy(n1)=dy(n1)+d2y;
                dx(n2)=dx(n2)-d2x;
                dy(n2)=dy(n2)-d2y;
                end
            end
        end
    end

%Generating image
    for n1=1:1:n
        x(n1)=x(n1)-dx(n1);
        y(n1)=y(n1)-dy(n1);
        if x(n1)<2995
            if x(n1)>5
                if y(n1)>5
                    if y(n1)<2995
                        for h=1:1:5
                            for w=1:1:5
                        e(floor(x(n1)+h),floor(y(n1)+w),:)=255;
                            end
                        end
                    end
                   
                end
            end
        end
    end

% Just for fun, makes the walls bouncy
% Unquote the if statements

      %  if x(n1)<2995
      %     dx(n1)=-dx(n1);
      %  end
      %  if x(n1)>5
      %      dx(n1)=-dx(n1);
      %  end
      %  if y(n1)>5
      %      dy(n1)=-dy(n1);
      %  end
      %  if y(n1)<2995
      %      dy(n1)=-dy(n1);
      %  end
    
      
      
    % This tells the time for larger systems if you need 
   
    % toc
   
    
    pause(.01)
    image(e)
    % Unquote the two following lines and the save gravsim.mat line below to
    % save the images as a movie which can be retrieved by the command load
    % gravsim.mat and then played with movie(M)
    
    %axis off
    %M(:,t)=getframe;
    
    
end
%save gravsim.mat M
 
%Outputs final coordinates as input for collide program
z=[x',y',dx',dy'];

