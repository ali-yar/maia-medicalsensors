## Copyright (C) 2017 hp
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} sucread (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: ali <ali@MAIA>
## Created: 2017-11-19

# Sample call:
# y=sucread(file="im.suc",size=[256,256],type="uint16",offset=512,lendian=true);
# imshow(y, [0 4000]);

function [data, count] = sucread (file, size, type, offset, lendian)
  f = fopen(file, 'r');
  if f == -1
    error('Cannot open file.');
  end
  if lendian == true
    format = "ieee-le";
  else
    format = "";
  end
  s = size(1) * size(2);
  type = sprintf("%d*%s=>%s",s,type,type);
  [data, count] = fread(FID=f, SIZE=size, PRECISION=type, SKIP=offset, ARCH=format);
  fclose(f);
endfunction