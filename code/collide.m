function collide(x)
%Vincent Whitney
%Ithaca College Physics Department
%Date: 05/09/2011


%input x is a matrix of 4 collumns that have the x and y velocities and
%positions for the stable galaxy

z1=x;
z2=x;

x1=z1(:,1)';
y1=z1(:,2)';
dx1=z1(:,3)';
dy1=z1(:,4)';
nz1=length(x1);
x2=z2(:,1)';
y2=z2(:,2)';
dx2=z2(:,3)';
dy2=z2(:,4)';
%initial velocities and positioning
x1=x1+100;
y1=y1-100;
dx1=dx1+1;
dy1=dy1-2;
nz1=length(x1);
x2=x2-100;
y2=y2+100;
dx2=dx2-1;
dy2=dy2+2;
nz2=length(x2);

tic
for t=1:1:2
   
    e=zeros(3000,3000,3,'uint8');
    for n1=1:1:nz1
        for n2=1:1:nz1
            if n2>n1
            if n1~=n2
                r=sqrt((y1(n1)-y1(n2))^2+(x1(n1)-x1(n2))^2);
                if r<2
                    r=2;
                end
                
                
              
                
                 V1=sqrt((dx1(n1)*dx1(n1))+(dy1(n1)*dy1(n1)));  
                V2=sqrt((dx1(n2)*dx2(n2))+(dy1(n2)*dy2(n2))); 
                  d2x=-((x1(n2)-x1(n1))/r^3)*2;
                d2y=-((y1(n2)-y1(n1))/r^3)*2;
                
                if V1>r
                    d2x=(double(-(((x1(n2)-x1(n1))/(r)^2))));
                   d2y=(double(-(((y1(n2)-y1(n1))/(r)^2))));
                
                end
                 if V2>r
                    d2x=(double(-(((x1(n2)-x1(n1))/(r)^2))));
                    d2y=(double(-(((y1(n2)-y1(n1))/(r)^2))));
                
               end
                
                    dx1(n1)=dx1(n1)+d2x;
                dy1(n1)=dy1(n1)+d2y;
                dx1(n2)=dx1(n2)-d2x;
                dy1(n2)=dy1(n2)-d2y;
            end
            end
        end
    end
    for n1=1:1:nz2
        for n2=1:1:nz2
            if n2>n1
            if n1~=n2
                
                r=sqrt((y2(n1)-y2(n2))^2+(x2(n2)-x2(n1))^2);
                if r<2
                    r=2;
                end
                
                
                 V1=sqrt((dx2(n1)*dx2(n1))+(dy2(n1)*dy2(n1)));  
                V2=sqrt((dx2(n2)*dx2(n2))+(dy2(n2)*dy2(n2))); 
                d2x=-((x2(n2)-x2(n1))/r^3)*2;
                d2y=-((y2(n2)-y2(n1))/r^3)*2;
                
                if V1>r
                    d2x=(double(-(((x2(n2)-x2(n1))/(r)^2))));
                   d2y=(double(-(((y2(n2)-y2(n1))/(r)^2))));
                
                end
                 if V2>r
                    d2x=(double(-(((x2(n2)-x2(n1))/(r)^2))));
                    d2y=(double(-(((y2(n2)-y2(n1))/(r)^2))));
                
               end
                
                
                    dx2(n1)=dx2(n1)+d2x;
                dy2(n1)=dy2(n1)+d2y;
                dx2(n2)=dx2(n2)-d2x;
                dy2(n2)=dy2(n2)-d2y;
            end
            end
        end
    end
    for n1=1:1:nz2
        for n2=1:1:nz1
            if n2>n1
            if n1~=n2
                
                r=sqrt((y2(n1)-y1(n2))^2+(x2(n1)-x1(n2))^2);
                if r<2
                    r=2;
                end
                V1=sqrt((dx2(n1)*dx2(n1))+(dy2(n1)*dy2(n1)));  
                V2=sqrt((dx1(n2)*dx1(n2))+(dy1(n2)*dy1(n2))); 
                d2x=-((x1(n2)-x2(n1))/r^3)*2;
                d2y=-((y1(n2)-y2(n1))/r^3)*2;
                
                if V1>r
                    d2x=(double(-(((x1(n2)-x2(n1))/(r)^2))));
                   d2y=(double(-(((y1(n2)-y2(n1))/(r)^2))));
                
                end
                 if V2>r
                    d2x=(double(-(((x1(n2)-x2(n1))/(r)^2))));
                    d2y=(double(-(((y1(n2)-y2(n1))/(r)^2))));
                
               end
                
                    dx2(n1)=dx2(n1)+d2x;
                dy2(n1)=dy2(n1)+d2y;
                dx1(n2)=dx1(n2)-d2x;
                dy1(n2)=dy1(n2)-d2y;
            end
            end
        end
    end
    for n1=1:1:nz1
        for n2=1:1:nz2
            if n2>n1
            if n1~=n2
                
                r=sqrt((y1(n1)-y2(n2))^2+(x1(n1)-x2(n2))^2);
                if r<2
                    r=2;
                end
                
                
                
                V1=sqrt((dx2(n2)*dx2(n2))+(dy2(n2)*dy2(n2)));  
                V2=sqrt((dx1(n1)*dx1(n1))+(dy1(n1)*dy1(n1))); 
                d2x=-((x2(n2)-x1(n1))/r^3)*2;
                d2y=-((y2(n2)-y1(n1))/r^3)*2;
                
                if V1>r
                    d2x=(double(-(((x2(n2)-x1(n1))/(r)^2))));
                   d2y=(double(-(((y2(n2)-y1(n1))/(r)^2))));
                
                end
                 if V2>r
                    d2x=(double(-(((x2(n2)-x1(n1))/(r)^2))));
                    d2y=(double(-(((y2(n2)-y1(n1))/(r)^2))));
                
               end
                
                
                    dx1(n1)=dx1(n1)+d2x;
                dy1(n1)=dy1(n1)+d2y;
                dx2(n2)=dx2(n2)-d2x;
                dy2(n2)=dy2(n2)-d2y;
            end
            end
        end
    end
    
    
    for n2=1:1:nz2
        x2(n2)=x2(n2)-dx2(n2);
        y2(n2)=y2(n2)-dy2(n2);
        if x2(n2)<2995
            if x2(n2)>5
                if y2(n2)>5
                    if y2(n2)<2995
                        for h=1:1:5
                            for w=1:1:5
                        e(floor(x2(n2)+h),floor(y2(n2)+w),3)=255;
                        
                            end
                        end
                    end
                   
                end
            end
        end
    end
     
    
    for n1=1:1:nz1
        x1(n1)=x1(n1)-dx1(n1);
        y1(n1)=y1(n1)-dy1(n1);
        if x1(n1)<2995
            if x1(n1)>5
                if y1(n1)>5
                    if y1(n1)<2995
                        for h=1:1:5
                            for w=1:1:5
                        e(floor(x1(n1)+h),floor(y1(n1)+w),2)=255;
                            end
                        end
                    end
                   
                end
            end
        end
    end
    % if x(n1)<2000
      %     dx(n1)=-dx(n1);
      %  end
      %  if x(n1)>0
      %      dx(n1)=-dx(n1);
      %  end
      %  if y(n1)>0
      %      dy(n1)=-dy(n1);
      %  end
      %  if y(n1)<2000
      %      dy(n1)=-dy(n1);
      %  end

      image(e);
      axis off
      %M(:,t)=getframe      %Unquote to make movie and 
      %change first line to be function M=collide(x)
      filename = [ 'gravsim' num2str(t) '.jpg' ];
      imwrite(e, filename, 'jpg')

      
          
          
     
      pause(.01)
toc
t
end

%save gravsim.mat M     %Unquote to save movie
toc