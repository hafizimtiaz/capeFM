function b = myVectorNoise( beta , N )

% this function generates a vector valued noise sample from the density
% f(b) = (1/alpha) * exp(-beta * norm(b))
% the density is proposed in Sarwate et al. 2011 Differentially Private Empirical Risk Minimization paper
% the generation procedure is described in the blog post: 
% https://ergodicity.net/2013/03/21/generating-vector-valued-noise-for-differential-privacy/

% b = output noise vector
% beta = scale parameter (of the density)
% N = dimension of the vector b
% Author - Hafiz Imtiaz

r = normrnd(0,1,N,1); % generating a standard normal vector (for direction)
r = r/norm(r); % normalizing the vector
rand_norm = gamrnd(N, 1/beta, 1 ); % generate the norm of noise according to gamma distribution
b = rand_norm*r;
return