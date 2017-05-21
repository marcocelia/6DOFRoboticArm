function traj = rectraj(r, sps)
traj = zeros(4,4,sum(sps));
for i=1:7
    t(:,:,i)= transl(r(i,:));
end
for j=1:6
     if j==1
        traj(:,:,1:sps(j)) = ctraj(t(:,:,j), t(:,:,j+1), sps(j)); 
     else
        traj(:,:, sum(sps(1:j-1)) + 1 : sum(sps(1:j-1))+sps(j) ) = ctraj(t(:,:,j), t(:,:,j+1), sps(j)); 
     end        
end