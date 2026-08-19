%sci adv version
%subroutine to remove nans from a matrix for display

function [cleanmat]=removenansdynamic(inmat);

%2d dynamic version

i1=1;
for i=1:size(inmat,2)
    if(isnan(inmat(2,i)))
        i1=i1;
    else
        cleanmat1(:,i1, :)=inmat(:,i, :);
        i1=i1+1;
    end
end
i1=1;
for i=1:size(inmat,1)
    if(isnan(inmat(i,2)))
        i1=i1;
    else
        cleanmat(i1,:, :)=cleanmat1(i,:, :);
        i1=i1+1;
    end
end