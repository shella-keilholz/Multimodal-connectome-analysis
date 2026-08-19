% similarity of fc tcs


function [simtc]=comparefcmatrices(fcmatc);

k=1;
for i=1:size(fcmatc,3)
    for j=(i+1):size(fcmatc,3)
        t1=reshape(fcmatc(:,:,i),size(fcmatc,1)*size(fcmatc,2),1);
        t2=reshape(fcmatc(:,:,j),size(fcmatc,1)*size(fcmatc,2),1);
        tmp=corrcoef(t1,t2);
        simtc(k)=tmp(1,2);
        k=k+1;
    end
end
