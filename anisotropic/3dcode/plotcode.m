p = patch(isosurface(x,y,z,STr,1));
isonormals(x,y,z,STr,p)
pw = patch(isosurface(x,y,z,STw,1));
isonormals(x,y,z,STw,p)
p.FaceColor = 'red';
p.EdgeColor = 'none';
p.FaceAlpha=.5;
pw.FaceColor = 'blue';
pw.EdgeColor = 'none';
pw.FaceAlpha=.5;
axis([-a a -a a -a a]); axis square
camlight
lighting gouraud