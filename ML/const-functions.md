without cost functions:
cost <- function(r, pi = 0) mean(abs(r-pi) > 0.5)
This is saying cost=∑|ri−pii|cost=∑|ri−pii|. 
Better to define your own cost function:
========
Quadratic cost

Also known as mean squared error, maximum likelihood, and sum squared error, this is defined as:

CMST(W,B,Sr,Er)=0.5∑j(aLj−Erj)2
CMST(W,B,Sr,Er)=0.5∑j(ajL−Ejr)2
The gradient of this cost function with respect to the output of a neural network and some sample rr is:

∇aCMST=(aL−Er)
∇aCMST=(aL−Er)
Cross-entropy cost

Also known as Bernoulli negative log-likelihood and Binary Cross-Entropy

CCE(W,B,Sr,Er)=−∑j[Erj ln aLj+(1−Erj) ln (1−aLj)]
CCE(W,B,Sr,Er)=−∑j[Ejr ln ajL+(1−Ejr) ln (1−ajL)]
The gradient of this cost function with respect to the output of a neural network and some sample rr is:

∇aCCE=(aL−Er)(aL+1)(aL)
∇aCCE=(aL−Er)(aL+1)(aL)
Exponentional cost

This requires choosing some parameter ττ that you think will give you the behavior you want. Typically you'll just need to play with this until things work good.

CEXP(W,B,Sr,Er)=τ exp(1τ∑j(aLj−Erj)2)
CEXP(W,B,Sr,Er)=τ exp⁡(1τ∑j(ajL−Ejr)2)
where exp(x)exp(x) is simply shorthand for exex.

The gradient of this cost function with respect to the output of a neural network and some sample rr is:

∇aC=2τ(aL−Er)CEXP(W,B,Sr,Er)
∇aC=2τ(aL−Er)CEXP(W,B,Sr,Er)
I could rewrite out CEXPCEXP, but that seems redundant. Point is the gradient computes a vector and then multiplies it by CEXPCEXP.

Hellinger distance

CHD(W,B,Sr,Er)=12‾√∑j(aLj‾‾‾√−Erj‾‾‾√)2
CHD(W,B,Sr,Er)=12∑j(ajL−Ejr)2
You can find more about this here. This needs to have positive values, and ideally values between 00 and 11. The same is true for the following divergences.

The gradient of this cost function with respect to the output of a neural network and some sample rr is:

∇aC=aL‾‾‾√−Er‾‾‾√2‾√aL‾‾‾√
∇aC=aL−Er2aL
Kullback–Leibler divergence

Also known as Information Divergence, Information Gain, Relative entropy, KLIC, or KL Divergence (See here).

Kullback–Leibler divergence is typically denoted
DKL(P∥Q)=∑iP(i)lnP(i)Q(i)
DKL(P∥Q)=∑iP(i)ln⁡P(i)Q(i)
,

where DKL(P∥Q)DKL(P∥Q) is a measure of the information lost when QQ is used to approximate PP. Thus we want to set P=EiP=Ei and Q=aLQ=aL, because we want to measure how much information is lost when we use aijaji to approximate EijEji. This gives us

CKL(W,B,Sr,Er)=∑jErjlogErjaLj
CKL(W,B,Sr,Er)=∑jEjrlog⁡EjrajL
The other divergences here use this same idea of setting P=EiP=Ei and Q=aLQ=aL.

The gradient of this cost function with respect to the output of a neural network and some sample rr is:

∇aC=EraL
∇aC=EraL
Generalized Kullback–Leibler divergence

From here.

CGKL(W,B,Sr,Er)=∑jErjlogErjaLj−∑j(Erj)+∑j(aLj)
CGKL(W,B,Sr,Er)=∑jEjrlog⁡EjrajL−∑j(Ejr)+∑j(ajL)
The gradient of this cost function with respect to the output of a neural network and some sample rr is:

∇aC=Er+aLaL
∇aC=Er+aLaL
Itakura–Saito distance

Also from here.

CGKL(W,B,Sr,Er)=∑j(ErjaLj−logErjaLj−1)
CGKL(W,B,Sr,Er)=∑j(EjrajL−log⁡EjrajL−1)
The gradient of this cost function with respect to the output of a neural network and some sample rr is:

∇aC=Er+(aL)2(aL)2
∇aC=Er+(aL)2(aL)2
Where ((aL)2)j=aLj⋅aLj((aL)2)j=ajL⋅ajL. In other words, (aL)2(aL)2 is simply equal to squaring each element of aLaL.

shareimprove this answer
edited Jun 6 '15 at 1:26
answered May 31 '15 at 19:48

Danielle Ensign
860413
  	 	
Thanks for sharing, you can also consider these: github.com/torch/nn/blob/master/doc/criterion.md – Yannis Assael May 31 '15 at 19:52
  	 	
you have a small mistake in the denominator of the cross-entropy derivative, it should be a*(1-a) not a*(1+a) – Amro May 16 at 17:51
add a comment
