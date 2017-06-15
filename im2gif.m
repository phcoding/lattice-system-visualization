function [  ] = im2gif( varargin )
%IM2GIF 将图片数据集保存为GIF动图
%   IM2GIF(frames, filename, delay, size, n)
%   frames  影片数据组，格式为 1xn，每一个元素为{cdata,colormap}结构体
%   filename图片保存文件名
%   delay   图片合成间隔，单位秒（s）
%   size    图片尺寸size=[wight,height]
%   n       图片保存的颜色位数
vlen = length(varargin);
if vlen < 2
    error('number of arguments error !');
else
    frames = varargin{1,1};
    filename = varargin{1,2};
    % 默认参数配置
    delay = .5;
    size = false;
    n = 32;
    if vlen >2
        delay = varargin{1,3};
    end
    if vlen > 3
        size = varargin{1,4};
    end
    if vlen > 4
        n = varargin{1,5};
    end
end

flen = length(frames);
if flen < 2
    warning('No dynamic photo created: frames too less !');
end
for i=1:flen
    im = frame2im(frames(1,i));
    % 改变图片尺寸
    if size~=false
        im = imresize(im, fliplr(size));
    end
    % 转换数据格式
    [I,map] = rgb2ind(im, n);
    if i==1
        imwrite(I,map,filename, 'gif', 'Loopcount', inf, 'DelayTime', delay);
    else
        imwrite(I,map,filename, 'gif', 'WriteMode', 'append', 'DelayTime', delay);
    end
end
end
