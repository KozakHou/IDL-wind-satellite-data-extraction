;1
openr,1,'wind_swe.dat.txt'
num=5000
year=intarr(num)&hour=bytarr(num)
month=bytarr(num)
day=bytarr(num)&minute=bytarr(num)
second=fltarr(num)
NP=fltarr(num)&VTH=fltarr(num)
dum=''&yy=1&mm=1b&hh=1&mi=1.&ss=1d&nn=0&dd=1&SW_VTH=1.&ION_NP=1.&DEL_TIME=1.&VXGSM=1.&VY_GSM=1.&VZ_GSM=1.
 readf,1,dum
 readf,1,dum
 readf,1,dum
 while ~EOF(1) do begin
  readf,1,dd,mm,yy,hh,mi,ss,SW_VTH,ION_NP,DEL_TIME,VXGSM,VY_GSM,VZ_GSM,$
    format='(i2,1x,i2,1x,i4,1x,i2,1x,i2,1x,f6.3,6f14.4)'
    year[nn]=yy
    month[nn]=mm
    day[nn]=dd
    hour[nn]=hh
    second[nn]=ss
    minute[nn]=mi
    NP[nn]=ION_NP
    VTH[nn]=SW_VTH
    nn=nn+1
 endwhile
 close,1
 year=year[0:nn-1]
 month=month[0:nn-1]
 day=day[0:nn-1]
 hour=hour[0:nn-1]
 minute=minute[0:nn-1]
 second=second[0:nn-1]
 NP=NP[0:nn-1]
 VTH=VTH[0:nn-1]
 a=where(NP lt 0)
 NP=NP
 NP[a]=!VALUES.F_NAN
 b=where(VTH lt 0)
 VTH=VTH
 VTH[b]=!values.f_nan
 SAVE,year,month,day,hour,minute,second,NP,VTH,FILENAME='wind_swe.save'

;2
openr,2,'wind_mfi.dat.txt'
num1=4000
year1=intarr(num1)
month1=bytarr(num1)
day1=bytarr(num1)
hour1=bytarr(num1)
minute1=bytarr(num1)
second1=fltarr(num1)
BX=fltarr(num1)
BY=fltarr(num1)
BZ=fltarr(num1)
dum1=''&yy1=1&mm1=1b&hh1=1.&mi1=1.&ss1=1d&nn1=0&dd1=1.&bxx=1.&byy=1.&bzz=1.
readf,2,dum1
readf,2,dum1
readf,2,dum1
while ~eof(2) do begin
readf,2,dd1,mm1,yy1,hh1,mi1,ss1,bxx,byy,bzz,$
    format='(i2,1x,i2,1x,i4,1x,i2,1x,i2,1x,f6.3,3f23.8)'
    year1[nn1]=yy1
    month1[nn1]=mm1
    day1[nn1]=dd1
    hour1[nn1]=hh1
    second1[nn1]=ss1
    minute1[nn1]=mi1
    BX[nn1]=bxx
    BY[nn1]=byy
    BZ[nn1]=bzz
    nn1=nn1+1
endwhile
close,2
year1=year1[0:nn1-1]
month1=month1[0:nn1-1]
day1=day1[0:nn1-1]
hour1=hour1[0:nn1-1]
minute1=minute1[0:nn1-1]
second1=second1[0:nn1-1]
BX=BX[0:nn1-1]
BY=BY[0:nn1-1]
BZ=BZ[0:nn1-1]
c=where(BX eq -1E+31)
BX=BX
BX[c]=!values.f_nan
d=where(BY eq -1E+31)
BY=BY
BY[d]=!values.f_nan
e=where(BZ eq -1E+31)
BZ=BZ
BZ[d]=!values.f_nan
save,year1,month1,day1,hour1,minute1,second1,BX,BY,BZ,filename='wind_mfi.save'
end
