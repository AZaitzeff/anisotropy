p = patch(isosurface(x,y,z,STr,1));
isonormals(x,y,z,STr,p)
pw = patch(isosurface(x,y,z,ST,1));
isonormals(x,y,z,ST,pw)
p0 = patch(isosurface(x,y,z,ST0,1));
isonormals(x,y,z,ST0,p0)
p.FaceColor = 'red';
p.EdgeColor = 'none';
p.FaceAlpha=.5;
pw.FaceColor = 'blue';
pw.EdgeColor = 'none';
pw.FaceAlpha=.5;
p0.FaceColor = 'green';
p0.EdgeColor = 'none';
p0.FaceAlpha=.5;
axis([-a a -a a -a a]); axis square
camlight
lighting gouraud