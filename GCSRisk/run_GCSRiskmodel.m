function y=run_GCSRiskmodel(x)

fatherdir = pwd;
cd([fatherdir,'/examples/GCSRisk']);

n = size(x,1);
y = nan(n,1);
for i = 1 : n    
    perm = 10^x(i,1);
    permv = perm*x(i,2);
    p0 = 10^x(i,3);
    para = [perm; permv; p0];
    save para.in para -ascii
    delete para.out
    !./driver1M.exe
    y0 = load('para.out');
    y(i,1) = sum(y0(:)); % Sum of the mass of liquid and gas phases CO2 in the upper aquifer
    clear y0
end

cd(fatherdir);

end