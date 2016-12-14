mask=fvals<2;

plot(fvals(mask),finanidif(mask),'*')
xlabel('energy (final)')
ylabel('difference in anisotropy (final)')

plot(intnormdif1(mask)+intnormdif2(mask),fvals(mask),'*')
ylabel('energy')
xlabel('difference in norm (initial)')
plot(intnormdif1(mask)+intnormdif2(mask),finanidif(mask),'*')
ylabel('difference in anisotropy (final)')
xlabel('difference in norm (initial)')

plot(intnormdif1(mask)+intnormdif2(mask),finnormdif1(mask)+finnormdif2(mask),'*')
ylabel('difference in norm (final)')
xlabel('difference in norm (initial)')

plot(intnormdif1(mask),finanidif(mask),'*')
ylabel('difference in anisotropy (final)')
xlabel('difference in norm (initial)')

plot(intnormdif1+intnormdif2,log(finanidif+1),'*')
ylabel('difference in anisotropy (final)')
xlabel('difference in norm (initial)')

plot(finnormdif1,finanidif,'*')
xlabel('difference in norm (final)')
ylabel('difference in anisotropy (final)')

plot(intanidif(mask),finanidif(mask),'*')
xlabel('difference in anisotropy (initial)')
ylabel('difference in anisotropy (final)')
hold on
plot(linspace(1,max(intanidif(mask))),linspace(1,max(intanidif(mask))))

plot(intanidif,finanidif,'*')
xlabel('difference in anisotropy (initial)')
ylabel('difference in anisotropy (final)')
hold on
plot(linspace(1,max(intanidif)),linspace(1,max(intanidif)))



maskb=fvalsb<20;

plot(fvalsb(maskb),finanidifb(maskb),'*')
xlabel('energy (final)')
ylabel('difference in anisotropy (final)')
plot(fvalsb(maskb),intnormdifb1(maskb),'*')
xlabel('energy')
ylabel('difference in norm (initial, st)')
plot(intanidifb(maskb),finanidifb(maskb),'*')
xlabel('difference in anisotropy (initial)')
ylabel('difference in anisotropy (final)')
hold on
plot(linspace(1,max(intanidifb(maskb))),linspace(1,max(intanidifb(maskb))))
