function [inmat] = tapers(inmat,windowname,windowparms), 

% tapers(inmat,windowname,windowparms), 
% 
%  tapers each row of inmat with defined window.  
% 
%  inmat - input data, waveforms in rows 
%  windowname  - name of window function -- see matlab window command 
%  windowparms - pass parms to matlab window function 
% 
%    NOTE: lenght of window will be length of inmat rows 
% 
%  e.g. tapers(inmat,'@hamming')
%       tapers(inmat,'@hamming','') 
%       tapers(inmat,'@tukeywin','.25'); 
% 
% Psychophysiology Toolbox, General, Edward Bernat, University of Minnesota  

if exist('windowname' )==0, 
  windowname  = '@tukeywin'; 
  windowparms = '.25';  
end 
if exist('windowparms')==0, 
  windowparms = ['']; 
else, 
  if ischar(windowparms), windowparms = [','         windowparms ];
  else,                   windowparms = [',' num2str(windowparms)]; %this line and above, edited 9/29/14, SJB
  end
end 

if ~isequal(windowname,'none') & ~isequal(windowname,'none'), 
  
  eval(['cur_window = window(' windowname ',' num2str(length(inmat(1,:))) windowparms ')'';']); 
 
  for n=1:size(inmat,1),
    inmat(n,:)=inmat(n,:) .* cur_window;
  end   

end 
 
