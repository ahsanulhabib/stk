% PLOT_1 view function

% Copyright Notice
%
%    Copyright (C) 2011-2014 SUPELEC
%
%    Authors:   Ivana Aleksovska  <ivanaaleksovska@gmail.com>
%               Emmanuel Vazquez  <emmanuel.vazquez@supelec.fr>

% Copying Permission Statement
%
%    This file is part of
%
%            STK: a Small (Matlab/Octave) Toolbox for Kriging
%               (http://sourceforge.net/projects/kriging)
%
%    STK is free software: you can redistribute it and/or modify it under
%    the terms of the GNU General Public License as published by the Free
%    Software Foundation,  either version 3  of the License, or  (at your
%    option) any later version.
%
%    STK is distributed  in the hope that it will  be useful, but WITHOUT
%    ANY WARRANTY;  without even the implied  warranty of MERCHANTABILITY
%    or FITNESS  FOR A  PARTICULAR PURPOSE.  See  the GNU  General Public
%    License for more details.
%
%    You should  have received a copy  of the GNU  General Public License
%    along with STK.  If not, see <http://www.gnu.org/licenses/>.

function plot_1(xi, zi, xg, zp, xt, zt)

LINE1 = {'--', 'LineWidth', 2, 'Color', [0.39, 0.47, 0.64]};
LINE2 = {'-', 'LineWidth', 2, 'Color', [0.95 0.25 0.3]};
MARKER1 = {'mo', 'MarkerSize', 5, 'MarkerFaceColor', 'y'};

h = area (double (xg), [zp.mean-2*sqrt(zp.var), 4*sqrt(zp.var)]);
set(h(1),'FaceColor','none');
set(h(2),'FaceColor',[0.8 0.8 0.8]);
set(h,'LineStyle','-','LineWidth', 1, 'EdgeColor', 'none');

hold on

if nargin > 4
    plot (xt, zt, LINE1{:})
end

plot (xg, zp.mean, LINE2{:})

if ~ isempty (zi)
    plot(xi, zi(:, 1), MARKER1{:})
    if size (zi, 2) == 3
        nb_obs = zi.nb_obs; 
        for i = 1:(stk_length (zi))
            if nb_obs(i) > 1
                h = text (xi(i), zi(i), sprintf ('%d', nb_obs(i)));
                set (h, 'Color', 'k', 'FontWeight', 'bold', 'FontSize', 13);
            end
        end
    end
end

hold off

end % function
