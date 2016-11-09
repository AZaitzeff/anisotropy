i=3;
k=4;
u = tdphysicalK3d(t(i),0.001,reshape(u0(k,:,:,:),[sizeu sizeu sizeu]),coeff1m(end,:),coeff2r);

data1=reshape(data(k,i,:,:,:),[sizeu,sizeu,sizeu]);
p = patch(isosurface(data1,.5));
%p = patch(isosurface(data,.5));
%isonormals(data,p)
pw = patch(isosurface(u,.5));
isonormals(u,p)
p.FaceColor = 'red';
p.EdgeColor = 'none';
p.FaceAlpha=.5;
pw.FaceColor = 'blue';
pw.EdgeColor = 'none';
pw.FaceAlpha=.5;
axis([1 64 1 64 1 64]); axis square
camlight
lighting gouraud