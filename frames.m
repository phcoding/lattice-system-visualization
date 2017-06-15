function [ fs ] = frames( varargin )
%FRAMES 将输入资源转换为frame数据组
%   fs = frames(...)
%   输入可以为图片文件路径、FIG文件路径、图片数据和frame影片数据
len = length(varargin);
fs = struct('cdata',num2cell(zeros(1,len,'uint8')),'colormap',num2cell(zeros(1,len,'double')));
for i=1:len
    e = varargin{1,i};
    switch(class(e))
        case 'char'
            filename = strsplit(e,'.');
            fmt = upper(filename{end});
            try
                switch(fmt)
                    case {'PNG','JPG','JPEG','BMP'}
                        fs(1,i) = im2frame(imread(e));
                    case {'FIG'}
                        open(e);
                        fs(1,i) = getframe;
                        close gcf;
                    otherwise
                        warning(['filetype ' fmt ' not surpported !']);
                end
            catch
                warning(['resource "' e '" load failed ![INDEX ' num2str(i) ']']);
            end
        case 'struct'
            fs(1,i) = e;
        case 'uint8'
            try
                fs(1,i) = im2frame(e);
            catch
                warning(['imdata load failed !' '[INDEX ' num2str(i) ']']);
            end
    end
end
end