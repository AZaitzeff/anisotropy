p = patch(isosurface(data,.5));
isonormals(data,p)
pw = patch(isosurface(uw,.5));
isonormals(uw,p)
p.FaceColor = 'red';
p.EdgeColor = 'none';
p.FaceAlpha=.5;
pw.FaceColor = 'blue';
pw.EdgeColor = 'none';
pw.FaceAlpha=.5;
axis([1 64 1 64 1 64]); axis square
camlight
lighting gouraud