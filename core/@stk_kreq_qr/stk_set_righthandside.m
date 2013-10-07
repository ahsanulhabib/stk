% STK_SET_RIGHTHANDSIDE [STK internal]

% Copyright Notice
%
%    Copyright (C) 2013 SUPELEC
%
%    Author:  Julien Bect  <julien.bect@supelec.fr>

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

function kreq = stk_set_righthandside (kreq, Kti, Pt)

% This class implements GREEDY EVALUATION: computations are made as soon as the
% required inputs are made available.

% prepare the right-hand side of the kriging equation
kreq.RS = [Kti Pt]';

% Solve the kriging equation to get the extended
% kriging weights vector (weights + Lagrange multipliers)
kreq.lambda_mu = linsolve (kreq);

end % function stk_set_righthandside