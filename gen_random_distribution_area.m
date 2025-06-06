function Obstacle_Area = gen_random_distribution_area(R1,R2)

Obstacle_Area = ones([100 100])/2;
%Obstacle_Area = Obstacle_Area/50;
Locations=[50 50];
Values=[R1];
for i=1:size(Locations,1)
    %Obstacle_Area(Locations(i,1),Locations(i,2))=1;
    for j=0:Values(i)
        for k=0:Values(i)
            if floor(sqrt(j^2+k^2))<=Values(i) && floor(sqrt(j^2+k^2))>=Values(i)-(R1-R2)
                if Locations(i,1)+j <= size(Obstacle_Area,1) && Locations(i,2)+k <= size(Obstacle_Area,2)
                    Obstacle_Area(Locations(i,1)+j,Locations(i,2)+k)=1;
                end
                if Locations(i,1)+j <= size(Obstacle_Area,1) && Locations(i,2)-k >=1
                    Obstacle_Area(Locations(i,1)+j,Locations(i,2)-k)=1;
                end
                if Locations(i,1)-j >=1 && Locations(i,2)+k <= size(Obstacle_Area,2)
                    Obstacle_Area(Locations(i,1)-j,Locations(i,2)+k)=1;
                end
                if Locations(i,1)-j >=1 && Locations(i,2)-k >=1
                    Obstacle_Area(Locations(i,1)-j,Locations(i,2)-k)=1;
                end
            end
        end
    end
end
%imagesc(Obstacle_Area)
%colorbar;